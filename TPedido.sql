USE [BdPedidos]
GO

/****** Object:  Table [dbo].[TPedido]    Script Date: 5/7/2021 19:40:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TPedido](
	[NumPedido] [int] IDENTITY(1,1) NOT NULL,
	[NumCliente] [varchar](10) NOT NULL,
	[DireccionEnvio] [varchar](10) NOT NULL,
	[EstadoPedido] [char](1) NOT NULL,
	[FechaPedido] [datetime] NOT NULL,
 CONSTRAINT [PK_TPedido] PRIMARY KEY CLUSTERED 
(
	[NumPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TPedido] ADD  CONSTRAINT [DF_TPedido_FechaPedido]  DEFAULT (getdate()) FOR [FechaPedido]
GO

ALTER TABLE [dbo].[TPedido]  WITH CHECK ADD  CONSTRAINT [FK_TPedido_TCliente] FOREIGN KEY([NumCliente])
REFERENCES [dbo].[TCliente] ([NumCliente])
GO

ALTER TABLE [dbo].[TPedido] CHECK CONSTRAINT [FK_TPedido_TCliente]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave primaria de la tabla pedido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TPedido', @level2type=N'COLUMN',@level2name=N'NumPedido'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla para el registro de pedido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TPedido'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre cliente y pedido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TPedido', @level2type=N'CONSTRAINT',@level2name=N'FK_TPedido_TCliente'
GO


