/****** Object:  Database [ABDTHREE]    Script Date: 12.12.2022 11:59:14 ******/
CREATE DATABASE [ABDTHREE]
GO
use ABDTHREE
/****** Object:  Table [dbo].[Agent]    Script Date: 12.12.2022 11:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 12.12.2022 11:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 12.12.2022 11:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 12.12.2022 11:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 12.12.2022 11:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 12.12.2022 11:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 12.12.2022 11:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12.12.2022 11:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 12.12.2022 11:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 12.12.2022 11:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 12.12.2022 11:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 12.12.2022 11:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 12.12.2022 11:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 12.12.2022 11:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (1, N'Гранулы для бумаги розовый 2x2', 10, N' л', 661, 16, NULL, CAST(10608.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (2, N'Гранулы для бумаги синий 1x2', 6, N' л', 112, 34, NULL, CAST(25624.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (3, N'Гранулы для бумаги розовый 0x3', 4, N' л', 379, 41, NULL, CAST(386800.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (4, N'Гранулы для бумаги цветной 0x1', 5, N' л', 759, 28, NULL, CAST(9216.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (5, N'Гранулы для бумаги розовый 0x2', 7, N' кг', 37, 50, NULL, CAST(1722700.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (6, N'Гранулы для бумаги цветной 0x3', 10, N' кг', 962, 33, NULL, CAST(35922.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (7, N'Гранулы для бумаги синий 1x3', 10, N' л', 841, 18, NULL, CAST(3870000.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (8, N'Переработка бумаги синий 0x3', 9, N' м', 958, 32, NULL, CAST(14180.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (9, N'Переработка бумаги серый 3x3', 10, N' м', 89, 20, NULL, CAST(4939100.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (10, N'Переработка бумаги цветной 1x3', 6, N' кг', 32, 34, NULL, CAST(37930.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (11, N'Переработка бумаги серый 1x2', 8, N' м', 516, 49, NULL, CAST(35981.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (12, N'Переработка бумаги синий 1x2', 4, N' м', 81, 32, NULL, CAST(47873.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (13, N'Переработка бумаги синий 0x1', 7, N' м', 97, 30, NULL, CAST(47937.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (14, N'Переработка бумаги цветной 0x0', 9, N' м', 508, 19, NULL, CAST(5114700.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (15, N'Переработка бумаги серый 0x2', 3, N' м', 167, 17, NULL, CAST(1024800.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (16, N'Переработка бумаги белый 3x0', 10, N' м', 247, 11, NULL, CAST(3950000.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (17, N'Переработка бумаги цветной 0x1', 8, N' м', 833, 34, NULL, CAST(53875.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (18, N'Переработка бумаги синий 0x2', 9, N' кг', 709, 47, NULL, CAST(2315700.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (19, N'Переработка бумаги белый 2x0', 5, N' м', 794, 17, NULL, CAST(2163700.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (20, N'Спрессованный материал серый 0x2', 5, N' м', 140, 49, NULL, CAST(3312800.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (21, N'Спрессованный материал розовый 2x1', 8, N' м', 636, 21, NULL, CAST(52606.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (22, N'Спрессованный материал белый 1x1', 7, N' кг', 843, 16, NULL, CAST(4344000.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (23, N'Спрессованный материал цветной 1x3', 3, N' м', 772, 40, NULL, CAST(5167200.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (24, N'Спрессованный материал синий 0x2', 3, N' кг', 514, 40, NULL, CAST(6555.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (25, N'Спрессованный материал цветной 1x2', 1, N' м', 429, 47, NULL, CAST(1580200.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (26, N'Спрессованный материал розовый 2x3', 3, N' м', 552, 7, NULL, CAST(465700.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (27, N'Спрессованный материал розовый 1x2', 7, N' м', 509, 26, NULL, CAST(10604.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (28, N'Спрессованный материал белый 3x3', 8, N' м', 942, 12, NULL, CAST(17600.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (29, N'Спрессованный материал синий 3x1', 10, N' м', 270, 50, NULL, CAST(38809.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (30, N'Спрессованный материал цветной 0x0', 6, N' м', 754, 24, NULL, CAST(4611.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (31, N'Спрессованный материал цветной 1x0', 8, N' м', 856, 26, NULL, CAST(12817.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (32, N'Рулон бумаги зеленый 1x1', 3, N' м', 634, 36, NULL, CAST(26841.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (33, N'Рулон бумаги белый 1x0', 1, N' м', 501, 49, NULL, CAST(1583300.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (34, N'Рулон бумаги цветной 2x0', 3, N' м', 386, 46, NULL, CAST(3554400.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (35, N'Рулон бумаги зеленый 2x2', 8, N' кг', 593, 20, NULL, CAST(55016.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (36, N'Рулон бумаги белый 3x2', 4, N' кг', 16, 31, NULL, CAST(53759.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (37, N'Рулон бумаги серый 3x3', 3, N' м', 596, 8, NULL, CAST(50247.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (38, N'Рулон бумаги синий 2x2', 6, N' кг', 363, 47, NULL, CAST(38450.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (39, N'Рулон бумаги цветной 1x2', 10, N' м', 246, 37, NULL, CAST(501600.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (40, N'Рулон бумаги розовый 2x1', 1, N' м', 349, 9, NULL, CAST(3616300.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (41, N'Рулон бумаги белый 3x3', 2, N' кг', 201, 46, NULL, CAST(51261.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (42, N'Рулон бумаги цветной 2x2', 10, N' кг', 534, 46, NULL, CAST(50776.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (43, N'Рулон бумаги розовый 3x2', 9, N' м', 144, 41, NULL, CAST(51776.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (44, N'Рулон бумаги цветной 1x3', 10, N' кг', 149, 13, NULL, CAST(2272400.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (45, N'Рулон бумаги синий 3x2', 9, N' м', 508, 16, NULL, CAST(25561.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (46, N'Рулон бумаги зеленый 2x3', 2, N' м', 181, 35, NULL, CAST(4538800.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (47, N'Рулон бумаги зеленый 3x3', 3, N' м', 861, 45, NULL, CAST(37283.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (48, N'Рулон бумаги белый 0x3', 2, N' м', 933, 50, NULL, CAST(725300.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (49, N'Рулон бумаги синий 3x1', 3, N' м', 720, 11, NULL, CAST(4467500.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (50, N'Рулон бумаги белый 1x3', 2, N' кг', 382, 10, NULL, CAST(32770.00 AS Decimal(10, 2)), NULL, 4)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (1, N' Гранулы', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (2, N' Нарезка', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (3, N' Пресс', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (4, N' Рулон', NULL)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (1, N'Бумага 10М Клубника', 1, N'275591', NULL, N'\products\paper_7.jpg', 4, 8, CAST(13600.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (2, N'Бумага 13М Бриз', 1, N'349861', NULL, N'не указано', 4, 6, CAST(384200.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (3, N'Бумага 15М Клубника', 1, N'449359', NULL, N'отсутствует', 3, 7, CAST(1000900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (4, N'Бумага 33М Бриз', 1, N'347239', NULL, N'отсутствует', 5, 9, CAST(13767.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (5, N'Бумага 3М Бриз', 1, N'260492', NULL, N'не указано', 1, 9, CAST(827800.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (6, N'Бумага 40М Бриз', 1, N'326200', NULL, N'\products\paper_19.jpg', 5, 1, CAST(12927.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (7, N'Набор 11М Дыня', 1, N'450659', NULL, N'\products\paper_16.jpg', 3, 7, CAST(595600.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (8, N'Набор 24М Дыня', 1, N'337632', NULL, N'нет', 5, 5, CAST(1147100.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (9, N'Набор 26М Дыня', 1, N'279801', NULL, N'нет', 2, 1, CAST(4628.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (10, N'Набор 34М Клубника', 1, N'381110', NULL, N'не указано', 3, 1, CAST(237200.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (11, N'Набор 40М Бриз', 1, N'353930', NULL, N'не указано', 2, 8, CAST(1276700.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (12, N'Набор 45М Бриз', 1, N'349802', NULL, N'отсутствует', 1, 8, CAST(1204000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (13, N'Набор 50М Бриз', 1, N'414595', NULL, N'\products\paper_8.jpg', 4, 6, CAST(10750.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (14, N'Набор 5М Бриз', 1, N'278382', NULL, N'нет', 3, 9, CAST(732500.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (15, N'Набор 9М Бриз', 1, N'259548', NULL, N'нет', 4, 5, CAST(2317.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (16, N'Полотенце 14М Дыня', 1, N'331688', NULL, N'нет', 2, 8, CAST(10330.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (17, N'Полотенце 14М Клубника', 1, N'309862', NULL, N'\products\paper_17.jpg', 4, 8, CAST(10682.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (18, N'Полотенце 17М Бриз', 1, N'309067', NULL, N'\products\paper_24.jpg', 1, 6, CAST(1382500.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (19, N'Полотенце 24М Дыня', 1, N'264493', NULL, N'отсутствует', 5, 10, CAST(10479.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (20, N'Полотенце 27М Ваниль', 1, N'278463', NULL, N'\products\paper_10.jpg', 3, 5, CAST(3978.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (21, N'Полотенце 27М Дыня', 1, N'238686', NULL, N'не указано', 2, 2, CAST(7864.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (22, N'Полотенце 6М Ваниль', 1, N'324941', NULL, N'не указано', 1, 2, CAST(5594.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (23, N'Полотенце 7М Бриз', 1, N'350515', NULL, N'отсутствует', 2, 2, CAST(498600.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (24, N'Бумага 14М Бриз', 2, N'310507', NULL, N'отсутствует', 1, 3, CAST(7846.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (25, N'Бумага 20М Бриз', 2, N'285792', NULL, N'отсутствует', 3, 7, CAST(14370.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (26, N'Бумага 28М Дыня', 2, N'298632', NULL, N'не указано', 4, 4, CAST(1467100.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (27, N'Бумага 32М Бриз', 2, N'379800', NULL, N'отсутствует', 1, 7, CAST(683200.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (28, N'Бумага 37М Клубника', 2, N'442634', NULL, N'\products\paper_14.jpg', 5, 4, CAST(12664.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (29, N'Бумага 45М Бриз', 2, N'374276', NULL, N'не указано', 3, 9, CAST(13605.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (30, N'Бумага 50М Бриз', 2, N'340583', NULL, N'\products\paper_15.jpg', 4, 7, CAST(6788.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (31, N'Бумага 50М Ваниль', 2, N'454479', NULL, N'отсутствует', 3, 9, CAST(3163.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (32, N'Бумага 9М Ваниль', 2, N'446348', NULL, N'нет', 3, 1, CAST(13568.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (33, N'Набор 12М Бриз', 2, N'349614', NULL, N'\products\paper_3.jpg', 1, 7, CAST(2551.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (34, N'Набор 19М Бриз', 2, N'277950', NULL, N'отсутствует', 5, 9, CAST(9962.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (35, N'Набор 22М Бриз', 2, N'443382', NULL, N'отсутствует', 3, 5, CAST(450100.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (36, N'Набор 24М Клубника', 2, N'296007', NULL, N'отсутствует', 2, 3, CAST(1416200.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (37, N'Набор 40М Дыня', 2, N'346154', NULL, N'не указано', 4, 8, CAST(3427.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (38, N'Набор 42М Дыня', 2, N'390914', NULL, N'\products\paper_13.jpg', 5, 10, CAST(14344.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (39, N'Набор 50М Клубника', 2, N'278721', NULL, N'нет', 3, 1, CAST(1422000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (40, N'Полотенце 41М Дыня', 2, N'239349', NULL, N'отсутствует', 2, 9, CAST(6238.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (41, N'Полотенце 45М Бриз', 2, N'303994', NULL, N'\products\paper_6.jpg', 2, 1, CAST(13081.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (42, N'Полотенце 7М Ваниль', 2, N'397143', NULL, N'не указано', 2, 9, CAST(2868.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (43, N'Бумага 10М Дыня', 3, N'446103', NULL, N'нет', 1, 3, CAST(13975.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (44, N'Бумага 12М Бриз', 3, N'426804', NULL, N'отсутствует', 1, 4, CAST(10703.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (45, N'Бумага 12М Клубника', 3, N'456129', NULL, N'\products\paper_1.jpg', 3, 4, CAST(6467.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (46, N'Бумага 20М Клубника', 3, N'253218', NULL, N'отсутствует', 2, 6, CAST(1168400.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (47, N'Бумага 29М Клубника', 3, N'334943', NULL, N'не указано', 1, 10, CAST(599700.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (48, N'Бумага 32М Дыня', 3, N'268393', NULL, N'отсутствует', 4, 3, CAST(7424.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (49, N'Бумага 44М Бриз', 3, N'422185', NULL, N'не указано', 2, 5, CAST(6441.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (50, N'Бумага 5М Бриз', 3, N'345239', NULL, N'отсутствует', 1, 8, CAST(9243.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (51, N'Бумага 5М Дыня', 3, N'256862', NULL, N'\products\paper_5.jpg', 5, 5, CAST(3712.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (52, N'Набор 10М Дыня', 3, N'431234', NULL, N'\products\paper_22.jpg', 4, 9, CAST(3816.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (53, N'Набор 16М Дыня', 3, N'376834', NULL, N'отсутствует', 4, 6, CAST(1192700.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (54, N'Набор 20М Бриз', 3, N'377042', NULL, N'\products\paper_9.jpg', 5, 9, CAST(9227.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (55, N'Набор 24М Ваниль', 3, N'374263', NULL, N'отсутствует', 5, 9, CAST(3907.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (56, N'Набор 25М Бриз', 3, N'434113', NULL, N'не указано', 4, 4, CAST(1304700.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (57, N'Набор 31М Дыня', 3, N'449401', NULL, N'отсутствует', 5, 10, CAST(5236.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (58, N'Набор 41М Дыня', 3, N'385037', NULL, N'\products\paper_21.jpg', 5, 9, CAST(329500.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (59, N'Набор 43М Клубника', 3, N'443538', NULL, N'отсутствует', 1, 10, CAST(13786.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (60, N'Набор 6М Бриз', 3, N'289779', NULL, N'нет', 1, 6, CAST(1415400.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (61, N'Набор 8М Дыня', 3, N'240580', NULL, N'отсутствует', 5, 2, CAST(7465.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (62, N'Набор 9М Дыня', 3, N'440942', NULL, N'нет', 3, 4, CAST(258000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (63, N'Полотенце 15М Бриз', 3, N'365615', NULL, N'нет', 1, 6, CAST(13013.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (64, N'Полотенце 37М Клубника', 3, N'292358', NULL, N'отсутствует', 4, 2, CAST(396100.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (65, N'Полотенце 44М Ваниль', 3, N'357053', NULL, N'нет', 5, 1, CAST(3396.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (66, N'Полотенце 47М Клубника', 3, N'378723', NULL, N'нет', 4, 2, CAST(387100.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (67, N'Бумага 16М Дыня', 4, N'262257', NULL, N'нет', 5, 2, CAST(910700.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (68, N'Бумага 21М Дыня', 4, N'366160', NULL, N'\products\paper_2.jpg', 1, 2, CAST(1106400.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (69, N'Бумага 26М Ваниль', 4, N'444337', NULL, N'отсутствует', 4, 4, CAST(3007.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (70, N'Бумага 45М Клубника', 4, N'400484', NULL, N'нет', 3, 4, CAST(3475.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (71, N'Бумага 7М Ваниль', 4, N'290729', NULL, N'не указано', 4, 4, CAST(6934.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (72, N'Набор 10М Ваниль', 4, N'261465', NULL, N'\products\paper_12.jpg', 5, 3, CAST(13028.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (73, N'Набор 17М Клубника', 4, N'441239', NULL, N'не указано', 2, 10, CAST(1486300.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (74, N'Набор 19М Дыня', 4, N'382063', NULL, N'отсутствует', 1, 7, CAST(2373.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (75, N'Набор 32М Клубника', 4, N'351062', NULL, N'нет', 3, 8, CAST(445000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (76, N'Набор 34М Ваниль', 4, N'316033', NULL, N'нет', 1, 4, CAST(1353300.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (77, N'Набор 41М Клубника', 4, N'281425', NULL, N'\products\paper_23.jpg', 4, 6, CAST(990800.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (78, N'Полотенце 11М Дыня', 4, N'400418', NULL, N'\products\paper_25.jpg', 2, 7, CAST(11660.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (79, N'Полотенце 16М Ваниль', 4, N'259488', NULL, N'не указано', 3, 6, CAST(10095.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (80, N'Полотенце 17М Ваниль', 4, N'403054', NULL, N'нет', 2, 9, CAST(504800.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (81, N'Полотенце 33М Бриз', 4, N'297840', NULL, N'отсутствует', 4, 1, CAST(461100.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (82, N'Полотенце 43М Клубника', 4, N'425641', NULL, N'отсутствует', 2, 6, CAST(14151.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (83, N'Полотенце 47М Дыня', 4, N'294441', NULL, N'не указано', 4, 5, CAST(1146000.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (84, N'Полотенце 48М Клубника', 4, N'292206', NULL, N'отсутствует', 3, 3, CAST(980100.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (85, N'Бумага 13М Дыня', 5, N'348651', NULL, N'нет', 3, 8, CAST(347700.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (86, N'Бумага 29М Дыня', 5, N'332522', NULL, N'\products\paper_18.jpg', 3, 6, CAST(543900.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (87, N'Бумага 33М Клубника', 5, N'252485', NULL, N'\products\paper_0.jpg', 3, 6, CAST(4240.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (88, N'Бумага 38М Ваниль', 5, N'416066', NULL, N'нет', 2, 2, CAST(12175.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (89, N'Бумага 49М Бриз', 5, N'414339', NULL, N'отсутствует', 1, 6, CAST(10786.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (90, N'Набор 14М Дыня', 5, N'373939', NULL, N'нет', 2, 3, CAST(3382.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (91, N'Набор 18М Ваниль', 5, N'331270', NULL, N'отсутствует', 4, 8, CAST(11171.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (92, N'Набор 22М Клубника', 5, N'360424', NULL, N'отсутствует', 4, 3, CAST(13524.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (93, N'Набор 29М Ваниль', 5, N'344868', NULL, N'\products\paper_4.jpg', 1, 9, CAST(7618.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (94, N'Набор 43М Дыня', 5, N'330360', NULL, N'нет', 5, 4, CAST(586700.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (95, N'Полотенце 16М Бриз', 5, N'418298', NULL, N'отсутствует', 2, 1, CAST(7342.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (96, N'Полотенце 23М Ваниль', 5, N'437519', NULL, N'отсутствует', 1, 10, CAST(3317.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (97, N'Полотенце 25М Бриз', 5, N'258695', NULL, N'не указано', 1, 8, CAST(3631.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (98, N'Полотенце 28М Клубника', 5, N'334385', NULL, N'\products\paper_20.jpg', 2, 6, CAST(9208.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (99, N'Полотенце 45М Клубника', 5, N'352034', NULL, N'отсутствует', 2, 5, CAST(1193900.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (100, N'Полотенце 50М Ваниль', 5, N'310212', NULL, N'\products\paper_11.jpg', 1, 10, CAST(13204.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (1, 9, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (1, 33, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (1, 42, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (3, 13, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (3, 16, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (4, 4, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (4, 45, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 2, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 7, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 31, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 37, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 45, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (7, 2, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (7, 23, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (8, 25, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 3, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 5, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (13, 42, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (13, 49, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (17, 22, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (17, 30, 7)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (25, 26, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (30, 34, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (32, 12, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (32, 49, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (33, 4, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (33, 33, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (33, 50, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (35, 15, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (35, 32, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (38, 6, 17)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (41, 24, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (41, 36, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (41, 43, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (45, 38, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (45, 40, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (46, 22, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (46, 26, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (46, 50, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (48, 37, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (51, 5, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (51, 8, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (51, 37, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (52, 50, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (54, 14, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (54, 30, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (58, 4, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (58, 32, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (61, 3, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (61, 32, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (61, 34, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (62, 16, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (66, 2, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (66, 4, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (66, 43, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (66, 46, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (66, 49, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (69, 30, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (69, 31, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (69, 48, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (69, 49, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (70, 33, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (71, 49, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (77, 4, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (77, 7, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (77, 27, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (78, 50, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (79, 8, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (79, 24, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (79, 41, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (82, 41, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (83, 3, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (85, 23, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (86, 28, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (86, 47, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (87, 6, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (87, 14, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (87, 40, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (87, 41, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (88, 9, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (88, 17, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (91, 7, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (93, 7, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (93, 26, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (93, 43, 17)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (93, 48, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (94, 3, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (94, 7, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (94, 22, 13)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (94, 47, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (98, 21, 13)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (98, 40, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (98, 41, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (99, 10, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (99, 18, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (99, 37, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (99, 45, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (100, 6, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (100, 30, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (100, 37, 10)
GO
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (1, N'Два слоя', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (2, N'Детская', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (3, N'Один слой', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (4, N'Супер мягкая', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (5, N'Три слоя', NULL)
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
ALTER DATABASE [ABDTHREE] SET  READ_WRITE 
GO
