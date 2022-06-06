
-- ================== Busqueda mediante strings ==================
    --Registros que su titulo empiece con 'Harry Potter'
SELECT libro_id, titulo FROM libros WHERE titulo LIKE 'Harry Potter%';
    --Registros que su titulo termine con 'fuego'
SELECT libro_id, titulo FROM libros WHERE titulo LIKE '%fuego';
    --Registros que su titulo contenga 'tierra'
SELECT libro_id, titulo FROM libros WHERE titulo LIKE '%tierra%';


    -- Registros que su titulo tenga 5 caracteres
SELECT * FROM libros WHERE titulo LIKE '_____';
    -- Registros que su titulo tenga 5 caracteres y que el tercero caracter sea la letra 'b'
SELECT * FROM libros WHERE titulo LIKE '__b__';
    -- Registros que en su titulo el segundo caracter tenga la letra 'a'
SELECT * FROM libros WHERE titulo LIKE '_a%';
    -- Registros que en su titulo el segundo caracter tenga la letra 'a' y en si quinto la letra 'o'
SELECT * FROM libros WHERE titulo LIKE '_a__o%';
    -- Registros que su titulo empiese con la letra 'h' o 'l'
SELECT * FROM libros WHERE titulo LIKE 'l%' OR titulo LIKE 'h%';
SELECT * FROM libros WHERE LEFT(titulo, 1) = 'l' OR LEFT(titulo, 1) = 'h';






-- ================== Busqueda con expresiones regulares ==================
    --Registros que su titulo empiese con la letra 'h' o 'l' o 'a'
SELECT libro_id, titulo FROM libros WHERE titulo REGEXP '^[HLA]';




-- ================== Ordenar registros ==================
    -- Orden DE A-Z (asc) :  valor por defecto
SELECT titulo FROM libros ORDER BY titulo;
    -- Ordernar de Z-A (desc)
SELECT titulo FROM libros ORDER BY titulo DESC;

    --ordenar por libro_id (asc)
SELECT libro_id, titulo FROM libros ORDER BY libro_id;
    --ordenar por libro_id (desc)
SELECT libro_id, titulo FROM libros ORDER BY libro_id DESC;
    --ordenar por libro_id (desc) en dos columnas
SELECT libro_id, autor_id, titulo FROM libros ORDER BY autor_id AND titulo DESC;


-- ================== Limitar registros ==================
    --obtener los 10 primero registros
SELECT libro_id, titulo FROM libros LIMIT 10;
    --obtener los 10 primero registros ordenados de forma descendente
SELECT libro_id, titulo FROM libros ORDER BY libro_id DESC LIMIT 10;
    --obtener el titulo de los primero 3 libros del autor con id 2
SELECT autor_id, titulo FROM libros WHERE autor_id = 2 LIMIT 3;

    --paginar los resultados : LIMIT donde_empieza, cantidad_registros;
SELECT libro_id, titulo FROM libros LIMIT 0, 5;
SELECT libro_id, titulo FROM libros LIMIT 5, 5;
SELECT libro_id, titulo FROM libros LIMIT 10, 5;
SELECT libro_id, titulo FROM libros LIMIT 15, 5;


-- ================== Funciones de agregación ==================

    --COUNT()
    --SUM()
    --MAX()
    --MIN()
    --AVG()

    -- COUNT()
    -- Cuantos autores tiene nuesta tablas autores
    SELECT COUNT(*) FROM autores;
    -- Cuantos autores tiene nuesta tablas autores con un alias
    SELECT COUNT(*) AS total FROM autores;

    -- Cuantos autores tienen un seudonimo
    SELECT COUNT(*) FROM autores WHERE seudonimo IS NOT NULL;
    -- Cuantos autores tienen un seudonimo
    SELECT COUNT(seudonimo) FROM autores;

    --SUM()
    -- sumar ventas
    SELECT SUM(ventas) FROM libros;

    --MAX()
    -- obtener el valor maximo de una columna
     SELECT MAX(ventas) FROM libros;

    --MIN()
    -- obtener el valor minimo de una columna
     SELECT MIN(ventas) FROM libros;


    --AVG()
    -- obtener el promedio de una columna
     SELECT AVG(ventas) FROM libros;





-- ================== Agrupamiento ================== 

    --Saber la suma de las ventas de cada autor
SELECT autor_id, SUM(ventas) FROM libros GROUP BY autor_id;

    --Saber la suma de las ventas de cada autor ordenados
SELECT autor_id, SUM(ventas) FROM libros GROUP BY autor_id ORDER BY SUM(ventas) DESC;

    --Saber que autor vendio más
SELECT autor_id, SUM(ventas) AS total FROM libros GROUP BY autor_id ORDER BY total DESC LIMIT 1;






-- ================== Condiciones bajo agrupamiento ================== 
    --obtener totos los autores que hallan vendido mas de 200
SELECT autor_id, SUM(ventas) AS total_ventas FROM libros GROUP BY autor_id HAVING(total_ventas) > 200;




-- ================== Unir resultados ================== 
SELECT CONCAT( nombre, ' ',apellidos ) AS nombre_completo FROM usuarios;

-- obtener una lista de los nombres de la tabla autores y asuarios
SELECT CONCAT( nombre, ' ', apellido ) AS nombre_completo FROM autores
UNION 
SELECT CONCAT( nombre, ' ',apellidos ) AS nombre_completo FROM usuarios;


-- obtener una lista de los nombres y correo de la tabla autores y asuarios
SELECT CONCAT( nombre, ' ', apellido ) AS nombre_completo, '' AS email FROM autores
UNION 
SELECT CONCAT( nombre, ' ',apellidos ) AS nombre_completo, email FROM usuarios;



-- ================== Subconsultas o Consultas anidadas  ==================

    --Obtener el promedio
SET @promedio = (SELECT AVG(ventas) FROM libros); --305.5636
    -- Obtener el id de todos los autores cuyas ventas hayan superado el promedio (305.5636)
SELECT autor_id 
    FROM libros 
    GROUP BY autor_id 
    HAVING SUM(ventas) > @promedio;


-- Obtener el id de todos los autores cuyas ventas hayan superado el promedio
SELECT autor_id 
    FROM libros 
    GROUP BY autor_id 
    HAVING SUM(ventas) > (SELECT AVG(ventas) FROM libros);


-- Obtener el id y el nombre completo de todos los autores cuyas ventas hayan superado el promedio

SELECT autor_id, CONCAT(nombre, ' ', apellido) AS nombre_autor
FROM autores
WHERE autor_id IN (
    SELECT autor_id 
        FROM libros 
        GROUP BY autor_id 
        HAVING SUM(ventas) > (SELECT AVG(ventas) FROM libros)
)


-- ================== Validar registros  ==================

    -- Obtener 'Disponible' si el libro con el titulo 'El hobbit' exite en la tabla de los contradio obtner 'NO disponible'
SELECT IF( 
    EXISTS( SELECT libro_id FROM libros WHERE titulo = 'El hobbit' ),
    'Disponible',
    'NO disponible'
) AS mensaje;