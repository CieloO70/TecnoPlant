-- -----------------------------
-- Versión: 1
-- Fecha: 27 / 03 / 2024
-- DML: Tecnoplant
-- Descripción: Registros de prueba para la aplicación
-- -----------------------------

USE tecnoplant;

/* Usuario inicial de prueba */ 
INSERT INTO usuario (nombre, apellidoPaterno, apellidoMaterno, nombreUsuario, email, contrasenia, token, genero, estatus)
VALUES ('Elizabeth', 'García', 'Huerta', 'eligarcia', 'eligarcia@example.com', 'contraseña123', 'token123456', 'M', 1);

/* Plantas registradas de prueba */
-- Insertar planta 1
INSERT INTO planta (nombre, habitat, tipo, descripcion, cultivo, cuidado, estatus, fechaRegistro, foto, idUsuario)
VALUES ('Rosa', 'Jardín', 'Flor', 'La rosa es una planta ornamental muy popular debido a su belleza y fragancia.', 'Suelo bien drenado y soleado', 'Riego moderado, poda ligera para promover la floración', 1, NOW(), 'ruta/a/la/foto1.jpg', 1);

-- Insertar planta 2
INSERT INTO planta (nombre, habitat, tipo, descripcion, cultivo, cuidado, estatus, fechaRegistro, foto, idUsuario)
VALUES ('Helecho', 'Bosque', 'Follaje', 'Los helechos son plantas perennes que se caracterizan por sus frondes verdes.', 'Suelo húmedo y sombra parcial', 'Riego regular, humedad alta, poda para eliminar hojas muertas', 1, NOW(), 'ruta/a/la/foto2.jpg', 1);

SELECT * FROM planta;
