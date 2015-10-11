USE [ipMusic]
GO

/****** Object:  Table [dbo].[ArtistAlias]    Script Date: 2015/10/11 13:09:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ArtistAlias](
	[AliasId] [int] IDENTITY(1,1) NOT NULL,
	[ArtistId] [int] NOT NULL,
	[Alias] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO


