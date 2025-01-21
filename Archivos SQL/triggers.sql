-- TRIGGER VALIDAR PROVEEDOR

DELIMITER //
CREATE TRIGGER validar_proveedor
BEFORE INSERT ON proveedor
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM proveedor WHERE razon_social = NEW.razon_social AND id_proveedor != NEW.id_proveedor) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un proveedor con ese nombre';
    END IF;
END //
DELIMITER ;

-- TRIGGER VALIDAR CLIENTE DUPLICADO

use eben_ezer;

DELIMITER //
drop trigger if exists validar_cliente_duplicado//
CREATE TRIGGER validar_cliente_duplicado
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM cliente WHERE nombre = NEW.nombre AND apellido = NEW.apellido) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un cliente con ese nombre y apellido';
    END IF;
END //
DELIMITER ;


