
-- ======================== STRINGS ======================== 
-- Concatenar campos
SELECT CONCAT( nombre, ' ',apellido ) FROM autores;
-- Concatenar campos y darle un alias
SELECT CONCAT( nombre, ' ',apellido ) AS 'Nombre completo' FROM autores;


-- Cantidad de caracteres que tiene un string
SELECT LENGTH( "Hola mundo!");
SELECT LENGTH( nombre) FROM autores;

--Ontener todos los autores cuyo nombre contenga más de 7 caracteres
SELECT * FROM autores WHERE LENGTH( NOMBRE ) > 7;


--Transformar en MAYUSCULAS
SELECT UPPER(nombre) FROM autores;
--Transformar en minusculas
SELECT LOWER(nombre) FROM autores;


-- ELiminar las epacion de un string
SELECT TRIM('   HOLA MUNDO!   ');

-- Substring (Cortar palabras)
SELECT LEFT('Esta es una cadena de Caracteres', 7) AS substring_izquierdo,
RIGHT('Esta es una cadena de Caracteres', 9) AS substring_derecho;

SELECT LEFT(nombre, 2) FROM autores;
SELECT RIGHT(nombre, 3) FROM autores;

    -- Todos los libros que el titulo inicie con Harry Potter
SELECT * FROM libros WHERE LEFT(titulo, 12) = 'Harry Potter';
SELECT * FROM libros WHERE LEFT(titulo, LENGTH('Harry Potter')) = 'Harry Potter';

    -- Todos los libros que el titulo termine con anillo
SELECT * FROM libros WHERE RIGHT(titulo, 6) = 'anillo';
SELECT * FROM libros WHERE RIGHT(titulo, LENGTH('anillo')) = 'anillo';




-- ======================== NÚMEROS ========================

-- Número aleatorio
SELECT RAND();

-- Número aleatorio entero
SELECT ROUND( RAND() * 100 );

-- Número aleatorio entero con alieas
SELECT ROUND( RAND() * 100 ) AS ramdom;

-- Cortar el numero
    --Sin decimales
SELECT TRUNCATE(3.04692181949217042, 0);
    --Con 3 decimales
SELECT TRUNCATE(3.04692181949217042, 3);

-- Elevar a la potencia
SELECT POW(2, 16);


-- ======================== FECHAS ========================
-- Fecha actual exacta 
SELECT NOW();     --Timestamp
SELECT CURDATE(); --Date

-- alamacenamos la fecha en una variable
SET @now = NOW();

-- Extraer el SEGUNDO | MINUTO | HORA | DÍA | MES | AÑO
SELECT SECOND( @now );
SELECT MINUTE( @now );
SELECT HOUR( @now );
SELECT DAY( @now );
SELECT MONTH( @now );
SELECT YEAR( @now );


-- Extraer el DIA DE LA SEMANA | DIA DEL MES | DIA DEL AÑO 
SELECT DAYOFWEEK( @now );
SELECT DAYOFMONTH( @now );
SELECT DAYOFYEAR( @now );

-- Converir un tipo Timestamp a Date
SELECT DATE( @now );


-- Obtener todos los libros que fueron creados hoy
SELECT titulo, fecha_creacion FROM libros WHERE DATE(fecha_creacion) = DATE( NOW() );


--Sumar o Restar Fechas
    -- sumar 30 dias 
SELECT @now + INTERVAL 30 DAY;
    -- restar 30 dias 
SELECT @now - INTERVAL 30 DAY;


-- ======================== FUNCIONES SOBRE CONDICIONES ========================
    --NOTA: es como un ternario
SELECT IF( 10 > 9, 'Es mayor', 'No es mayor' );
SELECT IF( 10 > 9, true, false );


    --Condicionemos las columna paginas de la tabla libros
SELECT libro_id, titulo, paginas FROM libros WHERE paginas = 0; --forma tradicional

SELECT IF( paginas = 0, 'El libro NO tiene paginas', paginas ) FROM libros;

    --Si el valoni no es null, se retornara el valor
SELECT IFNULL( seudonimo, 'Este auto no tiene un seudonimo' ) FROM autores;



-- ======================== CREAR FUNCIONES ========================
/* 
SI DA UN ERROR EJECUTAR EL SIGUENTE COMANDO:
        SET GLOBAL log_bin_trust_function_creators = 1;

AGREGA LO SIGUIENTE EN EL ARCHIVO DE CONFIGURACIÓN MYSQL.INI
        log_bin_trust_function_creators = 1;
*/


-- 1.- Moficamos el inidcador del final de una sentencia
DELIMITER //  

-- 2.- Creamos nuestra funcion
CREATE FUNCTION agregar_dias( fecha DATE, dias INT )
RETURNS DATE
BEGIN
    RETURN fecha + INTERVAL dias DAY;
END//

-- 3.- NOTA: despues de agregar la funcion debemos regresar el ; como final de sentencias para evitar futuros inconvenientes
DELIMITER ;

-- 4.- Creamos una variable
SET @now = CURDDATE();

-- 5.- Llamamos nuestra funcion ( Sumanos 3 dias )
SELECT agregar_dias( @now, 3 );



--======== Listar todas nuestras funciones======
    --Version Legacy
SELECT name FROM mysql.proc WHERE db = database() AND type= 'FUNCTION';
    --Version 8 de MySQL en adelante
SELECT routine_name FROM information_schema.routines 
WHERE routine_schema = database() AND routine_type = 'FUNCTION';


-- Eliminar una funcion
DROP FUNCTION agregar_dias; 




-- ======================== EJECUTAR SENTENCIAS DENTRO DE FUNCIONES ========================
-- ======= PAGINAS

-- Modificar la delimitacion de la sentencias
DELIMITER // 

-- Crear una funcion
CREATE FUNCTION obtener_paginas()
RETURNS INT
BEGIN
    SET @paginas = (SELECT ( ROUND( RAND() * 100 ) * 4 ));
    RETURN @paginas;
END//

-- Restableser la delimitacion de la sentencias
DELIMITER ;

-- Ver resultado de la funcion
SELECT obtener_paginas();

-- Actualizar las paginas de todos los libros
UPDATE libros SET paginas = obtener_paginas();




-- ======= VENTAS

-- Modificar la delimitacion de la sentencias
DELIMITER // 

-- Crear una funcion
CREATE FUNCTION obtener_ventas()
RETURNS INT
BEGIN
    SET @ventas = (SELECT ( ROUND( RAND() * 100 ) * 6 ));
    RETURN @ventas;
END//

-- Restableser la delimitacion de la sentencias
DELIMITER ;

-- Ver resultado de la funcion
SELECT obtener_ventas();

-- Actualizar las paginas de todos los libros
UPDATE libros SET ventas = obtener_ventas();