USE [master]
GO
/****** Object:  Database [helpdesk]    Script Date: 19/06/2025 21:20:30 ******/
CREATE DATABASE [helpdesk]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'helpdesk', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\helpdesk.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'helpdesk_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\helpdesk_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [helpdesk] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [helpdesk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [helpdesk] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [helpdesk] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [helpdesk] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [helpdesk] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [helpdesk] SET ARITHABORT OFF 
GO
ALTER DATABASE [helpdesk] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [helpdesk] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [helpdesk] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [helpdesk] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [helpdesk] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [helpdesk] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [helpdesk] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [helpdesk] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [helpdesk] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [helpdesk] SET  ENABLE_BROKER 
GO
ALTER DATABASE [helpdesk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [helpdesk] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [helpdesk] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [helpdesk] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [helpdesk] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [helpdesk] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [helpdesk] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [helpdesk] SET RECOVERY FULL 
GO
ALTER DATABASE [helpdesk] SET  MULTI_USER 
GO
ALTER DATABASE [helpdesk] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [helpdesk] SET DB_CHAINING OFF 
GO
ALTER DATABASE [helpdesk] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [helpdesk] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [helpdesk] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [helpdesk] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'helpdesk', N'ON'
GO
ALTER DATABASE [helpdesk] SET QUERY_STORE = ON
GO
ALTER DATABASE [helpdesk] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [helpdesk]
GO
/****** Object:  Table [dbo].[Archivo_Adjunto]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Archivo_Adjunto](
	[id_archivo] [int] NOT NULL,
	[id_ticket] [int] NULL,
	[nombre_archivo] [varchar](255) NULL,
	[url_archivo] [text] NULL,
	[tipo_archivo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_archivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bitacora_Ticket]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora_Ticket](
	[id_bitacora] [int] NOT NULL,
	[id_ticket] [int] NULL,
	[fecha_evento] [datetime] NULL,
	[evento] [text] NULL,
	[autor] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_bitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calendario_Atencion]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendario_Atencion](
	[id_calendario] [int] NOT NULL,
	[id_ticket] [int] NULL,
	[fecha_agendada] [datetime] NULL,
	[duracion_estimada] [int] NULL,
	[confirmado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_calendario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo_Servicio]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_Servicio](
	[id_servicio] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [text] NULL,
	[id_herramienta] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[id_comentario] [int] NOT NULL,
	[id_ticket] [int] NULL,
	[autor] [varchar](100) NULL,
	[fecha_comentario] [datetime] NULL,
	[contenido] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_comentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Escalamiento]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Escalamiento](
	[id_escalamiento] [int] NOT NULL,
	[id_ticket] [int] NULL,
	[id_tecnico_origen] [int] NULL,
	[id_tecnico_destino] [int] NULL,
	[motivo] [text] NULL,
	[fecha_escalamiento] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_escalamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estadistica_Ticket]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estadistica_Ticket](
	[id_estadistica] [int] NOT NULL,
	[id_ticket] [int] NULL,
	[tiempo_respuesta] [int] NULL,
	[tiempo_resolucion] [int] NULL,
	[fue_escalado] [int] NULL,
	[cumplio_sla] [int] NULL,
	[fecha_analisis] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estadistica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Ticket]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Ticket](
	[id_estado_ticket] [int] NOT NULL,
	[nombre_estado] [varchar](50) NULL,
	[descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estado_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Herramienta]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Herramienta](
	[id_herramienta] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[version] [varchar](50) NULL,
	[descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_herramienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plataforma]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plataforma](
	[id_plataforma] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_plataforma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Protocolo_Atencion]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Protocolo_Atencion](
	[id_protocolo] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [text] NULL,
	[pasos_json] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_protocolo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SLA]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA](
	[id_sla] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[tiempo_respuesta] [int] NULL,
	[tiempo_resolucion] [int] NULL,
	[penalizacion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_sla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tecnico]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tecnico](
	[id_tecnico] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[correo] [varchar](100) NULL,
	[id_tipo_tecnico] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tecnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[id_ticket] [int] NOT NULL,
	[id_usuario] [int] NULL,
	[id_tecnico] [int] NULL,
	[id_servicio] [int] NULL,
	[id_sla] [int] NULL,
	[id_estado_ticket] [int] NULL,
	[id_protocolo] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_resolucion] [datetime] NULL,
	[prioridad] [varchar](50) NULL,
	[descripcion] [text] NULL,
	[id_plataforma] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Tecnico]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Tecnico](
	[id_tipo_tecnico] [int] NOT NULL,
	[nombre_especialidad] [varchar](100) NULL,
	[descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo_tecnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 19/06/2025 21:20:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id_usuario] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[correo] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
	[departamento] [varchar](100) NULL,
	[tipo_usuario] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Archivo_Adjunto]  WITH CHECK ADD FOREIGN KEY([id_ticket])
REFERENCES [dbo].[Ticket] ([id_ticket])
GO
ALTER TABLE [dbo].[Bitacora_Ticket]  WITH CHECK ADD FOREIGN KEY([id_ticket])
REFERENCES [dbo].[Ticket] ([id_ticket])
GO
ALTER TABLE [dbo].[Calendario_Atencion]  WITH CHECK ADD FOREIGN KEY([id_ticket])
REFERENCES [dbo].[Ticket] ([id_ticket])
GO
ALTER TABLE [dbo].[Catalogo_Servicio]  WITH CHECK ADD FOREIGN KEY([id_herramienta])
REFERENCES [dbo].[Herramienta] ([id_herramienta])
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD FOREIGN KEY([id_ticket])
REFERENCES [dbo].[Ticket] ([id_ticket])
GO
ALTER TABLE [dbo].[Escalamiento]  WITH CHECK ADD FOREIGN KEY([id_tecnico_origen])
REFERENCES [dbo].[Tecnico] ([id_tecnico])
GO
ALTER TABLE [dbo].[Escalamiento]  WITH CHECK ADD FOREIGN KEY([id_tecnico_destino])
REFERENCES [dbo].[Tecnico] ([id_tecnico])
GO
ALTER TABLE [dbo].[Escalamiento]  WITH CHECK ADD FOREIGN KEY([id_ticket])
REFERENCES [dbo].[Ticket] ([id_ticket])
GO
ALTER TABLE [dbo].[Estadistica_Ticket]  WITH CHECK ADD FOREIGN KEY([id_ticket])
REFERENCES [dbo].[Ticket] ([id_ticket])
GO
ALTER TABLE [dbo].[Tecnico]  WITH CHECK ADD FOREIGN KEY([id_tipo_tecnico])
REFERENCES [dbo].[Tipo_Tecnico] ([id_tipo_tecnico])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([id_estado_ticket])
REFERENCES [dbo].[Estado_Ticket] ([id_estado_ticket])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([id_plataforma])
REFERENCES [dbo].[Plataforma] ([id_plataforma])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([id_protocolo])
REFERENCES [dbo].[Protocolo_Atencion] ([id_protocolo])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([id_servicio])
REFERENCES [dbo].[Catalogo_Servicio] ([id_servicio])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([id_sla])
REFERENCES [dbo].[SLA] ([id_sla])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([id_tecnico])
REFERENCES [dbo].[Tecnico] ([id_tecnico])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
USE [master]
GO
ALTER DATABASE [helpdesk] SET  READ_WRITE 
GO
