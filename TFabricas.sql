USE [BdPedidos]
GO

/****** Object:  Table [dbo].[TFabricas]    Script Date: 5/7/2021 19:39:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TFabricas](
	[NumFabrica] [int] IDENTITY(1,1) NOT NULL,
	[NombreFabrica] [varchar](10) NOT NULL,
	[NombreContacto] [varchar](75) NOT NULL,
 CONSTRAINT [PK_TFabricas] PRIMARY KEY CLUSTERED 
(
	[NumFabrica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave primaria de la tabla fabricas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TFabricas', @level2type=N'COLUMN',@level2name=N'NumFabrica'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla para registro de fabricas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TFabricas'
GO


