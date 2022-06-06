
-- Obtener todos los registro de una tabla
SELECT * FROM libros;

-- Obtener todos los registro de una tabla en forma de carta
SELECT * FROM libros\G;


-- Obtener registro de columnas especificas de una tabla
SELECT libro_id, titulo, stock FROM libros;



-- ========= WHERE ========== --
--obtener registros mediante condiciones
    --SELECT columnas FROM tabla WHERE condicion;

SELECT libro_id, titulo, stock FROM libros WHERE titulo = 'Carrie';

-- ==== Operadores Relacionales ====
-- <  : menor que
-- >  : mayor que
-- <= : menor o igual que
-- >= : mayor o igual que
-- =  : igual que
-- != : diferente que   : opcion 1
-- <> : diferente que   : opcion 2

-- ==== Operadores Lógicos ====
-- AND
-- OR
-- NOT


-- AND
SELECT libro_id, titulo FROM libros WHERE autor_id = 1 AND titulo = 'Carrie' AND ventas = 0;

-- OR
SELECT libro_id, titulo, autor_id FROM libros WHERE autor_id = 1 OR titulo = 'Carrie' OR ventas = 0;

--OR - AND
SELECT libro_id, titulo, autor_id FROM libros WHERE (autor_id = 1 AND ventas = 0 ) OR titulo = 'Carrie';


-- Registros Nulos
SELECT * FROM autores WHERE fecha_nacimiento IS NULL;
SELECT * FROM autores WHERE seudonimo IS NULL;
SELECT * FROM autores WHERE seudonimo IS NOT NULL;


SELECT * FROM autores WHERE seudonimo <=> NULL;



-- Registros por Rangos
SELECT titulo, fecha_publicacion FROM libros 
WHERE fecha_publicacion BETWEEN '1975-01-01' AND '2015-01-31'


-- Busqueda por listas
SELECT titulo FROM libros
WHERE titulo = 'Carrie' OR
      titulo = 'El resplandor' OR
      titulo = 'El hobbit';

SELECT titulo FROM libros
WHERE titulo IN ( 'Carrie', 'El resplandor', 'El hobbit' );


-- Registros únicos : OBTENEMOS TITULOS QUE NO SE REPITEN
SELECT DISTINCT titulo, fecha_publicacion FROM libros;


-- Alías
    --alias a las columnas 
SELECT autor_id AS Autor, titulo AS 'Titulo del libro' FROM libros;
    --alias a las columnas y tabla
SELECT autor_id AS Autor, titulo AS 'Titulo del libro' FROM libros AS books;
    -- Utilizar el alias del la tabla para hacer eferencia la columna
SELECT books.autor_id AS Autor, books.titulo AS 'Titulo del libro' FROM libros AS books;



-- Actualizar registros
    --Actulizar todos los registros
UPDATE libros SET  descripcion = 'Nueva_desc', ventas = 100;
    --Actulizar el campor del algun registro en especifico. 
UPDATE libros SET  descripcion = 'Un libro interesante', ventas = 17 WHERE titulo = 'Carrie';
UPDATE libros SET  descripcion = 'Un libro interesante ACTUALIZADO!', ventas = 23 WHERE libro_id = 3;


-- Eliminar registros
    -- Eliminar todos los registros de la tabla
DELETE FROM libros;
    -- Eliminar registros especificos
DELETE FROM libros WHERE autor_id = 1;
DELETE FROM libros WHERE libro_id = 12;


-- Eliminar en Cascada
    -- Habilitar ON DELETE CASCADE en la tabla libros
    -- ALTER TABLE libros ADD FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE
DELETE FROM autores WHERE autor_id = 1;


-- Eliminar todos los registros de una tabla
TRUNCATE TABLE libros;  --No puede utilizar WHERE y limpia la metadata



