USE [master]
GO
/****** Object:  Database [EyesTest]    Script Date: 6/24/2023 4:11:30 PM ******/
CREATE DATABASE [EyesTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EyesTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NVMSSQLSERVER\MSSQL\DATA\EyesTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EyesTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NVMSSQLSERVER\MSSQL\DATA\EyesTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EyesTest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EyesTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EyesTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EyesTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EyesTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EyesTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EyesTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [EyesTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EyesTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EyesTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EyesTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EyesTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EyesTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EyesTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EyesTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EyesTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EyesTest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EyesTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EyesTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EyesTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EyesTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EyesTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EyesTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EyesTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EyesTest] SET RECOVERY FULL 
GO
ALTER DATABASE [EyesTest] SET  MULTI_USER 
GO
ALTER DATABASE [EyesTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EyesTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EyesTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EyesTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EyesTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EyesTest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EyesTest', N'ON'
GO
ALTER DATABASE [EyesTest] SET QUERY_STORE = OFF
GO
USE [EyesTest]
GO
/****** Object:  User [nv]    Script Date: 6/24/2023 4:11:30 PM ******/
CREATE USER [nv] FOR LOGIN [nv] WITH DEFAULT_SCHEMA=[nv]
GO
/****** Object:  Schema [nv]    Script Date: 6/24/2023 4:11:30 PM ******/
CREATE SCHEMA [nv]
GO
/****** Object:  Table [dbo].[Participants]    Script Date: 6/24/2023 4:11:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participants](
	[ParticipantId] [int] IDENTITY(1,1) NOT NULL,
	[Nickname] [varchar](100) NULL,
	[Score] [int] NULL,
	[TimeTaken] [int] NULL,
	[User_Id] [int] NOT NULL,
	[QuizId] [int] NULL,
 CONSTRAINT [PK_Participant] PRIMARY KEY CLUSTERED 
(
	[ParticipantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 6/24/2023 4:11:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QnId] [int] IDENTITY(1,1) NOT NULL,
	[QuizId] [int] NOT NULL,
	[QnInWords] [nvarchar](500) NULL,
	[ImageName] [nvarchar](50) NULL,
	[Option1] [nvarchar](50) NULL,
	[Option2] [nvarchar](50) NULL,
	[Option3] [nvarchar](50) NULL,
	[Option4] [nvarchar](50) NULL,
	[Answer] [int] NOT NULL,
 CONSTRAINT [PK_Questions_1] PRIMARY KEY CLUSTERED 
(
	[QnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quizes]    Script Date: 6/24/2023 4:11:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quizes](
	[QuizId] [int] IDENTITY(1,1) NOT NULL,
	[QuizName] [varchar](250) NULL,
	[Decripsion] [varchar](250) NULL,
	[Imagename] [varchar](250) NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[QuizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 6/24/2023 4:11:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/24/2023 4:11:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[Fullname] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Participants] ON 

INSERT [dbo].[Participants] ([ParticipantId], [Nickname], [Score], [TimeTaken], [User_Id], [QuizId]) VALUES (105, N'John', 0, 0, 24, 1)
INSERT [dbo].[Participants] ([ParticipantId], [Nickname], [Score], [TimeTaken], [User_Id], [QuizId]) VALUES (106, N'Nguy?n', 0, 0, 1071, 1)
INSERT [dbo].[Participants] ([ParticipantId], [Nickname], [Score], [TimeTaken], [User_Id], [QuizId]) VALUES (107, N'Nguyen', 7, 17, 1071, 1)
INSERT [dbo].[Participants] ([ParticipantId], [Nickname], [Score], [TimeTaken], [User_Id], [QuizId]) VALUES (108, N'123', 3, 6, 1071, 12)
INSERT [dbo].[Participants] ([ParticipantId], [Nickname], [Score], [TimeTaken], [User_Id], [QuizId]) VALUES (109, N'1312', 0, 0, 1071, 4)
INSERT [dbo].[Participants] ([ParticipantId], [Nickname], [Score], [TimeTaken], [User_Id], [QuizId]) VALUES (110, N'123123', 2, 6, 1071, 4)
INSERT [dbo].[Participants] ([ParticipantId], [Nickname], [Score], [TimeTaken], [User_Id], [QuizId]) VALUES (111, N'213123', 0, 0, 1071, 4)
INSERT [dbo].[Participants] ([ParticipantId], [Nickname], [Score], [TimeTaken], [User_Id], [QuizId]) VALUES (112, N'ádas', 0, 0, 1071, 4)
INSERT [dbo].[Participants] ([ParticipantId], [Nickname], [Score], [TimeTaken], [User_Id], [QuizId]) VALUES (113, N'312', 0, 0, 1071, 11)
INSERT [dbo].[Participants] ([ParticipantId], [Nickname], [Score], [TimeTaken], [User_Id], [QuizId]) VALUES (114, N'ádsad', 0, 0, 1071, 11)
INSERT [dbo].[Participants] ([ParticipantId], [Nickname], [Score], [TimeTaken], [User_Id], [QuizId]) VALUES (115, N'12321', 0, 0, 1071, 11)
INSERT [dbo].[Participants] ([ParticipantId], [Nickname], [Score], [TimeTaken], [User_Id], [QuizId]) VALUES (116, N'Thao', 4, 9, 1073, 1)
INSERT [dbo].[Participants] ([ParticipantId], [Nickname], [Score], [TimeTaken], [User_Id], [QuizId]) VALUES (1116, N'NguyenVu', 10, 15, 1071, 1)
INSERT [dbo].[Participants] ([ParticipantId], [Nickname], [Score], [TimeTaken], [User_Id], [QuizId]) VALUES (1117, N'Khanh', 0, 0, 24, 11)
SET IDENTITY_INSERT [dbo].[Participants] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (115, 1, N'Question 1: Cover your right eye and indicate which direction the letter E is facing in the picture below?', N'VT1.png', N'Upward', N'Downwards', N' Left', N'Right', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (116, 1, N'Question 2: Cover your right eye and indicate which direction the letter E is facing in the picture below?', N'VT2.png', N' Upward', N'Downwards', N'Left', N'Right', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (118, 1, N'Question 3: Cover your right eye and indicate which direction the letter E is facing in the picture below?', N'VT4.png', N'Upward', N'Downwards', N'Left', N'Right', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (119, 1, N'Question 4: Cover your right eye and indicate which direction the letter E is facing in the picture below?', N'VT5.png', N'Upward', N'Downwards', N'Left', N'Right', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (120, 1, N'Question 5: Cover your right eye and indicate which direction the letter E is facing in the picture below?', N'VT6.png', N'Upward', N'Downwards', N'Left', N'Right', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (121, 1, N'Question 6: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'VT7.png', N'Upward', N'Downwards', N'Left', N'Right', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (122, 1, N'Question 7: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'VT8.png', N'Upward', N'Downwards', N'Left', N'Right', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (124, 1, N'Question 8: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'VT10.png', N'Upward', N'Downwards', N'Left', N'Right', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (125, 1, N'Question 9: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'VT11.png', N'Upward', N'Downwards', N'Left', N'Right', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (126, 1, N'Question 10: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'VT12.png', N'Upward', N'Downward', N'Left', N'Right', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (127, 2, N'Question 1: Cover your right eye and indicate which direction the letter C is facing in the picture below?', N'LST1.png', N'Upward', N'Downwards', N'Left', N'Right', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (128, 2, N'Question 2: Cover your right eye and indicate which direction the letter E is facing in the picture below?', N'LST2.png', N'Upward', N'Downwards', N'Left', N'Right', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (129, 2, N'Question 3: Cover your right eye and indicate which direction the letter E is facing in the picture below?', N'LST3.png', N'Upward', N'Downwards', N'Left', N'Right', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (130, 2, N'Question 4: Cover your right eye and indicate which direction the letter E is facing in the picture below?', N'LST4.png', N'Upward', N'Downwards', N'Left', N'Right', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (131, 2, N'Question 5: Cover your right eye and indicate which direction the letter E is facing in the picture below?', N'LST5.png', N'Upward', N'Downwards', N'Left', N'Right', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (133, 2, N'	Question 6: Cover your right eye and indicate which direction the letter E is facing in the picture below?', N'LST6.png', N'Upward', N'Downwards', N'Left', N'Right', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (134, 2, N'Question 7: Cover your right eye and indicate which direction the letter E is facing in the picture below?', N'LST7.png', N'Upward', N'Downwards', N'Left', N'Right', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (135, 2, N'Question 8: Cover your right eye and indicate which direction the letter E is facing in the picture below?', N'LST8.png', N'Upward', N'Downwards', N'Left', N'Right', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (136, 2, N'Question 9: Cover your right eye and indicate which direction the letter E is facing in the picture below?', N'LST9.png', N'Upward', N'Downwards', N'Left', N'Right', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (137, 2, N'Question 10: Cover your right eye and indicate which direction the letter E is facing in the picture below?', N'LST10.png', N'Upward', N'Downwards', N'Left', N'Right', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (138, 2, N'Question 11: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'LST11.png', N'Upward', N'Downwards', N'Left', N'Right', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (139, 2, N'Question 12: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'LST12.png', N'Upward', N'Downwards', N'Left', N'Right', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (140, 2, N'Question 13: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'LST13.png', N'Upward', N'Downwards', N'Left', N'Right', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (141, 2, N'	Question 14: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'LST14.png', N'Upward', N'Downwards', N'Left', N'Right', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (142, 2, N'	Question 15: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'LST15.png', N'Upward', N'Downwards', N'Left', N'Right', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (143, 2, N'	Question 16: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'LST16.png', N'Upward', N'Downwards', N'Left', N'Right', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (144, 2, N'	Question 17: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'LST17.png', N'Upward', N'Downwards', N'Left', N'Right', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (145, 2, N'	Question 18: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'LST18.png', N'Upward', N'Downwards', N'Left', N'Right', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (146, 2, N'	Question 19: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'LST19.png', N'Upward', N'Downwards', N'Left', N'Right', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (147, 2, N'	Question 20: Cover your left eye and indicate which direction the letter E is facing in the picture below?', N'LST20.png', N'Upward', N'Downwards', N'Left', N'Right', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (148, 3, N'Question 1: Look at the picture and choose the answer you see', N'CBT1.png', N'02', N'12', N'22', N'I can''t see', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (149, 3, N'Question 2: Look at the picture and choose the answer you see', N'CBT2.png', N'29', N'70', N' 67', N'I can''t see', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (150, 3, N'Question 3: Look at the picture and choose the answer you see', N'CBT3.png', N'17', N'15', N'19', N'I can''t see', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (151, 3, N'Question 4: Look at the picture and choose the answer you see', N'CBT4.png', N'59', N'80', N'97', N'I can''t see', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (152, 3, N'Question 5: Look at the picture and choose the answer you see', N'CBT5.png', N'75', N'16', N'20', N'I can''t see', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (153, 3, N'Question 6: Look at the picture and choose the answer you see', N'CBT6.png', N'6', N'5', N'9', N'I can''t see', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (154, 12, N'Question 1:  1m from the screen and cover your left eye with your hand, look at the picture below and say How do you see the lines?', N'VT13.png', N'All lines are bolded equally', N'All lines are equally blurred', N'There are bold lines, there are blurred lines', N'I can''t see', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (155, 12, N'Question 2: 1m from the screen and cover your right eye with your hand, look at the picture below and say How do you see the lines?', N'VT13.png', N'All lines are bolded equally', N'All lines are equally blurred', N'There are bold lines, there are blurred lines', N'I can''t see', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (156, 12, N'Question 3: From this sentence, go closer to the screen 40cm, and choose the answer you see in the picture', N'VT14.png', N'Tiger', N'Panda', N'Lion', N'I can''t see', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (157, 12, N'Question 4: From this sentence, go closer to the screen 40cm, and choose the answer you see in the picture', N'VT15.png', N'Lion', N'Bear', N'Tiger', N'I can''t see', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (158, 12, N'Question 5: From this sentence, go closer to the screen 40cm, and choose the answer you see in the picture', N'VT16.png', N'Elephant', N'Anteaters', N'Dog', N'I can''t see', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (159, 4, N'Question 1: Which of the following puzzle pieces A, B, C, D, when paired with the piece on the left, will create a complete square?', N'IQ1.png', N'Piece A', N'Piece B', N'Piece C', N'Piece D', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (160, 4, N'	Question 2: Which number will be the next number in the following series of numbers?', N'IQ2.png', N'60', N'70', N'64', N'72', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (161, 4, N'Question 3: What number can replace the question mark?', N'IQ3.png', N'20', N'18', N'15', N'9', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (162, 4, N'Question 4: Find the correct number to fill in the blank', N'IQ4.png', N'7', N'8', N'6', N'9', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (163, 4, N'Question 5: Please fill in the appropriate calculation in the blank so that the vertical and horizontal calculation values ​​are equal', N'IQ5.png', N'+', N'-', N'x', N':', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (164, 4, N'Question 6:  Answer the question in 10 seconds with the data in the picture', N'IQ6.png', N'35', N'2', N'16', N'-10', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (176, 10, N'Question 1: Read the sentence below and fill in the blank with the missing answer', N'READ1.png', N'expansion', N'process', N'creation', N'action', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (177, 10, N'Question 2: Read the sentence below and fill in the blank with the missing answer', N'READ2.png', N'regularity', N'regularize', N'regularities', N'regularly', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (178, 10, N'Question 3: Read the sentence below and fill in the blank with the missing answer', N'READ3.png', N'Persisted', N'Persistent', N'Persistently', N'Persistence', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (179, 10, N'Question 4: Read the sentence below and fill in the blank with the missing answer', N'READ4.png', N'happiest', N'happily', N'happier', N'happy', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (180, 10, N'Question 5: Read the sentence below and fill in the blank with the missing answer', N'READ5.png', N'employ', N'employment', N'employee', N'employing', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (187, 11, N'Question 1: Listen and answer the following questions. A long time ago, this part of the town used to be a place where people came to relax and get away from their stress. Although this was once a shelter for people to escape, it has now become a chaotic and noisy market area', N'Listen1.png', N'rest and relax', N'meet relatives', N'work', N'All of the above', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1188, 12, N'Question 6: From this sentence, go closer to the screen 40cm, and choose the answer you see in the picture', N'VT17.png', N'Darker red circle', N'Darker green circle', N'2 circles are the same', N'I can''t see', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1189, 12, N'Question 7: From this sentence, approach the screen 40cm, read the information in line 2 and select the information contained there', N'VT18.png', N'High-rise buildings', N'Splendid city', N'Small group of people like ants', N'I can''t see', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1190, 12, N'Question 8: From this sentence, approach the screen 40cm, read the information in line 3 and select the information contained there', N'VT18.png', N'Splendid city', N'Small group of people like ants', N'High-rise buildings', N'I can''t see', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1191, 12, N'Question 9: From this sentence, approach the screen 40cm, read the information in line 3 and select the information contained there', N'VT18.png', N'Small group of people like ants', N'High-rise buildings', N'Splendid city', N'I can''t see', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1192, 12, N'Question 10: From this sentence, go closer to the screen 40cm, and choose the answer you see in the picture', N'VT19.png', N'Zebra', N'Giraffe', N' Hippo', N'I can''t see', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1193, 3, N'Question 7: Look at the picture and choose the answer you see', N'CBT8.png', N'6', N'5', N'3', N'I can''t see', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1194, 3, N'Question 8: Look at the picture and choose the answer you see', N'CBT45.png', N'45', N'26', N'15', N'I can''t see', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1195, 3, N'Question 9: Look at the picture and choose the answer you see', N'CBT10.png', N'9', N'3', N'5', N'I can''t see', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1196, 3, N'Question 10: Look at the picture and choose the answer you see', N'CBT7.png', N'Window', N' Table', N'Car', N'I can''t see', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1197, 4, N'Question 7: Calculate the following series of numbers:', N'IQ7.png', N'4500', N'4950', N'4850', N'4650', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1198, 4, N'Question 8: Answer the question in 10 seconds with the data in the picture', N'IQ8.png', N'-2', N'6', N'10', N'2', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1199, 4, N'Question 9: How many squares are there in the picture below?', N'IQ9.png', N'10', N'8', N'9', N'6', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1200, 4, N'Question 10:  How many triangles are there in the picture below?', N'IQ10.png', N'20', N'24', N'18', N'19', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1201, 11, N'Question 2: Listen and answer the following questions. Up until a few years ago, it wasn''t as bad as it is now. Although it is true that some people in the neighborhood supported the expansion of the market a few years ago, now most of them would agree that it has gotten out of control and created many serious problems for the area', N'Listen2.png', N'Some people', N'Nobody', N'Most people agree', N' Everyone', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1203, 11, N'Question 3: Listen and answer the following questions. In fact, it might have already gotten too far out of control. What we really need right now is not a mere intervention by civilians but strong action from the mayor''s office.', N'Listen3.png', N'They want to go out', N'They want gentle intervention', N'Don''t want anything', N'Strong action from the mayor''s office', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1204, 11, N'Question 4: Listen and answer the following questions. Security Inc. is the most trusted name in the sales and service of financial equipment and automated teller machines. Offering a degree of personal yet professional service that is unrivaled in the financial industry today, all employees at Security Inc. are dedicated to customer service and your complete satisfaction.', N'Listen4.png', N'Sales', N'Service of financial equipment', N'Automated teller machines', N'All of the above ideas', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1205, 11, N'Question 5: Listen and answer the following questions. We offer flexibility not found anywhere else in the financial services industry. Security Inc. can assemble a unique financial equipment package across multiple manufacturers'' product lines or tailor a financial equipment service program to meet your specific business needs.', N'Listen5.png', N'Flexibility', N'Activation', N'Creation', N'All of the above', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1206, 11, N'Question 6: Listen and answer the following questions. We offer the widest array of financial equipment products, services and supplies. This diversity in product and service offerings, combined with our unrivaled knowledge in the sale and service of automated teller machines, provides a competitive edge and real value for our customers.', N'Listen6.png', N'Build infrastructures', N'Financial services and automated teller machines', N'Sell ​​all kinds of cars', N'Real estate business', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1207, 11, N'Question 7: Listen and answer the following questions. Adrienne Rich, who is an alumna of Jackson Madison High School will be appearing on the BBC''s new talk show, The Rachel Ratigan Show, this Saturday night. The Rachel Ratigan Show is premiering this week and Rich is honored to be the first guest on the show.', N'Listen7.png', N'Next Saturday', N'Last Saturday', N'This Saturday', N'Next Thursday', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1208, 11, N'Question 8: Listen and answer the following questions. Adrienne Rich, who is an alumna of Jackson Madison High School will be appearing on the BBC''s new talk show, The Rachel Ratigan Show, this Saturday night. The Rachel Ratigan Show is premiering this week and Rich is honored to be the first guest on the show.', N'Listen8.png', N'Rell', N'Rachel', N'Rhym', N'Rich', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1209, 11, N'Question 9: Listen and answer the following questions. She will be interviewed about her second novel, A Woman Observed, which depicts a 35 year-old divorced woman living in a city as observed through the eyes of other characters. The book has hit No. 14 on the New York Times Bestseller List and has been praised by critics as the most commercially successful feminist novel this year. To watch the show, tune in to channel 4 at 9 P.M. this Saturday.', N'Listen9.png', N'25', N'35', N'45', N'There is no correct answer', 1)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1210, 11, N'Question 10: Listen and answer the following questions. She will be interviewed about her second novel, A Woman Observed, which depicts a 35 year-old divorced woman living in a city as observed through the eyes of other characters. The book has hit No. 14 on the New York Times Bestseller List and has been praised by critics as the most commercially successful feminist novel this year. To watch the show, tune in to channel 4 at 9 P.M. this Saturday.', N'Listen10.png', N'4th place', N'40th place', N'15th place', N'14th place', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1211, 10, N'Question 6: Read the sentence below and fill in the blank with the missing answer', N'READ6.png', N'promptly', N'prompts', N'prompter', N'prompted', 0)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1212, 10, N'Question 7: Read the sentence below and fill in the blank with the missing answer', N'READ7.png', N'whisper', N'peep', N'trace', N'flash', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1213, 10, N'Question 8: Read the sentence below and fill in the blank with the missing answer', N'READ8.png', N'part', N'extension', N'variety', N'limit', 2)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1214, 10, N'Question 9: Read the sentence below and fill in the blank with the missing answer', N'READ9.png', N'Beside', N'Or else', N'And then', N'Accordingly', 3)
INSERT [dbo].[Questions] ([QnId], [QuizId], [QnInWords], [ImageName], [Option1], [Option2], [Option3], [Option4], [Answer]) VALUES (1215, 10, N'Question 10: Read the sentence below and fill in the blank with the missing answer', N'READ10.png', N'registering', N'joining', N'agreeing', N'running', 0)
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Quizes] ON 

INSERT [dbo].[Quizes] ([QuizId], [QuizName], [Decripsion], [Imagename]) VALUES (1, N'Myopia Test', N'Instructions: sit 1m away from the screen, continue to wear glasses if you are nearsighted', N'ET1.jpg')
INSERT [dbo].[Quizes] ([QuizId], [QuizName], [Decripsion], [Imagename]) VALUES (2, N'Light Sensitivity Test', N'Instructions: sit 1m away from the screen, continue to wear glasses if you are nearsighted', N'ET2.jpg')
INSERT [dbo].[Quizes] ([QuizId], [QuizName], [Decripsion], [Imagename]) VALUES (3, N'Color Blindness Test', N'Instructions: sit 40cm away from the screen, continue to wear glasses if you are nearsighted', N'ET4.jpg')
INSERT [dbo].[Quizes] ([QuizId], [QuizName], [Decripsion], [Imagename]) VALUES (4, N'IQ Test', N'International standard online IQ test', N'IQ.png')
INSERT [dbo].[Quizes] ([QuizId], [QuizName], [Decripsion], [Imagename]) VALUES (10, N'Reading Test', N'The TOEIC reading comprehension test is the second half of the TOEIC Listening & Reading Test. ', N'reading.png')
INSERT [dbo].[Quizes] ([QuizId], [QuizName], [Decripsion], [Imagename]) VALUES (11, N'Listening Test', N'The TOEIC L&R is an objective test using an optically-scanned answer sheet', N'listening.png')
INSERT [dbo].[Quizes] ([QuizId], [QuizName], [Decripsion], [Imagename]) VALUES (12, N'Astigmatism Test And Presbyopia Test', N'The astigmatism test has only the first 2 questions, the presbyopia test includes the remaining questions. Please read the instructions carefully', N'ET3.jpg')
SET IDENTITY_INSERT [dbo].[Quizes] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([RoleId], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[UserRole] ([RoleId], [RoleName]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [Fullname], [Email], [Phone], [Address], [RoleId]) VALUES (24, N'admin1', N'123', N'Nguyen Vu', N'nguyenvu270901@gmail.com', N'0946104100', N'112 Duong Qu?ng Hàm, phu?ng 5', 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [Fullname], [Email], [Phone], [Address], [RoleId]) VALUES (1071, N'nguyen123', N'Nvu270901', N'Vu Dinh Nguyen', N'nguyenvu270901@gmail.com', N'0946104100', N'112 Duong Qu?ng Hàm, phu?ng 5', 2)
INSERT [dbo].[Users] ([Id], [Username], [Password], [Fullname], [Email], [Phone], [Address], [RoleId]) VALUES (1073, N'thao123', N'Nvu270901', N'Thao', N'nguyenvu270901@gmail.com', N'0912345678', N'112 Duong Qu?ng Hàm, phu?ng 5', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [df_roleid]  DEFAULT ((2)) FOR [RoleId]
GO
ALTER TABLE [dbo].[Participants]  WITH CHECK ADD  CONSTRAINT [fk_id_user] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Participants] CHECK CONSTRAINT [fk_id_user]
GO
ALTER TABLE [dbo].[Participants]  WITH CHECK ADD  CONSTRAINT [fk_quizzid] FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quizes] ([QuizId])
GO
ALTER TABLE [dbo].[Participants] CHECK CONSTRAINT [fk_quizzid]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK__Questions__QuizI__47A6A41B] FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quizes] ([QuizId])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK__Questions__QuizI__47A6A41B]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_User_UserRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserRole] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_User_UserRole]
GO
/****** Object:  StoredProcedure [dbo].[usp_Login]    Script Date: 6/24/2023 4:11:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_Login] (@Fullname varchar(100), @Password varchar(100))
as
begin
Select * from [dbo].[User] Where Fullname = @Fullname and Password = @Password
End
GO
USE [master]
GO
ALTER DATABASE [EyesTest] SET  READ_WRITE 
GO
