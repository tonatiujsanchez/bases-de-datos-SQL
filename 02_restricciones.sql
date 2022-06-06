-- Creade una tabla en la bases de datos con restricciones
--NOT NULL: El campo es obligatorio
--UNIQUE: El campo debe de ser unico

CREATE TABLE AUTORES(
    autor_id INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    seudomino VARCHAR(50) UNIQUE,  
    genero CHAR(1) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    pais_arigen VARCHAR(40) NOT NULL
);

-- Valores por default con estos no son espesificados en la insersión del un registro
-- obtener la fecha exacta: 
    -- SELECT current_timestamp;
    -- SELECT now();
CREATE TABLE AUTORES(
    autor_id INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    seudomino VARCHAR(50) UNIQUE,  
    genero CHAR(1) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    pais_arigen VARCHAR(40) NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp
);


INSERT INTO autores ( autor_id, nombre, apellido, genero, fecha_nacimiento, pais_arigen, seudomino)
VALUES ( 8, 'Isaac', 'Hernandez', 'M', '2027-06-06', 'Mexico', 'Isa');

-- Prevenir insertar numeros negativos
    -- UNSIGNED

CREATE TABLE AUTORES(
    autor_id INT UNSIGNED NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    seudomino VARCHAR(50) UNIQUE,  
    genero CHAR(1) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    pais_arigen VARCHAR(40) NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp
);


-- Tipo de dato enum
    -- ENUM( 'VALOR1', 'VALOR1' )

CREATE TABLE AUTORES(
    autor_id INT UNSIGNED NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    seudomino VARCHAR(50) UNIQUE,  
    genero ENUM( 'M', 'F' ),
    fecha_nacimiento DATE NOT NULL,
    pais_arigen VARCHAR(40) NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp
);

-- Llave primaria
    -- PRIMARY KEY ( No permite Null y es Unico )
    -- AUTO_INCREMENT ( Si el campo ni cuenta con un valor, se asigna un valor numerico autoincremental )

    CREATE TABLE IF NOT EXISTS autores(
    autor_id INT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    seudomino VARCHAR(50) UNIQUE,  
    genero ENUM( 'M', 'F' ),
    fecha_nacimiento DATE NOT NULL,
    pais_arigen VARCHAR(40) NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp
);

INSERT INTO autores ( nombre, apellido, seudomino, genero, fecha_nacimiento, pais_arigen)
VALUES  ( 'Isaac', 'Hernandez', 'Isa', 'M', '2027-06-06', 'Mexico'),
        ( 'Brandon', 'Hernandez', 'Brand', 'M', '2017-08-26', 'México'),
        ( 'Rodrigo', 'Cardoso', 'Rodri', 'M', '2023-07-17', 'México'),
        ( 'Aria', 'Sánchez', 'Ari', 'F', '2025-09-12', 'Canada' ),
        ( 'Matias', 'Henandez', 'Mat', 'M', '2026-08-03', 'Canada' ),
        ( 'Lorelai', 'Cardoso', 'Lore', 'F', '2024-06-06', 'México'),
        ( 'Aaron', 'Sánchez', 'Aar', 'M', '2027-10-27', 'Nueva Zelenda' );

-- Llave Foranea
    --  FOREIGN KEY
    --  FOREIGN KEY (campo_foreign_key) REFERENCES table_de_refenecia( campo_primary_key)
    --  FOREIGN KEY (autor_id) REFERENCES autores(autor_id)
CREATE TABLE libros(
    libro_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    autor_id INT UNSIGNED NOT NULL,
    titulo VARCHAR(60) NOT NULL,
    descripcion VARCHAR(250),
    paginas INTEGER UNSIGNED, 
    fecha_publicacion DATE NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp,
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id)
);



















-- DATA
INSERT INTO autores ( autor_id, nombre, apellido, seudomino, genero, fecha_nacimiento, pais_origen)
VALUES  ( 10, 'Isaac', 'Hernandez', 'Isa', 'M', '2027-06-06', 'Mexico'),
        ( null, 'Brandon', 'Hernandez', 'Brand', 'M', '2017-08-26', 'México'),
        ( null, 'Rodrigo', 'Cardoso', 'Rodri', 'M', '2023-07-17', 'México'),
        ( null, 'Aria', 'Sánchez', 'Ari', 'F', '2025-09-12', 'Canada' ),
        ( null, 'Matias', 'Henandez', 'Mat', 'M', '2026-08-03', 'Canada' ),
        ( null, 'Lorelai', 'Cardoso', 'Lore', 'F', '2024-06-06', 'México'),
        ( 7, 'Aaron', 'Sánchez', 'Aar', 'M', '2027-10-27', 'Nueva Zelenda' );