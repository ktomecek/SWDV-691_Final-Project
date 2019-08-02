USE [master]
GO
/****** Object:  Database [uforme]    Script Date: 7/27/2019 10:30:09 AM ******/
CREATE DATABASE [uforme]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'uforme', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\uforme.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'uforme_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\uforme_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [uforme] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [uforme].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [uforme] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [uforme] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [uforme] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [uforme] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [uforme] SET ARITHABORT OFF 
GO
ALTER DATABASE [uforme] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [uforme] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [uforme] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [uforme] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [uforme] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [uforme] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [uforme] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [uforme] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [uforme] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [uforme] SET  DISABLE_BROKER 
GO
ALTER DATABASE [uforme] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [uforme] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [uforme] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [uforme] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [uforme] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [uforme] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [uforme] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [uforme] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [uforme] SET  MULTI_USER 
GO
ALTER DATABASE [uforme] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [uforme] SET DB_CHAINING OFF 
GO
ALTER DATABASE [uforme] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [uforme] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [uforme] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [uforme] SET QUERY_STORE = OFF
GO
USE [uforme]
GO
/****** Object:  Table [dbo].[images]    Script Date: 7/27/2019 10:30:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[userID] [int] NOT NULL,
	[imageID] [int] IDENTITY(1,1) NOT NULL,
	[image] [image] NOT NULL,
 CONSTRAINT [PK_images] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[languageList]    Script Date: 7/27/2019 10:30:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[languageList](
	[languageID] [int] NOT NULL,
	[languageName] [nvarchar](50) NOT NULL,
	[ISO_639-2_Code] [char](3) NOT NULL,
 CONSTRAINT [PK_languageList] PRIMARY KEY CLUSTERED 
(
	[languageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[languageText]    Script Date: 7/27/2019 10:30:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[languageText](
	[languageID] [int] NOT NULL,
	[phraseID] [int] NOT NULL,
	[text] [varchar](max) NOT NULL,
 CONSTRAINT [PK_languageText] PRIMARY KEY CLUSTERED 
(
	[languageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matches]    Script Date: 7/27/2019 10:30:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matches](
	[userID] [int] NOT NULL,
	[userMatchID] [int] NOT NULL,
	[userMatchBlocked] [bit] NOT NULL,
	[userRomanceLevel] [tinyint] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_matches] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userPreferences]    Script Date: 7/27/2019 10:30:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userPreferences](
	[userID] [int] NOT NULL,
	[partnerPreference] [tinyint] NULL,
	[agePreference] [tinyint] NULL,
	[locationPreference] [varchar](150) NULL,
	[distancePreference] [smallint] NULL,
	[relationshipPreference] [tinyint] NULL,
	[childrenPreference] [tinyint] NULL,
	[ethnicityPreference] [tinyint] NULL,
	[religionPreference] [int] NULL,
	[educationPreference] [tinyint] NULL,
	[bodytypePreference] [tinyint] NULL,
	[heightPreference] [tinyint] NULL,
	[smokingPreference] [tinyint] NULL,
	[cityPreference] [varchar](50) NULL,
	[statePreference] [char](2) NULL,
	[zipPreference] [nchar](10) NULL,
	[ageLowerRangePreference] [tinyint] NULL,
	[ageUpperRangePreference] [tinyint] NULL,
	[isPrimaryPreference] [bit] NULL,
	[preferenceAlias] [nvarchar](50) NULL,
	[preferenceID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_userPreferences] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 7/27/2019 10:30:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userID] [int] IDENTITY(1000,1) NOT NULL,
	[password] [nvarchar](12) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](150) NOT NULL,
	[nickName] [nvarchar](150) NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [char](10) NULL,
	[ccNumber] [char](15) NOT NULL,
	[cid] [nchar](4) NOT NULL,
	[userActive] [bit] NOT NULL,
	[accessLevel] [tinyint] NOT NULL,
	[dateJoined] [datetime] NOT NULL,
	[dateExited] [datetime] NOT NULL,
	[lastLogin] [datetime] NOT NULL,
	[gender] [tinyint] NOT NULL,
	[height] [tinyint] NOT NULL,
	[bodyType] [tinyint] NOT NULL,
	[birthDate] [date] NOT NULL,
	[city] [varchar](50) NOT NULL,
	[state] [char](2) NOT NULL,
	[zip] [nchar](10) NOT NULL,
	[id] [int] NOT NULL,
	[languagePreference] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_userActive]  DEFAULT ((0)) FOR [userActive]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_Table_1_admin]  DEFAULT ((0)) FOR [accessLevel]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_languagePreference]  DEFAULT ((0)) FOR [languagePreference]
GO
ALTER TABLE [dbo].[languageList]  WITH CHECK ADD  CONSTRAINT [FK_languageList_languageText] FOREIGN KEY([languageID])
REFERENCES [dbo].[languageText] ([languageID])
GO
ALTER TABLE [dbo].[languageList] CHECK CONSTRAINT [FK_languageList_languageText]
GO
ALTER TABLE [dbo].[matches]  WITH CHECK ADD  CONSTRAINT [FK_matches_users] FOREIGN KEY([userMatchID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[matches] CHECK CONSTRAINT [FK_matches_users]
GO
ALTER TABLE [dbo].[userPreferences]  WITH CHECK ADD  CONSTRAINT [FK_userPreferences_users] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[userPreferences] CHECK CONSTRAINT [FK_userPreferences_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_images] FOREIGN KEY([userID])
REFERENCES [dbo].[images] ([userID])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_images]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_languageList] FOREIGN KEY([languagePreference])
REFERENCES [dbo].[languageList] ([languageID])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_languageList]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_matches] FOREIGN KEY([userID])
REFERENCES [dbo].[matches] ([userID])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_matches]
GO
USE [master]
GO
ALTER DATABASE [uforme] SET  READ_WRITE 
GO
