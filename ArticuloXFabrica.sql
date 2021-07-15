USE [BdPedidos]
GO

/****** Object:  Table [dbo].[ArticuloXFabrica]    Script Date: 5/7/2021 19:36:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ArticuloXFabrica](
	[NumArticulo] [int] NOT NULL,
	[NumFabrica] [int] IDENTITY(1,1) NOT NULL,
	[PrecioFabrica] [decimal](10, 0) NOT NULL,
 CONSTRAINT [PK_ArticuloXFabrica] PRIMARY KEY CLUSTERED 
(
	[NumArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ArticuloXFabrica] ADD  CONSTRAINT [DF_ArticuloXFabrica_PrecioFabrica]  DEFAULT ((0)) FOR [PrecioFabrica]
GO

ALTER TABLE [dbo].[ArticuloXFabrica]  WITH CHECK ADD  CONSTRAINT [FK_ArticuloXFabrica_TArticulos] FOREIGN KEY([NumArticulo])
REFERENCES [dbo].[TArticulos] ([NumArticulo])
GO

ALTER TABLE [dbo].[ArticuloXFabrica] CHECK CONSTRAINT [FK_ArticuloXFabrica_TArticulos]
GO

ALTER TABLE [dbo].[ArticuloXFabrica]  WITH CHECK ADD  CONSTRAINT [FK_ArticuloXFabrica_TFabricas] FOREIGN KEY([NumFabrica])
REFERENCES [dbo].[TFabricas] ([NumFabrica])
GO

ALTER TABLE [dbo].[ArticuloXFabrica] CHECK CONSTRAINT [FK_ArticuloXFabrica_TFabricas]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave primaria de la tabla articuloxfabrica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticuloXFabrica', @level2type=N'COLUMN',@level2name=N'NumArticulo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla registro de articulos de fabrica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticuloXFabrica'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre Articulo Fabrica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticuloXFabrica', @level2type=N'CONSTRAINT',@level2name=N'FK_ArticuloXFabrica_TArticulos'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre Articulo Fabrica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticuloXFabrica', @level2type=N'CONSTRAINT',@level2name=N'FK_ArticuloXFabrica_TFabricas'
GO


