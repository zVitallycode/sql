# sql
Descripcion: Este repositorio contiene 20 consultas SQL organizadas en 4 bloques temáticos sobre un sistema de clientes, productos y pedidos: consultas básicas con filtros y ordenamiento,  agrupación y funciones de agregación, actualización de datos, y  inserciones, subconsultas y eliminación. Todas las consultas están escritas en sintaxis PostgreSQL y fueron ejecutadas mediante DBeaver.
Al no contar con el diccionario de datos completo del ejercicio original, se asumieron nombres de columna razonables a partir de cada enunciado documentados en cada archivo `.sql`, detectando además una inconsistencia entre las columnas `estado` y `activo` usadas para representar clientes activo

Conclusiones: El ejercicio cubrió el ciclo completo de manipulación de datos en SQL: lectura, análisis agregado, actualización y eliminación.
`GROUP BY` y `HAVING` resultaron esenciales para responder preguntas de negocio (ingresos por estado, promedios por categoría) sin procesar datos fuera de la base.
Las operaciones de escritura (`UPDATE`, `DELETE`) exigen condiciones `WHERE` precisas; verificar con `SELECT` antes de ejecutarlas es clave para evitar cambios no intencionados.
Contar con un modelo entidad-relación claro antes de escribir consultas evita ambigüedades como las encontradas en los nombres de columnas de este ejercicio
