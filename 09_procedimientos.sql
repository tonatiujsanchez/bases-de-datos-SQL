
-- CREAR PROCEDIMIENTO

DELIMITER // 

CREATE PROCEDURE prestamo( usuario_id INT, libro_id INT )
BEGIN
    INSERT INTO libros_usuarios( libro_id, usuario_id ) VALUES ( libro_id, usuario_id );
    UPDATE libros SET stock = stock - 1 WHERE libros.libro_id = libro_id;

END//

DELIMITER ;


-- LISTAR PROCEDIMIENTOS 
SHOW PROCEDURE STATUS WHERE db = database() AND type = 'PROCEDURE'\G



--LLAMAR PROCEDIMIENTO
CALL prestamo( 4, 29 );



--ELIMINAR PROCEDIMIENTO
DROP PROCEDURE prestamo;

-- NOTA: no se pueden editar,
--se tienen que eliminar y volver a generar con los cambios
-- y no retornan valores






-- OBTENER VALORES
CREATE PROCEDURE prestamo( usuario_id INT, libro_id INT, OUT cantidad INT)
BEGIN
    INSERT INTO libros_usuarios( libro_id, usuario_id ) VALUES ( libro_id, usuario_id );
    UPDATE libros SET stock = stock - 1 WHERE libros.libro_id = libro_id;
    SET cantidad = ( SELECT stock FROM libros WHERE libros.libro_id = libro_id );
END//

-- Decramamos un avariable
SET @cantidad = -1;
--Ejecutamos el procedimineto
CALL prestamo( 3, 20, @cantidad );
-- Verificamos que el resultado se almacene en nuestra variable
SELECT @cantidad;






-- CONDICIONALES

CREATE PROCEDURE prestamo( usuario_id INT, libro_id INT, OUT cantidad INT)
BEGIN
    
    SET cantidad = ( SELECT stock FROM libros WHERE libros.libro_id = libro_id );
    IF cantidad > 0 THEN

    INSERT INTO libros_usuarios( libro_id, usuario_id ) VALUES ( libro_id, usuario_id );
    UPDATE libros SET stock = stock - 1 WHERE libros.libro_id = libro_id;

    SET cantidad = cantidad -1;

    --ELSEIF condicion

    ELSE 
        SELECT "No es posible realizar el prestamo" AS mensaje_error;
    END IF;

END//





-- CASOS
DELIMITER // 

CREATE PROCEDURE tipo_lector(usuario_id INT)
 BEGIN

   SET @cantidad = (SELECT COUNT(*) FROM libros_usuarios
                     WHERE libros_usuarios.usuario_id = usuario_id);


   CASE
     WHEN @cantidad > 20 THEN
       SELECT "Fanatico" AS mensaje;
     WHEN @cantidad > 10 AND @cantidad < 20 THEN
       SELECT "Aficionado" AS mensaje;
     WHEN @cantidad > 5 AND @cantidad < 10 THEN
       SELECT "Promedio" AS mensaje;
     ELSE
       SELECT "Nuevo" AS mensaje;
   END CASE;
 END//

 DELIMITER ;



--  CLICLOS
DELIMITER // 

 CREATE PROCEDURE libros_azar()
 BEGIN
   SET @iteracion = 0;

   REPEAT

     SELECT libro_id, titulo FROM libros ORDER BY RAND() LIMIT 1;
     SET @iteracion = @iteracion + 1;

     UNTIL @iteracion >= 5
   END REPEAT;

 END//

  DELIMITER ;
