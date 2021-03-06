USE [master]
GO
/****** Object:  Database [SippyShop]    Script Date: 12/14/2018 9:20:01 PM ******/
CREATE DATABASE [SippyShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SippyShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SippyShop.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SippyShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SippyShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SippyShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SippyShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SippyShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SippyShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SippyShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SippyShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SippyShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [SippyShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SippyShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SippyShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SippyShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SippyShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SippyShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SippyShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SippyShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SippyShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SippyShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SippyShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SippyShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SippyShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SippyShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SippyShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SippyShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SippyShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SippyShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SippyShop] SET  MULTI_USER 
GO
ALTER DATABASE [SippyShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SippyShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SippyShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SippyShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SippyShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SippyShop]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 12/14/2018 9:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryId] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCodeSale]    Script Date: 12/14/2018 9:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCodeSale](
	[codeId] [nvarchar](50) NOT NULL,
	[sale] [float] NOT NULL,
	[endDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblCodeSale] PRIMARY KEY CLUSTERED 
(
	[codeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblGuestRecipt]    Script Date: 12/14/2018 9:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGuestRecipt](
	[guestReciptId] [int] IDENTITY(1,1) NOT NULL,
	[phoneNum] [nvarchar](50) NOT NULL,
	[productId] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_tblGuestRecipt] PRIMARY KEY CLUSTERED 
(
	[guestReciptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 12/14/2018 9:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productId] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[sale] [float] NOT NULL,
	[img] [nvarchar](50) NULL,
	[categoryId] [nvarchar](50) NOT NULL,
	[detail] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRecipt]    Script Date: 12/14/2018 9:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRecipt](
	[reciptId] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NULL,
	[price] [float] NOT NULL,
	[sale] [float] NULL,
	[name] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[date] [nvarchar](50) NULL,
	[stt] [int] NOT NULL,
 CONSTRAINT [PK_tblRecipt] PRIMARY KEY CLUSTERED 
(
	[reciptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblReciptDetail]    Script Date: 12/14/2018 9:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReciptDetail](
	[reciptDetailId] [int] IDENTITY(1,1) NOT NULL,
	[reciptId] [int] NULL,
	[productId] [nvarchar](50) NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_tblReciptDetail_1] PRIMARY KEY CLUSTERED 
(
	[reciptDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRegistration]    Script Date: 12/14/2018 9:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegistration](
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRegistration] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSaleDetail]    Script Date: 12/14/2018 9:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSaleDetail](
	[saleDeailId] [int] IDENTITY(1,1) NOT NULL,
	[codeId] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblReciptDetail] PRIMARY KEY CLUSTERED 
(
	[saleDeailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblType]    Script Date: 12/14/2018 9:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblType](
	[type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblType] PRIMARY KEY CLUSTERED 
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 12/14/2018 9:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[name] [nvarchar](50) NULL,
	[password] [nvarchar](50) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[phoneNum] [nvarchar](50) NULL,
	[img] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblCategory] ([categoryId], [name], [type]) VALUES (N'1', N'Sơ Mi', N'MEN')
