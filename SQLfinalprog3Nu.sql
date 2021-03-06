USE [master]
GO
/****** Object:  Database [finalprog3]    Script Date: 08/04/2019 4:10:50 ******/
CREATE DATABASE [finalprog3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'finalprog3', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\finalprog3.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'finalprog3_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\finalprog3_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [finalprog3] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [finalprog3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [finalprog3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [finalprog3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [finalprog3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [finalprog3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [finalprog3] SET ARITHABORT OFF 
GO
ALTER DATABASE [finalprog3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [finalprog3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [finalprog3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [finalprog3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [finalprog3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [finalprog3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [finalprog3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [finalprog3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [finalprog3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [finalprog3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [finalprog3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [finalprog3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [finalprog3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [finalprog3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [finalprog3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [finalprog3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [finalprog3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [finalprog3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [finalprog3] SET  MULTI_USER 
GO
ALTER DATABASE [finalprog3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [finalprog3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [finalprog3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [finalprog3] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [finalprog3] SET DELAYED_DURABILITY = DISABLED 
GO
USE [finalprog3]
GO
/****** Object:  Table [dbo].[Cargos]    Script Date: 08/04/2019 4:10:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cargos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](10) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 08/04/2019 4:10:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departamentos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](10) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Encargado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 08/04/2019 4:10:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](10) NOT NULL,
	[Nombre] [varchar](40) NOT NULL,
	[Apellido] [varchar](40) NOT NULL,
	[Telefono] [varchar](20) NULL,
	[genero] [varchar](10) NULL,
	[Departamento] [int] NULL,
	[Cargo] [int] NULL,
	[FechaIngreso] [date] NOT NULL,
	[Salario] [numeric](12, 2) NOT NULL,
	[estatus] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Licencias]    Script Date: 08/04/2019 4:10:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Licencias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[Desde] [date] NOT NULL,
	[Hasta] [date] NOT NULL,
	[Motivo] [varchar](50) NOT NULL,
	[Comentarios] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nominas]    Script Date: 08/04/2019 4:10:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nominas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Año] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[MontoTotal] [numeric](14, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 08/04/2019 4:10:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permisos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[Desde] [date] NOT NULL,
	[Hasta] [date] NOT NULL,
	[Comentarios] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalidaEmpleados]    Script Date: 08/04/2019 4:10:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalidaEmpleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[TipoSalida] [varchar](15) NOT NULL,
	[Motivo] [varchar](100) NULL,
	[FechaSalida] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vacaciones]    Script Date: 08/04/2019 4:10:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vacaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[Desde] [date] NOT NULL,
	[Hasta] [date] NOT NULL,
	[Año] [int] NOT NULL,
	[Comentarios] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cargos] ON 

INSERT [dbo].[Cargos] ([Id], [Codigo], [Nombre]) VALUES (1, N'JDP', N'Jefe de Departamento')
INSERT [dbo].[Cargos] ([Id], [Codigo], [Nombre]) VALUES (2, N'SV', N'Supervisor')
INSERT [dbo].[Cargos] ([Id], [Codigo], [Nombre]) VALUES (3, N'GE', N'Gerente')
INSERT [dbo].[Cargos] ([Id], [Codigo], [Nombre]) VALUES (4, N'ST', N'Secretario')
INSERT [dbo].[Cargos] ([Id], [Codigo], [Nombre]) VALUES (5, N'E1', N'Empleado Novato')
INSERT [dbo].[Cargos] ([Id], [Codigo], [Nombre]) VALUES (6, N'E2', N'Empleado Experimentado')
SET IDENTITY_INSERT [dbo].[Cargos] OFF
SET IDENTITY_INSERT [dbo].[Departamentos] ON 

INSERT [dbo].[Departamentos] ([id], [Codigo], [Nombre], [Encargado]) VALUES (2, N'RRHH', N'Recursos Humanos', 21)
INSERT [dbo].[Departamentos] ([id], [Codigo], [Nombre], [Encargado]) VALUES (6, N'AC', N'Atención al Cliente', 21)
INSERT [dbo].[Departamentos] ([id], [Codigo], [Nombre], [Encargado]) VALUES (9, N'TI', N'Tecnologia de la información', 21)
INSERT [dbo].[Departamentos] ([id], [Codigo], [Nombre], [Encargado]) VALUES (10, N'CC', N'Contabilidad', 21)
INSERT [dbo].[Departamentos] ([id], [Codigo], [Nombre], [Encargado]) VALUES (11, N'ADM', N'Administracion', 21)
INSERT [dbo].[Departamentos] ([id], [Codigo], [Nombre], [Encargado]) VALUES (12, N'Mm', N'Mantenimiento', 21)
SET IDENTITY_INSERT [dbo].[Departamentos] OFF
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (1, N'DP00', N'Darwin', N'Pere Ramo', NULL, NULL, NULL, NULL, CAST(N'2014-02-12' AS Date), CAST(80000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (4, N'JP00', N'Jorge', N'Pinarello', NULL, NULL, NULL, NULL, CAST(N'2016-12-02' AS Date), CAST(80000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (5, N'DR00', N'Dawich', N'Rodriguez', NULL, NULL, NULL, 1, CAST(N'2018-03-26' AS Date), CAST(80000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (6, N'YM00', N'Yeduin', N'Mateo', NULL, NULL, NULL, 1, CAST(N'2013-05-12' AS Date), CAST(80000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (7, N'PO00', N'Mario', N'Jimenez', N'8095955966', N'Masculino', 3, 5, CAST(N'2019-03-05' AS Date), CAST(25000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (8, N'OF00', N'Odette', N'Ferrer', N'8095569875', N'Femenino', 3, 3, CAST(N'2019-04-01' AS Date), CAST(10000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (9, N'CA00', N'Carlos', N'Aracena', N'809568789', N'Masculino', 3, 2, CAST(N'2019-03-31' AS Date), CAST(20000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (10, N'FM-00', N'Freddy', N'Mercury', N'3057358276', N'Masculino', 3, 5, CAST(N'2019-04-01' AS Date), CAST(50000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (11, N'WD-00', N'Wendy', N'D''Caprio', N'8099874565', N'Masculino', 5, 4, CAST(N'2019-04-01' AS Date), CAST(20000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (12, N'JM-00', N'Juan ', N'Marmolejos', N'8097138114', N'Femenino', 6, 2, CAST(N'2019-04-02' AS Date), CAST(30000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (13, N'ES-00', N'Elvis', N'Suazo', N'8095659874', N'Masculino', 4, 1, CAST(N'2019-04-03' AS Date), CAST(60000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (14, N'JG-00', N'Jose', N'guillermo', N'8094123698', N'Masculino', 3, 1, CAST(N'2019-04-12' AS Date), CAST(50000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (15, N'YR-00', N'Yoseiris', N'Ramos', N'8099631230', N'Femenino', 3, 4, CAST(N'2019-04-05' AS Date), CAST(300000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (16, N'PA-00', N'Paola', N'Arias', N'8295478746', N'Femenino', 4, 2, CAST(N'2019-04-06' AS Date), CAST(20000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (17, N'JC-00', N'Jaham', N'Cruz', N'8099517532', N'Masculino', 3, 2, CAST(N'2019-04-03' AS Date), CAST(45000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (18, N'JE-00', N'Julio', N'Encarnacion', N'3057358276', N'Masculino', 6, 6, CAST(N'2019-04-04' AS Date), CAST(15000.00 AS Numeric(12, 2)), N'Activo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (19, N'DR-00', N'Daniel', N'Rodriguez', N'8092581234', N'Masculino', 2, 1, CAST(N'2019-04-03' AS Date), CAST(100.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (20, N'LM-00', N'Luis', N'Mejia', N'8094567894', N'Masculino', 4, 5, CAST(N'2019-04-03' AS Date), CAST(30000.00 AS Numeric(12, 2)), N'Inactivo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (21, N'DR-02', N'Dawich', N'Rodriguez', N'3057358276', N'Masculino', 2, 5, CAST(N'2019-04-05' AS Date), CAST(30000.00 AS Numeric(12, 2)), N'Activo')
INSERT [dbo].[Empleados] ([Id], [Codigo], [Nombre], [Apellido], [Telefono], [genero], [Departamento], [Cargo], [FechaIngreso], [Salario], [estatus]) VALUES (22, N'OF-00', N'Odette', N'Ferrer', N'8298569019', N'Femenino', 6, 2, CAST(N'2019-04-08' AS Date), CAST(5000.00 AS Numeric(12, 2)), N'Activo')
SET IDENTITY_INSERT [dbo].[Empleados] OFF
SET IDENTITY_INSERT [dbo].[Licencias] ON 

INSERT [dbo].[Licencias] ([Id], [IdEmpleado], [Desde], [Hasta], [Motivo], [Comentarios]) VALUES (1, 10, CAST(N'2019-04-04' AS Date), CAST(N'2019-04-04' AS Date), N'Salir de parranda', N'Tu sabe')
INSERT [dbo].[Licencias] ([Id], [IdEmpleado], [Desde], [Hasta], [Motivo], [Comentarios]) VALUES (2, 18, CAST(N'2019-04-12' AS Date), CAST(N'2019-04-05' AS Date), N'Perro enfermo', N'Mano :v')
INSERT [dbo].[Licencias] ([Id], [IdEmpleado], [Desde], [Hasta], [Motivo], [Comentarios]) VALUES (3, 18, CAST(N'2019-04-11' AS Date), CAST(N'2019-04-12' AS Date), N'ASDSAD', N'Dale rapido y sin presion')
INSERT [dbo].[Licencias] ([Id], [IdEmpleado], [Desde], [Hasta], [Motivo], [Comentarios]) VALUES (4, 18, CAST(N'2019-04-11' AS Date), CAST(N'2019-04-12' AS Date), N'ASDSAD', N'Dale rapido y sin presion')
SET IDENTITY_INSERT [dbo].[Licencias] OFF
SET IDENTITY_INSERT [dbo].[Nominas] ON 

INSERT [dbo].[Nominas] ([id], [Año], [Mes], [MontoTotal]) VALUES (1, 2019, 1, CAST(450000.00 AS Numeric(14, 2)))
INSERT [dbo].[Nominas] ([id], [Año], [Mes], [MontoTotal]) VALUES (2, 2020, 8, CAST(450000.00 AS Numeric(14, 2)))
INSERT [dbo].[Nominas] ([id], [Año], [Mes], [MontoTotal]) VALUES (3, 2019, 11, CAST(450000.00 AS Numeric(14, 2)))
INSERT [dbo].[Nominas] ([id], [Año], [Mes], [MontoTotal]) VALUES (4, 2019, 4, CAST(150000.00 AS Numeric(14, 2)))
INSERT [dbo].[Nominas] ([id], [Año], [Mes], [MontoTotal]) VALUES (5, 2021, 7, CAST(150000.00 AS Numeric(14, 2)))
INSERT [dbo].[Nominas] ([id], [Año], [Mes], [MontoTotal]) VALUES (6, 2029, 11, CAST(150000.00 AS Numeric(14, 2)))
INSERT [dbo].[Nominas] ([id], [Año], [Mes], [MontoTotal]) VALUES (7, 2030, 10, CAST(110100.00 AS Numeric(14, 2)))
INSERT [dbo].[Nominas] ([id], [Año], [Mes], [MontoTotal]) VALUES (8, 2019, 1, CAST(60000.00 AS Numeric(14, 2)))
INSERT [dbo].[Nominas] ([id], [Año], [Mes], [MontoTotal]) VALUES (9, 2025, 1, CAST(0.00 AS Numeric(14, 2)))
INSERT [dbo].[Nominas] ([id], [Año], [Mes], [MontoTotal]) VALUES (10, 2025, 1, CAST(50000.00 AS Numeric(14, 2)))
SET IDENTITY_INSERT [dbo].[Nominas] OFF
SET IDENTITY_INSERT [dbo].[Permisos] ON 

INSERT [dbo].[Permisos] ([Id], [IdEmpleado], [Desde], [Hasta], [Comentarios]) VALUES (1, 10, CAST(N'2019-04-05' AS Date), CAST(N'2019-04-06' AS Date), N'Hola')
INSERT [dbo].[Permisos] ([Id], [IdEmpleado], [Desde], [Hasta], [Comentarios]) VALUES (2, 10, CAST(N'2019-04-02' AS Date), CAST(N'2019-04-05' AS Date), N'Hola')
INSERT [dbo].[Permisos] ([Id], [IdEmpleado], [Desde], [Hasta], [Comentarios]) VALUES (3, 11, CAST(N'2019-04-02' AS Date), CAST(N'2019-04-05' AS Date), N'dsakhfsjdkhgfkjdshg')
INSERT [dbo].[Permisos] ([Id], [IdEmpleado], [Desde], [Hasta], [Comentarios]) VALUES (4, 11, CAST(N'2019-04-02' AS Date), CAST(N'2019-04-05' AS Date), N'Megusta')
INSERT [dbo].[Permisos] ([Id], [IdEmpleado], [Desde], [Hasta], [Comentarios]) VALUES (5, 10, CAST(N'2019-04-02' AS Date), CAST(N'2019-04-06' AS Date), N'Hasta me dio risa')
INSERT [dbo].[Permisos] ([Id], [IdEmpleado], [Desde], [Hasta], [Comentarios]) VALUES (6, 12, CAST(N'2019-04-02' AS Date), CAST(N'2019-04-06' AS Date), N'Hasta me dio risa')
INSERT [dbo].[Permisos] ([Id], [IdEmpleado], [Desde], [Hasta], [Comentarios]) VALUES (7, 13, CAST(N'2019-04-02' AS Date), CAST(N'2019-04-06' AS Date), N'Hasta me dio risa')
INSERT [dbo].[Permisos] ([Id], [IdEmpleado], [Desde], [Hasta], [Comentarios]) VALUES (8, 18, CAST(N'2019-04-05' AS Date), CAST(N'2019-04-06' AS Date), N'Dale rapido y sin presion')
SET IDENTITY_INSERT [dbo].[Permisos] OFF
SET IDENTITY_INSERT [dbo].[SalidaEmpleados] ON 

INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (1, 1, N'Renuncia', N'ASDSAD', CAST(N'2014-02-12' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (2, 4, N'Renuncia', N'Se porto mal', CAST(N'2019-03-27' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (3, 7, N'Renuncia', N'Se quejo con el jefe y se fue por palomo', CAST(N'2019-03-31' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (4, 6, N'Renuncia', N'Se quejo con el jefe y se fue por palomo', CAST(N'2019-03-31' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (5, 7, N'Renuncia', N'ASDSAD', CAST(N'2019-04-01' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (6, 8, N'Despido', N'Por mmg xd ', CAST(N'2019-04-02' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (7, 9, N'Desahucio', N'El e vacano', CAST(N'2019-04-18' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (8, 9, N'Despido', N'Se porto mal', CAST(N'2019-04-06' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (9, 15, N'Despido', N'Se porto mal', CAST(N'2019-04-06' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (10, 15, N'Renuncia', N'Se porto mal', CAST(N'2019-04-05' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (11, 16, N'Renuncia', N'ASDSAD', CAST(N'2019-04-13' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (12, 13, N'Desahucio', N'ASDSAD', CAST(N'2019-04-13' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (13, 15, N'Despido', N'TU SABE', CAST(N'2019-04-04' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (14, 12, N'Desahucio', N'Por alguna razon se murio ', CAST(N'2019-04-11' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (15, 14, N'Renuncia', N'ASDSAD', CAST(N'2019-04-06' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (16, 10, N'Renuncia', N'ASDSAD', CAST(N'2019-04-06' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (17, 19, N'Desahucio', N'ASDSAD', CAST(N'2019-04-05' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (18, 11, N'Renuncia', N'Se porto mal', CAST(N'2019-04-03' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (19, 20, N'Desahucio', N'Jueputa', CAST(N'2019-04-05' AS Date))
INSERT [dbo].[SalidaEmpleados] ([Id], [IdEmpleado], [TipoSalida], [Motivo], [FechaSalida]) VALUES (20, 17, N'Desahucio', N'Se puso loco', CAST(N'2019-04-08' AS Date))
SET IDENTITY_INSERT [dbo].[SalidaEmpleados] OFF
SET IDENTITY_INSERT [dbo].[Vacaciones] ON 

INSERT [dbo].[Vacaciones] ([Id], [IdEmpleado], [Desde], [Hasta], [Año], [Comentarios]) VALUES (1, 10, CAST(N'2019-04-06' AS Date), CAST(N'2019-04-20' AS Date), 2020, N'Usted es ciego')
INSERT [dbo].[Vacaciones] ([Id], [IdEmpleado], [Desde], [Hasta], [Año], [Comentarios]) VALUES (2, 13, CAST(N'2019-04-06' AS Date), CAST(N'2019-04-13' AS Date), 2019, N'Hola')
INSERT [dbo].[Vacaciones] ([Id], [IdEmpleado], [Desde], [Hasta], [Año], [Comentarios]) VALUES (3, 18, CAST(N'2019-04-06' AS Date), CAST(N'2019-04-20' AS Date), 2019, N'Men cuidate por ahi')
SET IDENTITY_INSERT [dbo].[Vacaciones] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Cargos__06370DAC589B7C64]    Script Date: 08/04/2019 4:10:51 ******/
ALTER TABLE [dbo].[Cargos] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Cargos__06370DACB5A51BBA]    Script Date: 08/04/2019 4:10:51 ******/
ALTER TABLE [dbo].[Cargos] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Departam__06370DAC070B505E]    Script Date: 08/04/2019 4:10:51 ******/
ALTER TABLE [dbo].[Departamentos] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Departam__06370DAC3776A282]    Script Date: 08/04/2019 4:10:51 ******/
ALTER TABLE [dbo].[Departamentos] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Empleado__06370DAC1C73B2CF]    Script Date: 08/04/2019 4:10:51 ******/
ALTER TABLE [dbo].[Empleados] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Empleado__06370DAC7F54EE6E]    Script Date: 08/04/2019 4:10:51 ******/
ALTER TABLE [dbo].[Empleados] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Departamentos]  WITH CHECK ADD FOREIGN KEY([Encargado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[Departamentos]  WITH CHECK ADD FOREIGN KEY([Encargado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([Cargo])
REFERENCES [dbo].[Cargos] ([Id])
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([Cargo])
REFERENCES [dbo].[Cargos] ([Id])
GO
ALTER TABLE [dbo].[Licencias]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[Licencias]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[SalidaEmpleados]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[SalidaEmpleados]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[Vacaciones]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[Vacaciones]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [estatus_c] CHECK  (([estatus]='Activo' OR [estatus]='Inactivo'))
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [estatus_c]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [genero_c] CHECK  (([genero]='Masculino' OR [genero]='Femenino'))
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [genero_c]
GO
ALTER TABLE [dbo].[SalidaEmpleados]  WITH CHECK ADD  CONSTRAINT [TipoSalida_c] CHECK  (([TipoSalida]='Renuncia' OR [TipoSalida]='Despido' OR [TipoSalida]='Desahucio'))
GO
ALTER TABLE [dbo].[SalidaEmpleados] CHECK CONSTRAINT [TipoSalida_c]
GO
USE [master]
GO
ALTER DATABASE [finalprog3] SET  READ_WRITE 
GO
