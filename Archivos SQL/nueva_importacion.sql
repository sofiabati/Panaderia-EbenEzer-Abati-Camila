-- AGREGO DATOS TABLA PROVEEDOR
use eben_ezer;
insert into proveedor VALUES 
(1,20345678,"Molinos Argentinos SA","Juan Perez"),
(2,30789012,"Levadura del Plata","Maria Lopez"),
(3,27123456,"Sal del Norte S.R.L.","Pedro Gomez");

-- agrego datos tabla materia_prima
insert into materia_prima(id_materia_prima, descripcion, unidad_medida) VALUES
(1,"Harina de trigo","kg"),
(2,"Levadura seca","g"),
(3,"Sal","kg"),
(4,"Azucar","kg"),
(5,"Huevos","unidad"),
(6,"Crema pastelera","gr"),
(7,"manteca","gr"),
(8,"Queso tybo","kg"),
(9,"Queso Azul","kg"),
(10,"Queso Cremoso","kg"),
(11,"Almidon de mandioca","kg");

-- AGREGO DATOS TABLA MATERIA_PRIMA_PROVEEDOR
insert into materia_prima_proveedor (id_proveedor,id_materia_prima,cantidad,precio) VALUES
(1,1,50,10000),
(1,4,10,5000),
(1,3,2,2000),
(2,2,1000,6500),
(3,1,50,10500),
(3,3,2,1900),
(3,4,10,5200),
(3,5,36,8000),
(1,6,500,3500),
(2,7,1000,2000),
(3,8,3,15000),
(3,9,1,7500),
(3,10,3,12000),
(1,11,10,5000),
(2,11,10,6500);

-- agrego datos en tabla PRODUCTO
insert into producto (id_producto,nombre,descripcion,precio, unidad_medida) VALUES
(9,"Pan Frances","Pan blanco de miga suave",2500,"kg"),
(2,"Baguette","Pan francés alargado y crujiente",3000,"kg"),
(3,"Medialunas","Masa hojaldrada con relleno de dulce de leche",700,"unidad"),
(4,"Bizcochuelo","Bizcochuelo clásico para tortas",1500,"unidad"),
(5,"Facturas","Variedad de facturas dulces",750,"unidad"),
(6,"Criollo común","Bizcocho de grasa",3000,"kg"),
(7,"Criollo hojaldre","Bizcocho de grasa hojaldrado",3500,"kg"),
(8,"Chipa","Panificado base de almidón de mandioca y queso",15000,"kg");


-- agrego datos a la tabla PRODUCTO_MATERIA_PRIMA
insert into producto_materia_prima (id_producto_materia_prima,id_producto, id_materia_prima, cantidad) VALUES
(1,9,1,1),
(2,9,2,10),
(3,9,3,5),
(4,2,1,1.2),
(5,2,2,12),
(6,2,3,6),
(7,3,1,0.5),
(8,3,2,5),
(9,4,1,0.5),
(10,4,2,10),
(11,4,4,0.25),
(12,4,5,5),
(13,5,1,0.1),
(14,5,4,0.1),
(15,5,5,1),
(16,5,6,30),
(17,6,7,300),
(18,3,7,15),
(19,6,1,1),
(20,6,2,50),
(21,7,7,300),
(22,7,1,1),
(23,7,2,50),
(24,8,11,0.5),
(25,8,3,0.25),
(26,8,8,0.2),
(27,8,9,0.1),
(28,8,10,0.3),
(29,8,5,5);

-- agrego datos a la tabla categoria_personal
insert into categoria_personal (id_categoria,desxripcion) VALUES
(1,"Encargado"),
(2,"Cajero"),
(3,"Vendedor");

-- agrego datos en la tabla personal

