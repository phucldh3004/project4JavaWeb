USE [master]
GO
/****** Object:  Database [FunixAssignment]    Script Date: 7/4/2020 2:34:23 PM ******/
CREATE DATABASE [FunixAssignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FunixAssignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FunixAssignment.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FunixAssignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FunixAssignment_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FunixAssignment] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FunixAssignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FunixAssignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FunixAssignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FunixAssignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FunixAssignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FunixAssignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [FunixAssignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FunixAssignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FunixAssignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FunixAssignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FunixAssignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FunixAssignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FunixAssignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FunixAssignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FunixAssignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FunixAssignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FunixAssignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FunixAssignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FunixAssignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FunixAssignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FunixAssignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FunixAssignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FunixAssignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FunixAssignment] SET RECOVERY FULL 
GO
ALTER DATABASE [FunixAssignment] SET  MULTI_USER 
GO
ALTER DATABASE [FunixAssignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FunixAssignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FunixAssignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FunixAssignment] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FunixAssignment] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FunixAssignment', N'ON'
GO
USE [FunixAssignment]
GO
/****** Object:  Table [dbo].[Postdetail]    Script Date: 7/4/2020 2:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postdetail](
	[idPostDetail] [int] NOT NULL,
	[title] [nvarchar](250) NOT NULL,
	[author] [nvarchar](250) NOT NULL,
	[content] [nvarchar](250) NOT NULL,
	[publishedTime] [date] NOT NULL,
 CONSTRAINT [PK_Postdetail] PRIMARY KEY CLUSTERED 
(
	[idPostDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/4/2020 2:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Postdetail] ([idPostDetail], [title], [author], [content], [publishedTime]) VALUES (1, N'Hoa Mat Troi', N'Hoang Phuc', N'Hoa mat troi dep', CAST(N'2020-06-29' AS Date))
INSERT [dbo].[Postdetail] ([idPostDetail], [title], [author], [content], [publishedTime]) VALUES (2, N'Hoa Ly', N'Hoang Phuc', N'Hoa Ly thuong lau heo', CAST(N'2020-06-28' AS Date))
INSERT [dbo].[Postdetail] ([idPostDetail], [title], [author], [content], [publishedTime]) VALUES (3, N'Hoa hong', N'Hoang Phuc', N'<p><strong>HAHAHAHA<em>dsadsadasdad</em></strong></p>', CAST(N'2020-07-01' AS Date))
INSERT [dbo].[Postdetail] ([idPostDetail], [title], [author], [content], [publishedTime]) VALUES (5, N' Hoa cam tu cau', N'Hoang Phuc', N'<p>dsadasdas<strong>dasdasdasd</strong></p>', CAST(N'2020-07-01' AS Date))
INSERT [dbo].[Postdetail] ([idPostDetail], [title], [author], [content], [publishedTime]) VALUES (6, N'Hoa hong', N'Hoang Phuc', N'<p>Hoa hong khong rtan</p>', CAST(N'2020-07-01' AS Date))
INSERT [dbo].[Postdetail] ([idPostDetail], [title], [author], [content], [publishedTime]) VALUES (7, N'Hoa hong', N'Hoang Phuc', N'<p>Hoa hong that dep biet bao nhieu</p>', CAST(N'2020-07-01' AS Date))
INSERT [dbo].[Postdetail] ([idPostDetail], [title], [author], [content], [publishedTime]) VALUES (10, N' Hoa cam tu cau', N'Hoang Phuc', N'<p>Hoa Cam Tu Cau<strong> mau tim<em> mau xanh</em></strong></p>', CAST(N'2020-07-01' AS Date))
INSERT [dbo].[Users] ([username], [password]) VALUES (N'user', N'123')
INSERT [dbo].[Users] ([username], [password]) VALUES (N'username', N'123')
INSERT [dbo].[Users] ([username], [password]) VALUES (N'username123', N'123')
USE [master]
GO
ALTER DATABASE [FunixAssignment] SET  READ_WRITE 
GO
