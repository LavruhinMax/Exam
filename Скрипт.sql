USE [master]
GO
/****** Object:  Database [Lavruhin_Exam]    Script Date: 18.04.2025 9:51:44 ******/
CREATE DATABASE [Lavruhin_Exam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lavruhin_Exam', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KITP\MSSQL\DATA\Lavruhin_Exam.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lavruhin_Exam_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KITP\MSSQL\DATA\Lavruhin_Exam_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Lavruhin_Exam] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lavruhin_Exam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lavruhin_Exam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lavruhin_Exam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lavruhin_Exam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Lavruhin_Exam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lavruhin_Exam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET RECOVERY FULL 
GO
ALTER DATABASE [Lavruhin_Exam] SET  MULTI_USER 
GO
ALTER DATABASE [Lavruhin_Exam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lavruhin_Exam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lavruhin_Exam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lavruhin_Exam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Lavruhin_Exam] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Lavruhin_Exam] SET QUERY_STORE = OFF
GO
USE [Lavruhin_Exam]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 18.04.2025 9:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Client_ID] [int] IDENTITY(1,1) NOT NULL,
	[Client_First_Name] [varchar](50) NULL,
	[Client_Middle_Name] [varchar](50) NULL,
	[Client_Last_Name] [varchar](50) NULL,
	[Street] [varchar](50) NULL,
	[House] [varchar](5) NULL,
	[Flat] [varchar](10) NULL,
	[Phone_Number] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Client_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 18.04.2025 9:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Position_ID] [int] NULL,
	[Client_ID] [int] NULL,
	[Order_Date] [date] NULL,
	[Order_Price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pizza]    Script Date: 18.04.2025 9:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pizza](
	[Pizza_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pizza_Name] [varchar](30) NULL,
	[Ingredients] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pizza_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 18.04.2025 9:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Position_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pizza_ID] [int] NULL,
	[Size_ID] [int] NULL,
	[Weight] [int] NULL,
	[Price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Position_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 18.04.2025 9:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[Size_ID] [int] IDENTITY(1,1) NOT NULL,
	[Size] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Size_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (1, N'Дмитрий', N'Олегович', N'Сергеев', N'ул. Юшко', N'21', N' кв. 38', N'+7(904)123-4567')
INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (2, N'Валерия', N'Андреевна', N'Гребнева', N'ул. Фрунзе', N'8', N' кв. 21', N'+7(904)123-4568')
INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (3, N'Артемий', N'Дмитриевич', N'Лебедь', N'ул. Прокопцева', N'12', N' кв. 4', N'+7(904)123-4569')
INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (4, N'Вадим', N'Александрович', N'Целовальников', N'ул. Живцова', N'46', N' кв. 134', N'+7(904)123-4570')
INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (5, N'Ксения', N'Дмитриевна', N'Дружина', N'ул. Дмишкова', N'6', N' кв. 167', N'+7(904)123-4571')
INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (6, N'Андрей', N'Захарович', N'Петров', N'ул. Юшко', N'34', N' кв. 2', N'+7(904)123-4572')
INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (7, N'Мария', N'Викторовна', N'Тыцкая', N'ул. Мира', N'31', N' кв.191', N'+7(904)123-4573')
INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (8, N'Никита', N'Дмитриевич', N'Костиков', N'ул. Мира', N'31', N' кв.191', N'+7(904)123-4574')
INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (9, N'Галина', N'Олеговна', N'Хорошунова', N'ул. Жадова', N'45', N' кв. 37', N'+7(904)123-4575')
INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (10, N'Наталья', N'Алексеевна', N'Садриева', N'ул. Булгакова', N'23', N' кв. 98', N'+7(904)123-4576')
INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (11, N'Екатерина', N'Александровна', N'Никишина', N'ул. Калинина', N'2', N' кв. 61', N'+7(904)123-4577')
INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (12, N'Иван', N'Иванович', N'Лагута', N'ул. Дума', N'23', N' кв. 38', N'+7(904)123-4578')
INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (13, N'Анжела', N'Андреевна', N'Гребнева', N'ул. Донская', N'19', N' кв. 197', N'+7(904)123-4579')
INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (14, N'Константин', N'Валерьевич', N'Матвеенко', N'ул. Булгакова', N'5', N' кв. 1', N'+7(904)123-4580')
INSERT [dbo].[Client] ([Client_ID], [Client_First_Name], [Client_Middle_Name], [Client_Last_Name], [Street], [House], [Flat], [Phone_Number]) VALUES (15, N'Наталья', N'Захаровна', N'Бобинова', N'ул. Ландышева', N'32', N' кв. 201', N'+7(904)123-4581')
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (1, 11, 1, CAST(N'2024-01-29' AS Date), NULL)
INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (2, 3, 2, CAST(N'2024-03-03' AS Date), NULL)
INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (3, 5, 3, CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (4, 10, 4, CAST(N'2024-08-14' AS Date), NULL)
INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (5, 7, 5, CAST(N'2024-07-02' AS Date), NULL)
INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (6, 9, 6, CAST(N'2024-01-05' AS Date), NULL)
INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (7, 1, 7, CAST(N'2024-02-02' AS Date), NULL)
INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (8, 5, 8, CAST(N'2024-09-13' AS Date), NULL)
INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (9, 2, 9, CAST(N'2024-10-23' AS Date), NULL)
INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (10, 20, 10, CAST(N'2024-10-24' AS Date), NULL)
INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (11, 22, 11, CAST(N'2024-10-25' AS Date), NULL)
INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (12, 19, 12, CAST(N'2024-10-26' AS Date), NULL)
INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (13, 20, 13, CAST(N'2024-10-27' AS Date), NULL)
INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (14, 9, 14, CAST(N'2024-10-28' AS Date), NULL)
INSERT [dbo].[Order] ([Order_ID], [Position_ID], [Client_ID], [Order_Date], [Order_Price]) VALUES (15, 12, 15, CAST(N'2024-10-29' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Pizza] ON 

INSERT [dbo].[Pizza] ([Pizza_ID], [Pizza_Name], [Ingredients]) VALUES (1, N'Пепперони', N'Тесто для пиццы, соус томатный, сервелат, шампиньоны, томаты, сыр моцарелла')
INSERT [dbo].[Pizza] ([Pizza_ID], [Pizza_Name], [Ingredients]) VALUES (2, N'Барбекю', N'Тесто для пиццы, соус барбекю, бекон, колбаски охотничьи,лук маринованный, перец болгарский, сыр')
INSERT [dbo].[Pizza] ([Pizza_ID], [Pizza_Name], [Ingredients]) VALUES (3, N'Классическая', N'Тесто для пиццы, соус томатный, ветчина, томаты, перц болгарский, шампиньоны, сыр моцарелла')
INSERT [dbo].[Pizza] ([Pizza_ID], [Pizza_Name], [Ingredients]) VALUES (4, N'Маргарита', N'Тесто для пиццы, соус томатный,томаты, сыр гауда')
INSERT [dbo].[Pizza] ([Pizza_ID], [Pizza_Name], [Ingredients]) VALUES (5, N'Ферма', N'Тесто для пиццы, соус томатный, сыр моцарелла, говядина, шампиньоны, томаты, перец болгарский, сыр моцарелла')
INSERT [dbo].[Pizza] ([Pizza_ID], [Pizza_Name], [Ingredients]) VALUES (6, N'Домашняя', N'Тесто для пиццы, соус томатный, картофель, фарш мясной, томаты, сыр, яйцо')
INSERT [dbo].[Pizza] ([Pizza_ID], [Pizza_Name], [Ingredients]) VALUES (7, N'Американо', N'Тесто для пиццы, соус томатный, ветчина, сервелат, шампиноны, маслины, сыр моцарелла')
INSERT [dbo].[Pizza] ([Pizza_ID], [Pizza_Name], [Ingredients]) VALUES (8, N'Салями острая', N'Тесто для пиццы, соус томатный, аджика, салями, корнишоны маринованные, лук маринованный, сыр моцарелла')
SET IDENTITY_INSERT [dbo].[Pizza] OFF
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (1, 1, 1, 840, CAST(769.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (2, 1, 2, 615, CAST(630.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (3, 1, 3, 315, CAST(515.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (4, 2, 1, 840, CAST(809.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (5, 2, 2, 615, CAST(657.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (6, 2, 3, 315, CAST(456.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (7, 3, 1, 840, CAST(984.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (8, 3, 2, 615, CAST(763.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (9, 3, 3, 315, CAST(564.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (10, 4, 1, 840, CAST(876.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (11, 4, 2, 615, CAST(456.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (12, 4, 3, 315, CAST(378.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (13, 5, 1, 840, CAST(980.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (14, 5, 2, 615, CAST(897.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (15, 5, 3, 315, CAST(790.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (16, 6, 1, 840, CAST(660.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (17, 6, 2, 615, CAST(470.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (18, 6, 3, 315, CAST(320.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (19, 7, 1, 840, CAST(675.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (20, 7, 2, 615, CAST(456.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (21, 7, 3, 315, CAST(320.00 AS Decimal(10, 2)))
INSERT [dbo].[Position] ([Position_ID], [Pizza_ID], [Size_ID], [Weight], [Price]) VALUES (22, 8, 1, 840, CAST(786.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Position] OFF
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([Size_ID], [Size]) VALUES (1, N'Большая')
INSERT [dbo].[Size] ([Size_ID], [Size]) VALUES (2, N'Средняя')
INSERT [dbo].[Size] ([Size_ID], [Size]) VALUES (3, N'Малая')
SET IDENTITY_INSERT [dbo].[Size] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Client] ([Client_ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Position_ID])
REFERENCES [dbo].[Position] ([Position_ID])
GO
ALTER TABLE [dbo].[Position]  WITH CHECK ADD FOREIGN KEY([Pizza_ID])
REFERENCES [dbo].[Pizza] ([Pizza_ID])
GO
ALTER TABLE [dbo].[Position]  WITH CHECK ADD FOREIGN KEY([Size_ID])
REFERENCES [dbo].[Size] ([Size_ID])
GO
USE [master]
GO
ALTER DATABASE [Lavruhin_Exam] SET  READ_WRITE 
GO