INSERT [dbo].[tblCategory] ([categoryId], [name], [type]) VALUES (N'10', N'Áo Ba Lỗ', N'KID')
INSERT [dbo].[tblCategory] ([categoryId], [name], [type]) VALUES (N'2', N'Váy', N'WOMAN')
INSERT [dbo].[tblCategory] ([categoryId], [name], [type]) VALUES (N'3', N'Hoodie', N'MEN')
INSERT [dbo].[tblCategory] ([categoryId], [name], [type]) VALUES (N'4', N'Áo Phông', N'KID')
INSERT [dbo].[tblCategory] ([categoryId], [name], [type]) VALUES (N'5', N'Thể Thao', N'MEN')
INSERT [dbo].[tblCategory] ([categoryId], [name], [type]) VALUES (N'6', N'Vét', N'MEN')
INSERT [dbo].[tblCategory] ([categoryId], [name], [type]) VALUES (N'7', N'Áo Khoác', N'WOMAN')
INSERT [dbo].[tblCategory] ([categoryId], [name], [type]) VALUES (N'8', N'Pijama', N'WOMAN')
INSERT [dbo].[tblCategory] ([categoryId], [name], [type]) VALUES (N'9', N'Đồ Mùa Đông', N'KID')
INSERT [dbo].[tblCategory] ([categoryId], [name], [type]) VALUES (N'cat2', N'Đầm Bầu', N'WOMAN')
INSERT [dbo].[tblCodeSale] ([codeId], [sale], [endDate]) VALUES (N'giang sinh', 10000, CAST(N'2018-12-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCodeSale] ([codeId], [sale], [endDate]) VALUES (N'tet', 50000, CAST(N'2018-11-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCodeSale] ([codeId], [sale], [endDate]) VALUES (N'trung thu', 20000, CAST(N'2018-09-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro01', N'Sơ Mi Trắng', 95, 50000, 0, N'/Content/image/11.jpg', N'1', N'Với Chất Liệu Coton Pha Tơ Tằm Chắc Chắn Sẽ Làm Bạn Hài Lòng')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro02', N'Sơ Mi Lông Thú', 97, 70000, 0, N'/Content/image/AKN9.jpg', N'1', N'Làm Từ Lông Thú Hoang ')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro03', N'Sơ Mi Áo Khoác', 94, 80000, 10000, N'/Content/image/out10.jpg', N'1', N'Với Chất Liệu Coton Pha Tơ Tằm Chắc Chắn Sẽ Làm Bạn Hài Lòng')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro04', N'BasketBoy', 19, 60000, 0, N'/Content/image/7.jpg', N'5', N'Limited')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro05', N'Quần Đá Banh', 100, 50000, 0, N'/Content/image/jogger6.jpg', N'5', N'Bao Rách Háng')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro06', N'Quần Thể Thao Gymer', 19, 70000, 0, N'/Content/image/jogger2.jpg', N'5', N'Với Chất Liệu Coton Pha Tơ Tằm Chắc Chắn Sẽ Làm Bạn Hài Lòng')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro07', N'Vét Kaki', 100, 600000, 10000, N'/Content/image/C7.jpg', N'6', N'Do Thiếu Model Nam Nên Đành Chọn Model Nữ')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro09', N'Vét Complete', 100, 500000, 40000, N'/Content/image/C1.jpg', N'6', N'Đơn Giản Và Sang Trọng')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro10', N'Váy Ngắn Nóng Nực', 99, 50000, 0, N'/Content/image/ALQ8.jpg', N'2', N'Mùa Hè Thêm Vui Và Mát Mẻ ')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro11', N'Váy Ngắn Thu Đông', 19, 70000, 0, N'/Content/image/C9.jpg', N'2', N'Ngắn Hết Cỡ')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro12', N'Váy Đồng Phục', 100, 30000, 0, N'/Content/image/V5.jpg', N'2', N'Giành Tặng Cho Các Em Nữ Sinh Mát Mẻ Mơn Mởn')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro13', N'Ba Lỗ Tay Dài', 100, 50000, 0, N'/Content/image/AP12.jpg', N'10', N'Ba Lỗ Hiện Đại ')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro14', N'Đầm Bầu ĐỎ', 94, 50000, 0, N'/Content/image/AK6.jpg', N'cat2', N'Đẹp  Xinh Tươi')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro15', N'pijama Hoa', 98, 20000, 0, N'/Content/image/AK11.jpg', N'cat2', N'Hoa Xinh')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro16', N'Phông Đỏ Tươi', 50, 30000, 0, N'/Content/image/13.jpg', N'4', N'Phông Đỏ Chứng Tỏ Xi Đa')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro17', N'Áo Khoác Da', 100, 50000, 0, N'/Content/image/out14.jpg', N'7', N'Khoác Đẹp Lắm ')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro18', N'Đầm Xinh Tươi', 100, 20000, 0, N'/Content/image/AK8.jpg', N'cat2', N'Không Lo Trời Nắng')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro19', N'Pijama Mùa Đông', 100, 50000, 0, N'/Content/image/DN5.jpg', N'8', N'Mềm Mại Thoải Mái')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro20', N'Áo Phông Đen', 100, 40000, 0, N'/Content/image/3.jpg', N'4', N'Phông Đen Trắng ')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro21', N'Áo Thun Thẫn Thờ', 100, 40000, 0, N'/Content/image/10.jpg', N'4', N'Làm từ Tơ Tằm')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro22', N'Đồ Mùa Đông', 100, 40000, 0, N'/Content/image/AP7.jpg', N'9', N'Mùa Đông Không Lạnh Đâu')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro23', N'Đông Đừng Đến ', 100, 60000, 0, N'/Content/image/AN4.jpg', N'9', N'Mùa Đông Đến Nơi Đây Tìm Anh')
INSERT [dbo].[tblProduct] ([productId], [name], [quantity], [price], [sale], [img], [categoryId], [detail]) VALUES (N'pro25', N'Hoodie den', 100, 50000, 0, N'/Content/image/AK15.jpg', N'3', N'Limited')
SET IDENTITY_INSERT [dbo].[tblRecipt] ON 

