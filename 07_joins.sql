    -- INNER JOIN
    -- LEFT JOIN | LEFT OUTER JOIN
    -- RIGHT JOIN | RIGHT OUTER JOIN


-- ==================INNER JOIN  ==================
    -- Obtner el titulo de todos los libros y el nombre completo de su autor

 -- ON
SELECT 
    libros.titulo, 
    CONCAT(autores.nombre, ' ',autores.apellido) AS autor,
    libros.fecha_creacion 
FROM libros
INNER JOIN autores ON libros.autor_id = autores.autor_id;

-- USING: es un shorcut pero no podemos condicionar más columnas
SELECT 
    libros.titulo, 
    CONCAT(autores.nombre, ' ',autores.apellido) AS autor,
    libros.fecha_creacion 
FROM libros
INNER JOIN autores USING(autor_id);

    -- Obtner el titulo de todos los libros y el nombre completo de su autor simepre y cuando el autor tenga un seudonimo
    --ON : podemos condicional más columnas
SELECT 
    libros.titulo, 
    CONCAT(autores.nombre, ' ',autores.apellido) AS autor,
    autores.seudonimo,
    libros.fecha_creacion 
FROM libros
INNER JOIN autores 
ON libros.autor_id = autores.autor_id 
AND autores.seudonimo IS NOT NULL;


-- ================== LEFT JOIN ==================
usuarios - libros : muchos a muchos
INSERT INTO libros_usuarios(libro_id, usuario_id)
VALUES (1, 1), (2, 1), (3, 1);

-- Obtener el nombre completo de los usuarios y el id de los libros prestados;
    --usuarios
    --libros_usuarios

SELECT 
    CONCAT( nombre, ' ', apellidos ),
    libros_usuarios.libro_id
FROM usuarios
LEFT JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id;

--usuarios que han prestado libros
SELECT 
    CONCAT( nombre, ' ', apellidos ),
    libros_usuarios.libro_id
FROM usuarios
LEFT JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
WHERE libros_usuarios.libro_id IS NOT NULL;

--usuarios que NO an prestado libros
SELECT 
    CONCAT( nombre, ' ', apellidos ),
    libros_usuarios.libro_id
FROM usuarios
LEFT JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
WHERE libros_usuarios.libro_id IS NULL;



-- ================== RIGHT JOIN ==================

-- Obtener el nombre completo de los usuarios y el id de los libros prestados;
    --libros_usuarios
    --usuarios

SELECT 
    CONCAT( nombre, ' ', apellidos ),
    libros_usuarios.libro_id
FROM libros_usuarios
RIGHT JOIN usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id;

--usuarios que han prestado libros
SELECT 
    CONCAT( nombre, ' ', apellidos ),
    libros_usuarios.libro_id
FROM libros_usuarios
RIGHT JOIN usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
WHERE libros_usuarios.libro_id IS NOT NULL;

--usuarios que NO an prestado libros
SELECT 
    CONCAT( nombre, ' ', apellidos ),
    libros_usuarios.libro_id
FROM libros_usuarios
RIGHT JOIN usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
WHERE libros_usuarios.libro_id IS NULL;



-- ================== MULTIPLES JOIN ==================
-- obtener el nombre completo de los usuarios que haya prestado un libro
-- el libro debio ser escrito con un seudonimo
-- ademas el prestamo debio haberse realizado el dia de hoy

-- usuarios
-- libros_usuarios
-- libros
-- autores

SELECT DISTINCT
    CONCAT( usuarios.nombre, ' ', usuarios.apellidos ) AS nombre_usuario,
    seudonimo,
    libros_usuarios.fecha_creacion
FROM usuarios
INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
AND DATE( libros_usuarios.fecha_creacion ) = CURDATE()
INNER JOIN libros ON libros_usuarios.libro_id = libros.libro_id
INNER JOIN autores ON libros.autor_id = autores.autor_id 
AND autores.seudonimo IS NOT NULL;



-- ================== PRODUCTOS CARTESIANOS ==================
-- CROSS JOIN

SELECT usuarios.username, libros.titulo FROM usuarios CROSS JOIN libros ORDER BY username DESC;
