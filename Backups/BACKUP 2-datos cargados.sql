-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: eben_ezer
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria_personal`
--

DROP TABLE IF EXISTS `categoria_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_personal` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `desxripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_personal`
--

LOCK TABLES `categoria_personal` WRITE;
/*!40000 ALTER TABLE `categoria_personal` DISABLE KEYS */;
INSERT INTO `categoria_personal` VALUES (1,'Encargado'),(2,'Cajero'),(3,'Vendedor');
/*!40000 ALTER TABLE `categoria_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan','Pérez','juan.perez@example.com'),(2,'María','López','maria.lopez@example.com'),(3,'Pedro','Gómez','pedro.gomez@example.com'),(4,'Ana','García','ana.garcia@example.com'),(5,'Carlos','Rodríguez','carlos.rodriguez@example.com'),(6,'Sofía','Martínez','sofia.martinez@example.com'),(7,'Diego','Fernández','diego.fernandez@example.com'),(8,'Laura','González','laura.gonzalez@example.com'),(9,'Lucas','Silva','lucas.silva@example.com'),(10,'Valentina','Torres','valentina.torres@example.com'),(11,'Camila','Castro','camila.castro@example.com'),(12,'Benjamín','Díaz','benjamin.diaz@example.com'),(13,'Emilia','Romero','emilia.romero@example.com'),(14,'Mateo','Sánchez','mateo.sanchez@example.com'),(15,'Victoria','Jiménez','victoria.jimenez@example.com'),(16,'Gabriel','Ramírez','gabriel.ramirez@example.com'),(17,'Daniela','Ruiz','daniela.ruiz@example.com'),(18,'Nicolás','Hernández','nicolas.hernandez@example.com'),(19,'Camila','Álvarez','camila.alvarez@example.com'),(20,'Santiago','Muñoz','santiago.munoz@example.com'),(21,'Lucía','Gómez','lucia.gomez@example.com'),(22,'Agustín','Martínez','agustin.martinez@example.com'),(23,'Sofía','González','sofia.gonzalez@example.com'),(24,'Mateo','López','mateo.lopez@example.com'),(25,'Valentina','Pérez','valentina.perez@example.com'),(26,'Benjamín','García','benjamin.garcia@example.com'),(27,'Emilia','Rodríguez','emilia.rodriguez@example.com'),(28,'Nicolás','Fernández','nicolas.fernandez@example.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Curso_SQL_coder`@`%`*/ /*!50003 TRIGGER `validar_cliente_duplicado` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM cliente WHERE nombre = NEW.nombre AND apellido = NEW.apellido) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un cliente con ese nombre y apellido';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local` (
  `id_local` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_local`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
INSERT INTO `local` VALUES (1,'Sucursal Centro','Calle Colon 123','3514567890'),(2,'Local Nueva Cordoba','Av. Chacabuco 543','3511234567'),(3,'Sucursal Barrio Jardin','Av. Las Heras 789','3519876543');
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_prima`
--

DROP TABLE IF EXISTS `materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_prima` (
  `id_materia_prima` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `unidad_medida` varchar(10) NOT NULL,
  PRIMARY KEY (`id_materia_prima`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_prima`
--

LOCK TABLES `materia_prima` WRITE;
/*!40000 ALTER TABLE `materia_prima` DISABLE KEYS */;
INSERT INTO `materia_prima` VALUES (1,'Harina de trigo','kg'),(2,'Levadura seca','g'),(3,'Sal','kg'),(4,'Azucar','kg'),(5,'Huevos','unidad'),(6,'Crema pastelera','gr'),(7,'manteca','gr'),(8,'Queso tybo','kg'),(9,'Queso Azul','kg'),(10,'Queso Cremoso','kg'),(11,'Almidon de mandioca','kg');
/*!40000 ALTER TABLE `materia_prima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_prima_proveedor`
--

DROP TABLE IF EXISTS `materia_prima_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_prima_proveedor` (
  `id_materia_prima_proveedor` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `id_materia_prima` int NOT NULL,
  `cantidad` decimal(10,0) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_materia_prima_proveedor`),
  KEY `fk_proveedor_materia_prima` (`id_proveedor`),
  KEY `fk_materia_prima_proveedor` (`id_materia_prima`),
  CONSTRAINT `fk_materia_prima_proveedor` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`) ON DELETE CASCADE,
  CONSTRAINT `fk_proveedor_materia_prima` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_prima_proveedor`
--

LOCK TABLES `materia_prima_proveedor` WRITE;
/*!40000 ALTER TABLE `materia_prima_proveedor` DISABLE KEYS */;
INSERT INTO `materia_prima_proveedor` VALUES (1,1,1,50,10000),(2,1,4,10,5000),(3,1,3,2,2000),(4,2,2,1000,6500),(5,3,1,50,10500),(6,3,3,2,1900),(7,3,4,10,5200),(8,3,5,36,8000),(9,1,6,500,3500),(10,2,7,1000,2000),(11,3,8,3,15000),(12,3,9,1,7500),(13,3,10,3,12000),(14,1,11,10,5000),(15,2,11,10,6500);
/*!40000 ALTER TABLE `materia_prima_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `id_personal` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `cuil` int NOT NULL,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_personal`),
  UNIQUE KEY `mail` (`mail`),
  KEY `fk_personal_categoria` (`id_categoria`),
  CONSTRAINT `fk_personal_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_personal` (`id_categoria`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Juan','Pérez','juanperez@example.com',345678912,1),(2,'María','López','marialopez@example.com',123456789,2),(3,'Pedro','Gómez','pedrogomez@example.com',789012345,3),(4,'Ana','García','anagarcia@example.com',154321098,1),(5,'Carlos','Rodríguez','carlosrodriguez@example.com',978543210,2),(6,'Sofía','Martínez','sofiamartinez@example.com',876543210,3),(7,'Diego','Fernández','diegofernandez@example.com',765432109,1),(8,'Laura','González','lauragonzalez@example.com',654321098,2),(9,'Lucas','Silva','lucassilva@example.com',543210987,3),(10,'Valentina','Torres','valentinatorres@example.com',432109876,1),(11,'Camila','Castro','camilacastro@example.com',543210765,2),(12,'Benjamín','Díaz','benjamindiaz@example.com',572109654,3),(13,'Emilia','Romero','emiliaromero@example.com',601098543,1),(14,'Mateo','Sánchez','mateosanchez@example.com',630987432,2),(15,'Victoria','Jiménez','victoriajimenez@example.com',98765432,3);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `unidad_medida` varchar(10) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (2,'Baguette','Pan francés alargado y crujiente',3000,'kg'),(3,'Medialunas','Masa hojaldrada con relleno de dulce de leche',700,'unidad'),(4,'Bizcochuelo','Bizcochuelo clásico para tortas',1500,'unidad'),(5,'Facturas','Variedad de facturas dulces',750,'unidad'),(6,'Criollo común','Bizcocho de grasa',3000,'kg'),(7,'Criollo hojaldre','Bizcocho de grasa hojaldrado',3500,'kg'),(8,'Chipa','Panificado base de almidón de mandioca y queso',15000,'kg'),(9,'Pan Frances','Pan blanco de miga suave',2500,'kg');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_materia_prima`
--

DROP TABLE IF EXISTS `producto_materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_materia_prima` (
  `id_producto_materia_prima` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_materia_prima` int NOT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_producto_materia_prima`),
  KEY `fk_materia_prima_producto` (`id_materia_prima`),
  KEY `fk_producto_materia_prima` (`id_producto`),
  CONSTRAINT `fk_materia_prima_producto` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`) ON DELETE CASCADE,
  CONSTRAINT `fk_producto_materia_prima` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_materia_prima`
--

LOCK TABLES `producto_materia_prima` WRITE;
/*!40000 ALTER TABLE `producto_materia_prima` DISABLE KEYS */;
INSERT INTO `producto_materia_prima` VALUES (1,9,1,1.00),(2,9,2,10.00),(3,9,3,5.00),(4,2,1,1.20),(5,2,2,12.00),(6,2,3,6.00),(7,3,1,0.50),(8,3,2,5.00),(9,4,1,0.50),(10,4,2,10.00),(11,4,4,0.25),(12,4,5,5.00),(13,5,1,0.10),(14,5,4,0.10),(15,5,5,1.00),(16,5,6,30.00),(17,6,7,300.00),(18,3,7,15.00),(19,6,1,1.00),(20,6,2,50.00),(21,7,7,300.00),(22,7,1,1.00),(23,7,2,50.00),(24,8,11,0.50),(25,8,3,0.25),(26,8,8,0.20),(27,8,9,0.10),(28,8,10,0.30),(29,8,5,5.00);
/*!40000 ALTER TABLE `producto_materia_prima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_venta`
--

DROP TABLE IF EXISTS `producto_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_venta` (
  `id_producto_venta` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_producto_venta`),
  KEY `fk_producto_venta` (`id_producto`),
  CONSTRAINT `fk_producto_venta` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_venta`
--

LOCK TABLES `producto_venta` WRITE;
/*!40000 ALTER TABLE `producto_venta` DISABLE KEYS */;
INSERT INTO `producto_venta` VALUES (1,2,2.00),(2,4,3.00),(3,8,0.50),(4,6,1.00),(5,3,6.00);
/*!40000 ALTER TABLE `producto_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `cuit` int NOT NULL,
  `razon_social` varchar(100) NOT NULL,
  `encargado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,20345678,'Molinos Argentinos SA','Juan Perez'),(2,30789012,'Levadura del Plata','Maria Lopez'),(3,27123456,'Sal del Norte S.R.L.','Pedro Gomez');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Curso_SQL_coder`@`%`*/ /*!50003 TRIGGER `validar_proveedor` BEFORE INSERT ON `proveedor` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM proveedor WHERE razon_social = NEW.razon_social AND id_proveedor != NEW.id_proveedor) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un proveedor con ese nombre';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_producto_venta` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_personal` int NOT NULL,
  `id_local` int NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_venta_producto_venta` (`id_producto_venta`),
  KEY `fk_venta_personal` (`id_personal`),
  KEY `fk_venta_cliente` (`id_cliente`),
  KEY `fk_venta_local` (`id_local`),
  CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `fk_venta_local` FOREIGN KEY (`id_local`) REFERENCES `local` (`id_local`) ON UPDATE CASCADE,
  CONSTRAINT `fk_venta_personal` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`) ON UPDATE CASCADE,
  CONSTRAINT `fk_venta_producto_venta` FOREIGN KEY (`id_producto_venta`) REFERENCES `producto_venta` (`id_producto_venta`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,3,4,1,'2024-12-10'),(2,2,1,1,2,'2024-12-11'),(3,3,2,6,3,'2024-12-15'),(4,4,12,3,3,'2024-12-20'),(5,5,15,5,2,'2024-12-21');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ventas_hoy`
--

DROP TABLE IF EXISTS `ventas_hoy`;
/*!50001 DROP VIEW IF EXISTS `ventas_hoy`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventas_hoy` AS SELECT 
 1 AS `id_venta`,
 1 AS `id_producto_venta`,
 1 AS `id_cliente`,
 1 AS `id_personal`,
 1 AS `id_local`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ventas_por_local`
--

DROP TABLE IF EXISTS `ventas_por_local`;
/*!50001 DROP VIEW IF EXISTS `ventas_por_local`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventas_por_local` AS SELECT 
 1 AS `id_local`,
 1 AS `count(id_venta)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ventas_por_producto`
--

DROP TABLE IF EXISTS `vw_ventas_por_producto`;
/*!50001 DROP VIEW IF EXISTS `vw_ventas_por_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ventas_por_producto` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre`,
 1 AS `cantidad_vendida`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'eben_ezer'
--

--
-- Dumping routines for database 'eben_ezer'
--
/*!50003 DROP FUNCTION IF EXISTS `proveedor_mas_economico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Curso_SQL_coder`@`%` FUNCTION `proveedor_mas_economico`(id_materia_prima INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_ventas_hoy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Curso_SQL_coder`@`%` FUNCTION `total_ventas_hoy`() RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE total_ventas DECIMAL(10,2) DEFAULT 0;

    SELECT sum(total_venta) INTO total_ventas
    FROM venta
    WHERE DATE(fecha) = curdate();

    RETURN total_ventas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_nueva_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Curso_SQL_coder`@`%` PROCEDURE `registrar_nueva_venta`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_materias_primas_mas_economicas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Curso_SQL_coder`@`%` PROCEDURE `sp_materias_primas_mas_economicas`()
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ventas_hoy`
--

/*!50001 DROP VIEW IF EXISTS `ventas_hoy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Curso_SQL_coder`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_hoy` AS select `v`.`id_venta` AS `id_venta`,`v`.`id_producto_venta` AS `id_producto_venta`,`v`.`id_cliente` AS `id_cliente`,`v`.`id_personal` AS `id_personal`,`v`.`id_local` AS `id_local`,`v`.`fecha` AS `fecha` from `venta` `v` where (dayofmonth(`v`.`fecha`) = dayofmonth(now())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventas_por_local`
--

/*!50001 DROP VIEW IF EXISTS `ventas_por_local`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Curso_SQL_coder`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_por_local` AS select `v`.`id_local` AS `id_local`,count(`v`.`id_venta`) AS `count(id_venta)` from `venta` `v` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ventas_por_producto`
--

/*!50001 DROP VIEW IF EXISTS `vw_ventas_por_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Curso_SQL_coder`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ventas_por_producto` AS select `p`.`id_producto` AS `id_producto`,`p`.`nombre` AS `nombre`,sum(`pv`.`cantidad`) AS `cantidad_vendida` from (`producto` `p` join `producto_venta` `pv` on((`p`.`id_producto` = `pv`.`id_producto`))) group by `p`.`id_producto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-21  5:31:49
