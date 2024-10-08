USE [master]
GO
/****** Object:  Database [IskhakovTrade]    Script Date: 08.10.2024 5:04:58 ******/
CREATE DATABASE [IskhakovTrade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IskhakovTrade', FILENAME = N'D:\Program File\MSSQL15.SQLEXPRESS\MSSQL\DATA\IskhakovTrade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IskhakovTrade_log', FILENAME = N'D:\Program File\MSSQL15.SQLEXPRESS\MSSQL\DATA\IskhakovTrade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IskhakovTrade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IskhakovTrade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IskhakovTrade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IskhakovTrade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IskhakovTrade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IskhakovTrade] SET ARITHABORT OFF 
GO
ALTER DATABASE [IskhakovTrade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [IskhakovTrade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IskhakovTrade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IskhakovTrade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IskhakovTrade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IskhakovTrade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IskhakovTrade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IskhakovTrade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IskhakovTrade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IskhakovTrade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IskhakovTrade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IskhakovTrade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IskhakovTrade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IskhakovTrade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IskhakovTrade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IskhakovTrade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IskhakovTrade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IskhakovTrade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IskhakovTrade] SET  MULTI_USER 
GO
ALTER DATABASE [IskhakovTrade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IskhakovTrade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IskhakovTrade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IskhakovTrade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IskhakovTrade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IskhakovTrade] SET QUERY_STORE = OFF
GO
USE [IskhakovTrade]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 08.10.2024 5:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderCreateDate] [date] NOT NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[PickUpPoint] [int] NOT NULL,
	[ClientID] [int] NULL,
	[TakeCode] [int] NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Order__C3905BAFC529718F] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 08.10.2024 5:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickUpPoint]    Script Date: 08.10.2024 5:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickUpPoint](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [int] NOT NULL,
	[City] [nvarchar](256) NOT NULL,
	[Street] [nvarchar](256) NOT NULL,
	[House] [int] NULL,
 CONSTRAINT [PK_PickUpPoint_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08.10.2024 5:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[Unity] [nchar](3) NOT NULL,
	[ProductCost] [decimal](19, 2) NOT NULL,
	[ProductDiscountAmount] [tinyint] NOT NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProudctProducer] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductCurrentDIscount] [tinyint] NOT NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](255) NULL,
 CONSTRAINT [PK__Product__2EA7DCD5F45F8D60] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 08.10.2024 5:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 08.10.2024 5:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK__User__1788CCACCBC07CFA] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderCreateDate], [OrderDeliveryDate], [PickUpPoint], [ClientID], [TakeCode], [OrderStatus]) VALUES (1, CAST(N'2022-05-01' AS Date), CAST(N'2022-05-07' AS Date), 2, 51, 111, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderCreateDate], [OrderDeliveryDate], [PickUpPoint], [ClientID], [TakeCode], [OrderStatus]) VALUES (2, CAST(N'2022-05-02' AS Date), CAST(N'2022-05-08' AS Date), 8, NULL, 112, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderCreateDate], [OrderDeliveryDate], [PickUpPoint], [ClientID], [TakeCode], [OrderStatus]) VALUES (3, CAST(N'2022-05-03' AS Date), CAST(N'2022-05-09' AS Date), 10, NULL, 113, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderCreateDate], [OrderDeliveryDate], [PickUpPoint], [ClientID], [TakeCode], [OrderStatus]) VALUES (4, CAST(N'2022-05-04' AS Date), CAST(N'2022-05-10' AS Date), 12, NULL, 114, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderCreateDate], [OrderDeliveryDate], [PickUpPoint], [ClientID], [TakeCode], [OrderStatus]) VALUES (5, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-11' AS Date), 15, NULL, 115, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderCreateDate], [OrderDeliveryDate], [PickUpPoint], [ClientID], [TakeCode], [OrderStatus]) VALUES (6, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 18, 52, 116, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderCreateDate], [OrderDeliveryDate], [PickUpPoint], [ClientID], [TakeCode], [OrderStatus]) VALUES (7, CAST(N'2022-05-07' AS Date), CAST(N'2022-05-13' AS Date), 20, NULL, 117, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderCreateDate], [OrderDeliveryDate], [PickUpPoint], [ClientID], [TakeCode], [OrderStatus]) VALUES (8, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 25, NULL, 118, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderCreateDate], [OrderDeliveryDate], [PickUpPoint], [ClientID], [TakeCode], [OrderStatus]) VALUES (9, CAST(N'2022-05-09' AS Date), CAST(N'2022-05-15' AS Date), 30, NULL, 119, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderCreateDate], [OrderDeliveryDate], [PickUpPoint], [ClientID], [TakeCode], [OrderStatus]) VALUES (10, CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 36, 53, 120, N'Новый ')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (1, N'F933T5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (1, N'K478R4', 10)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (2, N'D034T5', 6)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (2, N'S563T4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (3, N'D826T5', 11)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (3, N'K083T5', 11)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (4, N'B037T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (4, N'D832R2', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (5, N'D044T5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (5, N'R922T5', 7)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (6, N'F933T5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (6, N'V783T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (7, N'H937R3', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (7, N'S039T5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (8, N'F903T5', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (8, N'F937R4', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (9, N'D826T5', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (9, N'R836R5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (10, N'D044T5', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (10, N'D832R2', 5)
GO
SET IDENTITY_INSERT [dbo].[PickUpPoint] ON 

INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (1, 125061, N'г.Ковров', N'ул.Подгорная', 8)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (2, 125703, N'г.Ковров', N'ул.Партизанская', 49)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (3, 125837, N'г.Ковров', N'ул.Шоссейная', 40)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (4, 190949, N'г.Ковров', N'ул.Мичурина', 26)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (5, 344288, N'г.Ковров', N'ул.Чехова', 1)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (6, 394060, N'г.Ковров', N'ул.Фрунзе', 43)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (7, 394242, N'г.Ковров', N'ул.Коммунистическая', 43)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (8, 394782, N'г.Ковров', N'ул.Чехова', 3)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (9, 400562, N'г.Ковров', N'ул.Зеленая', 32)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (10, 410172, N'г.Ковров', N'ул.Северная', 13)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (11, 410542, N'г.Ковров', N'ул.Светлая', 46)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (12, 410661, N'г.Ковров', N'ул.Школьная', 50)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (13, 420151, N'г.Ковров', N'ул.Вишневая', 32)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (14, 426030, N'г.Ковров', N'ул.Маяковского', 44)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (15, 443890, N'г.Ковров', N'ул.Коммунистическая', 1)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (16, 450375, N'г.Ковров', N'ул.Клубная', 44)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (17, 450558, N'г.Ковров', N'ул.Набережная', 30)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (18, 450983, N'г.Ковров', N'ул.Комсомольская', 26)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (19, 454311, N'г.Ковров', N'ул.Новая', 19)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (20, 603002, N'г.Ковров', N'ул.Дзержинского', 28)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (21, 603036, N'г.Ковров', N'ул.Садовая', 4)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (22, 603379, N'г.Ковров', N'ул.Спортивная', 46)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (23, 603721, N'г.Ковров', N'ул.Гоголя', 41)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (24, 614164, N'г.Ковров', N'ул.Степная', 30)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (25, 614510, N'г.Ковров', N'ул.Маяковского', 47)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (26, 614611, N'г.Ковров', N'ул.Молодежная', 50)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (27, 614753, N'г.Ковров', N'ул.Полевая', 35)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (28, 620839, N'г.Ковров', N'ул.Цветочная', 8)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (29, 625283, N'г.Ковров', N'ул.Победы', 46)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (30, 625560, N'г.Ковров', N'ул.Некрасова', 12)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (31, 625590, N'г.Ковров', N'ул.Коммунистическая', 20)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (32, 625683, N'г.Ковров', N'ул.8Марта', NULL)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (33, 630201, N'г.Ковров', N'ул.Комсомольская', 17)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (34, 630370, N'г.Ковров', N'ул.Шоссейная', 24)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (35, 660007, N'г.Ковров', N'ул.Октябрьская', 19)
INSERT [dbo].[PickUpPoint] ([ID], [Code], [City], [Street], [House]) VALUES (36, 660540, N'г.Ковров', N'ул.Солнечная', 25)
SET IDENTITY_INSERT [dbo].[PickUpPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'B025Y5', N'Блюдо', N'шт.', CAST(1890.00 AS Decimal(19, 2)), 5, N'Home Philosophy', N'Стокманн', N'Интерьерные аксессуары', 3, 8, N'Блюдо декоративное flower 35 см Home Philosophy', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'B037T5', N'Блюдо', N'шт.', CAST(690.00 AS Decimal(19, 2)), 5, N'Home Philosophy', N'Стокманн', N'Интерьерные аксессуары', 2, 14, N'Блюдо декоративное Flower 35 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D034T5', N'Диффузор', N'шт.', CAST(800.00 AS Decimal(19, 2)), 20, N'Miksdo', N'Hoff', N'Ароматы для дома', 2, 15, N'Диффузор Mikado intense Апельсин с корицей', N'Resources\D034T5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D044T5', N'Декор настенный', N'шт.', CAST(1790.00 AS Decimal(19, 2)), 5, N'Home Philosophy', N'Стокманн', N'Интерьерные аксессуары', 3, 7, N'Декор настенный Фантазия 45х45х1 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D826T5', N'Диффузор', N'шт.', CAST(600.00 AS Decimal(19, 2)), 5, N'True Scents', N'Hoff', N'Ароматы для дома', 2, 13, N'Диффузор True Scents 45 мл манго', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D832R2', N'Растение', N'шт.', CAST(1000.00 AS Decimal(19, 2)), 10, N'Home Philosophy', N'Стокманн', N'Интерьерные аксессуары', 3, 15, N'Декоративное растение 102 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D947R5', N'Диффузор', N'шт.', CAST(500.00 AS Decimal(19, 2)), 5, N'Aroma', N'Hoff', N'Ароматы для дома', 4, 6, N'Диффузор Aroma Harmony Lavender', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F837T5', N'Фоторамка', N'шт.', CAST(999.00 AS Decimal(19, 2)), 5, N'Gallery', N'Hoff', N'Картины и фоторамки', 2, 15, N'Шкатулка для украшений из дерева Stowit', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F903T5', N'Фоторамка', N'шт.', CAST(600.00 AS Decimal(19, 2)), 15, N'Gallery', N'Hoff', N'Картины и фоторамки', 2, 3, N'Фоторамка Gallery 20х30 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F928T5', N'Фоторамка', N'шт.', CAST(1590.00 AS Decimal(19, 2)), 25, N'Umbra', N'Стокманн', N'Картины и фоторамки', 2, 13, N'Фоторамка Prisma 10х10 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F933T5', N'Кашпо', N'шт.', CAST(1400.00 AS Decimal(19, 2)), 20, N'Cube Color', N'Hoff', N'Горшки и подставки', 4, 23, N'Настольное кашпо с автополивом Cube Color', N'Resources\F933T5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F937R4', N'Фоторамка', N'шт.', CAST(359.00 AS Decimal(19, 2)), 15, N'Gallery', N'Hoff', N'Картины и фоторамки', 4, 17, N'Фоторамка 10х15 см Gallery серый с патиной/золотой', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'H023R8', N'Часы', N'шт.', CAST(5600.00 AS Decimal(19, 2)), 15, N'Umbra', N'Стокманн', N'Часы', 2, 6, N'Часы настенные Ribbon 30,5 см', N'Resources\H023R8.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'H937R3', N'Часы', N'шт.', CAST(999.00 AS Decimal(19, 2)), 10, N'Umbra', N'Hoff', N'Часы', 3, 4, N'Часы настенные 6500 30,2 см', N'Resources\H937R3.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'K083T5', N'Аромат', N'шт.', CAST(2790.00 AS Decimal(19, 2)), 20, N'Esteban', N'Стокманн', N'Ароматы для дома', 2, 6, N'Сменный аромат Figue noire 250 мл', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'K478R4', N'Аромат', N'шт.', CAST(3500.00 AS Decimal(19, 2)), 30, N'Esteban', N'Стокманн', N'Ароматы для дома', 4, 4, N'Аромат для декобукета Esteban', N'Resources\K478R4.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'K937T4', N'Аромат', N'шт.', CAST(7900.00 AS Decimal(19, 2)), 25, N'Esteban', N'Стокманн', N'Ароматы для дома', 2, 17, N'Деко-букет Кедр 250 мл', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'P846R4', N'Подставка', N'шт.', CAST(1400.00 AS Decimal(19, 2)), 15, N'Valley', N'Стокманн', N'Горшки и подставки', 3, 12, N'Подставка для цветочных горшков 55x25x35 см Valley', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'P927R2', N'Подставка', N'шт.', CAST(4000.00 AS Decimal(19, 2)), 15, N'Valley', N'Стокманн', N'Горшки и подставки', 2, 4, N'Подставка для цветочных горшков Valley', N'Resources\P927R2.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'P936E4', N'Подставка', N'шт.', CAST(3590.00 AS Decimal(19, 2)), 15, N'Umbra', N'Стокманн', N'Горшки и подставки', 4, 9, N'Подставка для газет и журналов Zina', N'Resources\P936E4.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'R836R5', N'Шкатулка', N'шт.', CAST(8000.00 AS Decimal(19, 2)), 30, N'Umbra', N'Стокманн', N'Шкатулки и подставки', 5, 3, N'Шкатулка для украшений из дерева Stowit', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'R922T5', N'Шкатулка', N'шт.', CAST(690.00 AS Decimal(19, 2)), 10, N'Home Philosophy', N'Стокманн', N'Шкатулки и подставки', 2, 4, N'Шкатулка из керамики Lana 6х7 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S039T5', N'Свеча', N'шт.', CAST(250.00 AS Decimal(19, 2)), 10, N'True Scents', N'Hoff', N'Свечи', 2, 18, N'Свеча True Moods Feel happy', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S563T4', N'Свеча', N'шт.', CAST(1000.00 AS Decimal(19, 2)), 20, N'True Scents', N'Hoff', N'Свечи', 3, 12, N'Свеча в стакане True Scents', N'Resources\S563T4.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S936Y5', N'Свеча', N'шт.', CAST(299.00 AS Decimal(19, 2)), 15, N'True Scents', N'Hoff', N'Ароматы для дома', 3, 4, N'Свеча в стакане True Scents', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S937T5', N'Подсвечник', N'шт.', CAST(2600.00 AS Decimal(19, 2)), 10, N'Kersten', N'Стокманн', N'Ароматы для дома', 3, 23, N'Подсвечник 37 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V432R6', N'Ваза', N'шт.', CAST(1990.00 AS Decimal(19, 2)), 10, N'Kersten', N'Стокманн', N'Вазы', 3, 30, N'Ваза из фаянса 28,00 x 9,50 x 9,50 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V483R7', N'Ваза', N'шт.', CAST(100.00 AS Decimal(19, 2)), 15, N'Весна', N'Hoff', N'Вазы', 3, 7, N'Ваза «Весна» 18 см стекло, цвет прозрачный', N'Resources\V483R7.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V783T5', N'Ваза', N'шт.', CAST(1300.00 AS Decimal(19, 2)), 25, N'Home Philosophy', N'Стокманн', N'Вазы', 2, 13, N'Ваза из керамики Betty', N'Resources\V783T5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [Unity], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProudctProducer], [ProductCategory], [ProductCurrentDIscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V937E4', N'Ваза', N'шт.', CAST(1999.00 AS Decimal(19, 2)), 15, N'Kersten', N'Hoff', N'Вазы', 3, 21, N'Ваза 18H2535S 30,5 см', NULL)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Алексеев ', N'Владислав', N'Аркадьевич', N'loginDEbct2018', N'Qg3gff', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Савельева ', N'Евфросиния', N'Арсеньевна', N'loginDEvtg2018', N'ETMNzL', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Никонов ', N'Мэлс', N'Лукьевич', N'loginDEuro2018', N'a1MIcO', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Горшкова ', N'Агафья', N'Онисимовна', N'loginDEpst2018', N'0CyGnX', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Горбачёв ', N'Пантелеймон', N'Германович', N'loginDEpsu2018', N'Vx9cQ{', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Ершова ', N'Иванна', N'Максимовна', N'loginDEzqs2018', N'qM9p7i', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Туров ', N'Денис', N'Геласьевич', N'loginDEioe2018', N'yMPu&2', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Носова ', N'Наина', N'Эдуардовна', N'loginDEcmk2018', N'3f+b0+', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Куликов ', N'Андрей', N'Святославович', N'loginDEfsp2018', N'&dtlI+', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Нестеров ', N'Агафон', N'Георгьевич', N'loginDExcd2018', N'SZXZNL', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Козлов ', N'Геласий', N'Христофорович', N'loginDEvlf2018', N'O5mXc2', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Борисова ', N'Анжелика', N'Анатольевна', N'loginDEanv2018', N'Xiq}M3', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Суханов ', N'Станислав', N'Фролович', N'loginDEzde2018', N'tlO3x&', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Тетерина ', N'Феврония', N'Эдуардовна', N'loginDEriv2018', N'GJ2mHL', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Муравьёва ', N'Александра', N'Ростиславовна', N'loginDEhcp2018', N'n2nfRl', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Новикова ', N'Лукия', N'Ярославовна', N'loginDEwjv2018', N'ZfseKA', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Агафонова ', N'Лариса', N'Михаиловна', N'loginDEiry2018', N'5zu7+}', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Сергеева ', N'Агата', N'Юрьевна', N'loginDEgbr2018', N'}+Ex1*', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Колобова ', N'Елена', N'Евгеньевна', N'loginDExxv2018', N'+daE|T', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Ситников ', N'Николай', N'Филатович', N'loginDEbto2018', N'b1iYMI', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Белов ', N'Роман', N'Иринеевич', N'loginDEfbs2018', N'v90Rep', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Волкова ', N'Алла', N'Лукьевна', N'loginDEple2018', N'WlW+l8', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Кудрявцева ', N'Таисия', N'Игоревна', N'loginDEhhx2018', N'hmCHeQ', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Семёнова ', N'Октябрина', N'Христофоровна', N'loginDEayn2018', N'Ka2Fok', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Смирнов ', N'Сергей', N'Яковович', N'loginDEwld2018', N'y9HStF', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Брагина ', N'Алина', N'Валерьевна', N'loginDEhuu2018', N'X31OEf', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Евсеев ', N'Игорь', N'Донатович', N'loginDEmjb2018', N'5mm{ch', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Суворов ', N'Илья', N'Евсеевич', N'loginDEdgp2018', N'1WfJjo', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Котов ', N'Денис', N'Мартынович', N'loginDEgyi2018', N'|7nYPc', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Бобылёва ', N'Юлия', N'Егоровна', N'loginDEmvn2018', N'Mrr9e0', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Брагин ', N'Бронислав', N'Георгьевич', N'loginDEfoj2018', N'nhGc+D', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Александров ', N'Владимир', N'Дамирович', N'loginDEuuo2018', N'42XmH1', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Фокин ', N'Ириней', N'Ростиславович', N'loginDEhsj2018', N's+jrMW', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Воронов ', N'Митрофан', N'Антонович', N'loginDEvht2018', N'zMyS8Z', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Маслов ', N'Мстислав', N'Антонинович', N'loginDEeqo2018', N'l5CBqA', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Щербаков ', N'Георгий', N'Богданович', N'loginDExrf2018', N'mhpRIT', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Кириллова ', N'Эмилия', N'Федосеевна', N'loginDEfku2018', N'a1m+8c', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Васильев ', N'Серапион', N'Макарович', N'loginDExix2018', N'hzxtnn', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Галкина ', N'Олимпиада', N'Владленовна', N'loginDEqrf2018', N'mI8n58', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Яковлева ', N'Ксения', N'Онисимовна', N'loginDEhlk2018', N'g0jSed', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Калашникова ', N'Александра', N'Владимировна', N'loginDEwoe2018', N'yOtw2F', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Медведьева ', N'Таисия', N'Тихоновна', N'loginDExyu2018', N'7Fg}9p', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Карпова ', N'Ольга', N'Лукьевна', N'loginDEcor2018', N'2cIrC8', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Герасимов ', N'Мстислав', N'Дамирович', N'loginDEqon2018', N'YeFbh6', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Тимофеева ', N'Ксения', N'Валерьевна', N'loginDEyfd2018', N'8aKdb0', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Горбунов ', N'Вячеслав', N'Станиславович', N'loginDEtto2018', N'qXYDuu', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Кошелева ', N'Кира', N'Владиславовна', N'loginDEdal2018', N'cJWXL0', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Панфилова ', N'Марина', N'Борисовна', N'loginDEbjs2018', N'Xap2ct', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Кудрявцев ', N'Матвей', N'Игоревич', N'loginDEdof2018', N'kD|LRU', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Зуев ', N'Эдуард', N'Пантелеймонович', N'loginDEsnh2018', N'sdgf3awd', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (51, N'Архипова', N'Оливия', N'Дмитриевна', N'LoginDEasd2024', N'asdxdv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (52, N'Никонова', N'Татьяна', N'Захаровна', N'LoginDEaszx2024', N'ZXcqfg', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (53, N'Рябова', N'Диана', N'Павловна', N'LoginDEhaas2024', N'jggd', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[OrderProduct] ADD  CONSTRAINT [DF_OrderProduct_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickUpPoint] FOREIGN KEY([PickUpPoint])
REFERENCES [dbo].[PickUpPoint] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickUpPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([ClientID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__2D27B809] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__2D27B809]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2E1BDC42] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__UserRole__267ABA7A] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__UserRole__267ABA7A]
GO
USE [master]
GO
ALTER DATABASE [IskhakovTrade] SET  READ_WRITE 
GO
