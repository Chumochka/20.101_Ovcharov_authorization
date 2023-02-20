USE [master]
GO
/****** Object:  Database [20.101_Ovcharov_authorization]    Script Date: 20.02.2023 17:49:46 ******/
CREATE DATABASE [20.101_Ovcharov_authorization]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'20.101_Ovcharov_authorization', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\20.101_Ovcharov_authorization.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'20.101_Ovcharov_authorization_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\20.101_Ovcharov_authorization_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [20.101_Ovcharov_authorization].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET ARITHABORT OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET  DISABLE_BROKER 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET  MULTI_USER 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET DB_CHAINING OFF 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET QUERY_STORE = OFF
GO
USE [20.101_Ovcharov_authorization]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 20.02.2023 17:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID_Role] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 20.02.2023 17:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID_User] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[ID_Role] [tinyint] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Roles] ([ID_Role])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [20.101_Ovcharov_authorization] SET  READ_WRITE 
GO
