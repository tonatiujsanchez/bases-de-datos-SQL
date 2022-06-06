
-- Agregar una nueva columna
ALTER TABLE libros ADD ventas INT UNSIGNED NOT NULL;

-- Agregar una nueva columna con un valor por defecto
ALTER TABLE libros ADD stock INT UNSIGNED NOT NULL DEFAULT 10;



-- Eliminar una columna
ALTER TABLE libros DROP COLUMN stock;



-- ============= MODIFICACIONES MÁS COMUNES ======================

-- Renombrar la tabla usuarios por users.
ALTER TABLE usuarios RENAME users;

-- Agregar una nueva columna.
ALTER TABLE usuarios ADD email VARCHAR(50);

-- Agregar una nueva columna con constraints.
ALTER TABLE usuarios ADD email VARCHAR(50) NOT NULL DEFAULT '';

-- Agregar a la tabla usuarios, la columna email, validando su valor único.
ALTER TABLE tabla ADD columna VARCHAR(50) UNIQUE;

-- Eliminar la columna email de la tabla usuarios.
ALTER TABLE usuarios DROP COLUMN email;

-- Modificar el tipo de dato de una columna
    -- Modificar el tipo de dato de la columna teléfono, (tabla usuarios) de INT a VARCHAR, máximo 50 caracteres.
ALTER TABLE usuarios MODIFY telefono VARCHAR(50);

-- Generar una llave primaria.
ALTER TABLE usuarios ADD id INT UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (id);

-- Agregar llave foránea.
ALTER TABLE usuarios ADD FOREIGN KEY(grupo_id) REFERENCES grupos(grupo_id);

-- Eliminar llaves foráneas
ALTER TABLE usuarios DROP FOREIGN KEY grupo_id;
