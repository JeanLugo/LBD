USE [Restaurante]
GO
/****** Object:  Index [INDX_Entradas_Restaurante]    Script Date: 13/09/2019 02:51:30 p. m. ******/
DROP INDEX IF EXISTS [INDX_Entradas_Restaurante] ON [dbo].[Entradas]
GO
/****** Object:  Index [INDX_EmpleadosCocina_Restaurante]    Script Date: 13/09/2019 02:51:30 p. m. ******/
DROP INDEX IF EXISTS [INDX_EmpleadosCocina_Restaurante] ON [dbo].[empleados_Cocina]
GO
/****** Object:  Index [INDX_bebidasA_Restaurante]    Script Date: 13/09/2019 02:51:30 p. m. ******/
DROP INDEX IF EXISTS [INDX_bebidasA_Restaurante] ON [dbo].[bebidas_A]
GO
/****** Object:  Table [dbo].[Entradas]    Script Date: 13/09/2019 02:51:30 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Entradas]
GO
/****** Object:  Table [dbo].[empleados_Meseros]    Script Date: 13/09/2019 02:51:30 p. m. ******/
DROP TABLE IF EXISTS [dbo].[empleados_Meseros]
GO
/****** Object:  Table [dbo].[empleados_Cocina]    Script Date: 13/09/2019 02:51:30 p. m. ******/
DROP TABLE IF EXISTS [dbo].[empleados_Cocina]
GO
/****** Object:  Table [dbo].[bebidas_NA]    Script Date: 13/09/2019 02:51:30 p. m. ******/
DROP TABLE IF EXISTS [dbo].[bebidas_NA]
GO
/****** Object:  Table [dbo].[bebidas_A]    Script Date: 13/09/2019 02:51:30 p. m. ******/
DROP TABLE IF EXISTS [dbo].[bebidas_A]
GO
USE [master]
GO
/****** Object:  Database [Restaurante]    Script Date: 13/09/2019 02:51:30 p. m. ******/
DROP DATABASE IF EXISTS [Restaurante]
GO
/****** Object:  Database [Restaurante]    Script Date: 13/09/2019 02:51:30 p. m. ******/
CREATE DATABASE [Restaurante]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Restaurante', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Restaurante.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Restaurante_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Restaurante_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Restaurante] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restaurante].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restaurante] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restaurante] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restaurante] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restaurante] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restaurante] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restaurante] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Restaurante] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restaurante] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restaurante] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restaurante] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restaurante] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restaurante] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restaurante] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restaurante] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restaurante] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Restaurante] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restaurante] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restaurante] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restaurante] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restaurante] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restaurante] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restaurante] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restaurante] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Restaurante] SET  MULTI_USER 
GO
ALTER DATABASE [Restaurante] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restaurante] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restaurante] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restaurante] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Restaurante] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Restaurante] SET QUERY_STORE = OFF
GO
USE [Restaurante]
GO
/****** Object:  Table [dbo].[bebidas_A]    Script Date: 13/09/2019 02:51:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bebidas_A](
	[iId] [int] NOT NULL,
	[vNombreBebida] [varchar](20) NULL,
	[vNombreAlcohol] [varchar](20) NULL,
	[iPrecioBA] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bebidas_NA]    Script Date: 13/09/2019 02:51:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bebidas_NA](
	[iId] [int] NOT NULL,
	[vTipoBebida] [varchar](20) NOT NULL,
	[vNombreBebida] [varchar](30) NOT NULL,
	[iRefill] [tinyint] NOT NULL,
	[iPrecioB] [int] NOT NULL,
	[Bebida]  AS (([vNombreBebida]+' ')+[vTipoBebida]),
PRIMARY KEY CLUSTERED 
(
	[iId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados_Cocina]    Script Date: 13/09/2019 02:51:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados_Cocina](
	[iId] [int] NOT NULL,
	[vNombre] [varchar](30) NOT NULL,
	[vSegundoNombre] [varchar](30) NULL,
	[vApellidoPaterno] [varchar](30) NOT NULL,
	[vApellidoMaterno] [varchar](30) NOT NULL,
	[Nombre]  AS (((((([vNombre]+' ')+[vSegundoNombre])+' ')+[vApellidoPaterno])+' ')+[vApellidoMaterno]),
PRIMARY KEY CLUSTERED 
(
	[iId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados_Meseros]    Script Date: 13/09/2019 02:51:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados_Meseros](
	[iId] [int] NOT NULL,
	[vNombre] [varchar](30) NOT NULL,
	[vSegundoNombre] [varchar](30) NULL,
	[vApellidoPaterno] [varchar](30) NOT NULL,
	[vApellidoMaterno] [varchar](30) NOT NULL,
	[Nombre]  AS (((((([vNombre]+' ')+[vSegundoNombre])+' ')+[vApellidoPaterno])+' ')+[vApellidoMaterno]),
PRIMARY KEY CLUSTERED 
(
	[iId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entradas]    Script Date: 13/09/2019 02:51:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entradas](
	[iId] [int] NOT NULL,
	[vNombrePlatillo] [varchar](40) NOT NULL,
	[vDescripcionPlatillo] [varchar](100) NOT NULL,
	[iTamanoPorcion] [int] NOT NULL,
	[iPrecio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[bebidas_A] ([iId], [vNombreBebida], [vNombreAlcohol], [iPrecioBA]) VALUES (1, N'Margarita', N'Victoria', 50)
INSERT [dbo].[bebidas_A] ([iId], [vNombreBebida], [vNombreAlcohol], [iPrecioBA]) VALUES (2, N'Cerveza', N'Tecate', 40)
INSERT [dbo].[bebidas_NA] ([iId], [vTipoBebida], [vNombreBebida], [iRefill], [iPrecioB]) VALUES (1, N'Azucarada', N'Coca Cola', 1, 40)
INSERT [dbo].[bebidas_NA] ([iId], [vTipoBebida], [vNombreBebida], [iRefill], [iPrecioB]) VALUES (2, N'Azucarada', N'Coca Cola', 0, 20)
INSERT [dbo].[empleados_Cocina] ([iId], [vNombre], [vSegundoNombre], [vApellidoPaterno], [vApellidoMaterno]) VALUES (1, N'Pedro', N'Jesus', N'Perez', N'Martinez')
INSERT [dbo].[empleados_Meseros] ([iId], [vNombre], [vSegundoNombre], [vApellidoPaterno], [vApellidoMaterno]) VALUES (1, N'Juan', N'', N'Gonzales', N'Martinez')
INSERT [dbo].[Entradas] ([iId], [vNombrePlatillo], [vDescripcionPlatillo], [iTamanoPorcion], [iPrecio]) VALUES (1, N'PapasBravas', N'Deliciosas papas bañadas en salsa bufalo', 250, 40)
/****** Object:  Index [INDX_bebidasA_Restaurante]    Script Date: 13/09/2019 02:51:30 p. m. ******/
CREATE NONCLUSTERED INDEX [INDX_bebidasA_Restaurante] ON [dbo].[bebidas_A]
(
	[iId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_EmpleadosCocina_Restaurante]    Script Date: 13/09/2019 02:51:30 p. m. ******/
CREATE NONCLUSTERED INDEX [INDX_EmpleadosCocina_Restaurante] ON [dbo].[empleados_Cocina]
(
	[vApellidoPaterno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Entradas_Restaurante]    Script Date: 13/09/2019 02:51:30 p. m. ******/
CREATE NONCLUSTERED INDEX [INDX_Entradas_Restaurante] ON [dbo].[Entradas]
(
	[vNombrePlatillo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Restaurante] SET  READ_WRITE 
GO
