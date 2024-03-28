-- -----------------------------
-- Versión: 1
-- Fecha: 27 / 03 / 2024
-- DDL: Tecnoplant_StoredProcedure
-- Descripción: Procedures necesarios para la aplicación (generarRecordatorio)
-- -----------------------------

USE tecnoplant;

-- Procedimiento almacenado para insertar un Recordatorio
DROP PROCEDURE IF EXISTS generarRecordatorio;
DELIMITER $$
CREATE PROCEDURE generarRecordatorio( /*Datos del recordatorio*/
									IN var_frecuenciaRiego VARCHAR (40),			-- 1
                                    IN var_frecuenciaPoda VARCHAR (40),				-- 2
									IN var_frecuenciaFertilizacion VARCHAR (40),	-- 3
                                    IN var_descripcion VARCHAR (200),				-- 4
                                   
                                    
                                    /*Datos relacionados con la notificación*/
                                    IN var_horaNotificacion TIME,					-- 5
                                    IN var_repeticionNotificacion VARCHAR (60),		-- 6
									
                                     IN var_idPlanta INT,							-- 7
                                    IN var_idUsuario INT,							-- 8
                                    
                                    /*Parametro de salida*/
                                    OUT var_idRecordatorio INT						-- 9
									)
	BEGIN
    
		-- Insertar datos a la tabla Recordatorio
		INSERT INTO recordatorio (frecuenciaRiego, frecuenciaPoda, frecuenciaFertilizacion, descripcion, fechaHoraAgregado, horaNotificacion, repeticionNotificacion, idPlanta, idUsuario)
		VALUES (var_frecuenciaRiego, var_frecuenciaPoda, var_frecuenciaFertilizacion, var_descripcion, NOW(), var_horaNotificacion, var_repeticionNotificacion, var_idPlanta, var_idUsuario);
            
		-- Obtener el ID de Recordatorio generado
		SET var_idRecordatorio = LAST_INSERT_ID();
		
	END
$$ DELIMITER ;

-- Declaración de variables para almacenar el resultado del procedimiento
SET @idRecordatorio := 0;

-- Llamada al procedimiento
CALL generarRecordatorio('diaria', 'semanal', 'mensual', 'Recordatorio de prueba', '10:00:00', 'diaria', 1, 1, @idRecordatorio);

-- Mostrar el resultado
SELECT @idRecordatorio AS idRecordatorio;

SELECT * FROM recordatorio;
	
            
            