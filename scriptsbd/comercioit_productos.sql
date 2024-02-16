use comercio;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: comercioit
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.29-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Precio` double NOT NULL,
  `Marca` int(11) NOT NULL,
  `Categoria` varchar(20) NOT NULL,
  `Presentacion` varchar(30) NOT NULL,
  `Stock` int(6) NOT NULL,
  PRIMARY KEY (`idProducto`,`Marca`),
  
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Marca`) REFERENCES `marcas` (`idMarca`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES 
(1, 'iPhone 6', 499.99, 1, 'Smartphone', '16GB', 500),
(2, 'iPad Pro', 599.99, 1, 'Smartphone', '128GB', 300),
(3, 'TV LG FG-5646', 1569.32, 4, 'Televisores', 'Sin Detalle', 300),
(4, 'Galaxy S7', 459.99, 2, 'Smartphone', '64GB', 200),
(5, 'Impresora T23', 489.99, 8, 'Impresoras', 'Color', 180),
(6, 'Impresora T33', 399, 8, 'Impresoras', 'Color', 200),
(8, 'Camara Digital 760', 649, 9, 'FotografÃ­a', 'Sin detalle', 150),
(9, 'Notebook CQ40-300', 2999, 7, 'Notebooks', 'Intel Core i3', 150),
(10, 'TV Samsung SR11256', 2356, 2, 'Televisores', 'Sin Detalle', 25),
(11, 'Frio Total 1256', 5698, 4, 'Heladeras', 'Sin Detalle', 50),
(12, 'GF Frio - 7812', 5678, 15, 'Heladeras', 'Sin Detalle', 30),
(13, 'GF Frio - 2563', 2348, 15, 'Heladeras', 'Sin Detalle', 10),
(14, 'GF Frio - 8712', 3232, 15, 'Heladeras', 'Sin Detalle', 25),
(15, 'GF Frio - 6222', 5859, 15, 'Heladeras', 'Sin Detalle', 52),
(16, 'Noblex TV 5646', 1569.32, 10, 'Televisores', 'Sin Detalle', 300),
(17, 'Plancha a vapor', 220, 15, 'Pequeños', 'Sin Detalle', 20),
(18, 'Afeitadora', 350, 15, 'Pequeños', 'Sin Detalle', 30),
(19, 'Batidora', 124, 15, 'Pequeños', 'Sin Detalle', 50),
(20, 'parlante', 220, 15, 'Pequeños', 'Sin Detalle', 15),
(21, 'TV Samsung Pantalla Plana', 6556, 2, 'Televis', 'Sin Detalle', 52),
(22, 'TV Samsung Pantalla Curva', 2665, 2, 'Televis', 'Sin Detalle', 52),
(23, 'TV Samsung Pantalla Diagonal', 1556, 2, 'Televis', 'Sin Detalle', 52),
(24, 'Print 1522 Casio', 1236, 4, 'Impr', 'Sin Detalle', 52),
(25, 'Photo PX2623', 1525, 5, 'Impr', 'Sin Detalle', 52);

/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-21 20:27:43 
