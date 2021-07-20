use [Empresa]
go

create function FeFechaIngreso (@idEmpleado varchar(10))
returns date 
as
begin 
declare @fechaIngreso date
select @fechaIngreso= fechaIngreso from TEmpleado
where idEmpleado=@idEmpleado
return @fechaIngreso
end
go

create function FTEmpleadosDepartamento (@idDepto int)
returns Table
As 
return (Select TEmpleado.idEmpleado,TEmpleado.nombreEmpleado, TEmpleado.apellidosEmpleado, TEmpleado.salarioEmpleado, TEmpleado.sexoEmpleado 
from TEmpleado 
where TEmpleado.idDepto=@idDepto 
group by TEmpleado.idEmpleado)
go

create function FTProyectosEmpleado (@idEmpleado varchar (10))
returns @tablaProyectos Table (
idProyecto int Primary Key Not Null Identity,
nombreProyecto varchar (255) Not null, 
horasTrabajadas float not null
)
as
begin 
insert @tablaProyectos select horasTrabajadas, idProyecto from THoras where idEmpleado=@idEmpleado
insert @tablaProyectos select nombreProyecto from TProyecto where idProyecto= idProyecto
return 
end