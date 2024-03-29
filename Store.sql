USE [master]
GO
/****** Object:  Database [Store]    Script Date: 10.01.2024 2:23:21 ******/
CREATE DATABASE [Store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Store', FILENAME = N'E:\SQLServer\MSSQL16.MSSQLSERVER\MSSQL\DATA\Store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Store_log', FILENAME = N'E:\SQLServer\MSSQL16.MSSQLSERVER\MSSQL\DATA\Store_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Store] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Store] SET ARITHABORT OFF 
GO
ALTER DATABASE [Store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Store] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Store] SET RECOVERY FULL 
GO
ALTER DATABASE [Store] SET  MULTI_USER 
GO
ALTER DATABASE [Store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Store] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Store', N'ON'
GO
ALTER DATABASE [Store] SET QUERY_STORE = OFF
GO
USE [Store]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 10.01.2024 2:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](50) NULL,
	[id_city] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10.01.2024 2:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 10.01.2024 2:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_region] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 10.01.2024 2:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 10.01.2024 2:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[id_supplier] [int] NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[date_of_delivery] [datetime] NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 10.01.2024 2:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[percent] [int] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurements]    Script Date: 10.01.2024 2:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Measurements] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 10.01.2024 2:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_adress] [int] NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10.01.2024 2:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_category] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[id_producer] [int] NULL,
	[id_measurement] [int] NULL,
	[id_discount] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 10.01.2024 2:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_country] [int] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 10.01.2024 2:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[date_of_sale] [datetime] NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 10.01.2024 2:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (1, N'Садова', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (2, N'Истридж', 2)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (3, N'Гичинер', 3)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (4, N'Одесса', 4)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (5, N'Хотеллвеган ', 5)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Молочные')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Снеки')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Хлебобулочное изделие')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Рыбопродукты')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Мясо')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (1, N'Одесса', 1)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (2, N'Одесса', 2)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (3, N'Берлин', 3)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (4, N'Париж', 4)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (5, N'Осло', 5)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id], [name]) VALUES (1, N'Украина')
INSERT [dbo].[Country] ([id], [name]) VALUES (2, N'США')
INSERT [dbo].[Country] ([id], [name]) VALUES (3, N'Германия')
INSERT [dbo].[Country] ([id], [name]) VALUES (4, N'Франция')
INSERT [dbo].[Country] ([id], [name]) VALUES (5, N'Норвегия')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (2, 2, 2, NULL, NULL, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (3, 3, 3, NULL, NULL, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (4, 4, 4, NULL, NULL, NULL)
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (5, 5, 5, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([id], [percent]) VALUES (1, 5)
INSERT [dbo].[Discount] ([id], [percent]) VALUES (2, 15)
INSERT [dbo].[Discount] ([id], [percent]) VALUES (3, 20)
INSERT [dbo].[Discount] ([id], [percent]) VALUES (4, 30)
INSERT [dbo].[Discount] ([id], [percent]) VALUES (5, 45)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Measurements] ON 

INSERT [dbo].[Measurements] ([id], [name]) VALUES (1, N'Кг')
INSERT [dbo].[Measurements] ([id], [name]) VALUES (2, N'Г')
INSERT [dbo].[Measurements] ([id], [name]) VALUES (3, N'Л')
INSERT [dbo].[Measurements] ([id], [name]) VALUES (4, N'Мл')
SET IDENTITY_INSERT [dbo].[Measurements] OFF
GO
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (1, N'Сад', 1)
INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (2, N'Нестле', 2)
INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (3, N'Пенни', 3)
INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (4, N'Мон-де-Ка', 4)
INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (5, N'Брукс', 5)
SET IDENTITY_INSERT [dbo].[Producer] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_discount]) VALUES (1, N'Сухарики', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_discount]) VALUES (2, N'Майонез', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_discount]) VALUES (3, N'Молоко', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_discount]) VALUES (4, N'Хлеб', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_discount]) VALUES (5, N'Крабовые палочки', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (1, N'Одесса', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (2, N'Техас', 2)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (3, N'Берлин', 3)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (4, N'Париж', 4)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (5, N'Осло', 5)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (1, 1, NULL, NULL, NULL)
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (2, 2, NULL, NULL, NULL)
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (3, 3, NULL, NULL, NULL)
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (4, 4, NULL, NULL, NULL)
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (5, 5, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (1, N'Аква', 1)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (2, N'Гид-Вид', 2)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (3, N'А-Айкатек', 3)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (4, N'Ботка', 4)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (5, N'Мегимаш', 5)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_City] FOREIGN KEY([id_city])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_City]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Region] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region] ([id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Region]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Products] FOREIGN KEY([id_product])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Products]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Supplier] FOREIGN KEY([id_supplier])
REFERENCES [dbo].[Supplier] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Supplier]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Address] FOREIGN KEY([id_adress])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Producer_Address]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Discount] FOREIGN KEY([id_discount])
REFERENCES [dbo].[Discount] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Discount]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Measurements] FOREIGN KEY([id_measurement])
REFERENCES [dbo].[Measurements] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Measurements]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Producer] FOREIGN KEY([id_producer])
REFERENCES [dbo].[Producer] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Producer]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Products] FOREIGN KEY([id_product])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Products]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Address]
GO
USE [master]
GO
ALTER DATABASE [Store] SET  READ_WRITE 
GO
