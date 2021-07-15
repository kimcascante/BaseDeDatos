USE [BdPedidos]
GO

/****** Object:  Table [dbo].[TDireccion]    Script Date: 5/7/2021 19:38:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TDireccion](
	[IdDireccion] [varchar](10) NOT NULL,
	[NumCliente] [varchar](10) NOT NULL,
	[Provincia] [varchar](1) NOT NULL,
	[Avenida] [varchar](5) NOT NULL,
	[Calle] [varchar](5) NOT NULL,
 CONSTRAINT [PK_TDireccion] PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TDireccion]  WITH CHECK ADD  CONSTRAINT [FK_TDireccion_TCliente] FOREIGN KEY([NumCliente])
REFERENCES [dbo].[TCliente] ([NumCliente])
GO

ALTER TABLE [dbo].[TDireccion] CHECK CONSTRAINT [FK_TDireccion_TCliente]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave primaria de la tabla direcciones' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TDireccion', @level2type=N'COLUMN',@level2name=N'IdDireccion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla para el regitro de direcciones' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TDireccion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre cliente y direccion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TDireccion', @level2type=N'CONSTRAINT',@level2name=N'FK_TDireccion_TCliente'
GO


