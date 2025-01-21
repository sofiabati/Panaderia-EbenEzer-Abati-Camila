-- PROCEDURE MATERIAS PRIMAS MAS ECONÓMICAS  

USE eben_ezer;
DELIMITER //
DROP PROCEDURE IF EXISTS sp_materias_primas_mas_economicas//
CREATE PROCEDURE sp_materias_primas_mas_economicas()
BEGIN
    -- Crear una tabla temporal para almacenar los resultados
    CREATE temporary table agg_data
    SELECT 
        id_materia_prima,
        descripcion,
        MIN(precio) AS precio_minimo
        -- id_proveedor
        FROM (
		SELECT mp.id_materia_prima as id_materia_prima,
        mp.descripcion as descripcion,
        mpp.precio as precio
        -- mpp.id_proveedor as id_proveedor
        FROM materia_prima mp
		INNER JOIN materia_prima_proveedor mpp ON mp.id_materia_prima = mpp.id_materia_prima) AS mat_prima
    GROUP BY id_materia_prima, descripcion;

    SELECT * FROM agg_data;

    DROP TABLE if exists agg_data;
END//

DELIMITER //

-- PROCEDURE REGISTRAR NUEVA VENTA 

use eben_ezer;
DELIMITER //
drop procedure if exists registrar_nueva_venta//
CREATE PROCEDURE registrar_nueva_venta(
	IN p_id_producto INT,
    IN p_cantidad INT,
    IN p_id_cliente INT,
    IN p_id_personal INT,
    IN p_id_local INT,
    IN p_fecha DATE
)
BEGIN
	declare p_id_producto_venta INT; 
    
    INSERT INTO eben_ezer.producto_venta (
		id_producto,
        cantidad)
        values(p_id_producto,
        p_cantidad);
-- se asigna el id_producto_venta del producto insertado  
    select LAST_INSERT_ID() as p_id_producto_venta
    from eben_ezer.producto_venta;
	
    INSERT INTO eben_ezer.venta (
        id_producto_venta,
        id_cliente,
        id_personal,
        id_local,
        fecha
    )
    VALUES (
        p_id_producto_venta,
        p_id_cliente,
        p_id_personal,
        p_id_local,
        p_fecha
    );
END //
DELIMITER ;
