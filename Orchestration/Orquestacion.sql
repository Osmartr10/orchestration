USE [master]
GO
/****** Object:  Database [Orquestacion]    Script Date: 13/01/2024 8:25:38 ******/
CREATE DATABASE [Orquestacion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Orquestacion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Orquestacion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Orquestacion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Orquestacion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Orquestacion] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Orquestacion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Orquestacion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Orquestacion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Orquestacion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Orquestacion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Orquestacion] SET ARITHABORT OFF 
GO
ALTER DATABASE [Orquestacion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Orquestacion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Orquestacion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Orquestacion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Orquestacion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Orquestacion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Orquestacion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Orquestacion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Orquestacion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Orquestacion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Orquestacion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Orquestacion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Orquestacion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Orquestacion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Orquestacion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Orquestacion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Orquestacion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Orquestacion] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Orquestacion] SET  MULTI_USER 
GO
ALTER DATABASE [Orquestacion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Orquestacion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Orquestacion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Orquestacion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Orquestacion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Orquestacion] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Orquestacion] SET QUERY_STORE = ON
GO
ALTER DATABASE [Orquestacion] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Orquestacion]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 13/01/2024 8:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 13/01/2024 8:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 13/01/2024 8:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[PedidoId] [int] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Productos_PedidoId]    Script Date: 13/01/2024 8:25:39 ******/
CREATE NONCLUSTERED INDEX [IX_Productos_PedidoId] ON [dbo].[Productos]
(
	[PedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Pedidos_PedidoId] FOREIGN KEY([PedidoId])
REFERENCES [dbo].[Pedidos] ([Id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Pedidos_PedidoId]
GO
USE [master]
GO
ALTER DATABASE [Orquestacion] SET  READ_WRITE 
GO
