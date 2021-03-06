USE [TurneroDef]
GO
/****** Object:  Table [dbo].[Especialidades]    Script Date: 03/06/2020 17:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidades](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Especialidades] PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 03/06/2020 17:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[legajo] [int] IDENTITY(1,1) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idEspecilidad] [int] NOT NULL,
 CONSTRAINT [PK_Medicoss] PRIMARY KEY CLUSTERED 
(
	[legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasSociales]    Script Date: 03/06/2020 17:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasSociales](
	[idObraSocial] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](25) NOT NULL,
 CONSTRAINT [PK_ObrasSociales] PRIMARY KEY CLUSTERED 
(
	[idObraSocial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 03/06/2020 17:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[dni] [varchar](20) NOT NULL,
	[nroHistoriaClinica] [int] IDENTITY(1,1) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fechaNac] [date] NOT NULL,
	[obraSocial] [int] NULL,
	[telefono] [varchar](20) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[HistoriaClinica] [text] NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Practicas]    Script Date: 03/06/2020 17:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practicas](
	[idPractica] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[costo] [int] NOT NULL,
 CONSTRAINT [PK_Practicas] PRIMARY KEY CLUSTERED 
(
	[idPractica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 03/06/2020 17:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turnos]    Script Date: 03/06/2020 17:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turnos](
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[medico] [int] NOT NULL,
	[idEspecialidad] [int] NULL,
	[paciente] [varchar](20) NULL,
	[idPractica] [int] NULL,
	[obraSocial] [int] NOT NULL,
	[confirmado] [bit]  NULL,
	[atendido] [bit]  NULL,
 CONSTRAINT [PK_Turnos] PRIMARY KEY CLUSTERED 
(
	[fecha] ASC,
	[hora] ASC,
	[medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 03/06/2020 17:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[usuario] [varchar](16) NOT NULL,
	[contraseña] [varchar](16) NOT NULL,
	[idRol] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarioss] PRIMARY KEY CLUSTERED 
(
	[usuario] ASC,
	[contraseña] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Especialidades] FOREIGN KEY([idEspecilidad])
REFERENCES [dbo].[Especialidades] ([idEspecialidad])
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Especialidades]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Pacientes_ObrasSociales] FOREIGN KEY([obraSocial])
REFERENCES [dbo].[ObrasSociales] ([idObraSocial])
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [FK_Pacientes_ObrasSociales]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_Especialidades] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[Especialidades] ([idEspecialidad])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_Turnos_Especialidades]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_Medicos] FOREIGN KEY([medico])
REFERENCES [dbo].[Medicos] ([legajo])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_Turnos_Medicos]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_ObrasSociales] FOREIGN KEY([obraSocial])
REFERENCES [dbo].[ObrasSociales] ([idObraSocial])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_Turnos_ObrasSociales]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_Pacientes] FOREIGN KEY([paciente])
REFERENCES [dbo].[Pacientes] ([dni])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_Turnos_Pacientes]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_Practicas] FOREIGN KEY([idPractica])
REFERENCES [dbo].[Practicas] ([idPractica])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_Turnos_Practicas]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarioss_Roles] FOREIGN KEY([idRol])
REFERENCES [dbo].[Roles] ([idRol])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarioss_Roles]
GO
