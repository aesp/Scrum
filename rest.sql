USE [Restaurant]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 28/04/2017 12:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pedido](
	[PedidoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Celular] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[PedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Plato]    Script Date: 28/04/2017 12:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plato](
	[PlatoId] [int] IDENTITY(1,1) NOT NULL,
	[TipoPlatoId] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Precio] [float] NOT NULL,
	[Visible] [bit] NOT NULL,
 CONSTRAINT [PK_Plato] PRIMARY KEY CLUSTERED 
(
	[PlatoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Plato_Pedido]    Script Date: 28/04/2017 12:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plato_Pedido](
	[PlatoPedidoId] [int] IDENTITY(1,1) NOT NULL,
	[PlatoId] [int] NOT NULL,
	[PedidoId] [int] NOT NULL,
	[Cantidad] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Plato_Pedido] PRIMARY KEY CLUSTERED 
(
	[PlatoPedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoPlato]    Script Date: 28/04/2017 12:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoPlato](
	[TipoPlatoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_TipoPlato] PRIMARY KEY CLUSTERED 
(
	[TipoPlatoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Plato]  WITH CHECK ADD  CONSTRAINT [FK_Plato_TipoPlato] FOREIGN KEY([TipoPlatoId])
REFERENCES [dbo].[TipoPlato] ([TipoPlatoId])
GO
ALTER TABLE [dbo].[Plato] CHECK CONSTRAINT [FK_Plato_TipoPlato]
GO
ALTER TABLE [dbo].[Plato_Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Plato_Pedido_Pedido] FOREIGN KEY([PedidoId])
REFERENCES [dbo].[Pedido] ([PedidoId])
GO
ALTER TABLE [dbo].[Plato_Pedido] CHECK CONSTRAINT [FK_Plato_Pedido_Pedido]
GO
ALTER TABLE [dbo].[Plato_Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Plato_Pedido_Plato] FOREIGN KEY([PlatoId])
REFERENCES [dbo].[Plato] ([PlatoId])
GO
ALTER TABLE [dbo].[Plato_Pedido] CHECK CONSTRAINT [FK_Plato_Pedido_Plato]
GO
