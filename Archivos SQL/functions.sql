-- funcion proveedor mas economico
USE eben_ezer;
DELIMITER //
CREATE FUNCTION proveedor_mas_economico(id_materia_prima INT)
RETURNS INT
deterministic
reads sql data
BEGIN
	DECLARE id_proveedor_mas_economico INT;
    DECLARE precio_minimo DECIMAL(10,2);

    SELECT 
        p.id_proveedor INTO id_proveedor_mas_economico
    FROM
        materia_prima_proveedor mpp
    INNER JOIN proveedor p ON mpp.id_proveedor = p.id_proveedor
    WHERE 
        mpp.id_materia_prima = id_materia_prima
    ORDER BY p.precio ASC
    LIMIT 1;

    RETURN id_proveedor_mas_economico;
END //
DELIMITER ;

--  funcion total de ventas del dia
USE eben_ezer;
DELIMITER //
CREATE FUNCTION total_ventas_hoy()
RETURNS DECIMAL(10,2)
reads sql data
BEGIN
    DECLARE total_ventas DECIMAL(10,2) DEFAULT 0;

    SELECT sum(total_venta) INTO total_ventas
    FROM venta
    WHERE DATE(fecha) = curdate();

    RETURN total_ventas;
END //
DELIMITER ;