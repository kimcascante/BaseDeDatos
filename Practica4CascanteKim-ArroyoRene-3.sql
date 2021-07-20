
-------------- Practica 4 ----------------
				
USE [BDExpedienteMedico]	
 

-- ================================================
-- Author: Kimberly Cascante - Rene Arroyo
-- Create date: 17-07-21
-- Description: Funcion que reciba por parámetro una 
-- fecha de nacimiento y retorne la edad de la persona
-- ================================================

--SELECT dbo.feEdad ('1995-09-03')

CREATE FUNCTION dbo.feEdad 
(
	-- Add the parameters for the function here
	@fechaNacimiento date
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Edad int

	-- Add the T-SQL statements to compute the return value here
	SELECT @Edad =  DATEDIFF(YEAR,@fechaNacimiento,Getdate())

	-- Return the result of the function
	RETURN @Edad

END
GO

-- ================================================
-- Author: Kimberly Cascante - Rene Arroyo
-- Create date: 17-07-21
-- Description: Funcion que  reciba por parámetro el
-- IdMedico y retorne los datos de la vista VwMedico
-- ================================================

--SELECT * FROM dbo.ftVistaMedico(1)
CREATE FUNCTION dbo.ftVistaMedico 
(	
	-- Add the parameters for the function here
	@IdMedico int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT    dbo.TMedico.PkMedicoIdMedico
			, dbo.TPersona.NumeroIdentificacion
			, dbo.TPersona.Nombre + ' ' + dbo.TPersona.Apellidos Nombre
			, dbo.TMedico.Titulos
			, dbo.TMedico.CantidadPacientes
			, dbo.TMedico.Estado
	FROM    dbo.TMedico 
			INNER JOIN dbo.TPersona 
					ON dbo.TMedico.idPersona = dbo.TPersona.PkPersonaIdPersona
)
GO


-- ================================================
-- Author: Kimberly Cascante - Rene Arroyo
-- Create date: 17-07-21
-- Description: Funcion que  reciba por parámetro el
-- IdPaciente y retorne los datos de la vista VwPaciente
-- ================================================

--SELECT * FROM dbo.ftVistaPaciente(1)

CREATE FUNCTION dbo.ftVistaPaciente
(	
	@idPaciente int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT  dbo.TPaciente.PkPacienteIdPaciente
			, dbo.TPersona.NumeroIdentificacion
			, dbo.TPersona.Nombre +  ' ' + dbo.TPersona.Apellidos AS Nombre
			, datediff (mm,TPersona.FechaNacimiento, GETDATE())/12 AS Edad
			, Peso=([Peso]/2.2)
			, Estatura=([Estatura]*0.01)
			, dbo.TPaciente.Estado
	FROM    dbo.TPersona 
			INNER JOIN dbo.TPaciente 
			ON dbo.TPersona.PkPersonaIdPersona = dbo.TPaciente.IdPersona
)
GO

-- ================================================
-- Author: Kimberly Cascante - Rene Arroyo
-- Create date: 17-07-21
-- Description: Funcion que  reciba por parámetro el
-- un número de Expediente y retorne: 
--		NombrePaciente
--		Peso
--		Estatura
--		NombreMedico
--		Titulos
-- ================================================

--SELECT * FROM dbo.ftExpedienteMedico(2)

CREATE FUNCTION dbo.ftExpedienteMedico
(
	-- Add the parameters for the function here
	@idExpediente int
)
RETURNS 
@ExpedienteMedico TABLE 
(
	-- Add the column definitions for the TABLE variable here
	Nombre varchar(50),
	Peso tinyint,
	Estatura tinyint,
	Titulos varchar(150)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set

	INSERT INTO @ExpedienteMedico
	SELECT	dbo.TPersona.Nombre, 
			dbo.TPaciente.Peso, 
			dbo.TPaciente.Estatura, 
			dbo.TMedico.Titulos
	FROM    dbo.TMedico 
			INNER JOIN dbo.TPersona 
			ON dbo.TMedico.idPersona = dbo.TPersona.PkPersonaIdPersona 
			INNER JOIN dbo.TPaciente 
			ON dbo.TPersona.PkPersonaIdPersona = dbo.TPaciente.IdPersona
	RETURN 
END
GO