USE [Restaurante]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesero]') AND type in (N'U'))
ALTER TABLE [dbo].[Mesero] DROP CONSTRAINT IF EXISTS [CK__Mesero__iId_Plat__693CA210]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesa]') AND type in (N'U'))
ALTER TABLE [dbo].[Mesa] DROP CONSTRAINT IF EXISTS [CK__Mesa__iId_Client__6A30C649]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido]') AND type in (N'U'))
ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT IF EXISTS [relation_idmesa]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido]') AND type in (N'U'))
ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT IF EXISTS [relation_idclienteP]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesero]') AND type in (N'U'))
ALTER TABLE [dbo].[Mesero] DROP CONSTRAINT IF EXISTS [relation_idplatillo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesa]') AND type in (N'U'))
ALTER TABLE [dbo].[Mesa] DROP CONSTRAINT IF EXISTS [relation_idmeserom]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mesa]') AND type in (N'U'))
ALTER TABLE [dbo].[Mesa] DROP CONSTRAINT IF EXISTS [relation_idcliente]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido]') AND type in (N'U'))
ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT IF EXISTS [default_idcliente]
GO
/****** Object:  Index [unique_descripcion]    Script Date: 20/09/2019 01:34:58 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Platillo]') AND type in (N'U'))
ALTER TABLE [dbo].[Platillo] DROP CONSTRAINT IF EXISTS [unique_descripcion]
GO
/****** Object:  Index [INDX_Mesero_Restarurante]    Script Date: 20/09/2019 01:34:58 p. m. ******/
DROP INDEX IF EXISTS [INDX_Mesero_Restarurante] ON [dbo].[Mesero]
GO
/****** Object:  Index [INDX_Clientes_Restaurante]    Script Date: 20/09/2019 01:34:58 p. m. ******/
DROP INDEX IF EXISTS [INDX_Clientes_Restaurante] ON [dbo].[Clientes]
GO
/****** Object:  Index [unique_telefono]    Script Date: 20/09/2019 01:34:58 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clientes]') AND type in (N'U'))
ALTER TABLE [dbo].[Clientes] DROP CONSTRAINT IF EXISTS [unique_telefono]
GO
/****** Object:  Table [dbo].[Platillo]    Script Date: 20/09/2019 01:34:58 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Platillo]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 20/09/2019 01:34:58 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Pedido]
GO
/****** Object:  Table [dbo].[Mesero]    Script Date: 20/09/2019 01:34:58 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Mesero]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 20/09/2019 01:34:58 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Mesa]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 20/09/2019 01:34:58 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Clientes]
GO
USE [master]
GO
/****** Object:  Database [Restaurante]    Script Date: 20/09/2019 01:34:58 p. m. ******/
DROP DATABASE IF EXISTS [Restaurante]
GO
/****** Object:  Database [Restaurante]    Script Date: 20/09/2019 01:34:58 p. m. ******/
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 20/09/2019 01:34:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[iId_Cliente] [int] NOT NULL,
	[vNombre] [varchar](15) NULL,
	[vApellidoP] [varchar](20) NULL,
	[vApellidoM] [varchar](20) NULL,
	[iTelefono] [int] NULL,
	[NombreCompleto]  AS (((([vNombre]+' ')+[vApellidoP])+' ')+[vApellidoM]),
PRIMARY KEY CLUSTERED 
(
	[iId_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 20/09/2019 01:34:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesa](
	[iId_NumMesa] [int] NOT NULL,
	[iNumero_Personas] [int] NULL,
	[iId_ClienteF] [int] NULL,
	[iIdMesero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iId_NumMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesero]    Script Date: 20/09/2019 01:34:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesero](
	[iId_Mesero] [int] NOT NULL,
	[vNombre] [varchar](15) NULL,
	[vApellidoP] [varchar](20) NULL,
	[vApellidoM] [varchar](20) NULL,
	[iId_Platillo] [int] NULL,
	[NombreCpt]  AS (((([vNombre]+' ')+[vApellidoP])+' ')+[vApellidoM]),
PRIMARY KEY CLUSTERED 
(
	[iId_Mesero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 20/09/2019 01:34:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[iId_Pedido] [int] NOT NULL,
	[iId_ClienteP] [int] NULL,
	[iIdMesa] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iId_Pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Platillo]    Script Date: 20/09/2019 01:34:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platillo](
	[iId_Platillo] [int] NOT NULL,
	[vNombre_Platillo] [varchar](20) NULL,
	[mPrecio] [money] NULL,
	[vDescripcion] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[iId_Platillo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [unique_telefono]    Script Date: 20/09/2019 01:34:58 p. m. ******/
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [unique_telefono] UNIQUE NONCLUSTERED 
(
	[iTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Clientes_Restaurante]    Script Date: 20/09/2019 01:34:58 p. m. ******/
CREATE NONCLUSTERED INDEX [INDX_Clientes_Restaurante] ON [dbo].[Clientes]
(
	[iId_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Mesero_Restarurante]    Script Date: 20/09/2019 01:34:58 p. m. ******/
CREATE NONCLUSTERED INDEX [INDX_Mesero_Restarurante] ON [dbo].[Mesero]
(
	[iId_Mesero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_descripcion]    Script Date: 20/09/2019 01:34:58 p. m. ******/
ALTER TABLE [dbo].[Platillo] ADD  CONSTRAINT [unique_descripcion] UNIQUE NONCLUSTERED 
(
	[vDescripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pedido] ADD  CONSTRAINT [default_idcliente]  DEFAULT ('0') FOR [iId_ClienteP]
GO
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD  CONSTRAINT [relation_idcliente] FOREIGN KEY([iId_ClienteF])
REFERENCES [dbo].[Clientes] ([iId_Cliente])
GO
ALTER TABLE [dbo].[Mesa] CHECK CONSTRAINT [relation_idcliente]
GO
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD  CONSTRAINT [relation_idmeserom] FOREIGN KEY([iIdMesero])
REFERENCES [dbo].[Mesero] ([iId_Mesero])
GO
ALTER TABLE [dbo].[Mesa] CHECK CONSTRAINT [relation_idmeserom]
GO
ALTER TABLE [dbo].[Mesero]  WITH CHECK ADD  CONSTRAINT [relation_idplatillo] FOREIGN KEY([iId_Platillo])
REFERENCES [dbo].[Platillo] ([iId_Platillo])
GO
ALTER TABLE [dbo].[Mesero] CHECK CONSTRAINT [relation_idplatillo]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [relation_idclienteP] FOREIGN KEY([iId_ClienteP])
REFERENCES [dbo].[Clientes] ([iId_Cliente])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [relation_idclienteP]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [relation_idmesa] FOREIGN KEY([iIdMesa])
REFERENCES [dbo].[Mesa] ([iId_NumMesa])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [relation_idmesa]
GO
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD CHECK  (([iId_ClienteF]>(0)))
GO
ALTER TABLE [dbo].[Mesero]  WITH CHECK ADD CHECK  (([iId_Platillo]>(0)))
GO
USE [master]
GO
ALTER DATABASE [Restaurante] SET  READ_WRITE 
GO
