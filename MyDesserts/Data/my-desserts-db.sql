USE [master]
GO
/****** Object:  Database [DessertsDb]    Script Date: 02-12-2022 17:04:09 ******/
CREATE DATABASE [DessertsDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DessertsDb', FILENAME = N'C:\Users\chauhan\DessertsDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DessertsDb_log', FILENAME = N'C:\Users\chauhan\DessertsDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DessertsDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DessertsDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DessertsDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DessertsDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DessertsDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DessertsDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DessertsDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [DessertsDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DessertsDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DessertsDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DessertsDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DessertsDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DessertsDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DessertsDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DessertsDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DessertsDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DessertsDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DessertsDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DessertsDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DessertsDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DessertsDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DessertsDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DessertsDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DessertsDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DessertsDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DessertsDb] SET  MULTI_USER 
GO
ALTER DATABASE [DessertsDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DessertsDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DessertsDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DessertsDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DessertsDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DessertsDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DessertsDb] SET QUERY_STORE = OFF
GO
USE [DessertsDb]
GO
/****** Object:  Table [dbo].[Dessert]    Script Date: 02-12-2022 17:04:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dessert](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DessertName] [nvarchar](50) NULL,
	[DessertImage] [varchar](512) NULL,
	[Category] [bigint] NULL,
 CONSTRAINT [PK_Dessert] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DessertCategory]    Script Date: 02-12-2022 17:04:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DessertCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[CategoryImage] [varchar](512) NULL,
 CONSTRAINT [PK_DessetCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dessert] ON 

INSERT [dbo].[Dessert] ([ID], [DessertName], [DessertImage], [Category]) VALUES (1, N'Homemade Jell-O', N'2-1.jpg', 2)
INSERT [dbo].[Dessert] ([ID], [DessertName], [DessertImage], [Category]) VALUES (2, N'Gummy Bears', N'2-2.webp', 2)
INSERT [dbo].[Dessert] ([ID], [DessertName], [DessertImage], [Category]) VALUES (3, N'Panna Cotta', N'2-3.jpg', 2)
INSERT [dbo].[Dessert] ([ID], [DessertName], [DessertImage], [Category]) VALUES (4, N'Banana cake with cream cheese', N'1-1.jpg', 1)
INSERT [dbo].[Dessert] ([ID], [DessertName], [DessertImage], [Category]) VALUES (5, N'New York baked cheesecake', N'1-2.jpg', 1)
INSERT [dbo].[Dessert] ([ID], [DessertName], [DessertImage], [Category]) VALUES (6, N'Chocolate coconut cake', N'1-3.jpg', 1)
SET IDENTITY_INSERT [dbo].[Dessert] OFF
GO
SET IDENTITY_INSERT [dbo].[DessertCategory] ON 

INSERT [dbo].[DessertCategory] ([ID], [CategoryName], [CategoryImage]) VALUES (1, N'Cakes', N'1-0.jpg')
INSERT [dbo].[DessertCategory] ([ID], [CategoryName], [CategoryImage]) VALUES (2, N'Jelly', N'2-0.jpg')
SET IDENTITY_INSERT [dbo].[DessertCategory] OFF
GO
ALTER TABLE [dbo].[Dessert]  WITH CHECK ADD  CONSTRAINT [FK_Dessert_DessertCategory] FOREIGN KEY([Category])
REFERENCES [dbo].[DessertCategory] ([ID])
GO
ALTER TABLE [dbo].[Dessert] CHECK CONSTRAINT [FK_Dessert_DessertCategory]
GO
USE [master]
GO
ALTER DATABASE [DessertsDb] SET  READ_WRITE 
GO
