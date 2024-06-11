/*CONSULTAS OPTICA*/

/* 1 - Lista el total de compras de un cliente/a */

SELECT cliente.nombre, cliente.apellido1, COUNT(ventas.id) AS total_de_compras FROM cliente LEFT JOIN ventas ON ventas.id_cliente = cliente.id where ventas.id_cliente = 1;

/* 2 - Lista las diferentes garfas que ha vendido un empleado durante un año */

SELECT ventas.id_empleado, ventas.id_garfas, garfas.marca, garfas.tipo_montura FROM ventas LEFT JOIN garfas ON ventas.id_garfas = garfas.id LEFT JOIN periodo ON ventas.id_periodo = periodo.id WHERE ventas.id_empleado = 96 AND YEAR (periodo.fecha_inicial) = '2023';

/* 3 - Lista los diferentes proveedores que han suministrado garfas vendidas con éxito por la óptica */

SELECT provedor.id AS provedor_iD, provedor.nif AS provedor_NIF, garfas.marca, ventas.id AS ventas FROM provedor INNER JOIN garfas ON provedor.id = garfas.id_provedor INNER JOIN ventas ON garfas.id = ventas.id_garfas;

/*CONSULTAS PIZZERIA*/

/* 1 - Lista cuántos productos de tipos “Bebidas” se han vendido en una determinada localidad  */

SELECT tienda.localidad, SUM(pedido.qty_produto) AS total_vendas_bebidas FROM pedido INNER JOIN producto ON pedido.id_produto = producto.id INNER JOIN tienda ON tienda.id = pedido.id_tienda INNER JOIN categoria ON producto.id_categoria = categoria.id WHERE categoria.tipo = 'bebidas' AND tienda.localidad = 'Madrid';

/* 2 - Lista cuántos pedidos ha efectuado un determinado empleado */

SELECT empleado.nombre AS nombre_empleado, COUNT(pedido.id) AS total_pedidos FROM pedido INNER JOIN tienda ON pedido.id_tienda = tienda.id INNER JOIN empleado ON tienda.id = empleado.id_tienda WHERE empleado.id = '201';