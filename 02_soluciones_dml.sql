-- =================================================================
-- Taller Práctico: Consultas SQL DML
-- Estudiantes: Samuel Tuberquia David, Daniel Felipe Montero y Cheelsea Faria Moreno
-- Fecha: 02/09/2026
-- Gestor de Base de Datos: PostgresSQL
-- =================================================================

-- -----------------------------------------------------------------
-- BLOQUE 1: Consultas Básicas, Filtros y Ordenamiento
-- ----------------------------------------------------------------


1. Consulta general: Obtener el nombre, email, ciudad y saldo de todos los clientes activos, ordenados alfabeticamente por su nombre.
SELECT
    nombre,
    email,
    ciudad,
    saldo
FROM clientes
WHERE estado = 'activo'
ORDER BY nombre ASC;

2. Filtrado por rango: Listar el nombre, precio y stock de todos los productos cuyo precio este entre $100.00 y $500.00 .
SELECT
    nombre,
    precio,
    stock
FROM productos
WHERE precio BETWEEN 100.00 AND 500.00;


3. Busqueda por patrones: Consultar todos los clientes cuyo correo electronico termine en @mail.com y cuya ciudad sea 'Bogota' o
'Medellín'.
SELECT
    nombre,
    email,
    ciudad,
    saldo
FROM clientes
WHERE email LIKE '%@mail.com'
  AND ciudad IN ('Bogotá', 'Medellín');


4. Valores nulos y operadores logicos: Mostrar el nombre y ciudad de los clientes que no tienen registrado un numero de teléfono ( IS
NULL ).
SELECT
    nombre,
    ciudad
FROM clientes
WHERE telefono IS NULL;


5. Calculo de columnas derivadas: Listar el nombre de cada producto, su precio original, su porcentaje de descuento y el precio final con el
descuento aplicado (utiliza el alias precio_con_descuento ).
SELECT
    nombre,
    precio AS precio_original,
    porcentaje_descuento,
    precio - (precio * porcentaje_descuento / 100) AS precio_con_descuento
FROM productos;


6. Top y ordenamiento descendente: Obtener los 3 productos más caros que se encuentren actualmente disponibles ( disponible = TRUE ).
SELECT
    nombre,
    precio,
    stock
FROM productos
WHERE disponible = TRUE
ORDER BY precio DESC
LIMIT 3;

-- -----------------------------------------------------------------
-- Bloque 2: Agrupación y Funciones de Agregacion (GROUP BY, HAVING, COUNT, SUM, AVG, MIN, MAX)
-- ----------------------------------------------------------------

7. Metricas globales: Calcular el total de productos en catalogo, el precio promedio, el precio minimo y el precio maximo de todos los
productos.
SELECT
    COUNT(*) AS total_productos,
    AVG(precio) AS precio_promedio,
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo
FROM productos;


8. Conteo agrupado: Contar cuantos clientes activos hay registrados por cada ciudad.
SELECT
    ciudad,
    COUNT(*) AS total_clientes_activos
FROM clientes
WHERE estado = 'activo'
GROUP BY ciudad;


9. Suma agrupada: Calcular el total de ingresos recaudados ( SUM(total) ) por cada estado de pedido ( estado ).
SELECT
    estado,
    SUM(total) AS total_ingresos
FROM pedidos
GROUP BY estado;


10- 10. Promedio y filtrado de grupos: Obtener el ID de la categoria y el precio promedio de sus productos, mostrando unicamente aquellas
categorías cuyo precio promedio sea mayor a $300.00 .SELECT
    id_categoria,
    AVG(precio) AS precio_promedio
FROM productos
GROUP BY id_categoria
HAVING AVG(precio) > 300.00;


11. Conteo con condicion agrupada: Mostrar la lista de clientes ( id_cliente ) que han realizado mas de 1 pedido, indicando cuantos
pedidos tienen en total.
SELECT
    id_cliente,
    COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY id_cliente
HAVING COUNT(*) > 1;


12. Metricas de inventario: Mostrar por cada categoria ( id_categoria ) la suma total de unidades en stock ( stock ), ordenando el resultado
de mayor a menor stock.
SELECT
    id_categoria,
    SUM(stock) AS total_stock
FROM productos
GROUP BY id_categoria
ORDER BY total_stock DESC;

-- -----------------------------------------------------------------
-- Bloque 3: Modificación y Actualización de Datos ( UPDATE )
-- ----------------------------------------------------------------

13. Actualizacion simple: Modificar el saldo del cliente con id_cliente = 2, asignandole un nuevo saldo de $100.00 .
UPDATE clientes
SET saldo = 100.00
WHERE id_cliente = 2;


14. Actualización con cálculo porcentual: Aumentar en un 10% el precio de todos los productos pertenecientes a la categoría 1 ( Laptops ).
UPDATE productos
SET precio = precio * 1.10
WHERE id_categoria = 1;


15. Actualizacion condicional multiple: Marcar como no disponibles ( disponible = FALSE ) todos los productos cuyo stock sea igual a e.
UPDATE productos
SET disponible = FALSE
WHERE stock = 0;


16. Actualizacion masiva de estado: Cambiar el estado a 'Entregado' a todos los pedidos que actualmente se encuentren en estado
'Enviado' .
UPDATE pedidos
SET estado = 'Entregado'
WHERE estado = 'Enviado';


-- -----------------------------------------------------------------
-- Bloque 4: Inserciones Adicionales, Subconsultas y Eliminacion ( INSERT, DELETE)
-- ----------------------------------------------------------------

17. Insercion de nuevo registro: Insertar un nuevo cliente con tus datos (o ficticios) con saldo de $250.00, estado activo y la fecha actual.
INSERT INTO clientes (nombre, email, ciudad, saldo, estado, fecha_registro)
VALUES ('Juan Pérez', 'juan.perez@correo.com', 'Medellín', 250.00, 'activo', CURRENT_DATE);


18. Subconsulta de comparacion: Consultar el nombre y precio de todos los productos cuyo precio sea superior al precio promedio de todos
los productos de la tienda.
SELECT
    nombre,
    precio
FROM productos
WHERE precio > (
    SELECT AVG(precio)
    FROM productos
);


19. liminacion condicional: Eliminar todos los clientes que se encuentren inactivos ( activo = FALSE ) y que tengan un saldo igual a $0.00 .
DELETE FROM clientes
WHERE activo = FALSE
  AND saldo = 0.00;


20. Subconsulta con borrado selectivo: Eliminar los pedidos cuyo estado sea 'Cancelado'.
DELETE FROM pedidos
WHERE estado = 'Cancelado';

SELECT * FROM pedidos WHERE estado = 'Cancelado';