USE [RestauranteJMG]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ticket]') AND type in (N'U'))
ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT IF EXISTS [FK_iIdMesa]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ticket]') AND type in (N'U'))
ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT IF EXISTS [FK_iIdMenu]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido]') AND type in (N'U'))
ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT IF EXISTS [FK_iIdProducto]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido]') AND type in (N'U'))
ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT IF EXISTS [FK_iIdCliente]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesero]') AND type in (N'U'))
ALTER TABLE [dbo].[Mesero] DROP CONSTRAINT IF EXISTS [FK_iIdMesaM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesa]') AND type in (N'U'))
ALTER TABLE [dbo].[Mesa] DROP CONSTRAINT IF EXISTS [FK_iIdRestaurante]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
ALTER TABLE [dbo].[Cliente] DROP CONSTRAINT IF EXISTS [FK_iIdMesaC]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 24/10/2019 07:41:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Ticket]
GO
/****** Object:  Table [dbo].[Restaurante]    Script Date: 24/10/2019 07:41:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Restaurante]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 24/10/2019 07:41:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Pedido]
GO
/****** Object:  Table [dbo].[Mesero]    Script Date: 24/10/2019 07:41:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Mesero]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 24/10/2019 07:41:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Mesa]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 24/10/2019 07:41:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Menu]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 24/10/2019 07:41:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cliente]
GO
USE [master]
GO
/****** Object:  Database [RestauranteJMG]    Script Date: 24/10/2019 07:41:21 p. m. ******/
DROP DATABASE IF EXISTS [RestauranteJMG]
GO
/****** Object:  Database [RestauranteJMG]    Script Date: 24/10/2019 07:41:21 p. m. ******/
CREATE DATABASE [RestauranteJMG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RestauranteJMG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RestauranteJMG.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RestauranteJMG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RestauranteJMG_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RestauranteJMG] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestauranteJMG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestauranteJMG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RestauranteJMG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestauranteJMG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestauranteJMG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestauranteJMG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestauranteJMG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestauranteJMG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestauranteJMG] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RestauranteJMG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestauranteJMG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestauranteJMG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestauranteJMG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestauranteJMG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestauranteJMG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RestauranteJMG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestauranteJMG] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RestauranteJMG] SET  MULTI_USER 
GO
ALTER DATABASE [RestauranteJMG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestauranteJMG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RestauranteJMG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RestauranteJMG] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RestauranteJMG] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RestauranteJMG] SET QUERY_STORE = OFF
GO
USE [RestauranteJMG]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 24/10/2019 07:41:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[iIdCliente] [int] NOT NULL,
	[iIdMesa] [int] NOT NULL,
	[vNombreC] [varchar](30) NULL,
	[vApellidoP] [varchar](30) NOT NULL,
	[vApellidoM] [varchar](30) NOT NULL,
	[NombreCompleto]  AS (((([vNombreC]+' ')+[vApellidoP])+' ')+[vApellidoM]),
