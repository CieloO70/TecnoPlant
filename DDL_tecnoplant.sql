-- -----------------------------
-- Versión: 2
-- Modificaciones: Se cambiaron los campos de la tabla Planta y se corrigio la tabla alerta, se agrego la tabla notificación.
-- Fecha: 20 / 03 / 2024
-- DDL: Tecnoplant
-- -----------------------------

DROP DATABASE IF EXISTS tecnoplant;

CREATE DATABASE tecnoplant;

USE tecnoplant;

-- Tabla Usuario
CREATE TABLE usuario(
	idUsuario 			INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre 				VARCHAR (60) NOT NULL,
    apellidoPaterno 	VARCHAR (45) NOT NULL,
    apellidoMaterno 	VARCHAR (45) NOT NULL DEFAULT '',
    nombreUsuario 		VARCHAR (40) NOT NULL DEFAULT '',
    email 				VARCHAR (60) NOT NULL DEFAULT '',
    contrasenia 		VARCHAR (30) NOT NULL DEFAULT '',
    token 				VARCHAR (32) NOT NULL DEFAULT '',
    genero 				VARCHAR (2) NOT NULL, -- M: Masculino, F: Femenino, O: Otro
    estatus 			INT NOT NULL DEFAULT 1 -- 0: Inactivo; 1: Activo
);

-- Tabla Planta
CREATE TABLE planta(
	idPlanta 			INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre 				VARCHAR (40) NOT NULL,
    habitat 			VARCHAR (40) NOT NULL DEFAULT '',
    tipo 				VARCHAR (30) NOT NULL DEFAULT '',
    descripcion 		VARCHAR (100) NOT NULL DEFAULT '',
    cultivo 			VARCHAR (100) NOT NULL DEFAULT '',
    cuidado 			VARCHAR (100) NOT NULL DEFAULT '',
    estatus 			INT NOT NULL DEFAULT 1, -- 0: Inactivo, 1: Activo,
    fechaRegistro 		DATETIME NOT NULL,
    foto 				LONGTEXT NOT NULL,
    idUsuario 			INT NOT NULL,
    CONSTRAINT fk_idUsuario_planta
    FOREIGN KEY (idUsuario)
    REFERENCES usuario (idUsuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Tabla recordatorio
CREATE TABLE recordatorio(
	idRecordatorio 				INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    frecuenciaRiego 			VARCHAR (40) NOT NULL,
    frecuenciaPoda				VARCHAR (40) NOT NULL,
    frecuenciaFertilizacion		VARCHAR (40) NOT NULL,
	descripcion 				VARCHAR (200) NOT NULL DEFAULT '',
    fechaHoraAgregado 			DATETIME NOT NULL,						-- Fecha y hora a la que se agrego el recordatorio
    horaNotificacion 			TIME NOT NULL,							-- Hora a la que se mostrara la notificación
    repeticionNotificacion		VARCHAR(60) NOT NULL,					-- Frecuencia con las que se mostrara la notificación. 
    estatus 					INT NOT NULL DEFAULT 1, 				-- 0: Inactivo, 1: Activo
    idPlanta 					INT NOT NULL,
    idUsuario 					INT NOT NULL,
    CONSTRAINT fk_idPlanta_recordatorio
    FOREIGN KEY (idPlanta)
    REFERENCES planta (idPlanta)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_idUsuario_recordatorio
    FOREIGN KEY (idUsuario)
    REFERENCES usuario (idUsuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Tabla sensor (Medida de temperatura, humedad, luz y movimiento)
CREATE TABLE sistema_sensor(
	idSistema 			INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fechaHora 			DATETIME NOT NULL,
    temperatura 		VARCHAR (10) NOT NULL,
    humedad 			VARCHAR (10) NOT NULL,
    luz 				VARCHAR (10) NOT NULL,
    movimiento 			VARCHAR (10) NOT NULL,
    idUsuario 			INT NOT NULL,
	CONSTRAINT fk_idUsuario_sistema
    FOREIGN KEY (idUsuario)
    REFERENCES usuario (idUsuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Tabla Cuidado (Medidas de cuidado para plantas en general)
-- Problemas comunes de plantas, su causa, tratamiento y prevención
CREATE TABLE cuidado(
	idMedidaCuidado 	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descripcion 		VARCHAR (80) NOT NULL,
    plantas 			VARCHAR (100) NOT NULL, -- Plantas o especies que presentan este problema
    causa 				VARCHAR (255) NOT NULL DEFAULT '', 
    tratamiento 		VARCHAR (255) NOT NULL DEFAULT '',
    prevencion 			VARCHAR (255) NOT NULL DEFAULT '',
    foto 				LONGTEXT NOT NULL
);

