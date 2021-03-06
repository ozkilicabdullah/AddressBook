USE [master]
GO
/****** Object:  Database [MyFridge]    Script Date: 24.07.2020 20:37:24 ******/
CREATE DATABASE [MyFridge]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyFridge', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MyFridge.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyFridge_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MyFridge_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MyFridge] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyFridge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyFridge] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyFridge] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyFridge] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyFridge] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyFridge] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyFridge] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyFridge] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyFridge] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyFridge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyFridge] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyFridge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyFridge] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyFridge] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyFridge] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyFridge] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyFridge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyFridge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyFridge] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyFridge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyFridge] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyFridge] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyFridge] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyFridge] SET RECOVERY FULL 
GO
ALTER DATABASE [MyFridge] SET  MULTI_USER 
GO
ALTER DATABASE [MyFridge] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyFridge] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyFridge] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyFridge] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyFridge] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyFridge', N'ON'
GO
ALTER DATABASE [MyFridge] SET QUERY_STORE = OFF
GO
USE [MyFridge]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 24.07.2020 20:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 24.07.2020 20:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[imageUrl] [nvarchar](250) NULL,
 CONSTRAINT [PK_Dood] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodIngredient]    Script Date: 24.07.2020 20:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodIngredient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[foodId] [int] NULL,
	[ingredientId] [int] NULL,
 CONSTRAINT [PK_FoodIngredient] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fridge]    Script Date: 24.07.2020 20:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fridge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK_Fridge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FridgeIngredient]    Script Date: 24.07.2020 20:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FridgeIngredient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fridgeId] [int] NULL,
	[ingredientId] [int] NULL,
	[quantity] [int] NULL,
	[quantityTypeId] [int] NULL,
 CONSTRAINT [PK_FridgeIngredient] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 24.07.2020 20:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[ingredientTypeId] [int] NULL,
	[imageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientType]    Script Date: 24.07.2020 20:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
 CONSTRAINT [PK_IngredientType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quantity]    Script Date: 24.07.2020 20:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quantity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[quantityTypeId] [int] NULL,
	[fridgeId] [int] NULL,
	[ingredientId] [int] NULL,
	[quantity] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Quantity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuantityType]    Script Date: 24.07.2020 20:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuantityType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
 CONSTRAINT [PK_QuantityType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 24.07.2020 20:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[directions] [nvarchar](4000) NULL,
	[foodName] [nvarchar](max) NULL,
	[imageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeIngredient]    Script Date: 24.07.2020 20:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeIngredient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[recipeId] [int] NULL,
	[ingredientId] [int] NULL,
 CONSTRAINT [PK_RecipeIngredient] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 24.07.2020 20:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[userName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[imageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [userName], [password], [name]) VALUES (1, N'ozkilic', N'12345', N'Abdullah')
INSERT [dbo].[Admin] ([Id], [userName], [password], [name]) VALUES (2, N'el', N'12345', N'Ali Murat')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([Id], [name], [imageUrl]) VALUES (1, N'The Best Marinade Around', N'1.jpg')
INSERT [dbo].[Food] ([Id], [name], [imageUrl]) VALUES (2, N'Panettone French Toast
', N'2.jpg')
INSERT [dbo].[Food] ([Id], [name], [imageUrl]) VALUES (3, N'Maple Apple Turkey Sausage
', N'3.jpg')
INSERT [dbo].[Food] ([Id], [name], [imageUrl]) VALUES (4, N'Good Old Fashioned Pancakes', N'4.jpg')
INSERT [dbo].[Food] ([Id], [name], [imageUrl]) VALUES (5, N'Banana Sour Cream Bread
', N'5.jpg')
INSERT [dbo].[Food] ([Id], [name], [imageUrl]) VALUES (6, N'Pumpkin Bread IV', N'6.jpg')
INSERT [dbo].[Food] ([Id], [name], [imageUrl]) VALUES (7, N'Banana Bread', N'7.jpg')
INSERT [dbo].[Food] ([Id], [name], [imageUrl]) VALUES (2009, N'ahmet', N'1.jpg')
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[FoodIngredient] ON 

INSERT [dbo].[FoodIngredient] ([id], [foodId], [ingredientId]) VALUES (1, 1, 1)
INSERT [dbo].[FoodIngredient] ([id], [foodId], [ingredientId]) VALUES (2, 2, 3)
INSERT [dbo].[FoodIngredient] ([id], [foodId], [ingredientId]) VALUES (3, 5, 4)
INSERT [dbo].[FoodIngredient] ([id], [foodId], [ingredientId]) VALUES (5, 1, 5)
INSERT [dbo].[FoodIngredient] ([id], [foodId], [ingredientId]) VALUES (6, 2, 5)
INSERT [dbo].[FoodIngredient] ([id], [foodId], [ingredientId]) VALUES (7, 2, 9)
INSERT [dbo].[FoodIngredient] ([id], [foodId], [ingredientId]) VALUES (8, 5, 4)
INSERT [dbo].[FoodIngredient] ([id], [foodId], [ingredientId]) VALUES (9, 5, 6)
SET IDENTITY_INSERT [dbo].[FoodIngredient] OFF
SET IDENTITY_INSERT [dbo].[Fridge] ON 

INSERT [dbo].[Fridge] ([Id], [userId]) VALUES (1, 1)
INSERT [dbo].[Fridge] ([Id], [userId]) VALUES (2, 2)
INSERT [dbo].[Fridge] ([Id], [userId]) VALUES (1034, 1050)
INSERT [dbo].[Fridge] ([Id], [userId]) VALUES (4250, 2052)
INSERT [dbo].[Fridge] ([Id], [userId]) VALUES (4261, 2053)
INSERT [dbo].[Fridge] ([Id], [userId]) VALUES (4263, 2054)
SET IDENTITY_INSERT [dbo].[Fridge] OFF
SET IDENTITY_INSERT [dbo].[FridgeIngredient] ON 

INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (1, 1, 2, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (8, 1, 4, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (13, 1, 30, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (14, 1, 31, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (1010, 1, 168, 2, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (1013, 2, 8, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (1016, 1, 17, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (1017, 1, 1, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (1024, 2, 2, 2, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (1025, 2, 163, 2, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (1026, 2, 9, 3, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (1034, 2, 1, 2, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (2036, 2, 4, 2, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (2054, 1034, 4, 2, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (2061, 1034, 17, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (2062, 1034, 7, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (2063, 1034, 10, 2, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (2064, 1034, 14, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (2065, 1034, 11, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (2066, 1034, 1, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (2067, 1034, 1, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (3041, 1034, 13, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (3042, 1034, 25, 2, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (3043, 4250, 55, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (3044, 4250, 1, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (3045, 4261, 4, 2, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (3046, 4261, 1, 1, 1)
INSERT [dbo].[FridgeIngredient] ([id], [fridgeId], [ingredientId], [quantity], [quantityTypeId]) VALUES (3047, 4261, 15, 5, 1)
SET IDENTITY_INSERT [dbo].[FridgeIngredient] OFF
SET IDENTITY_INSERT [dbo].[Ingredient] ON 

INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (1, N'Apples', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (2, N'Bacon', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (4, N'Bread', 7, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (7, N'Cauliflower', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (8, N'Cheddar Cheese', 6, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (9, N'Chicken', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (10, N'Turkey', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (11, N'Cream Cheese', 6, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (12, N'Eggs', 6, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (13, N'Flour', 7, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (14, N'Garlic', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (15, N'Strawberry', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (16, N'Banana', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (17, N'Orange', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (18, N'Melon', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (19, N'Avocado', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (20, N'Pineapple', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (21, N'Mango', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (22, N'Bilberry', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (23, N'Apricot', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (24, N'Grape', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (25, N'Cherry', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (26, N'Tangerine', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (27, N'Fig', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (28, N'Blackberry', 4, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (29, N'Carrot', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (30, N'Cabbage', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (31, N'Onion', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (32, N'Potato', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (33, N'Peas', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (34, N'Pumpkin', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (35, N'Tomato', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (36, N'Pepper', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (37, N'Aubergine', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (38, N'Cucumber', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (39, N'Lettuce', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (40, N'Bean', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (41, N'Green Been', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (42, N'Spinach', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (43, N'Celery', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (44, N'Mushroom', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (45, N'Corn', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (46, N'Broccoli', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (47, N'Kale', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (49, N'Leek', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (50, N'Red Cabbage', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (51, N'Okra', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (52, N'Turnip', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (53, N'Parsley', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (54, N'Mint', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (55, N'Lemon ', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (56, N'Squash', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (57, N'Eggplant', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (58, N'Artichoke', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (59, N'Arrugula', 2, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (60, N'Apple Juice', 8, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (61, N'Diet Cola', 8, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (62, N'Coffee', 8, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (63, N'Cola', 8, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (64, N'Lemonade', 8, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (65, N'Orange Juice', 8, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (66, N'Soda Water', 8, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (67, N'Baked Beans', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (68, N'Beans', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (69, N'Beef Soup', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (70, N'Black Beans', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (71, N'Canned Corn', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (72, N'Canned Tomatoes', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (73, N'Cheese Soup', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (74, N'Chili', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (75, N'Corned Beef Hash', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (76, N'Crab Bisque', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (77, N'Cream of Celery', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (78, N'Cream of Chicken', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (79, N'Cream of Corn', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (80, N'Cream of Mushroom', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (81, N'Cream of Onion', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (82, N'Gumbo', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (83, N'Kidney Beans', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (84, N'Lima Beans', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (85, N'Kidney Beans', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (86, N'Lime Beans', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (87, N'Minnestrone', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (88, N'Pork and Beans', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (89, N'Refried Beans', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (90, N'Tomato Paste', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (91, N'Tomato Soup', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (92, N'Vegetable Stock', 9, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (93, N'Applesauce', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (94, N'Barbecue Sauce', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (95, N'Buffalo', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (96, N'Burgandy Wine', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (97, N'Caramel', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (98, N'Cesar Dressing', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (99, N'Cheese Sauce', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (100, N'Chili Sauce', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (101, N'Chocolate Syrup', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (102, N'Cocktail Sauce', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (103, N'White Wine', 10, NULL)
GO
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (104, N'Garlic Sauce', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (105, N'Grape Jelly', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (106, N'Gravy', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (107, N'Guacamole', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (108, N'Honey Mustard ', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (109, N'Horseradish', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (110, N'Jam', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (111, N'Ketchup', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (112, N'Marsala Wine', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (113, N'Mayonnaise', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (114, N'Mustard', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (115, N'Nutella', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (116, N'Orange Jelly', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (117, N'Oyster Sauce', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (118, N'Peanut Butter', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (119, N'Pesto', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (120, N'Red Wine', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (121, N'Salsa', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (122, N'Sandwich Spread ', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (123, N'Sherry Wine', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (124, N'Steak Sauce', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (125, N'Red Sauce', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (126, N'Vermouth', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (127, N'Vinegar(General)', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (128, N'Vinegar Balsamic', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (129, N'Vinegar Red', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (130, N'Whip Cream', 10, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (131, N'American Cheese', 6, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (132, N'Blue Cheese', 6, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (133, N'Butter', 6, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (134, N'Margarine', 6, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (135, N'Buttermilk', 6, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (136, N'Chocolate Milk', 6, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (137, N'Coconut Milk', 6, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (138, N'Colby Cheese', 6, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (139, N'Milk', 6, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (140, N'Mozarella Cheese', 6, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (141, N'Yogurt', 6, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (142, N'Beer', 11, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (143, N'Brandy', 11, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (144, N'Coconut Rum', 11, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (145, N'Gin', 11, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (147, N'Gran Marnier', 11, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (148, N'Kahlua', 11, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (149, N'Pucker Raspbery', 11, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (150, N'Rum', 11, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (151, N'Tequila', 11, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (152, N'Triple Sec', 11, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (153, N'Vodka', 11, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (154, N'Whiskey', 11, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (155, N'Raki', 11, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (156, N'Beef (General)', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (157, N'Bologna', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (158, N'Brisket', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (159, N'Canned Chicken', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (160, N'Chicken Breast', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (161, N'Corned Beef', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (162, N'Ground Beef', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (163, N'Ground Meat(General)', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (164, N'Ground Prok', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (165, N'Ham', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (166, N'Hot Dog', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (167, N'Keilbasa', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (168, N'Meat Balls', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (169, N'Pepperoni', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (170, N'Polish Sausage', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (171, N'Prok Chops', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (172, N'Pork Roast', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (173, N'Pork Tenderloin', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (174, N'Prosciutto', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (175, N'Roast Beef', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (176, N'Salami', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (177, N'Sliced Chicken', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (178, N'Sliced Ham', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (179, N'Sliced Roast Beef', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (180, N'Sliced Turkey', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (181, N'Steak', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (182, N'Turkey Breasy ', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (183, N'Turkey Legs', 1, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (184, N'Barley', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (185, N'Black Rice', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (186, N'Bowtie Pasta', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (188, N'Brown Rice', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (189, N'Egg Noodles', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (190, N'Elbow Macaroni', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (191, N'Granola', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (192, N'Lasagna Noodles', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (193, N'Oats/Oatmeal', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (194, N'Pasta Noodles', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (195, N'Rice(General)', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (196, N'Rotini Noodles', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (197, N'Shell Noodles', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (198, N'Spaghetti Noodles', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (199, N'White Rice', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (200, N'Wild Rie ', 12, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (201, N'CatFish', 3, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (202, N'Clams', 3, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (203, N'Cod', 3, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (204, N'Crab', 3, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (205, N'Haddock', 3, NULL)
GO
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (206, N'Salmon', 3, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (207, N'Scallops', 3, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (208, N'Shrimp', 3, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (209, N'Swordfish', 3, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (210, N'Tuna ', 3, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (211, N'Cashew', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (212, N'Chocolate Bars', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (213, N'Crackers(General)', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (214, N'Frozen Fries', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (215, N'Kit Kat Bars', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (216, N'MArshmallows', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (217, N'Oyster Crackers', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (218, N'Peanuts', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (219, N'Pecans', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (220, N'Popcorn', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (221, N'Potato Chips', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (222, N'Pretzels', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (223, N'Ritz Crackers', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (224, N'Saltines', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (225, N'Corn Chips', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (226, N'Walnuts', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (227, N'Twinkie', 13, NULL)
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (1250, N'hhhh', 1, N'')
INSERT [dbo].[Ingredient] ([Id], [name], [ingredientTypeId], [imageUrl]) VALUES (1251, N'sdsadsds', 1, N'')
SET IDENTITY_INSERT [dbo].[Ingredient] OFF
SET IDENTITY_INSERT [dbo].[IngredientType] ON 

INSERT [dbo].[IngredientType] ([Id], [type]) VALUES (1, N'Meats')
INSERT [dbo].[IngredientType] ([Id], [type]) VALUES (2, N'Vegatables')
INSERT [dbo].[IngredientType] ([Id], [type]) VALUES (3, N'SeaFood')
INSERT [dbo].[IngredientType] ([Id], [type]) VALUES (4, N'Fruit')
INSERT [dbo].[IngredientType] ([Id], [type]) VALUES (6, N'Dairy Products')
INSERT [dbo].[IngredientType] ([Id], [type]) VALUES (7, N'Pastry')
INSERT [dbo].[IngredientType] ([Id], [type]) VALUES (8, N'Beverages')
INSERT [dbo].[IngredientType] ([Id], [type]) VALUES (9, N'Canned Products')
INSERT [dbo].[IngredientType] ([Id], [type]) VALUES (10, N'
Condiments
')
INSERT [dbo].[IngredientType] ([Id], [type]) VALUES (11, N'Liquor')
INSERT [dbo].[IngredientType] ([Id], [type]) VALUES (12, N'Grains')
INSERT [dbo].[IngredientType] ([Id], [type]) VALUES (13, N'Snacks')
SET IDENTITY_INSERT [dbo].[IngredientType] OFF
SET IDENTITY_INSERT [dbo].[Quantity] ON 

INSERT [dbo].[Quantity] ([Id], [quantityTypeId], [fridgeId], [ingredientId], [quantity]) VALUES (1, 1, 1, 2, CAST(1.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Quantity] OFF
SET IDENTITY_INSERT [dbo].[QuantityType] ON 

INSERT [dbo].[QuantityType] ([Id], [type]) VALUES (1, N'pieces ')
INSERT [dbo].[QuantityType] ([Id], [type]) VALUES (2, N'gram')
SET IDENTITY_INSERT [dbo].[QuantityType] OFF
SET IDENTITY_INSERT [dbo].[Recipe] ON 

INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (1, N'Mix together soy sauce, olive oil, lemon juice, and garlic. Pour over meat, and refrigerate for 1 hour before preparing as desired. ', N'The Best Marinade Around', N'1.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2, N'Whisk milk, egg, and cinnamon together in a shallow bowl. Dip panettone slice in the milk mixture; turn to ensure both sides are coated and most of the liquid has been absorbed.
Melt butter in a nonstick skillet over medium-low heat. Cook panettone in the hot butter until golden brown, about 5 minutes per side.', N'Panettone French Toast
', N'2.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (3, N'Combine turkey, apple, maple syrup, salt, sage, garlic powder, black pepper, marjoram, cinnamon, and cloves in a bowl; mix well. Form into 10 small patties.
Heat olive oil in a skillet over medium heat. Fry patties until no longer pink in the center and the juices run clear, 3 to 4 minutes per side. An instant-read thermometer inserted into the center should read at least 165 degrees F (74 degrees C).', N'Maple Apple Turkey Sausage
', N'3.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (4, N'In a large bowl, sift together the flour, baking powder, salt and sugar. Make a well in the center and pour in the milk, egg and melted butter; mix until smooth. Heat a lightly oiled griddle or frying pan over medium high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot', N'Good Old Fashioned Pancakes', N'4.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (5, N'Preheat oven to 300 degrees F (150 degrees C). Grease four 7x3 inch loaf pans. In a small bowl, stir together 1/4 cup white sugar and 1 teaspoon cinnamon. Dust pans lightly with cinnamon and sugar mixture.In a large bowl, cream butter and 3 cups sugar. Mix in eggs, mashed bananas, sour cream, vanilla and cinnamon. Mix in salt, baking soda and flour. Stir in nuts. Divide into prepared pans.Bake for 1 hour, until a toothpick inserted in center comes out clean. ', N'Banana Sour Cream Bread
', N'5.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (6, N'Preheat the oven to 350 degrees F (175 degrees C). Grease and flour three 9x5 inch loaf pans.In a large bowl, mix together the pumpkin, oil, sugar, and eggs. Combine the flour, baking powder, baking soda, salt, cinnamon, nutmeg, and cloves; stir into the pumpkin mixture until well blended. Divide the batter evenly between the prepared pans. Bake in preheated oven for 45 minutes to 1 hour. The top of the loaf should spring back when lightly pressed. ', N'Pumpkin Bread IV', N'6.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2008, N' First, crack the eggs into a mixing bowl and add in milk and salt. Whisk until combined. Then pass through a fine sieve to help get rid of lumps. Liquid without lumps is helpful in making egg roll successfully.Add in other toppings.Lightly grease a frying pan with vegetable oil. It’s a small egg roll. And heat the frying pan. Then pour in 1/2 egg mixture and over low heat cook it over until half done. Roll the omelet half way from the right to the middle. And move the egg roll to the right edge of the pan. If there is not enough oil, lightly grease the pan each time you roll up. And add in ¼ egg mixture to cover the left half of the pan. And cook until half done. And roll again half way up from the right to the left and move the egg roll to the right side of the pan. And add in the remaining egg mixture and cook until half done. And finally roll all the way up.Transfer to a cutting board. When an egg roll is hot, it’s easily broken, so let cool before cutting. Slice into bite-size pieces. And serve.', N'Omelet Egg Roll', N'8.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2009, N'Slice your onion into 1/2 inch slices. Then, using the biggest one, place in an oiled skillet over medium heat. When one side is lightly browned, flip the onion ring over and crack an egg in the middle. If you want the egg yolk to show, dab the top of the egg yolk gently with a paper towel and remove the white over the top of it. Then, sprinkle a little water in the pan and cover the skillet. Cook until your egg is done as you like. ', N'Egg in an Onion', N'9.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2010, N'preheat oven to 425, have cast iron pan in there (or oven safe dish)
Slice avocado in half, take out pit (not too soft but not too firm either.)
take pan out, put avocado half on, crack egg in
put whatever you want on top
place in oven and cook till your eggs [are done how you] desire ', N'Baked Avocado Egg on Top', N'10.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2011, N'Preheat the oven to 475˚ F. Place the potato wedges in a large mixing bowl. Cover with hot water; soak for 10-30 minutes. Put 4 tablespoons of the oil onto a heavy, rimmed baking sheet. Tilt the sheet side to side to evenly coat the pan with oil (a pastry brush can also help with this). Sprinkle the pan evenly with the salt and pepper. Set aside.Drain the potatoes. Spread the wedges out on layers of paper towels or on clean kitchen towels. Pat dry with additional towels. Wipe out the now empty bowl so it is dry. Return the potatoes to the bowl and toss with the remaining 1 tablespoon of oil. Arrange the potato wedges on the prepared baking sheet in a single layer. Cover tightly with foil and bake for 5 minutes. Remove the foil and continue to bake until the bottoms of the potatoes are spotty golden brown, 15-20 minutes, rotating the baking sheet after 10 minutes. Using a metal spatula and tongs, flip each potato wedge keeping them in a single layer. Continue baking until the fries are golden and crisp, 5 -15 minutes. Rotate the pan as needed to ensure even browning.When the fries are finished baking, transfer to a paper-towel lined plate to drain some of the grease. Season with additional salt and pepper to taste. Serve warm.', N'Oven Baked Fried Fries', N'11.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2012, N'Pre-heat the oven to 375
Rinse potatoes under the sink
Using a fork - pierce the potato 2-3 times per side
Brush Potato with olive oil - (makes the skin crispy)
Sprinkle with salt
Place them directly on the middle rack of the oven. I like to place a foil lined baking sheet underneath just in case anything drips off of the potatoes.
Bake for 45-60 minutes or until a fork is able to pierce the potato with little resistance.', N'Outback Potato', N'12.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2014, N'1. Preheat the oven to 350ºF. Bake the sweet potato for 30–45 minutes or until well cooked and soft all the way through. Peel and discard the sweet potato skin (or sprinkle it with a pinch of salt and much on it for a snack!). You can do this as much as a day ahead of time. Let the potato cool completely.

2. Place the sweet potato in a medium bowl and crush it with a fork until well mashed. Add the flours and salt. Knead the dough well, adding flour as necessary to allow for easy handling. Avoid adding more flour than necessary to keep the gnocchi from getting tough.

3. When you can easily handle the dough, separate it into four segments and roll each segment on a floured surface into long skinny ropes. Each roll should be approximately 3/4 of an inch in diameter. With a fork, cut each roll into 1/2 inch gnocchi segments. If you’d like to make the traditional grooves in your gnocchi, press each piece of pasta lightly with the fork. You can store these in an airtight container in the fridge for 2–3 days.

4. When you’re ready to cook your gnocchi, boil water just as you would normally for pasta. When the water is boiling, add a pinch of salt and the gnocchi. Keep the gnocchi simmering and stir them periodically to avoid sticking. When they float to the surface of the water, let them cook for another 5–10 minutes to taste. Strain the gnocchi from the water.

The Sauce:
Basically, just threw a large can of tomatoes (28 ounces – you can use the juice and tomatoes if you want it even lighter) and a few Tablespoons of basil to a blender. Add a pinch of salt and pepper and some garlic ', N'Sweet Potato Gnocchi', N'14.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2015, N'Heat a deep pan over medium heat.
Add the juice first and bring to a low boil.
Add in the chicken and sprinkle the meat with salt and pepper.
Lower everything to a simmer and cover the pan, cooking for 15 minutes.
Cover and cook for another 15 minutes.
Pop the lid up so that steam can escape, allowing the apple juice to reduce down.
Cook for another 10-20 minutes...
', N'Apple Juice Chicken', N'15.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2017, N'Slice banana into thin chips.
 Dip in lemon juice.
    Place on a GREASED cookie sheet.
    Bake for 2 hours @ 200 degrees and flip.
Bake for another 1.5-2 hours or until crisp.
', N'Banana Chips', N'17.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2018, N'In a saucepan bring water to a boil. Add rice and bouillon and stir. Reduce heat, cover and simmer for 20 minutes. Mix well before serving. ', N'Chicken Bouillon Rice', N'18.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2019, N'1 Mix rice, salsa (I like medium heat, but go with your family''s preference) and water in small saucepan.
2 Bring to a boil, cover with lid and reduce heat to low.
3 Simmer, stirring every 5-7 minutes until rice is tender, about 20-25 minutes. ', N'Salsa Rice', N'19.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2020, N'In a saucepan, bring water and salsa to a boil. Stir in rice. Remove from the heat; cover and let stand for 5 minutes. Stir in cheese; cover and let stand for 30 seconds or until cheese is melted. ', N'Spicy Mexican Rice', N'20.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2021, N'1 Preheat oven to 350F. Spray a 12 count cup cake pan.
2 Mix brownie mix as directed.
3 Unroll cookie dough
4 Add 1/4 part brownie mix and a piece of cookie dough on top. Should be 3/4th''s full. Bake for 10-15 minutes.', N'Cookie Brownies', N'21.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2024, N'1 - Cut the Crust off the Bread
2 - Flatten Bread with a rolling pin then top with a slice of cheese
3 - Roll the cheese up in the bread then cook in a pan with melted butter over medium heat, until cheese is melted ', N'Grilled Cheese Rolls', N'24.jpg')
INSERT [dbo].[Recipe] ([Id], [directions], [foodName], [imageUrl]) VALUES (2025, N'Preheat a grill to medium-high. Arrange 3 thin slices sandwich bread, such as Pepperidge Farm Very Thin white bread, on a work surface. Top each with 1 deli-style slice cheddar cheese, another slice bread, another slice cheese and another slice bread. Trim and discard the crusts. Brush the sides of each stack with melted butter. Quarter each diagonally to form 12 triangles. Spear a 6-inch skewer into each quarter and butter the cut sides. Grill each side. ', N'Grilled Cheese on a Stick', N'25.jpg')
SET IDENTITY_INSERT [dbo].[Recipe] OFF
SET IDENTITY_INSERT [dbo].[RecipeIngredient] ON 

INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1, 1, 1)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2, 1, 2)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (3, 1, 4)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (4, 1, 7)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (5, 2, 37)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1002, 2, 168)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1003, 2, 4)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1004, 2, 11)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1005, 2, 14)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1006, 3, 88)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1007, 3, 66)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1008, 3, 65)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1009, 3, 78)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1010, 3, 99)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1011, 3, 45)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1012, 4, 5)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1013, 4, 9)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1014, 4, 32)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1015, 4, 44)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1016, 4, 88)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1017, 4, 122)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1018, 4, 123)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1019, 5, 165)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1020, 5, 167)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1021, 5, 155)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1022, 5, 79)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1023, 5, 76)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1024, 6, 6)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1025, 6, 61)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1026, 6, 59)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1027, 6, 42)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1028, 6, 33)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (1029, 6, 31)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2002, 2008, 12)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2003, 2008, 14)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2004, 2008, 74)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2005, 2008, 8)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2006, 2008, 9)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2007, 2008, 6)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2008, 2008, 13)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2010, 2008, 17)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2011, 2008, 15)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2012, 2009, 20)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2013, 2009, 25)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2014, 2009, 24)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2015, 2009, 8)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2016, 2009, 11)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2017, 2009, 29)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2018, 2009, 31)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2019, 2010, 45)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2020, 2010, 36)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2021, 2010, 33)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2022, 2010, 38)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2023, 2010, 37)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2024, 2011, 5)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2025, 2011, 9)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2026, 2011, 146)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2027, 2011, 141)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2028, 2011, 134)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2029, 2011, 140)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2030, 2011, 122)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2031, 2011, 111)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2032, 2011, 110)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2033, 2012, 100)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2034, 2012, 98)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2035, 2012, 94)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2036, 2012, 90)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2037, 2012, 88)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2038, 2013, 76)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2039, 2013, 74)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2040, 2013, 71)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2041, 2013, 70)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2042, 2013, 68)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2043, 2014, 55)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2044, 2014, 51)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2045, 2014, 7)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2046, 2014, 144)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2047, 2014, 110)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2048, 2014, 13)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2049, 2014, 21)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2050, 2015, 131)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2051, 2015, 9)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2052, 2015, 96)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2053, 2015, 93)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2054, 2015, 5)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2055, 2016, 6)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2056, 2016, 16)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2057, 2016, 66)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2058, 2016, 36)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2059, 2016, 41)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2064, 2018, 18)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2065, 2018, 69)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2066, 2018, 84)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2067, 2018, 83)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2068, 2018, 4)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2069, 2019, 9)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2070, 2019, 19)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2071, 2019, 36)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2072, 2019, 124)
GO
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2073, 2019, 76)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2074, 2020, 21)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2075, 2020, 20)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2076, 2020, 2)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2077, 2020, 24)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2078, 2020, 14)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2079, 2021, 1)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2080, 2021, 6)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2081, 2021, 64)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2082, 2021, 44)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2083, 2021, 43)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2084, 2024, 4)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2085, 2024, 24)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2086, 2024, 143)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2087, 2024, 120)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2088, 2024, 116)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2089, 2025, 5)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2090, 2025, 15)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2091, 2025, 10)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2092, 2025, 7)
INSERT [dbo].[RecipeIngredient] ([id], [recipeId], [ingredientId]) VALUES (2093, 2025, 6)
SET IDENTITY_INSERT [dbo].[RecipeIngredient] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [name], [lastName], [userName], [password], [active], [imageUrl]) VALUES (1, N'Abdullah', N'ÖZKILIÇ', N'ozkilicabdullah', N'12345', 1, N'mr.jpg')
INSERT [dbo].[User] ([Id], [name], [lastName], [userName], [password], [active], [imageUrl]) VALUES (2, N'Ali Murat', N'EL', N'alimuratel', N'12345', 1, N'mr.jpg')
INSERT [dbo].[User] ([Id], [name], [lastName], [userName], [password], [active], [imageUrl]) VALUES (1050, N'ibo1', N'ibo', N'ww', N'ww', 1, N'mrs.png')
INSERT [dbo].[User] ([Id], [name], [lastName], [userName], [password], [active], [imageUrl]) VALUES (2052, N'ahmet', N'Dal', N'ahmet', N'12345', 1, N'mrs.png')
INSERT [dbo].[User] ([Id], [name], [lastName], [userName], [password], [active], [imageUrl]) VALUES (2053, N'mehmet', N'Guven', N'mehmet', N'12345', 1, N'mr.jpg')
INSERT [dbo].[User] ([Id], [name], [lastName], [userName], [password], [active], [imageUrl]) VALUES (2054, N'ilknur', N'ilknur', N'ilknur', N'12345', 1, N'mr.jpg')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[FridgeIngredient]  WITH CHECK ADD  CONSTRAINT [FK_FridgeIngredient_Fridge] FOREIGN KEY([fridgeId])
REFERENCES [dbo].[Fridge] ([Id])
GO
ALTER TABLE [dbo].[FridgeIngredient] CHECK CONSTRAINT [FK_FridgeIngredient_Fridge]
GO
ALTER TABLE [dbo].[FridgeIngredient]  WITH CHECK ADD  CONSTRAINT [FK_FridgeIngredient_Ingredient] FOREIGN KEY([ingredientId])
REFERENCES [dbo].[Ingredient] ([Id])
GO
ALTER TABLE [dbo].[FridgeIngredient] CHECK CONSTRAINT [FK_FridgeIngredient_Ingredient]
GO
ALTER TABLE [dbo].[Ingredient]  WITH CHECK ADD  CONSTRAINT [FK_Ingredient_IngredientType] FOREIGN KEY([ingredientTypeId])
REFERENCES [dbo].[IngredientType] ([Id])
GO
ALTER TABLE [dbo].[Ingredient] CHECK CONSTRAINT [FK_Ingredient_IngredientType]
GO
ALTER TABLE [dbo].[Quantity]  WITH CHECK ADD  CONSTRAINT [FK_Quantity_Fridge] FOREIGN KEY([fridgeId])
REFERENCES [dbo].[Fridge] ([Id])
GO
ALTER TABLE [dbo].[Quantity] CHECK CONSTRAINT [FK_Quantity_Fridge]
GO
ALTER TABLE [dbo].[Quantity]  WITH CHECK ADD  CONSTRAINT [FK_Quantity_Ingredient] FOREIGN KEY([ingredientId])
REFERENCES [dbo].[Ingredient] ([Id])
GO
ALTER TABLE [dbo].[Quantity] CHECK CONSTRAINT [FK_Quantity_Ingredient]
GO
ALTER TABLE [dbo].[Quantity]  WITH CHECK ADD  CONSTRAINT [FK_Quantity_QuantityType] FOREIGN KEY([quantityTypeId])
REFERENCES [dbo].[QuantityType] ([Id])
GO
ALTER TABLE [dbo].[Quantity] CHECK CONSTRAINT [FK_Quantity_QuantityType]
GO
USE [master]
GO
ALTER DATABASE [MyFridge] SET  READ_WRITE 
GO
