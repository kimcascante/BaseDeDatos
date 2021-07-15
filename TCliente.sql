USE [BdPedidos]
GO

/****** Object:  Table [dbo].[TCliente]    Script Date: 5/7/2021 19:38:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TCliente](
	[NombreCliente] [varchar](75) NOT NULL,
	[EstadoCivil] [char](1) NOT NULL,
	[TipoCliente] [char](1) NOT NULL,
	[SaldoCliente] [decimal](10, 0) NOT NULL,
	[Exento] [bit] NOT NULL,
	[Descuento] [tinyint] NOT NULL,
	[NumCliente] [varchar](10) NOT NULL,
 CONSTRAINT [PkTClienteNumCliente] PRIMARY KEY CLUSTERED 
(
	[NumCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UkTClienteNombreCliente] UNIQUE NONCLUSTERED 
(
	[NombreCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TCliente] ADD  CONSTRAINT [DF_TCliente_EstadoCivil]  DEFAULT ('S') FOR [EstadoCivil]
GO

ALTER TABLE [dbo].[TCliente] ADD  CONSTRAINT [DF_TCliente_SaldoCliente]  DEFAULT ((0)) FOR [SaldoCliente]
GO

ALTER TABLE [dbo].[TCliente] ADD  CONSTRAINT [DF_TCliente_Exento]  DEFAULT ((0)) FOR [Exento]
GO

ALTER TABLE [dbo].[TCliente]  WITH CHECK ADD  CONSTRAINT [CK_TCliente] CHECK  (([descuento]<(0.15)))
GO

ALTER TABLE [dbo].[TCliente] CHECK CONSTRAINT [CK_TCliente]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave primaria de la tabla cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TCliente', @level2type=N'COLUMN',@level2name=N'NumCliente'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave Primaria de la tabla TCliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TCliente', @level2type=N'CONSTRAINT',@level2name=N'PkTClienteNumCliente'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave unica de la tabla TCliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TCliente', @level2type=N'CONSTRAINT',@level2name=N'UkTClienteNombreCliente'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla para el registro de clientes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TCliente'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Restriccion para indicar que el descuento no puede ser mayor a 15%' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TCliente', @level2type=N'CONSTRAINT',@level2name=N'CK_TCliente'
GO


