USE [BdPedidos]
GO

/****** Object:  Rule [RgTipoCliente]    Script Date: 5/7/2021 19:44:36 ******/
CREATE RULE [dbo].[RgTipoCliente] 
AS
@TipoCliente in ('A', 'C', 'C');
GO


