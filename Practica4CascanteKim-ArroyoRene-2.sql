USE [BDExpedienteMedico]

INSERT INTO [TPersona] (TipoIdentificacion,NumeroIdentificacion,Nombre,Apellidos,Sexo,FechaNacimiento)
VALUES ('C','102590458','ELENA','CASTRO GONZALES','F','1975/04/12'),
('C','602220333','CARLOS','ROJAS MORALES','M','1970/08/11'),
('P','1-2254-9888','HERIBERTO','MATARRITA PEREZ','M','1984/07/03'),
('C','702450855','PATRICIA','ARIAS HERNANDEZ','F','1980/01/01'),
('C','409981235','JOSE ALBERTO','PEREZ LOBO','M','1987/12/25')

INSERT INTO [TMedico] (idPersona,Titulos,CantidadPacientes,Estado)
VALUES (1,'PEDIATRA',0,1),
(4,'OBSTRETICIA',0,1)

INSERT INTO [TPaciente] (IdPersona,Peso,Estatura,Estado)
VALUES (2,120,170,1),
(3,100,165,1),
(5,190,166,1)


UPDATE TPersona 
SET NumeroIdentificacion ='122549888'
WHERE PkPersonaIdPersona=3

UPDATE TPersona 
SET FechaNacimiento ='1981/05/01'
WHERE PkPersonaIdPersona=4

UPDATE TMedico 
SET Titulos ='ONCOLOGO'
WHERE PkMedicoIdMedico=2

UPDATE TPaciente 
SET Peso =120
WHERE PkPacienteIdPaciente=2

UPDATE TPaciente 
SET Peso =168
WHERE PkPacienteIdPaciente=3

DELETE FROM TPaciente
WHERE IdPersona=5

DELETE FROM TPersona
WHERE PkPersonaIdPersona=5

DELETE FROM TMedico
WHERE idPersona=1

DELETE FROM TPersona
WHERE PkPersonaIdPersona=1

GO

SELECT [PkMedicoIdMedico], [Apellidos] + ' ' + [Nombre] Medico, [Titulos], [CantidadPacientes], [Estado]
  FROM [BDExpedienteMedico].[dbo].TMedico, BDExpedienteMedico.dbo.TPersona 

SELECT [PkPacienteIdPaciente], [Apellidos] + ' ' + [Nombre] Paciente, Peso=([Peso]/2.2), Estatura=([Estatura]*0.01), [Estado]
FROM [BDExpedienteMedico].[dbo].TPaciente, [BDExpedienteMedico].dbo.TPersona

CREATE VIEW [dbo].[VwPersona]
AS
SELECT        PkPersonaIdPersona
			, TipoIdentificacion
			, NumeroIdentificacion
			, Nombre + ' ' + Apellidos AS Nombre
			, Sexo
			, FechaNacimiento
			, datediff (mm,TPersona.FechaNacimiento, GETDATE())/12 AS Edad
FROM        BDExpedienteMedico.dbo.TPersona


CREATE VIEW [dbo].[VwPaciente]
AS
SELECT        dbo.TPaciente.PkPacienteIdPaciente
			, dbo.TPersona.NumeroIdentificacion
			, dbo.TPersona.Nombre + ' ' + dbo.TPersona.Apellidos AS Nombre
			, datediff (mm,TPersona.FechaNacimiento, GETDATE())/12 AS Edad
			, Peso=([Peso]/2.2)
			, Estatura=([Estatura]*0.01)
			, dbo.TPaciente.Estado
FROM        dbo.TPersona 
				INNER JOIN dbo.TPaciente 
						ON dbo.TPersona.PkPersonaIdPersona = dbo.TPaciente.IdPersona

CREATE VIEW [dbo].[VwMedico]
AS
SELECT        dbo.TMedico.PkMedicoIdMedico
			, dbo.TPersona.NumeroIdentificacion
			, dbo.TPersona.Nombre + ' ' + dbo.TPersona.Apellidos Nombre
			, dbo.TMedico.Titulos
			, dbo.TMedico.CantidadPacientes
			, dbo.TMedico.Estado
FROM          dbo.TMedico 
					INNER JOIN dbo.TPersona 
							ON dbo.TMedico.idPersona = dbo.TPersona.PkPersonaIdPersona

