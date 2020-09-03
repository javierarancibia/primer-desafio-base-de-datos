-- 1. Crear Base de datos posts 
CREATE DATABASE posts;

-- 2. Crear tabla post, con los atributos id, nombre de usuario, fecha de creación, contenido, descripción 
CREATE TABLE post(id SERIAL, nombre_usuario VARCHAR(70), fecha_de_creacion DATE, contenido VARCHAR(70), descripcion VARCHAR(70), PRIMARY KEY(id));

-- 3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos" 
INSERT INTO post(nombre_usuario, fecha_de_creacion, contenido, descripcion) VALUES
('Pamela', '2020-08-12', 'Chile gana 3-0', 'Consulta partido de Chile'),
('Pamela', '2020-08-13', 'En verdad Chile gana 5-0', 'Consulta partido de Chile'),
('Carlos', '2020-08-11', 'Chile va a empatar a cero, no han jugado bien', 'Consulta partido de Chile');

-- Chequear que este bien creada
SELECT * FROM post;

-- 4. Modificar la tabla post, agregando la columna título 
ALTER TABLE post ADD COLUMN titulo VARCHAR(70);

-- 5. Agregar título a las publicaciones ya ingresadas
UPDATE post SET titulo='Partido de Chile' WHERE nombre_usuario='Pamela';
UPDATE post SET titulo='Partido de Chile' WHERE nombre_usuario='Carlos';

-- 6. Insertar 2 post para el usuario "Pedro" 
INSERT INTO post(nombre_usuario, fecha_de_creacion, contenido, descripcion, titulo) VALUES
('Pedro', '2020-08-12', 'Chile gana 6-0', 'Consulta partido de Chile', 'Partido de Chile'),
('Pedro', '2020-08-14', 'Vamos Chileeee', 'Consulta partido de Chile', 'Partido de Chile');

-- 7. Eliminar el post de Carlos
DELETE FROM post WHERE nombre_usuario='Carlos';

-- 8. Ingresar un nuevo post para el usuario "Carlos" 
INSERT INTO post(nombre_usuario, fecha_de_creacion, contenido, descripcion, titulo) VALUES
('Carlos', '2020-08-15', 'Chile gana 2-0', 'Consulta partido de Chile', 'Partido de Chile');

-- Parte 2
-- 9. Crear una nueva tabla, llamada comentarios, con los atributos id, fecha y hora de creación, contenido, que se relacione con la tabla posts. 
CREATE TABLE comentarios(id SERIAL, fecha DATE, hora TIME, contenido VARCHAR(100));
ALTER TABLE comentarios ADD usuario_id INT; -- se crea columna para linkear las dos tablas
ALTER TABLE comentarios ADD FOREIGN KEY(usuario_id) REFERENCES post(id); --se crea la llave foranea para relacionarlas


-- 10. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos" 
INSERT INTO comentarios(fecha, hora, contenido) VALUES
('2020-08-15', '19:30:20', 'Muy bien dicho Pamela!'),
('2020-08-15', '19:45:20', 'Esa Carlitos!'),
('2020-08-15', '20:30:15', 'Bien dicho Carlongas'), 
('2020-08-15', '20:30:45', 'Buenisimo Carlos');

-- 11. Crear un nuevo post para "Margarita" 
INSERT INTO post(nombre_usuario, fecha_de_creacion, contenido, descripcion, titulo) VALUES
('Margarita', '2020-08-15', 'Chile pierde 3-0', 'Consulta partido de Chile', 'Partido de Chile');


-- 12. Ingresar 5 comentarios para el post de Margarita. 
INSERT INTO comentarios(fecha, hora, contenido) VALUES
('2020-08-15', '19:30:20', 'Mala onda margarita!'),
('2020-08-15', '19:45:20', 'Nada que ver Margarita'),
('2020-08-15', '20:30:15', 'Vamos a ganar Margarita'), 
('2020-08-15', '20:30:45', 'Pa que tan negativa margarita'), 
('2020-08-16', '13:15:34', 'noooooo margaritaaa');

-- Se linkea el id del usuario en la columna usuario_id de la tabla comentarios 
UPDATE comentarios SET usuario_id=1 WHERE id=1;
UPDATE comentarios SET usuario_id=6 WHERE id=2;
UPDATE comentarios SET usuario_id=7 WHERE id=5;
UPDATE comentarios SET usuario_id=7 WHERE id=6;
UPDATE comentarios SET usuario_id=7 WHERE id=7;
UPDATE comentarios SET usuario_id=7 WHERE id=8;
UPDATE comentarios SET usuario_id=7 WHERE id=9;

