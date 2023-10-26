-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: db
-- ------------------------------------------------------
-- Server version	8.0.34-1ubuntu1

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
-- Table structure for table `corzina`
--

DROP TABLE IF EXISTS `corzina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corzina` (
  `idcorzina` int NOT NULL AUTO_INCREMENT,
  `quantity` varchar(45) DEFAULT NULL,
  `dish_iddish` int NOT NULL,
  PRIMARY KEY (`idcorzina`,`dish_iddish`),
  KEY `fk_corzina_dish_idx` (`dish_iddish`),
  CONSTRAINT `fk_corzina_dish` FOREIGN KEY (`dish_iddish`) REFERENCES `dish` (`iddish`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corzina`
--

LOCK TABLES `corzina` WRITE;
/*!40000 ALTER TABLE `corzina` DISABLE KEYS */;
/*!40000 ALTER TABLE `corzina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier`
--

DROP TABLE IF EXISTS `courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier` (
  `idcourier` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(12) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcourier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier`
--

LOCK TABLES `courier` WRITE;
/*!40000 ALTER TABLE `courier` DISABLE KEYS */;
/*!40000 ALTER TABLE `courier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `idcustomer` int NOT NULL AUTO_INCREMENT,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(319) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idcustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `iddish` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddish`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `idorder` int NOT NULL AUTO_INCREMENT,
  `address` varchar(300) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `corzina_idcorzina` int NOT NULL,
  `corzina_dish_iddish` int NOT NULL,
  `courier_idcourier` int NOT NULL,
  `customer_idcustomer` int NOT NULL,
  `restaurants_idrestaurants` int NOT NULL,
  PRIMARY KEY (`idorder`,`corzina_idcorzina`,`corzina_dish_iddish`,`courier_idcourier`,`customer_idcustomer`,`restaurants_idrestaurants`),
  KEY `fk_order_corzina1_idx` (`corzina_idcorzina`,`corzina_dish_iddish`),
  KEY `fk_order_courier1_idx` (`courier_idcourier`),
  KEY `fk_order_customer1_idx` (`customer_idcustomer`),
  KEY `fk_order_restaurants1_idx` (`restaurants_idrestaurants`),
  CONSTRAINT `fk_order_corzina1` FOREIGN KEY (`corzina_idcorzina`, `corzina_dish_iddish`) REFERENCES `corzina` (`idcorzina`, `dish_iddish`),
  CONSTRAINT `fk_order_courier1` FOREIGN KEY (`courier_idcourier`) REFERENCES `courier` (`idcourier`),
  CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customer_idcustomer`) REFERENCES `customer` (`idcustomer`),
  CONSTRAINT `fk_order_restaurants1` FOREIGN KEY (`restaurants_idrestaurants`) REFERENCES `restaurants` (`idrestaurants`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `idrestaurants` int NOT NULL AUTO_INCREMENT,
  `address` varchar(300) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `courier_idcourier` int NOT NULL,
  PRIMARY KEY (`idrestaurants`,`courier_idcourier`),
  KEY `fk_restaurants_courier1_idx` (`courier_idcourier`),
  CONSTRAINT `fk_restaurants_courier1` FOREIGN KEY (`courier_idcourier`) REFERENCES `courier` (`idcourier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-26 12:33:18
