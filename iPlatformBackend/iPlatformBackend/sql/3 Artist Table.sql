USE [ipMusic]
GO

/****** Object:  Table [dbo].[Artist]    Script Date: 2015/10/11 13:09:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Artist](
	[ArtistId] [int] IDENTITY(1,1) NOT NULL,
	[ArtistName] [nvarchar](100) NOT NULL,
	[UniqueId] [nvarchar](50) NOT NULL,
	[CountryId] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


