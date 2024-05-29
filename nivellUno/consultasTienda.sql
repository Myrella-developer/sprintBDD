DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

SELECT nombre FROM producto;
SELECT nombre, precio FROM producto ORDER BY precio;
SELECT nombre, precio, precio *1.1 FROM producto;
SELECT nombre AS nombre_de_producto, precio AS euros, precio *1.1 AS dolares FROM producto;
SELECT UPPER (nombre), precio FROM producto;
SELECT LOWER (nombre), precio FROM producto;
SELECT nombre, UPPER(substring(nombre, 1, 2)) FROM fabricante;
SELECT nombre, ROUND(precio) AS precio_redondo FROM producto;
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM tienda.fabricante limit 5;
SELECT * FROM tienda.fabricante limit 3,2;
SELECT nombre, precio FROM tienda.producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM tienda.producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM tienda.producto WHERE codigo_fabricante = 2;
SELECT producto.nombre AS nombre_p, producto.precio AS precio_p, fabricante.nombre AS nombre_fab FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;
SELECT producto.codigo AS codigo_p, producto.nombre AS nombre_p, producto.codigo_fabricante AS codigo_fab, fabricante.nombre AS nombre_fab FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre AS nombre_p, producto.precio AS precio_p, producto.codigo_fabricante AS codigo_fab, fabricante.nombre AS nombre_fab FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio ASC LIMIT 1;
SELECT producto.nombre AS nombre_p, producto.precio AS precio_p, producto.codigo_fabricante AS codigo_fab, fabricante.nombre AS nombre_fab FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC LIMIT 1;
SELECT producto.nombre AS nombre_p, fabricante.nombre AS nombre_fab FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo'; 
SELECT producto.nombre AS nombre_p, producto.precio AS precio_p, fabricante.nombre AS nombre_fab FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;
SELECT producto.nombre AS nombre_p, producto.precio AS precio_p, fabricante.nombre AS nombre_fab FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';
SELECT producto.nombre AS nombre_p, producto.precio AS precio_p, fabricante.nombre AS nombre_fab FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e';
SELECT producto.nombre AS nombre_p, producto.precio AS precio_p, fabricante.nombre AS nombre_fab FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';
SELECT producto.nombre AS nombre_p, producto.precio AS precio_p, fabricante.nombre AS nombre_fab FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;   
SELECT fabricante.codigo AS codigo_fab, fabricante.nombre AS nombre_fab FROM tienda.fabricante INNER JOIN tienda.producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT fabricante.nombre AS nombre_fab, producto.nombre AS nombre_p FROM tienda.fabricante LEFT JOIN tienda.producto  ON fabricante.codigo = producto.codigo_fabricante;   
SELECT fabricante.nombre AS nombre_fab, producto.nombre AS nombre_p FROM tienda.fabricante LEFT JOIN tienda.producto  ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo IS NULL;
SELECT producto.nombre AS nombre_p, fabricante.nombre AS nombre_fab FROM tienda.producto, tienda.fabricante WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Lenovo';
SELECT * FROM tienda.producto WHERE precio = (SELECT MAX(precio) FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM tienda.fabricante WHERE nombre ='Lenovo'));
SELECT nombre FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM tienda.fabricante WHERE nombre = 'Lenovo') AND precio = (SELECT MAX(precio) FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM tienda.fabricante WHERE nombre = 'Lenovo'));
SELECT nombre FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM tienda.fabricante WHERE nombre = 'Hewlett-Packard') AND precio = (SELECT MIN(precio) FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM tienda.fabricante WHERE nombre = 'Hewlett-Packard'));
SELECT * FROM tienda.producto WHERE precio >= (SELECT MAX(precio) FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM tienda.fabricante WHERE nombre ='Lenovo'));
SELECT producto.nombre AS nombre_p, producto.precio AS precio_p, fabricante.nombre AS nombre_fab FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' AND producto.precio > ((SELECT AVG(precio) FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM tienda.fabricante WHERE nombre = 'Asus')));

