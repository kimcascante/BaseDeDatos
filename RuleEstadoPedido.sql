USE [BdPedidos]
GO

/****** Object:  Rule [RgEstadoPedido]    Script Date: 5/7/2021 19:44:12 ******/
CREATE RULE [dbo].[RgEstadoPedido] 
AS
@EstadoPedido in ('E', 'P', 'R');
GO


