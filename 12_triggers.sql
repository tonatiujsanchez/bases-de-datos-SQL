DELIMITER //
--5.7.2 <  Máximo 6 triggers
CREATE TRIGGER after_insert_actualizacion_libros --Nombre del trigger
AFTER INSERT ON libros -- Definimos tiempo y cuando
FOR EACH ROW
BEGIN
  UPDATE autores SET libros = libros + 1 WHERE autor_id = NEW.autor_id;
END;
//


-- Evento Delete
DELIMITER //
CREATE TRIGGER after_delete_actualizacion_libros
AFTER DELETE ON libros
FOR EACH ROW
BEGIN
  UPDATE autores SET libros = libros - 1 WHERE autor_id = OLD.autor_id;
END;
//

-- Evento Update
DELIMITER //
CREATE TRIGGER after_update_actualizacion_libros
AFTER UPDATE ON libros
FOR EACH ROW
BEGIN

  IF (NEW.autor_id != OLD.autor_id) THEN

    UPDATE autores SET libros = libros - 1 WHERE autor_id = OLD.autor_id;
    UPDATE autores SET libros = libros + 1 WHERE autor_id = NEW.autor_id;

  END IF;

END;//

DELIMITER ;



-- Listado 
SHOW TRIGGERS;


-- eliminar Trigger
DROP TRIGGER IF EXIST libreria_cf.nombre_trigger