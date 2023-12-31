USE [master]
GO
/****** Object:  Database [BookStoreDB]    Script Date: 11/29/2023 13:49:09 ******/
CREATE DATABASE [BookStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStoreDB', FILENAME = N'C:\Users\Des\BookStoreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStoreDB_log', FILENAME = N'C:\Users\Des\BookStoreDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BookStoreDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStoreDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStoreDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStoreDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BookStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStoreDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [BookStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStoreDB] SET QUERY_STORE = OFF
GO
USE [BookStoreDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [BookStoreDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/29/2023 13:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11/29/2023 13:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/29/2023 13:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/29/2023 13:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/29/2023 13:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/29/2023 13:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/29/2023 13:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[DateOfBirth] [datetime2](7) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11/29/2023 13:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookGallery]    Script Date: 11/29/2023 13:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookGallery](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
 CONSTRAINT [PK_BookGallery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 11/29/2023 13:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[LanguageId] [int] NOT NULL,
	[Category] [nvarchar](max) NULL,
	[CoverImageUrl] [nvarchar](max) NULL,
	[TotalPages] [int] NOT NULL,
	[BookpdfUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 11/29/2023 13:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230914170332_addidentity', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230915095328_addedApllicationUser', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231003141741_Tables', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231003162238_addednewColumPdf', N'5.0.1')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'admin', N'admin', N'admin')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'60138be8-82c1-40b5-bad5-ae9c66a9a568', N'1')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DateOfBirth], [FirstName], [LastName]) VALUES (N'07220cdb-7dd9-4f9d-b2b1-0c60b31ac2dd', N'Fname@gmail.com', N'FNAME@GMAIL.COM', N'Fname@gmail.com', N'FNAME@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEE0cPynnLBoZbS58X8Svv7uUVZxpr7yOGj2SG3brbrbOA4Job1g038CTd7aILQhy1g==', N'CKQVX55SOY4IBGTTDAW56AGUMH2XZ6XA', N'015fa893-6504-4896-bc25-def8c5ab24e8', NULL, 0, 0, NULL, 1, 0, NULL, N'Fname', N'Lname')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DateOfBirth], [FirstName], [LastName]) VALUES (N'16a728cf-22b8-41ec-a935-9d93d7d4ebf6', N'ayeshachandini@gmail.com', N'AYESHACHANDINI@GMAIL.COM', N'ayeshachandini@gmail.com', N'AYESHACHANDINI@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEG9mLF7Zo16butTTpVTcDdc2IUqvAuh/x7FyVXDlKiAPWiE9J3bzWUDaOysOJo7ixQ==', N'G7LMZD3TT6MTUVHAQLL4Z7LAM2QMEQNF', N'1183af30-fa6c-4184-8ed2-c5974e998b44', NULL, 0, 0, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DateOfBirth], [FirstName], [LastName]) VALUES (N'21684ae0-5e52-4fc2-862b-f0846591b2f8', N'Test123@gmail.com', N'TEST123@GMAIL.COM', N'Test123@gmail.com', N'TEST123@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAeM++fPZWRMCqBCILyFrmzqgEOet4OnB/oH8IWEi3H+Al/TldPZR+mLhnmkJfkHSw==', N'4YHFG657G6H3MRGA6IJ2UGTPQCJBDCIK', N'89d75d02-7f7b-4cb2-b285-ecb245b1c9a4', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DateOfBirth], [FirstName], [LastName]) VALUES (N'41a85fed-27f0-4a84-96c1-096b7edca34a', N'Test1234@gmail.com', N'TEST1234@GMAIL.COM', N'Test1234@gmail.com', N'TEST1234@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEDU5bci9QH6n3Bb7DJx2pZ9QuJ64QcuU3Vh0y6GC6YgSU7MivbCeKy2W0cDzQG8qYQ==', N'QRBBTYJB77XAXWLN7IRGPVAVRIPPWVBW', N'7bf57648-7565-46ca-ad46-826fb80615e5', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DateOfBirth], [FirstName], [LastName]) VALUES (N'52f63cb7-28b7-4bc9-933f-229497f15647', N'Lname@gmail.com', N'LNAME@GMAIL.COM', N'Lname@gmail.com', N'LNAME@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFzLNaZXENRrzEj8oDCYrEDiosAG7XwSUG5XdTBso0FoTEC3hMpp5jUJxKcy75X2Ew==', N'NBSSLMJCEYC3DLURKW7BAUD63SMMZ2XM', N'f1cc6689-3e9a-455c-a93b-a7501ac65f87', NULL, 0, 0, NULL, 1, 1, NULL, N'Fname', N'Lname')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DateOfBirth], [FirstName], [LastName]) VALUES (N'60138be8-82c1-40b5-bad5-ae9c66a9a568', N'AdminUser@gmail.com', N'ADMINUSER@GMAIL.COM', N'AdminUser@gmail.com', N'ADMINUSER@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEOjS9BZWQNQeyV2Hc7G10NXYZhGIcpafRSodmIepAiVJtUF7RxKMOaFlrsZJmxlKlA==', N'JY5XL43UC22P5AQUKLMNDMIEN5MOOWMH', N'4d6399a9-96d2-4e71-8f12-90902afea9c5', NULL, 0, 0, NULL, 1, 0, NULL, N'Admin', N'User')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DateOfBirth], [FirstName], [LastName]) VALUES (N'8021789d-bbd5-4ab9-a442-44841517c08a', N'Jon1@gmail.com', N'JON1@GMAIL.COM', N'Jon1@gmail.com', N'JON1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKsp8uI8sPzDIxMcEOZPzrJ3jRjTEBDVmuHECa2kihAdqPNCo5qlrO64FsUz8fOk8A==', N'TMCWNSXVSIFPIQ77SDA57O5345PDGHIU', N'5070ff0d-0e7c-4443-8078-6ac499aa64cc', NULL, 0, 0, NULL, 1, 0, NULL, N'Fname', N'Lname')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DateOfBirth], [FirstName], [LastName]) VALUES (N'9934e407-3d32-4391-a952-10370cde21fc', N'Ram@gmail.com', N'RAM@GMAIL.COM', N'Ram@gmail.com', N'RAM@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEJv19QveQ9wYAup/4yPLNymasRMsH1LU6CZQNc6mFPuOyVbkMIvL1GD2Vmzj3OICGQ==', N'MLV32ZWWARQUA4HW2YM2EY6WQG5TTE6M', N'4bc3eef0-5176-4238-9b3a-195ca44099b2', NULL, 0, 0, NULL, 1, 0, NULL, N'Ram', N'Nitish')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DateOfBirth], [FirstName], [LastName]) VALUES (N'9bef43b3-9246-450c-95b1-198b1f10eda1', N'ayeshachandini25@gmail.com', N'AYESHACHANDINI25@GMAIL.COM', N'ayeshachandini25@gmail.com', N'AYESHACHANDINI25@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBiDm3SR/br4V4YLFrQWqguwksfUW0t+5JMOtDGc36jdkVNLytEYzoJkRVafoSWaqg==', N'KLYQURMDDGKSSXJGBC2QVTUBLFAJYLKM', N'942228eb-4a6f-4c94-b7a2-c6c3ebdcc5b1', NULL, 0, 0, NULL, 1, 0, NULL, N'Test', N'User')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DateOfBirth], [FirstName], [LastName]) VALUES (N'a295c889-23c2-4c87-a130-ebeb0b816aa2', N'john123@gmail.com', N'JOHN123@GMAIL.COM', N'john123@gmail.com', N'JOHN123@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOQ3hbTuDcegjJU2AwU0CIf0HWx6MlNJhvG5EerFiPiSVQKoljkuY0TL4Tc7zF/YXQ==', N'LMKPWGBNHZC7YLUUIDFAFSC3BL5MTURO', N'03de4526-4fc3-48dd-b442-3d373161249a', NULL, 0, 0, NULL, 1, 0, NULL, N'John', N'sina')
