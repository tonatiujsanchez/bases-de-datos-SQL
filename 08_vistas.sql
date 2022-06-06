

-- ======= CREAR VISTA =========
CREATE VIEW prestamos_prestamos_vw AS 
SELECT
    usuarios.usuario_id,
    usuarios.nombre,
    usuarios.email,
    usuarios.username,
    COUNT( usuarios.usuario_id ) AS total_prestamos
    FROM usuarios
    INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
    GROUP BY usuarios.usuario_id;



-- ======= VER VISTA =========
-- lla podemos tratar como una tabla normal
SELECT * FROM prestamos_prestamos_vw;
SELECT * FROM prestamos_prestamos_vw WHERE total_prestamos > 4;



-- ======= EDITAR VISTA =========
CREATE OR REPLACE VIEW prestamos_prestamos_vw AS 
SELECT
    usuarios.usuario_id,
    usuarios.nombre,
    usuarios.email,
    usuarios.username,
    COUNT( usuarios.usuario_id ) AS total_prestamos,
    libros_usuarios.fecha_creacion AS fecha_prestamo
    FROM usuarios
    INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
    AND libros_usuarios.fecha_creacion >= CURDATE() - INTERVAL 5 DAY
    GROUP BY usuarios.usuario_id;



-- ======= ELIMINAR VISTA =========
DROP VIEW prestamos_prestamos_vw;

