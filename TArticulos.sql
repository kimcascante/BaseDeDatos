USE [BdPedidos]
GO

/****** Object:  Table [dbo].[TArticulos]    Script Date: 5/7/2021 19:37:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TArticulos](
	[NumArticulo] [int] IDENTITY(1,1) NOT NULL,
	[ExistenciaEnBodega] [int] NOT NULL,
	[DescripcionArticulo] [varchar](100) NOT NULL,
	[PrecioArticulo] [decimal](10, 0) NOT NULL,
	[FechaUltimaCompra] [datetime] NOT NULL,
 CONSTRAINT [PK_TArticulos] PRIMARY KEY CLUSTERED 
(
	[NumArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TArticulos] ADD  CONSTRAINT [DF_TArticulos_PrecioArticulo]  DEFAULT ((0)) FOR [PrecioArticulo]
GO

ALTER TABLE [dbo].[TArticulos]  WITH CHECK ADD  CONSTRAINT [CK_TArticulos] CHECK  (([ExistenciaEnBodega]>(20)))
GO

ALTER TABLE [dbo].[TArticulos] CHECK CONSTRAINT [CK_TArticulos]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave primaria de la tabla articulos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TArticulos', @level2type=N'COLUMN',@level2name=N'NumArticulo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla para registro de articulos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TArticulos'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Restriccion para que la existencia en bodega sea mayor a 20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TArticulos', @level2type=N'CONSTRAINT',@level2name=N'CK_TArticulos'
GO


