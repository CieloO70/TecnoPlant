-- -----------------------------
-- Versión: 1
-- Fecha: 27 / 03 / 2024
-- DDL: Tecnoplant_Vistas
-- Descripción: Vistas necesarias para la aplicación (vista recordatorios)
-- -----------------------------

USE tecnoplant;

-- Vista de plantas
DROP VIEW IF EXISTS v_plantas;
CREATE VIEW v_plantas AS
	SELECT 
		p.idPlanta,
		p.nombre,
		p.habitat,
		p.tipo,
		p.descripcion,
		p.cultivo,
		p.cuidado,
		p.estatus,
		p.fechaRegistro
	FROM planta p;


-- Vista de recordatorios 
DROP VIEW IF EXISTS v_recordatorios;

CREATE VIEW v_recordatorios AS
	SELECT 
		r.idRecordatorio,
        r.frecuenciaRiego,
        r.frecuenciaPoda,
        r.frecuenciaFertilizacion,
        r.descripcion,
        r.horaNotificacion,
        r.repeticionNotificacion,
        r.estatus,
        p.idPlanta,
        p.nombre,
        p.foto,
        u.idUsuario,
        u.nombre AS nombreUsuario,
        u.apellidoPaterno,
        u.apellidoMaterno
	FROM
		recordatorio r
	INNER JOIN 
		planta p ON r.idPlanta = p.idPlanta
	INNER JOIN 
		usuario u ON r.idUsuario = u.idUsuario;
        
SELECT * FROM v_recordatorios WHERE estatus = 1;
        