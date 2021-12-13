USE [Cap]
GO

/****** Object:  Table [dbo].[Products]    Script Date: 12/13/2021 1:34:59 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
DROP TABLE [dbo].[Products]
GO