insert into personal (id_personal,nombre,apellido,mail,cuil,id_categoria) VALUES
(1,"Juan","Pérez","juanperez@example.com",345678912,1),
(2,"María","López","marialopez@example.com",123456789,2),
(3,"Pedro","Gómez","pedrogomez@example.com",789012345,3),
(4,"Ana","García","anagarcia@example.com",154321098,1),
(5,"Carlos","Rodríguez","carlosrodriguez@example.com",978543210,2),
(6,"Sofía","Martínez","sofiamartinez@example.com",876543210,3),
(7,"Diego","Fernández","diegofernandez@example.com",765432109,1),
(8,"Laura","González","lauragonzalez@example.com",654321098,2),
(9,"Lucas","Silva","lucassilva@example.com",543210987,3),
(10,"Valentina","Torres","valentinatorres@example.com",432109876,1),
(11,"Camila","Castro","camilacastro@example.com",543210765,2),
(12,"Benjamín","Díaz","benjamindiaz@example.com",572109654,3),
(13,"Emilia","Romero","emiliaromero@example.com",601098543,1),
(14,"Mateo","Sánchez","mateosanchez@example.com",630987432,2),
(15,"Victoria","Jiménez","victoriajimenez@example.com",098765432,3);

-- agreggo datos a la tabla cliente
insert into cliente (id_cliente,nombre,apellido,mail) VALUES
(1,"Juan","Pérez","juan.perez@example.com"),
(2,"María","López","maria.lopez@example.com"),
(3,"Pedro","Gómez","pedro.gomez@example.com"),
(4,"Ana","García","ana.garcia@example.com"),
(5,"Carlos","Rodríguez","carlos.rodriguez@example.com"),
(6,"Sofía","Martínez","sofia.martinez@example.com"),
(7,"Diego","Fernández","diego.fernandez@example.com"),
(8,"Laura","González","laura.gonzalez@example.com"),
(9,"Lucas","Silva","lucas.silva@example.com"),
(10,"Valentina","Torres","valentina.torres@example.com"),
(11,"Camila","Castro","camila.castro@example.com"),
(12,"Benjamín","Díaz","benjamin.diaz@example.com"),
(13,"Emilia","Romero","emilia.romero@example.com"),
(14,"Mateo","Sánchez","mateo.sanchez@example.com"),
(15,"Victoria","Jiménez","victoria.jimenez@example.com"),
(16,"Gabriel","Ramírez","gabriel.ramirez@example.com"),
(17,"Daniela","Ruiz","daniela.ruiz@example.com"),
(18,"Nicolás","Hernández","nicolas.hernandez@example.com"),
(19,"Camila","Álvarez","camila.alvarez@example.com"),
(20,"Santiago","Muñoz","santiago.munoz@example.com"),
(21,"Lucía","Gómez","lucia.gomez@example.com"),
(22,"Agustín","Martínez","agustin.martinez@example.com"),
(23,"Sofía","González","sofia.gonzalez@example.com"),
(24,"Mateo","López","mateo.lopez@example.com"),
(25,"Valentina","Pérez","valentina.perez@example.com"),
(26,"Benjamín","García","benjamin.garcia@example.com"),
(27,"Emilia","Rodríguez","emilia.rodriguez@example.com"),
(28,"Nicolás","Fernández","nicolas.fernandez@example.com");

-- agrego datos a la tabla local
insert into local (descripcion,direccion,telefono) VALUES
("Sucursal Centro","Calle Colon 123",3514567890),
("Local Nueva Cordoba","Av. Chacabuco 543",3511234567),
("Sucursal Barrio Jardin","Av. Las Heras 789",3519876543);

-- agrego datos a la tabla producto_venta
insert into producto_venta (id_producto_venta,id_producto,cantidad) VALUES
(1,2,2),
(2,4,3),
(3,8,0.5),
(4,6,1),
(5,3,6);

-- agrego datos a la tabla ventas
insert into venta (id_producto_venta,id_cliente,id_personal,id_local,fecha) VALUES
(1,3,4,1,"2024-12-10"),
(2,1,1,2,"2024-12-11"),
(3,2,6,3,"2024-12-15"),
(4,12,3,3,"2024-12-20"),
(5,15,5,2,"2024-12-21");

