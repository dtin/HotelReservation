USE [master]
GO
/****** Object:  Database [HotelBooking]    Script Date: 12/18/2020 11:40:03 PM ******/
CREATE DATABASE [HotelBooking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelBooking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\HotelBooking.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HotelBooking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\HotelBooking_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HotelBooking] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelBooking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelBooking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelBooking] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HotelBooking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelBooking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelBooking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelBooking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelBooking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelBooking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelBooking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelBooking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HotelBooking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelBooking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelBooking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelBooking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelBooking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelBooking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelBooking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelBooking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HotelBooking] SET  MULTI_USER 
GO
ALTER DATABASE [HotelBooking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelBooking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelBooking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelBooking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HotelBooking] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HotelBooking]
GO
/****** Object:  Table [dbo].[tblDiscounts]    Script Date: 12/18/2020 11:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDiscounts](
	[discountCode] [varchar](30) NOT NULL,
	[discountPercent] [float] NOT NULL,
	[availableTo] [date] NOT NULL,
	[createdAt] [date] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 12/18/2020 11:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[detailId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [varchar](50) NOT NULL,
	[roomId] [int] NOT NULL,
	[price] [bigint] NOT NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[detailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 12/18/2020 11:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderId] [varchar](50) NOT NULL CONSTRAINT [DF__tblOrders__order__1367E606]  DEFAULT (newid()),
	[userId] [varchar](50) NOT NULL,
	[totalPrice] [bigint] NOT NULL,
	[discountCode] [varchar](30) NULL,
	[checkIn] [date] NOT NULL,
	[checkOut] [date] NOT NULL,
	[createdAt] [date] NOT NULL,
	[feedBack] [int] NULL,
	[status] [bit] NOT NULL,
	[activationCode] [varchar](6) NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 12/18/2020 11:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRooms]    Script Date: 12/18/2020 11:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRooms](
	[roomId] [int] IDENTITY(1,1) NOT NULL,
	[roomNumber] [varchar](5) NOT NULL,
	[typeId] [int] NOT NULL,
 CONSTRAINT [PK_tblRooms] PRIMARY KEY CLUSTERED 
(
	[roomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTypes]    Script Date: 12/18/2020 11:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTypes](
	[typeId] [int] IDENTITY(1,1) NOT NULL,
	[picture] [varchar](50) NOT NULL,
	[typeName] [nvarchar](50) NOT NULL,
	[price] [bigint] NOT NULL,
 CONSTRAINT [PK_tblTypes] PRIMARY KEY CLUSTERED 
(
	[typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 12/18/2020 11:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userId] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NULL,
	[phone] [varchar](11) NULL,
	[status] [bit] NOT NULL,
	[roleId] [int] NOT NULL,
	[createdAt] [date] NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblDiscounts] ([discountCode], [discountPercent], [availableTo], [createdAt]) VALUES (N'KHACHHANGMOI', 49.9, CAST(N'2020-12-15' AS Date), CAST(N'2020-12-14' AS Date))
INSERT [dbo].[tblDiscounts] ([discountCode], [discountPercent], [availableTo], [createdAt]) VALUES (N'KHACHHANGCU', 30, CAST(N'2020-12-20' AS Date), CAST(N'2020-12-18' AS Date))
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([detailId], [orderId], [roomId], [price]) VALUES (11, N'81B424FB-DEB1-4F80-82D7-D5F02E5B48B5', 1, 800000)
INSERT [dbo].[tblOrderDetails] ([detailId], [orderId], [roomId], [price]) VALUES (12, N'81B424FB-DEB1-4F80-82D7-D5F02E5B48B5', 5, 800000)
INSERT [dbo].[tblOrderDetails] ([detailId], [orderId], [roomId], [price]) VALUES (13, N'C27190E7-1B69-423B-AA9E-5A6E158890CE', 2, 1700000)
INSERT [dbo].[tblOrderDetails] ([detailId], [orderId], [roomId], [price]) VALUES (14, N'D835FBB3-A0CD-4F39-B2F6-6D0481660C9A', 2, 1700000)
INSERT [dbo].[tblOrderDetails] ([detailId], [orderId], [roomId], [price]) VALUES (15, N'FC3A9D7B-094E-40C7-A6AD-221A6FAE7ADF', 1, 800000)
INSERT [dbo].[tblOrderDetails] ([detailId], [orderId], [roomId], [price]) VALUES (19, N'37CDEDFF-C5AF-45BC-8906-908459F4F538', 5, 800000)
INSERT [dbo].[tblOrderDetails] ([detailId], [orderId], [roomId], [price]) VALUES (20, N'8CEC1A8E-E2A1-4D2F-BADA-9A1D917E0DC2', 5, 800000)
INSERT [dbo].[tblOrderDetails] ([detailId], [orderId], [roomId], [price]) VALUES (21, N'8CEC1A8E-E2A1-4D2F-BADA-9A1D917E0DC2', 2, 1700000)
INSERT [dbo].[tblOrderDetails] ([detailId], [orderId], [roomId], [price]) VALUES (22, N'8CEC1A8E-E2A1-4D2F-BADA-9A1D917E0DC2', 8, 1700000)
INSERT [dbo].[tblOrderDetails] ([detailId], [orderId], [roomId], [price]) VALUES (23, N'2A5230D1-20CB-46FB-B4ED-6339C79FCF8F', 6, 800000)
INSERT [dbo].[tblOrderDetails] ([detailId], [orderId], [roomId], [price]) VALUES (24, N'2A5230D1-20CB-46FB-B4ED-6339C79FCF8F', 12, 800000)
INSERT [dbo].[tblOrderDetails] ([detailId], [orderId], [roomId], [price]) VALUES (25, N'2A5230D1-20CB-46FB-B4ED-6339C79FCF8F', 7, 3100000)
INSERT [dbo].[tblOrderDetails] ([detailId], [orderId], [roomId], [price]) VALUES (26, N'3CC21256-B693-4A67-B0EB-6BD03D86F12D', 2, 1700000)
INSERT [dbo].[tblOrderDetails] ([detailId], [orderId], [roomId], [price]) VALUES (27, N'3CC21256-B693-4A67-B0EB-6BD03D86F12D', 9, 5000000)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
INSERT [dbo].[tblOrders] ([orderId], [userId], [totalPrice], [discountCode], [checkIn], [checkOut], [createdAt], [feedBack], [status], [activationCode]) VALUES (N'2A5230D1-20CB-46FB-B4ED-6339C79FCF8F', N'tinddse140129@fpt.edu.vn', 4700000, NULL, CAST(N'2020-12-18' AS Date), CAST(N'2020-12-18' AS Date), CAST(N'2020-12-18' AS Date), NULL, 1, N'')
INSERT [dbo].[tblOrders] ([orderId], [userId], [totalPrice], [discountCode], [checkIn], [checkOut], [createdAt], [feedBack], [status], [activationCode]) VALUES (N'37CDEDFF-C5AF-45BC-8906-908459F4F538', N'tinddse140129@fpt.edu.vn', 800000, N'KHACHHANGCU', CAST(N'2020-12-18' AS Date), CAST(N'2020-12-18' AS Date), CAST(N'2020-12-18' AS Date), NULL, 1, N'')
INSERT [dbo].[tblOrders] ([orderId], [userId], [totalPrice], [discountCode], [checkIn], [checkOut], [createdAt], [feedBack], [status], [activationCode]) VALUES (N'3CC21256-B693-4A67-B0EB-6BD03D86F12D', N'tinddse140129@fpt.edu.vn', 6700000, NULL, CAST(N'2020-12-18' AS Date), CAST(N'2020-12-18' AS Date), CAST(N'2020-12-18' AS Date), NULL, 1, N'')
INSERT [dbo].[tblOrders] ([orderId], [userId], [totalPrice], [discountCode], [checkIn], [checkOut], [createdAt], [feedBack], [status], [activationCode]) VALUES (N'81B424FB-DEB1-4F80-82D7-D5F02E5B48B5', N'ghostuker@gmail.com', 1600000, NULL, CAST(N'2020-12-17' AS Date), CAST(N'2020-12-17' AS Date), CAST(N'2020-12-17' AS Date), NULL, 1, N'331655')
INSERT [dbo].[tblOrders] ([orderId], [userId], [totalPrice], [discountCode], [checkIn], [checkOut], [createdAt], [feedBack], [status], [activationCode]) VALUES (N'8CEC1A8E-E2A1-4D2F-BADA-9A1D917E0DC2', N'tinddse140129@fpt.edu.vn', 4200000, NULL, CAST(N'2020-12-19' AS Date), CAST(N'2020-12-20' AS Date), CAST(N'2020-12-18' AS Date), NULL, 1, N'')
INSERT [dbo].[tblOrders] ([orderId], [userId], [totalPrice], [discountCode], [checkIn], [checkOut], [createdAt], [feedBack], [status], [activationCode]) VALUES (N'C27190E7-1B69-423B-AA9E-5A6E158890CE', N'ghostuker@gmail.com', 1700000, NULL, CAST(N'2020-12-17' AS Date), CAST(N'2020-12-17' AS Date), CAST(N'2020-12-17' AS Date), NULL, 0, N'')
INSERT [dbo].[tblOrders] ([orderId], [userId], [totalPrice], [discountCode], [checkIn], [checkOut], [createdAt], [feedBack], [status], [activationCode]) VALUES (N'D835FBB3-A0CD-4F39-B2F6-6D0481660C9A', N'ghostuker@gmail.com', 1700000, NULL, CAST(N'2020-12-16' AS Date), CAST(N'2020-12-16' AS Date), CAST(N'2020-12-16' AS Date), 1, 1, N'')
INSERT [dbo].[tblOrders] ([orderId], [userId], [totalPrice], [discountCode], [checkIn], [checkOut], [createdAt], [feedBack], [status], [activationCode]) VALUES (N'FC3A9D7B-094E-40C7-A6AD-221A6FAE7ADF', N'ghostuker@gmail.com', 800000, NULL, CAST(N'2020-12-18' AS Date), CAST(N'2020-12-23' AS Date), CAST(N'2020-12-17' AS Date), NULL, 1, N'')
SET IDENTITY_INSERT [dbo].[tblRoles] ON 

INSERT [dbo].[tblRoles] ([roleId], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[tblRoles] ([roleId], [roleName]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[tblRoles] OFF
SET IDENTITY_INSERT [dbo].[tblRooms] ON 

INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (1, N'111', 1)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (2, N'123', 2)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (5, N'021', 1)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (6, N'031', 1)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (7, N'412', 3)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (8, N'132', 2)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (9, N'511', 4)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (10, N'510', 4)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (11, N'505', 4)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (12, N'112', 1)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (13, N'113', 1)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (14, N'114', 1)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (15, N'115', 1)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (16, N'101', 1)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (17, N'102', 1)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (18, N'231', 2)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (19, N'230', 2)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (20, N'210', 2)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (21, N'215', 2)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (22, N'310', 3)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (23, N'311', 3)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (24, N'312', 3)
INSERT [dbo].[tblRooms] ([roomId], [roomNumber], [typeId]) VALUES (25, N'313', 3)
SET IDENTITY_INSERT [dbo].[tblRooms] OFF
SET IDENTITY_INSERT [dbo].[tblTypes] ON 

INSERT [dbo].[tblTypes] ([typeId], [picture], [typeName], [price]) VALUES (1, N'single-bed.jpg', N'Single', 800000)
INSERT [dbo].[tblTypes] ([typeId], [picture], [typeName], [price]) VALUES (2, N'double-beds.jpg', N'Double', 1700000)
INSERT [dbo].[tblTypes] ([typeId], [picture], [typeName], [price]) VALUES (3, N'family-room.jpg', N'Family', 3100000)
INSERT [dbo].[tblTypes] ([typeId], [picture], [typeName], [price]) VALUES (4, N'president-room.jpg', N'President', 5000000)
SET IDENTITY_INSERT [dbo].[tblTypes] OFF
INSERT [dbo].[tblUsers] ([userId], [password], [name], [address], [phone], [status], [roleId], [createdAt]) VALUES (N'demo@gmail.com', N'1', N'Demo', N'Nguyen Kiem', N'0901397192', 1, 2, CAST(N'2020-12-16' AS Date))
INSERT [dbo].[tblUsers] ([userId], [password], [name], [address], [phone], [status], [roleId], [createdAt]) VALUES (N'ghostuker@gmail.com', N'1', N'Tin', N'1', N'1', 1, 2, CAST(N'2020-12-17' AS Date))
INSERT [dbo].[tblUsers] ([userId], [password], [name], [address], [phone], [status], [roleId], [createdAt]) VALUES (N'tan@gmail.com', N'11', N'Tan', N'1', N'1', 1, 2, CAST(N'2020-12-16' AS Date))
INSERT [dbo].[tblUsers] ([userId], [password], [name], [address], [phone], [status], [roleId], [createdAt]) VALUES (N'tin@gmail.com', N'1', N'Tín', N'Thich Quang Duc', N'0383371353', 1, 2, CAST(N'2020-12-16' AS Date))
INSERT [dbo].[tblUsers] ([userId], [password], [name], [address], [phone], [status], [roleId], [createdAt]) VALUES (N'tinddse140129@fpt.edu.vn', N'', N'tinddse140129@fpt.edu.vn', NULL, NULL, 1, 2, CAST(N'2020-12-18' AS Date))
USE [master]
GO
ALTER DATABASE [HotelBooking] SET  READ_WRITE 
GO
