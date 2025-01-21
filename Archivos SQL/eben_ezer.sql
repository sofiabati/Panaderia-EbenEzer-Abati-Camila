DROP DATABASE IF EXISTS eben_ezer;
CREATE DATABASE eben_ezer;

USE eben_ezer;

-- CREACIÓN DE TABLAS
CREATE TABLE eben_ezer.materia_prima(
id_materia_prima INT NOT NULL auto_increment PRIMARY KEY,
descripcion varchar(100) NOT NULL,
unidad_medida varchar(10) NOT NULL);

CREATE TABLE eben_ezer.proveedor(
id_proveedor INT NOT NULL auto_increment PRIMARY KEY,
cuit int NOT NULL,
razon_social varchar(100) NOT NULL,
encargado varchar(50) NOT NULL);

CREATE TABLE eben_ezer.producto(
id_producto INT NOT NULL auto_increment PRIMARY KEY,
nombre varchar(100) NOT NULL,
descripcion varchar(100) NOT NULL,
precio decimal NOT NULL,
unidad_medida varchar(10) NOT NULL);

CREATE TABLE eben_ezer.categoria_personal(
id_categoria INT NOT NULL auto_increment PRIMARY KEY,
desxripcion varchar(50) NOT NULL);

CREATE TABLE eben_ezer.personal(
id_personal INT NOT NULL auto_increment PRIMARY KEY,
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL,
mail varchar(50) NOT NULL unique,
cuil int NOT NULL, 
id_categoria int);

CREATE TABLE eben_ezer.local(
id_local INT NOT NULL auto_increment PRIMARY KEY,
descripcion varchar(100) NOT NULL,
direccion varchar(100) NOT NULL,
telefono int NOT NULL);

CREATE TABLE eben_ezer.cliente(
id_cliente INT NOT NULL auto_increment PRIMARY KEY,
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL,
mail varchar(50) NOT NULL unique);

CREATE TABLE eben_ezer.materia_prima_proveedor(
id_materia_prima_proveedor INT NOT NULL auto_increment PRIMARY KEY,
id_proveedor int NOT NULL,
id_materia_prima int NOT NULL,
cantidad decimal NOT NULL,
precio decimal NOT null);

CREATE TABLE eben_ezer.producto_materia_prima(
id_producto_materia_prima INT NOT NULL auto_increment PRIMARY KEY,
id_producto int NOT NULL,
id_materia_prima int NOT NULL,
cantidad decimal NOT NULL);

CREATE TABLE eben_ezer.producto_venta(
id_producto_venta INT NOT NULL auto_increment PRIMARY KEY,
-- id_venta INT NOT NULL,
id_producto int NOT NULL,
cantidad decimal NOT NULL);

CREATE TABLE eben_ezer.venta(
id_venta INT NOT NULL auto_increment PRIMARY KEY,
id_producto_venta int NOT NULL,
id_cliente int NOT NULL,
id_personal int NOT NULL,
id_local int NOT NULL,
fecha datetime default(current_timestamp));

-- AGREGA FK

ALTER TABLE eben_ezer.personal
ADD CONSTRAINT fk_personal_categoria
FOREIGN KEY(id_categoria) REFERENCES categoria_personal(id_categoria)on update cascade;

ALTER TABLE eben_ezer.materia_prima_proveedor
ADD CONSTRAINT fk_proveedor_materia_prima
FOREIGN KEY(id_proveedor) REFERENCES proveedor(id_proveedor)on delete cascade;

ALTER TABLE eben_ezer.materia_prima_proveedor
ADD CONSTRAINT fk_materia_prima_proveedor
FOREIGN KEY(id_materia_prima) REFERENCES materia_prima(id_materia_prima)on delete cascade;

ALTER TABLE eben_ezer.producto_materia_prima
ADD CONSTRAINT fk_materia_prima_producto
FOREIGN KEY(id_materia_prima) REFERENCES materia_prima(id_materia_prima)on delete cascade;

ALTER TABLE eben_ezer.producto_materia_prima
ADD CONSTRAINT fk_producto_materia_prima
FOREIGN KEY(id_producto) REFERENCES producto(id_producto) on delete cascade;

ALTER TABLE eben_ezer.producto_venta
ADD CONSTRAINT fk_producto_venta
FOREIGN KEY(id_producto) REFERENCES producto(id_producto) on update cascade;

-- ALTER TABLE eben_ezer.producto_venta
-- ADD CONSTRAINT fk_venta_producto
-- FOREIGN KEY(id_venta) REFERENCES venta(id_venta)on update cascade;

ALTER TABLE eben_ezer.venta
ADD CONSTRAINT fk_venta_producto_venta
FOREIGN KEY(id_producto_venta) REFERENCES producto_venta(id_producto_venta)on update cascade;

ALTER TABLE eben_ezer.venta
ADD CONSTRAINT fk_venta_personal
FOREIGN KEY(id_personal) REFERENCES personal(id_personal)on update cascade;

ALTER TABLE eben_ezer.venta
ADD CONSTRAINT fk_venta_cliente
FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente)on update cascade;

ALTER TABLE eben_ezer.venta
ADD CONSTRAINT fk_venta_local
FOREIGN KEY(id_local) REFERENCES local(id_local) on update cascade;

---------------------------------------------
-- Creacion de vistas

CREATE view ventas_hoy AS
SELECT * from eben_ezer.venta v
where day(V.fecha) = day(current_timestamp());

create view ventas_por_local AS
select distinct id_local, count(id_venta)
from eben_ezer.venta v;


-- creacion de funciones

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

-- -------------------------------------------------------------------
-- creación de procedimientos
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

-- ----------------creación de triggers-----------------------------

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


