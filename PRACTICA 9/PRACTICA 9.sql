use restauranteJMG

create table VisitasCliente(
iIdCliente int not null foreign key (iIdCliente) references Cliente(iIdCliente),
iNumVisitas int not null
)

CREATE OR ALTER TRIGGER TR_ClienteF on Pedido after INSERT
as 
declare @iIdCl int
select @iIdCl = iIdCLiente from Pedido

declare @VisitasCliente int
select @VisitasCliente = COUNT(iIdCliente) from Pedido where iIdCliente = @iIdCl;
if @VisitasCliente = 1
	insert into VisitasCliente (iIdCliente,iNumVisitas) values (@iIdCl, 1)
else
	update VisitasCliente set iNumVisitas =@VisitasCliente where iIdCliente = @iIdCl
go

select * from VisitasCliente

create procedure
ProCliente(
@iIdCliente int,@iIdMesa int, @vNombreC varchar (30),@vApellidoP varchar(30),@vApellidoM varchar(30))
as
begin
INSERT INTO Cliente(iIdCliente,iIdMesa,vNombreC,vApellidoP,vApellidoM)
values (@iIdCliente,@iIdMesa,@vNombreC,@vApellidoP,@vApellidoM)
END

EXEC ProCliente @iIdCliente= 44, @iIdMesa=12,@vNombreC='Jean', @vApellidoP='Lugo', @vApellidoM='De La Rosa'

create procedure 
ProMesero(
@iIdM int, @vNomM varchar(30), @vApP varchar(30), @vApM varchar (30), @iIdMesa int)
AS BEGIN
INSERT INTO Mesero(iIdMesero,vNombreM,vApellidoPM,vApellidoMM,iIdMesa)
VALUES (@iIdM, @vNomM, @vApP, @vApM, @iIdMesa)
END

CREATE PROCEDURE
ProTicket( 
@iIdT int, @iIdMesa int, @Fecha date, @iIdMenu int)
AS BEGIN
INSERT INTO Ticket(iIdTicket, iIdMesa, Fecha, iIdMenu)
VALUES (@iIdT, @iIdMesa, @Fecha, @iIdMenu)
END

CREATE PROCEDURE
ProMesa(
@iIdMesa int, @iIdRes int, @iNumP int)
AS BEGIN
INSERT INTO Mesa(iIdMesa,iIdRestaurante,iNumPer)
VALUES (@iIdMesa, @iIdRes, @iNumP)
END

create procedure
ProMenu(
@iIdPro int, @vNomPl varchar(50), @vDesc varchar(200),@iPre int)
AS BEGIN
INSERT INTO Menu(iIdProducto,vNombrePlatillo,vDescripcion,iPrecio)
values (@iIdPro,@vNomPl, @vDesc, @iPre)
END

create or alter function BusquedaClientes
(@NombreClientes varchar (40))
returns varchar (40)
as begin
declare @busqueda varchar(40)
set @busqueda =(select iIdCliente from cliente where vNombreC = @NombreClientes)
return @busqueda
end

select dbo.BusquedaClientes ('Jean') as 'Id del Cliente'
