START TRANSACTION;


COMMIT; --Persister de forma permanente los cambios
ROLLBACK; --Regresar al estado antes de la transaccion


-- ===============================
DELIMITER // 

CREATE PROCEDURE prestamo(usuario_id INT, libro_id INT)
BEGIN

  DECLARE EXIT HANDLER FOR SQLEXCEPTION --ocurre un error
  BEGIN
    ROLLBACK;
  END;

  START TRANSACTION;

  INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES(libro_id, usuario_id);
  UPDATE libros SET stock = stock - 1 WHERE libros.libro_id = libro_id;
  
  COMMIT;

END//


DELIMITER ;