PRIMARY KEY CLUSTERED 
(
	[iIdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 24/10/2019 07:41:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[iIdProducto] [int] NOT NULL,
	[vNombrePlatillo] [varchar](50) NULL,
	[vDescripcion] [varchar](200) NULL,
	[iPrecio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 24/10/2019 07:41:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesa](
	[iIdMesa] [int] NOT NULL,
	[iIdRestaurante] [int] NULL,
	[iNumPer] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesero]    Script Date: 24/10/2019 07:41:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesero](
	[iIdMesero] [int] NOT NULL,
	[vNombreM] [varchar](30) NOT NULL,
	[vApellidoPM] [varchar](30) NOT NULL,
	[vApellidoMM] [varchar](30) NOT NULL,
	[iIdMesa] [int] NOT NULL,
	[NombreCompleto]  AS (((([vNombreM]+' ')+[vApellidoPM])+' ')+[vApellidoMM]),
PRIMARY KEY CLUSTERED 
(
	[iIdMesero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 24/10/2019 07:41:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[iIdPedido] [int] NOT NULL,
	[iIdCliente] [int] NOT NULL,
	[iIdProducto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurante]    Script Date: 24/10/2019 07:41:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurante](
	[iIdRestaurante] [int] NOT NULL,
	[Ubicacion] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 24/10/2019 07:41:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[iIdTicket] [int] NOT NULL,
	[iIdMesa] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[iIdMenu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (1, 1, N'Pedro', N'Ramirez', N'Perez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (2, 2, N'Wynn', N'Messent', N'Snaddon')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (4, 4, N'Nero', N'Moxstead', N'Dolby')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (5, 5, N'Binny', N'Hemphill', N'Aitcheson')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (6, 6, N'Maryellen', N'Jamme', N'Devey')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (7, 7, N'Mario', N'Marrett', N'Marini')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (8, 8, N'Kylila', N'Manns', N'Diplock')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (9, 9, N'Barny', N'Kalvin', N'Dunridge')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (10, 10, N'Hector', N'Ofen', N'Retallick')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (11, 11, N'Corbett', N'Ianniello', N'Sreenan')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (12, 12, N'Neille', N'Mouser', N'Janous')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (13, 13, N'Stanly', N'Heads', N'Lautie')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (16, 2, N'Melina', N'Cantu', N'Valdez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (17, 3, N'Mauricio', N'Camacho', N'Hernandez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (18, 5, N'Denisse', N'Montemayor', N'Aguilar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (19, 6, N'Jon', N'de Leon', N'Montes')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (20, 1, N'Juan', N'Tostado', N'Valdez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (21, 8, N'Paco', N'Tosatdo', N'Maldonado')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (22, 11, N'Astrid', N'Camacho', N'Limon')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (23, 12, N'Adriana', N'Valdez', N'Aguiar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (24, 9, N'Oscar', N'Valdez', N'Aguiar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (25, 6, N'Jorge', N'Hernandez', N'Garcia')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (26, 7, N'Jose', N'Garcia', N'Gonzales')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (27, 10, N'David', N'Martinez', N'Lopez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (28, 15, N'Diego', N'Ramires', N'Flores')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (29, 4, N'Leonardo', N'Soto', N'Flores')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (30, 12, N'Daniel', N'Sanchez', N'Rodriguez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (31, 3, N'Margarita', N'Gomez', N'Velazco')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (32, 4, N'Yolanda', N'Sotelo', N'Aguiar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (33, 5, N'Araceli', N'Ruelas', N'Gomez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (34, 7, N'Gabriela', N'Aguirre', N'Salazar')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (35, 10, N'Elizabeth', N'Cervantes', N'Davila')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (36, 15, N'Natalia', N'Garcia', N'Vega')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (37, 12, N'Veronica', N'Gonzales', N'Martinez')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (38, 1, N'Alexa', N'Lopez', N'Coronado')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (39, 6, N'Sebastian', N'Betancurt', N'Flores')
INSERT [dbo].[Cliente] ([iIdCliente], [iIdMesa], [vNombreC], [vApellidoP], [vApellidoM]) VALUES (40, 8, N'Fernanda', N'Garcia', N'Vega')
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (1, N'Tacos de Trompo', N'Tacos mexicanos de carne de puerco adobada', 50)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (2, N'Mojarra (670-720grs)', N'Mojarra a la diabla o al mojo de ajo acompañada con papas en gajo, ensalada y arroz de la casa', 129)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (3, N'La Rosita(220grs)', N'Pasta acompañada con salmon a la plancha y verduras.', 145)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (4, N'Chamalitas(240grs)', N'Alitas bañadas con salsa de la casa espolvpreadas con cebollin y cacahuate .', 89)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (5, N'Los Esquineros', N'Orden de tacos (3) de carne asada gratinaos con queso manchego y acompañados con papitas galeana.', 105)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (6, N'Las fajas(250grs)', N'Fajitas de Sirloin.', 119)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (7, N'Las fajas(250grs)', N'Fajitas de Pollo.', 99)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (8, N'Chamakidz)(80grs)', N'Fajitas de pescado o nuggets de pollo scompañadas con papas en gajos sazonadas con lemon-papper.', 70)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (9, N'Cocolizos', N'Camarones empanizados con coco, servidos con salsa de tomate, acompañados con arroz y verduras al vapor.', 119)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (10, N'Chamaburger', N'Hamburguesa de camaron con guacamole, tocino, queso manchego, cebolla y pimiento cocido.', 145)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (11, N'Mojarra Chamalera (550-620grs)', N'Mojarra preparada al estilo Chamalero con papas, ensalada y arroz.', 119)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (12, N'Mojarra Chamalera (670-720grs)', N'Mojarra preparada al estilo Chamalero con papas, ensalada y arroz.', 129)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (13, N'Isabela (135grs)', N'Receta original de coctel de camaron con un toquesito picante especial.', 95)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (14, N'Isabelita (80grs)', N'Como la Isabela pero version individual ideal pa`empezar.', 67)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (15, N'Camarones QK (200grs)', N'Camarones sateneados en nuestra salsa de ajillo acompañados con arroz.', 169)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (16, N'Estoyokei (120grs)', N'Lajas de sirloin curtidas en la receta secreta especial de la casa acompañadas con cubitos de aguacate y champiñones', 115)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (17, N'Water Chile green(150grs)', N'Camarones frescos curtidos en limon con 2 aguachiles verde.', 115)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (18, N'Water Chile black(150grs)', N'Camarones frescos curtidos en limon con 2 aguachiles negro.', 115)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (19, N'El pozolon (230grs)', N'Pozole calientito de mariscos(camaron, pulpo, pescado y almeja) acompañado de lechuga, rabano, tostadas y salsa de la casa.', 115)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (20, N'Caldo de Chamama (220grs)', N'Delicioso caldo de pescado, camaron, verduras y arroz.', 99)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (21, N'La ligerita', N'Mezcla de lechuga con camarones bufalo, tomate, pepino y varitas de apio con aderezo blue cheese.', 95)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (22, N'La rogelia (220grs)', N'Pasta fettuccinie con una crema fradevil y camarones salteados .', 109)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (23, N'Lais', N'Filete de pescado a la plancha, acompañado con arroz y verduras al vapor con un toque de mantequilla.', 95)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (24, N'Panchitos', N'Camarones rellenos de queso envueltos en tocino, acompañados con arroz y verduras al vapor.', 129)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (25, N'Los cuates', N'Filete de pescado capeado y camarones al ajillo, acompañado de arroz y verduras al vapor.', 109)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (26, N'La pinky (Tostada)', N'Finas laminas de atun fresco, aguacate, cebolla frita, cilantro y aderezo de chipotle.', 49)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (27, N'La robles (Tostada)', N'Finas laminas de salmon natural fresco sobre una cama de aguacate, tomate y aderezo de chipotle.', 49)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (28, N'La descuidada (Tostada)', N'Tostada de carne, champiñones y cebolla cocida sobre una cama de delicioso queso manchego gratinado.', 49)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (29, N'La tipica (Tostada)', N'Tradicional tostada de ceviche de camaron tomate, cebolla, aguacate y cilantro sobre un aderezo de ajo.', 47)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (30, N'La Don Octavio (Tostada)', N'Tostada de ceviche de pulpo cocido acompañado de jitomate, pepino y aguacate sobre un aderezo de cilantro.', 47)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (31, N'Doña Blanca (Tostada)', N'Tostada de ceviche de pescado sazonada en clamato, tomate, cebolla, aguacate sobre un aderezo de la casa.', 39)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (32, N'Coqueta (Tostada)', N'Tostada de ceviche de pescado, pepino trocitos de mango y un aderezo de la casa.', 39)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (33, N'Gober Precioso (Tacos)', N'Taco de guiso de camaron con queso fundido y chile poblano.', 34)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (34, N'Coca Cola 355ml (Bebidas)', N'Refresco Coca Cola.', 25)
INSERT [dbo].[Menu] ([iIdProducto], [vNombrePlatillo], [vDescripcion], [iPrecio]) VALUES (35, N'Sprite 355ml (Bebidas)', N'Refresco Sprite.', 25)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (1, 1, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (2, 2, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (3, 3, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (4, 4, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (5, 5, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (6, 6, 1)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (7, 7, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (8, 8, 5)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (9, 9, 8)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (10, 10, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (11, 8, 2)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (12, 4, 1)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (13, 1, 4)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (14, 2, 6)
INSERT [dbo].[Mesa] ([iIdMesa], [iIdRestaurante], [iNumPer]) VALUES (15, 9, 5)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (1, N'Agnese', N'Botterill', N'Berthelet', 7)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (2, N'Xever', N'Brazelton', N'Racine', 13)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (3, N'Sherill', N'Martinot', N'Andress', 8)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (4, N'Pedro', N'Meas', N'Gammage', 1)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (5, N'Rae', N'McDill', N'MacCarrick', 2)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (6, N'Doy', N'Carff', N'Spikeings', 13)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (7, N'Vittorio', N'Mackrill', N'Cheves', 4)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (8, N'Randa', N'Bacher', N'Reaveley', 9)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (9, N'Jervis', N'Bouch', N'Brownett', 14)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (10, N'Bonnibelle', N'MacLeese', N'Angus', 2)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (11, N'Wileen', N'Rothwell', N'Verick', 12)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (12, N'Roland', N'Spreadbury', N'Feldbau', 5)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (13, N'Cornell', N'Beadnall', N'MacCahee', 5)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (14, N'Johnath', N'Beament', N'Daniele', 13)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (15, N'Gery', N'Lerohan', N'Guwer', 12)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (16, N'Ede', N'Torri', N'Maybury', 13)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (17, N'Natal', N'Tothacot', N'Gennerich', 5)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (18, N'Jerald', N'Breyt', N'Probin', 3)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (19, N'Dianemarie', N'Parkes', N'Doy', 6)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (20, N'Rodney', N'Lethbury', N'Burgoyne', 5)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (21, N'Nelia', N'Hatz', N'Gibbons', 12)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (22, N'Nichol', N'Colliford', N'Mowsdill', 12)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (23, N'Kitti', N'Lowndesbrough', N'Adnam', 15)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (24, N'Killy', N'Corcut', N'Bredes', 1)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (25, N'Randie', N'McSporon', N'Rawsthorn', 2)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (26, N'Stella', N'Kohrding', N'Broadfield', 4)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (27, N'Bondon', N'McCrorie', N'Casterot', 5)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (28, N'Beniamino', N'Arno', N'Lowdeane', 2)
INSERT [dbo].[Mesero] ([iIdMesero], [vNombreM], [vApellidoPM], [vApellidoMM], [iIdMesa]) VALUES (29, N'Inness', N'Bengall', N'Piddle', 12)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (1, 12, 15)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (2, 6, 16)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (3, 2, 17)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (4, 1, 21)
INSERT [dbo].[Pedido] ([iIdPedido], [iIdCliente], [iIdProducto]) VALUES (5, 13, 5)
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (1, N'Garcia')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (2, N'Escobedo')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (3, N'Tepito')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (4, N'Cancun')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (5, N'Colima')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (6, N'San Pedro')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (7, N'Santa Catarina')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (8, N'Morelos')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (9, N'Apodaca')
INSERT [dbo].[Restaurante] ([iIdRestaurante], [Ubicacion]) VALUES (10, N'Los Cabos')
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (1, 12, CAST(N'2019-05-30' AS Date), 3)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (2, 15, CAST(N'2019-01-25' AS Date), 4)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (3, 1, CAST(N'2019-06-19' AS Date), 1)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (4, 8, CAST(N'2019-09-30' AS Date), 9)
INSERT [dbo].[Ticket] ([iIdTicket], [iIdMesa], [Fecha], [iIdMenu]) VALUES (5, 14, CAST(N'2019-07-17' AS Date), 6)
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_iIdMesaC] FOREIGN KEY([iIdMesa])
REFERENCES [dbo].[Mesa] ([iIdMesa])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_iIdMesaC]
GO
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD  CONSTRAINT [FK_iIdRestaurante] FOREIGN KEY([iIdRestaurante])
REFERENCES [dbo].[Restaurante] ([iIdRestaurante])
GO
ALTER TABLE [dbo].[Mesa] CHECK CONSTRAINT [FK_iIdRestaurante]
GO
ALTER TABLE [dbo].[Mesero]  WITH CHECK ADD  CONSTRAINT [FK_iIdMesaM] FOREIGN KEY([iIdMesa])
REFERENCES [dbo].[Mesa] ([iIdMesa])
GO
ALTER TABLE [dbo].[Mesero] CHECK CONSTRAINT [FK_iIdMesaM]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_iIdCliente] FOREIGN KEY([iIdCliente])
REFERENCES [dbo].[Cliente] ([iIdCliente])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_iIdCliente]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_iIdProducto] FOREIGN KEY([iIdProducto])
REFERENCES [dbo].[Menu] ([iIdProducto])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_iIdProducto]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_iIdMenu] FOREIGN KEY([iIdMenu])
REFERENCES [dbo].[Menu] ([iIdProducto])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_iIdMenu]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_iIdMesa] FOREIGN KEY([iIdMesa])
REFERENCES [dbo].[Mesa] ([iIdMesa])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_iIdMesa]
GO
USE [master]
GO
ALTER DATABASE [RestauranteJMG] SET  READ_WRITE 
GO
