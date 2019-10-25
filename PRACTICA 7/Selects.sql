use RestauranteJMG

select * from Cliente where Cliente.vNombreC like '%a%'  order by iIdCliente
select * from Mesero where Mesero.NombreCompleto like '%b%' order by iIdMesa
select * from Restaurante where Restaurante.Ubicacion like '%g%' order by iIdRestaurante
select * from Pedido where Pedido.iIdCliente like 1 order by iIdProducto
select * from Menu where Menu.vNombrePlatillo like '%c%' order by iPrecio
select * from Cliente inner join Mesero on Cliente.iIdCliente=Mesero.iIdMesero
select * from Cliente right join Mesero on Cliente.iIdMesa = Mesero.iIdMesero
select * from Mesa left join Restaurante on Mesa.iIdMesa=Restaurante.iIdRestaurante
select * from Ticket full outer join Menu on Ticket.iIdMesa=Menu.iIdProducto
select * from Mesa cross join Pedido

select COUNT (iIdCliente) as 'Mesas registradas por clientes' from Cliente group by iIdMesa 
select MIN(Fecha) as 'Orden de visitas por fecha' from Ticket group by Fecha
select MAX(iPrecio) as 'Precios del mas barato al mas caro' from Menu group by iPrecio
select COUNT(iIdMesa) as 'Total de mesas por restaurante' from Mesa group by iIdRestaurante
select COUNT(iIdMesero) as 'Meseros por mesa' from Mesero group by iIdMesa
select COUNT(iIdMesero) from Mesero group by iIdMesa having COUNT (iIdMesa)>1
select COUNT(iIdCliente) as 'Compras de los clientes' from Pedido group by iIdCliente having COUNT(*)>5
select COUNT(iIdMesa) from Ticket group by iIdMesa having COUNT(*)>5
select COUNT(iIdRestaurante) from Mesa group by iIdRestaurante having COUNT(*)<10
select COUNT(iIdMenu) from Ticket group by iIdMenu having COUNT(*)>3

select * from Ticket
select * from Mesa
select * from Menu
select * from Cliente
select * from Restaurante
