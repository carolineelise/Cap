USE [master]
GO
/****** Object:  Database [Cap]    Script Date: 12/13/2021 2:10:24 AM ******/
CREATE DATABASE [Cap]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cap', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Cap.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cap_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Cap_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Cap] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cap].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cap] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cap] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cap] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cap] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cap] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cap] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cap] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cap] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cap] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cap] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cap] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cap] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cap] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cap] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cap] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cap] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cap] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cap] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cap] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cap] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cap] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cap] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cap] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cap] SET  MULTI_USER 
GO
ALTER DATABASE [Cap] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cap] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cap] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cap] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cap] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cap] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Cap] SET QUERY_STORE = OFF
GO
USE [Cap]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/13/2021 2:10:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartNbr] [varchar](10) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[Unit] [varchar](10) NOT NULL,
	[Price] [decimal](9, 2) NOT NULL,
	[PhotoPath] [varchar](255) NULL,
	[VendorId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PartNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestLines]    Script Date: 12/13/2021 2:10:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestLines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 12/13/2021 2:10:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[Id] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Justification] [varchar](50) NOT NULL,
	[RejectionReason] [varchar](50) NULL,
	[DeliveryMode] [varchar](30) NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[Total] [decimal](11, 2) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/13/2021 2:10:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](10) NOT NULL,
	[Password] [nvarchar](10) NOT NULL,
	[Firstname] [varchar](30) NOT NULL,
	[Lastname] [varchar](30) NOT NULL,
	[Phone] [numeric](18, 0) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[IsReviewer] [bit] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 12/13/2021 2:10:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[Id] [int] NOT NULL,
	[Code] [varchar](6) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[ZipCode] [varchar](6) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('Each') FOR [Unit]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[RequestLines] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Requests] ADD  DEFAULT ('NEW') FOR [Status]
GO
ALTER TABLE [dbo].[Requests] ADD  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([Id])
GO
ALTER TABLE [dbo].[RequestLines]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[RequestLines]  WITH CHECK ADD FOREIGN KEY([RequestId])
REFERENCES [dbo].[Requests] ([Id])
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Cap] SET  READ_WRITE 
GO
