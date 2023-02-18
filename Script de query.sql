

--Se obtienen todos los usuarios con una edad entre 20 y 60 y con una i entre su nombre y se muestra su nombre real, relacionado con su username y su edad
select p.nombre, u.username, p.edad from "Usuario" u
right join persona p on p.idpersona = u.idusuario
where p.edad between 20 and 60 and (p.nombre like '%i%' or p.nombre like '%I%') order by p.edad asc;

--Se muestran todos los usuarios que han realizado ventas y el total de cada venta hecha.
select p.nombre, u.username, p.edad, v.idventa, v.total from venta v
right join persona p on p.idpersona = v.idcliente
right join "Usuario" u on u.idusuario = v.idusuario
where p.edad between 18 and 80 and (p.nombre like '%e%' or p.nombre like '%E%') order by v.total asc;

--Se muestra el total de dinero que se ha recogido en todas las ventas hechas por cada persona
select p.idpersona, p.nombre, sum(v.total) as TotalVentas from venta v, persona p
where v.idusuario = p.idpersona group by p.idpersona order by p.idpersona asc;


--Muestra las unidades vendidas de cada tipo de articulo
select a.idarticulo, a.nombre, sum(dv.cantidad) as UnidadesVendidas from articulo a, detalle_venta dv
where dv.idarticulo = a.idarticulo  group by a.idarticulo order by a.idarticulo asc;


--Muestras los usuarios que han ganado más de 7000 con el total de sus ventas
select p.nombre, u.username, p.edad, v.idventa, v.total from venta v
right join persona p on p.idpersona = v.idcliente
right join "Usuario" u on u.idusuario = v.idusuario
where v.total > 7000 order by v.total desc;
