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
/****** Object:  Table [dbo].[Ticket]    Script Date: 11/10/2019 08:27:24 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Ticket]
GO
/****** Object:  Table [dbo].[Restaurante]    Script Date: 11/10/2019 08:27:24 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Restaurante]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 11/10/2019 08:27:24 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Pedido]
GO
/****** Object:  Table [dbo].[Mesero]    Script Date: 11/10/2019 08:27:24 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Mesero]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 11/10/2019 08:27:24 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Mesa]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 11/10/2019 08:27:24 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Menu]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/10/2019 08:27:24 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cliente]
GO
USE [master]
GO
/****** Object:  Database [RestauranteJMG]    Script Date: 11/10/2019 08:27:24 p. m. ******/
DROP DATABASE IF EXISTS [RestauranteJMG]
GO
/****** Object:  Database [RestauranteJMG]    Script Date: 11/10/2019 08:27:24 p. m. ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/10/2019 08:27:24 p. m. ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 11/10/2019 08:27:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[iIdProducto] [int] NOT NULL,
	[vNombrePlatillo] [varchar](50) NULL,
	[vDescripcion] [varchar](200) NULL,
	[iPrecio] [int] NOT NULL,
	[NombrePlatillo]  AS (((([vNombrePlatillo]+' ')+[vDescripcion])+' ')+[iPrecio]),
PRIMARY KEY CLUSTERED 
(
	[iIdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 11/10/2019 08:27:24 p. m. ******/
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
/****** Object:  Table [dbo].[Mesero]    Script Date: 11/10/2019 08:27:24 p. m. ******/
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
/****** Object:  Table [dbo].[Pedido]    Script Date: 11/10/2019 08:27:24 p. m. ******/
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
/****** Object:  Table [dbo].[Restaurante]    Script Date: 11/10/2019 08:27:24 p. m. ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 11/10/2019 08:27:24 p. m. ******/
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
