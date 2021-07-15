USE [BdPedidos]
GO

/****** Object:  Rule [RgEstadoCivil]    Script Date: 5/7/2021 19:43:40 ******/
CREATE RULE [dbo].[RgEstadoCivil] 
AS
@EstadoCivil in ('C', 'S', 'D', 'V', 'U');
GO