INSERT [dbo].[tblRecipt] ([reciptId], [email], [price], [sale], [name], [phone], [address], [type], [date], [stt]) VALUES (28, N'a@gmail.com', 2000, 0, N'thien', N'0983974232', N'Hanoi', N'Nhà riêng', N'10/25/2018 11:17:09 PM', 2)
INSERT [dbo].[tblRecipt] ([reciptId], [email], [price], [sale], [name], [phone], [address], [type], [date], [stt]) VALUES (29, N'a@gmail.com', 10000, 0, N'abc', N'0983974232', N'1,quang trung,11,go vap,437', N'Nơi làm việc', N'10/26/2018 8:51:10 PM', 2)
INSERT [dbo].[tblRecipt] ([reciptId], [email], [price], [sale], [name], [phone], [address], [type], [date], [stt]) VALUES (35, N'thanh@gmail.com', 28500, 1500, N'thuy', N'0983974232', N'1,quang trung,11,go vap,437', N'Nhà riêng', N'10/27/2018 4:58:00 PM', 3)
INSERT [dbo].[tblRecipt] ([reciptId], [email], [price], [sale], [name], [phone], [address], [type], [date], [stt]) VALUES (41, N'thanh@gmail.com', 114000, 6000, N'thien', N'0983974232', N'1,quang trung,11,go vap,437', N'Nhà riêng', N'10/30/2018 10:18:30 PM', 1)
INSERT [dbo].[tblRecipt] ([reciptId], [email], [price], [sale], [name], [phone], [address], [type], [date], [stt]) VALUES (42, N'thuc@gmail.com', 66500, 3500, N'thien', N'0983974232', N'1,quang trung,11,go vap,419', N'Nhà riêng', N'10/30/2018 10:32:00 PM', 1)
INSERT [dbo].[tblRecipt] ([reciptId], [email], [price], [sale], [name], [phone], [address], [type], [date], [stt]) VALUES (43, N'thanh@gmail.com', 114000, 6000, N'thien', N'0983974232', N'1,quang trung,11,go vap,417', N'Nơi làm việc', N'10/31/2018 12:12:15 PM', 0)
INSERT [dbo].[tblRecipt] ([reciptId], [email], [price], [sale], [name], [phone], [address], [type], [date], [stt]) VALUES (44, N'thanh@gmail.com', 114000, 6000, N'thuc', N'0983974232', N'1,quang trung,11,go vap,417', N'Nơi làm việc', N'10/31/2018 12:14:43 PM', 2)
INSERT [dbo].[tblRecipt] ([reciptId], [email], [price], [sale], [name], [phone], [address], [type], [date], [stt]) VALUES (45, N'thanh@gmail.com', 66500, 3500, N'Phat', N'0983974232', N'1,quang trung,11,go vap,437', N'Nhà riêng', N'10/31/2018 1:33:16 PM', 2)
INSERT [dbo].[tblRecipt] ([reciptId], [email], [price], [sale], [name], [phone], [address], [type], [date], [stt]) VALUES (46, N'thanh@gmail.com', 418000, 22000, N'Thao', N'0983974232', N'1,quang trung,11,go vap,440', N'Nơi làm việc', N'10/31/2018 2:32:09 PM', 2)
INSERT [dbo].[tblRecipt] ([reciptId], [email], [price], [sale], [name], [phone], [address], [type], [date], [stt]) VALUES (47, N'thanh@gmail.com', 370500, 19500, N'Phú', N'0983974232', N'66,Tân Quý,11,go vap,437', N'Nhà riêng', N'10/31/2018 10:18:09 PM', 2)
SET IDENTITY_INSERT [dbo].[tblRecipt] OFF
SET IDENTITY_INSERT [dbo].[tblReciptDetail] ON 

INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (1, 41, N'pro10', 1, 50000)
INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (2, 41, N'pro11', 1, 70000)
INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (3, 42, N'pro14', 1, 50000)
INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (4, 42, N'pro15', 1, 20000)
INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (5, 43, N'pro01', 1, 50000)
INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (6, 43, N'pro02', 1, 70000)
INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (7, 44, N'pro01', 1, 50000)
INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (8, 44, N'pro02', 1, 70000)
INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (9, 45, N'pro06', 1, 70000)
INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (10, 46, N'pro03', 5, 80000)
INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (11, 46, N'pro01', 1, 50000)
INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (12, 47, N'pro14', 5, 50000)
INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (13, 47, N'pro15', 1, 20000)
INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (14, 47, N'pro01', 1, 50000)
INSERT [dbo].[tblReciptDetail] ([reciptDetailId], [reciptId], [productId], [quantity], [price]) VALUES (15, 47, N'pro03', 1, 80000)
SET IDENTITY_INSERT [dbo].[tblReciptDetail] OFF
INSERT [dbo].[tblRegistration] ([email], [password]) VALUES (N'abc@gmail.com', N'1')
INSERT [dbo].[tblRegistration] ([email], [password]) VALUES (N'as@gmail.com', N'1')
INSERT [dbo].[tblRegistration] ([email], [password]) VALUES (N'c@gmail.com', N'1')
INSERT [dbo].[tblRegistration] ([email], [password]) VALUES (N'e@gmail.com', N'1')
INSERT [dbo].[tblType] ([type]) VALUES (N'KID')
INSERT [dbo].[tblType] ([type]) VALUES (N'MEN')
INSERT [dbo].[tblType] ([type]) VALUES (N'WOMAN')
INSERT [dbo].[tblUser] ([name], [password], [role], [phoneNum], [img], [email], [address]) VALUES (N'THIEN', N'1', N'Admin', N'0983874233', NULL, N'a@gmail.com', N'DaNang')
INSERT [dbo].[tblUser] ([name], [password], [role], [phoneNum], [img], [email], [address]) VALUES (NULL, N'1', N'User', NULL, NULL, N'anh@gmail.com', NULL)
INSERT [dbo].[tblUser] ([name], [password], [role], [phoneNum], [img], [email], [address]) VALUES (NULL, N'1', N'User', NULL, NULL, N'dat@gmail.com', NULL)
INSERT [dbo].[tblUser] ([name], [password], [role], [phoneNum], [img], [email], [address]) VALUES (N'kien', N'1', N'User', N'1234', NULL, N'kien@gmail.com', N'hanoi')
INSERT [dbo].[tblUser] ([name], [password], [role], [phoneNum], [img], [email], [address]) VALUES (N'THANH', N'1', N'User', N'0983874232', NULL, N'thanh@gmail.com', N'HongKong1')
INSERT [dbo].[tblUser] ([name], [password], [role], [phoneNum], [img], [email], [address]) VALUES (N'thao', N'1', N'User', N'123', NULL, N'thao@gmail.com', NULL)
INSERT [dbo].[tblUser] ([name], [password], [role], [phoneNum], [img], [email], [address]) VALUES (N'Dam Bau', N'1', N'User', N'123', NULL, N'thien@gmail.com', N'DaNang')
INSERT [dbo].[tblUser] ([name], [password], [role], [phoneNum], [img], [email], [address]) VALUES (N'thuc', N'1', N'User', N'123', N'/Content/image/check.png', N'thuc@gmail.com', N'DaNang')
ALTER TABLE [dbo].[tblCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblCategory_tblType] FOREIGN KEY([type])
REFERENCES [dbo].[tblType] ([type])
GO
ALTER TABLE [dbo].[tblCategory] CHECK CONSTRAINT [FK_tblCategory_tblType]
GO
ALTER TABLE [dbo].[tblGuestRecipt]  WITH CHECK ADD  CONSTRAINT [FK_tblGuestRecipt_tblProduct] FOREIGN KEY([productId])
REFERENCES [dbo].[tblProduct] ([productId])
GO
ALTER TABLE [dbo].[tblGuestRecipt] CHECK CONSTRAINT [FK_tblGuestRecipt_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([categoryId])
REFERENCES [dbo].[tblCategory] ([categoryId])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO
ALTER TABLE [dbo].[tblRecipt]  WITH CHECK ADD  CONSTRAINT [FK_tblRecipt_tblUser] FOREIGN KEY([email])
REFERENCES [dbo].[tblUser] ([email])
GO
ALTER TABLE [dbo].[tblRecipt] CHECK CONSTRAINT [FK_tblRecipt_tblUser]
GO
ALTER TABLE [dbo].[tblReciptDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblReciptDetail_tblProduct] FOREIGN KEY([productId])
REFERENCES [dbo].[tblProduct] ([productId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblReciptDetail] CHECK CONSTRAINT [FK_tblReciptDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblReciptDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblReciptDetail_tblRecipt] FOREIGN KEY([reciptId])
REFERENCES [dbo].[tblRecipt] ([reciptId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblReciptDetail] CHECK CONSTRAINT [FK_tblReciptDetail_tblRecipt]
GO
ALTER TABLE [dbo].[tblSaleDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblReciptDetail_tblCodeSale] FOREIGN KEY([codeId])
REFERENCES [dbo].[tblCodeSale] ([codeId])
GO
ALTER TABLE [dbo].[tblSaleDetail] CHECK CONSTRAINT [FK_tblReciptDetail_tblCodeSale]
GO
ALTER TABLE [dbo].[tblSaleDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblSaleDetail_tblUser] FOREIGN KEY([email])
REFERENCES [dbo].[tblUser] ([email])
GO
ALTER TABLE [dbo].[tblSaleDetail] CHECK CONSTRAINT [FK_tblSaleDetail_tblUser]
GO
USE [master]
GO
ALTER DATABASE [SippyShop] SET  READ_WRITE 
GO
