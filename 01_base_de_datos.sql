-- Crear bases de datos
CREATE DATABASE libreria_cf;

-- Eliminar una base de datos de forma permanente
DROP DATABASE libreria_cf;

-- Entrar a la base de datos
USE libreria_cf;



/* 
    ¿QUE TIPO DE ENTIDADES? autores 
    Nombre: autores
*/
Nombre
Genero
Fecha de nacimiento
País de origen

columna y el tipo de dato

autor_id INT
nombre VARCHAR(30)
apellido VARCHAR(30)
genero CHAR(1) -- M o F
fecha_nacimiento DATE --año/mes/dia
pais_arigen VARCHAR(40)

-- Creade una tabla en la bases de datos

CREATE TABLE AUTORES(
    autor_id INT,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    genero CHAR(1),
    fecha_nacimiento DATE,
    pais_arigen VARCHAR(40)
);

-- Mostrar las tablas de la base de datos
SHOW TABLES;

-- Sabre en que base de datos estamos trabajando
SELECT DATABASE();

-- Eliminar una tabla en una base de datos
DROP TABLE autores;

-- Visualizar los detalle de las comunas de una tabla
SHOW COLUMNS FROM autores
DESC autores



-- Crear una tabla a partir de otra
CREATE TABLE usuarios LIKE autores;




-- ======================================================= --

-- Insertar registros a una tabla
INSERT INTO autores ( autor_id, nombre, apellido, genero, fecha_nacimiento, pais_arigen )
VALUES ( 1, 'Brandon', 'Hernandez', 'M', '2017-08-26', 'México');

-- Mostrar registros
SELECT * FROM autores;


--insertar varios registro a la vez (tuplas)

INSERT INTO autores ( autor_id, nombre, apellido, genero, fecha_nacimiento, pais_arigen )
VALUES ( 3, 'Rodrigo', 'Cardoso', 'M', '2023-07-17', 'México'),
        ( 4, 'Aria', 'Sánchez', 'F', '2025-09-12', 'Canada' ),
        ( 5, 'Matias', 'Henandez', 'M', '2026-08-03', 'Canada' ),
        ( 6, 'Lorelai', 'Cardoso', 'F', '2024-06-06', 'México'),
        ( 7, 'Aaron', 'Sánchez', 'M', '2027-10-27', 'Nueva Zelenda' );



-- =========================================== --
-- Ejecurar un archivo .sql

-- Sin iniciar sesión
mysql -u root -p < ruta/nombre_archivo.sql -- sin ;


-- Con la sesión iniciada
SOURSE ruta/nombre_archivo.sql; -- si lleva ;




-- =========================================== --
-- condicionar sentencias
DROP DATABASE IF EXISTS libreria_cf; -- Elimina la base de datos solo si existe
CREATE DATABASE IF NOT EXISTS libreria_cf; -- Crea la base de datos solo si NO existe

CREATE TABLE IS NOT EXISTS AUTORES(  -- Crea la tabla solo si NO existe
    autor_id INT,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    genero CHAR(1),
    fecha_nacimiento DATE,
    pais_arigen VARCHAR(40)
);



-- =========================================== --
-- Ejecutar sentencias sin iniciar sésion

mysql -u root -p libreria_cf -e "SELECT * FROM autores"
