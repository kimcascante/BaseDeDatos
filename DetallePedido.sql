USE [BdPedidos]
GO

/****** Object:  Table [dbo].[DetallePedido]    Script Date: 5/7/2021 19:37:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DetallePedido](
	[NumPedido] [int] IDENTITY(1,1) NOT NULL,
	[NumArticulo] [int] NOT NULL,
	[CantidadPedida] [int] NOT NULL,
	[SubtotalPedido] [decimal](10, 0) NOT NULL,
 CONSTRAINT [PK_DetallePedido] PRIMARY KEY CLUSTERED 
(
	[NumPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DetallePedido] ADD  CONSTRAINT [DF_DetallePedido_SubtotalPedido]  DEFAULT ((0)) FOR [SubtotalPedido]
GO

ALTER TABLE [dbo].[DetallePedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallePedido_TArticulos] FOREIGN KEY([NumArticulo])
REFERENCES [dbo].[TArticulos] ([NumArticulo])
GO

ALTER TABLE [dbo].[DetallePedido] CHECK CONSTRAINT [FK_DetallePedido_TArticulos]
GO

ALTER TABLE [dbo].[DetallePedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallePedido_TPedido] FOREIGN KEY([NumPedido])
REFERENCES [dbo].[TPedido] ([NumPedido])
GO

ALTER TABLE [dbo].[DetallePedido] CHECK CONSTRAINT [FK_DetallePedido_TPedido]
GO

ALTER TABLE [dbo].[DetallePedido]  WITH CHECK ADD  CONSTRAINT [CK_DetallePedido] CHECK  (([cantidadpedida]>(0)))
GO

ALTER TABLE [dbo].[DetallePedido] CHECK CONSTRAINT [CK_DetallePedido]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave primaria de la tabla detalle pedido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetallePedido', @level2type=N'COLUMN',@level2name=N'NumPedido'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla para el detalle de los pedidos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetallePedido'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre articulos y detalle del pedido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetallePedido', @level2type=N'CONSTRAINT',@level2name=N'FK_DetallePedido_TArticulos'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre pedido y el detalle de pedido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetallePedido', @level2type=N'CONSTRAINT',@level2name=N'FK_DetallePedido_TPedido'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Restriccion para que cantidad pedida sea mayor a 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetallePedido', @level2type=N'CONSTRAINT',@level2name=N'CK_DetallePedido'
GO


