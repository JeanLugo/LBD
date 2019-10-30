use RestauranteJMG

								/**		VISTAS	 **/
create view vw_Cliente as
select vNombreC,iIdCliente from Cliente

create view vw_Mesero as
select iIdMesero,vNombreM,iIdMesa from Mesero

create view vw_Ticket as
select iIdTicket,Fecha from Ticket

create view vw_Mesa as
select iIdMesa,iIdRestaurante from Mesa

create view vw_Menu as
select vNombrePlatillo,vDescripcion,iPrecio from Menu

								/**		SUBCONSULTAS	**/

/** WITH **/
with MeseroMesa as
(select count(iIdMesa) as MM
from Mesero group by iIdMesa)
select * from MeseroMesa
where MeseroMesa.MM >3

/** NORMAL **/
select iIdMesero 
from Mesero 
where iIdMesa > (select AVG(iIdMesa)  from Mesero)

/** JOIN **/
select iIdCliente, iIdMesero 
from Cliente inner join Mesero 
on Cliente.iIdCliente=Mesero.iIdMesero
where exists(select iIdMesero from Mesero where (iIdMesa)>6)
