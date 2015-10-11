-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alex Schaft
-- Create date: Oct 2015
-- Description:	Add/Upd/Del Artist
-- =============================================
ALTER PROCEDURE proc_Artist 
	-- Add the parameters for the stored procedure here
	@Cmd nvarchar(10) = 'Upd', 
	@ArtistName nvarchar(100) = '',
	@UniqueId nvarchar(50) = '',
	@CountryId nvarchar(5) = '',
	@Alias nvarchar(100) = '',
	@AliasId int = 0,
	@PageNo int = 1,
	@PageSize int = 20,
	@ArtistId int = 0 OUTPUT
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	If @Cmd = 'Upd'
	Begin
		If @ArtistId = 0
		Begin
			Select @ArtistId =  ArtistId from Artist Where @UniqueId = UniqueId

			if Isnull(@ArtistID, 0) = 0
			Begin
				Insert into Artist (ArtistName, UniqueId, CountryId) 
					Values (@ArtistName, @UniqueId, @CountryId)

				Set @ArtistId = @@IDENTITY
			
				Return
			End
		End

		if @ArtistId > 0
		Begin
			Update Artist 
				Set ArtistName = @ArtistName,
					CountryId = @CountryId
				Where @ArtistId = ArtistId
		End
	End
	
	If @Cmd = 'UpdAlias'
	Begin
		
		if isNull(@AliasId, 0) = 0
		Begin
			Select @AliasID = AliasID
				From ArtistAlias AA
				Where AA.ArtistId = @ArtistId and AA.Alias = @Alias

			Set @AliasId = isNull(@AliasId, 0)

			
			if @AliasId = 0
			Begin
				Insert into ArtistAlias (ArtistId, Alias)
					Values (@ArtistId, @Alias)
			End
		End

		if @AliasId > 0
		Begin
			Update ArtistAlias
				Set Alias = @Alias
				Where AliasId = @AliasID
		End
	End
			
	If @Cmd = 'Get'
	Begin
		Create Table #IDList (ArtistId int primary key not null, Aliases nvarchar(2000) default '')

		Insert into #IDList (ArtistId)
			Select ArtistId from Artist Where Artist.ArtistName like @ArtistName + '%'
			Union 
			Select ArtistId from ArtistAlias Where Alias like @ArtistName + '%'

		Select artist = Artist.ArtistName, country = Artist.CountryId,
			alias = '<Aliases>' + (Select AA.Alias As [text()]
									From ArtistAlias AA
									Where AA.ArtistId = Artist.ArtistId
									For XML PATH ('Alias')) + '</Aliases>'
						
			From Artist
				Join #IDList ID on Artist.ArtistId = Id.ArtistId
			

			Order By Artist.ArtistName
			Offset @PageSize * (@PageNo - 1) Rows
			Fetch First @PageSize Rows Only
			
		Select numberOfSearchResults = count(*), numberOfPages = ceiling(count(*) / @PageSize) + 1 from #IdList

		
	End
END
GO