GO
SET IDENTITY_INSERT [dbo].[BookGallery] ON 

INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (1, 1, N'BookImg3.jpg', N'/books/cover/deee599d-1942-47c9-bba9-8857b80acfa7_BookImg3.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (2, 1, N'Bookimag2.jpg', N'/books/cover/4f950949-03a0-4cec-88a8-8d04534bc244_Bookimag2.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (3, 1, N'Book1.jpg', N'/books/cover/2adecd2c-e6a9-4dde-aa85-aff8ff4d66f1_Book1.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (4, 2, N'soup2.jpg', N'/books/cover/d0340662-d476-4444-ba22-dd70b9a1325f_soup2.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (5, 2, N'Soup1.jpg', N'/books/cover/22ffb9f2-e0df-454a-bf61-53d24c194195_Soup1.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (6, 3, N'kitchen3.jpg', N'/books/cover/b7db02f7-5ec8-4e62-a097-654055acf9c9_kitchen3.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (7, 3, N'kitchen2.jpg', N'/books/cover/89c2465f-13e1-4b0d-ad2a-0a90e82ee65d_kitchen2.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (8, 3, N'kitchen1.jpg', N'/books/cover/efb10ce9-dc3f-4ace-90d6-640231afe19c_kitchen1.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (9, 4, N'Charlotte4.jpg', N'/books/cover/069e1b8e-8248-4caf-8852-5cd8cce85306_Charlotte4.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (10, 4, N'Charlotte3.jpg', N'/books/cover/1a03a24e-6750-4c88-b919-d4f4eb84e1a7_Charlotte3.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (11, 4, N'Charlotte2.jpg', N'/books/cover/8811e62d-7053-46de-9392-a97e032d159a_Charlotte2.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (12, 5, N'Mocking4.jpg', N'/books/cover/dadbc3c9-0274-4c2e-87cf-323d1f121e41_Mocking4.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (13, 5, N'mocking3.jpg', N'/books/cover/8b1fd695-77ba-4dbc-976c-6283fc235878_mocking3.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (14, 5, N'Mocking2.jpg', N'/books/cover/a184ec19-db41-4ae2-892c-5b588f6bbe0a_Mocking2.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (15, 5, N'Mocking1.jpg', N'/books/cover/11875e05-a17b-45fe-867f-546b69df5350_Mocking1.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (16, 6, N'Naruto5.jpg', N'/books/cover/a48ef2b2-0547-46c4-8d41-2f5fe3dfe5db_Naruto5.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (17, 6, N'Naruto4.jpg', N'/books/cover/7090a4f1-e319-4be9-ad9f-92d166db75e0_Naruto4.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (18, 6, N'Naruto3.jpg', N'/books/cover/4bb03f2b-fe21-4c52-af20-a5210496ed58_Naruto3.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (19, 6, N'Naruto2.jpg', N'/books/cover/34ec2ec3-995c-468e-abf3-652efbc89a77_Naruto2.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (20, 6, N'Naruto1.jpg', N'/books/cover/a315e0c5-55bb-4b68-9059-1b250189d816_Naruto1.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (21, 7, N'LiitleAngel4.jpg', N'/books/cover/0a32143e-2b47-4829-b95b-c2456f731bc1_LiitleAngel4.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (22, 7, N'LittleAngel3.jpg', N'/books/cover/affb89cc-4ed8-40fb-994f-a6f2d6e97114_LittleAngel3.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (23, 7, N'LiitleAngel2.jpg', N'/books/cover/74a94d79-5ef7-4085-9e2a-acaa81271cd0_LiitleAngel2.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (24, 7, N'LittleAngel1.jpg', N'/books/cover/c2d29a8a-82ad-4329-bf45-01d4e0988b88_LittleAngel1.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (25, 8, N'Asp.net2.jpg', N'/books/cover/8085a05a-f71e-40b0-b7f8-25fa8e4f9b9b_Asp.net2.jpg')
INSERT [dbo].[BookGallery] ([Id], [BookId], [Name], [URL]) VALUES (26, 8, N'Asp1.jpg', N'/books/cover/6e6660ae-6cf3-484b-ba47-b4869d4952e9_Asp1.jpg')
SET IDENTITY_INSERT [dbo].[BookGallery] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Title], [Author], [Description], [LanguageId], [Category], [CoverImageUrl], [TotalPages], [BookpdfUrl]) VALUES (1, N'Nature Kingdom', N'ayesha', N'The Kingdom of God is of utmost importance because it is the only way to gain eternal life.', 2, N'sever side', N'/books/cover/f26dd863-1b2c-4dee-9cf1-afa7b4b00103_Cover01.jpg', 345, N'/books/pdf/NaturePdf.pdf')
INSERT [dbo].[Books] ([Id], [Title], [Author], [Description], [LanguageId], [Category], [CoverImageUrl], [TotalPages], [BookpdfUrl]) VALUES (2, N'Princess soup', N'Holly covel', N'Charlotte wants to prove she is more than just a princess, but sometimes following your dream isn''t as easy as, well...', 3, N'Story Book', N'/books/cover/07a6dd27-81db-4b7f-9880-5dcc3ea1a614_Cover02.jpg', 123, NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [Description], [LanguageId], [Category], [CoverImageUrl], [TotalPages], [BookpdfUrl]) VALUES (3, N'The Way I help', N'cassandra Richards', N'I help in the kitchen', 1, N'Story Book', N'/books/cover/6254251d-68b5-4b63-b383-1ba8761a44d2_Cover03.jpg', 213, NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [Description], [LanguageId], [Category], [CoverImageUrl], [TotalPages], [BookpdfUrl]) VALUES (4, N'Charlotte''s Web', N'E. B. White', N'Charlotte''s Web is a book of children''s literature by American author', 1, N'Story book', N'/books/cover/1db18435-2cd5-473c-891c-503c86c6d197_Charlottes.jpg', 345, NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [Description], [LanguageId], [Category], [CoverImageUrl], [TotalPages], [BookpdfUrl]) VALUES (5, N'To Kill a Mockingbird', N'Harper Lee', N'To Kill a Mockingbird is a novel', 1, N'Novel', N'/books/cover/81092230-f2a4-4295-8df3-b85e8473aec4_MockingThumb.jpg', 345, NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [Description], [LanguageId], [Category], [CoverImageUrl], [TotalPages], [BookpdfUrl]) VALUES (6, N'Naruto and Boruto', N'Masashi Kishimoto', N'The ninja adventures continue in these stories featuring the characters of Naruto and Boruto', 1, N'narutoStory', N'/books/cover/ae472e3e-f301-42ea-be83-fa8241b9abf9_narutoThumb.jpg', 345, NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [Description], [LanguageId], [Category], [CoverImageUrl], [TotalPages], [BookpdfUrl]) VALUES (7, N'The Littlest Angel', N'Charles Tazewell.', N'The Littlest Angel is an American children''s book ', 1, N'novel', N'/books/cover/b19db395-f2e3-407a-be4f-42c08314eb57_LittleAngelThimb.jpg', 123, NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [Description], [LanguageId], [Category], [CoverImageUrl], [TotalPages], [BookpdfUrl]) VALUES (8, N'ASP.NET Core', N'Microsoft Press', N'ASP.NET Core is the definitive guide to practical web-based application development with Microsoft’s new ASP.NET Core framework.', 1, N'Technology', N'/books/cover/b9c40f53-e1b8-4321-9f6c-bb3b8185ead7_Asp.netCoreThumb.jpg', 124, N'/books/pdf/NaturePdf.pdf')
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Language] ON 

INSERT [dbo].[Language] ([Id], [Name], [Description]) VALUES (1, N'English', N'englishDescription')
INSERT [dbo].[Language] ([Id], [Name], [Description]) VALUES (2, N'Telugu', N'TeluguDes')
INSERT [dbo].[Language] ([Id], [Name], [Description]) VALUES (3, N'Hindhi', N'hindhides')
INSERT [dbo].[Language] ([Id], [Name], [Description]) VALUES (4, N'Tanil', N'tamildes')
SET IDENTITY_INSERT [dbo].[Language] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 11/29/2023 13:49:09 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/29/2023 13:49:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 11/29/2023 13:49:09 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 11/29/2023 13:49:09 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 11/29/2023 13:49:09 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 11/29/2023 13:49:09 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/29/2023 13:49:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookGallery_BookId]    Script Date: 11/29/2023 13:49:09 ******/
CREATE NONCLUSTERED INDEX [IX_BookGallery_BookId] ON [dbo].[BookGallery]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_LanguageId]    Script Date: 11/29/2023 13:49:09 ******/
CREATE NONCLUSTERED INDEX [IX_Books_LanguageId] ON [dbo].[Books]
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BookGallery]  WITH CHECK ADD  CONSTRAINT [FK_BookGallery_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookGallery] CHECK CONSTRAINT [FK_BookGallery_Books_BookId]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Language_LanguageId] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Language_LanguageId]
GO
USE [master]
GO
ALTER DATABASE [BookStoreDB] SET  READ_WRITE 
GO
