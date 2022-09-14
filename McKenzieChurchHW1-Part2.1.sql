-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: airplane_maintenance
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `airplane`
--

DROP TABLE IF EXISTS `airplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane` (
  `registration_num` char(5) NOT NULL,
  `model` varchar(10) NOT NULL,
  `capacity` decimal(10,2) DEFAULT NULL,
  `weight` int DEFAULT NULL,
  PRIMARY KEY (`registration_num`),
  UNIQUE KEY `registration_num` (`registration_num`),
  CONSTRAINT `airplane_ibfk_1` FOREIGN KEY (`registration_num`) REFERENCES `plane_service` (`registration_num`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane`
--

LOCK TABLES `airplane` WRITE;
/*!40000 ALTER TABLE `airplane` DISABLE KEYS */;
INSERT INTO `airplane` VALUES ('a2394','F-86 Sabre',2945.33,10000),('a9999','Boeing747',400.10,34000);
/*!40000 ALTER TABLE `airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeid` char(5) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `phone` char(10) DEFAULT NULL,
  PRIMARY KEY (`employeeid`),
  UNIQUE KEY `employeeid` (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('e1234','Paul','Frank','1234567890'),('e9874','McKenzie','Church','3334445555');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `eid` char(5) NOT NULL,
  `registration_num` char(5) NOT NULL,
  `date` date NOT NULL,
  `workcode` char(4) NOT NULL,
  PRIMARY KEY (`eid`,`registration_num`,`date`,`workcode`),
  UNIQUE KEY `eid` (`eid`),
  UNIQUE KEY `registration_num` (`registration_num`),
  KEY `registration_num_2` (`registration_num`,`date`,`workcode`),
  CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`employeeid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `maintenance_ibfk_2` FOREIGN KEY (`registration_num`, `date`, `workcode`) REFERENCES `plane_service` (`registration_num`, `date`, `workcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES ('e1234','a9999','2022-10-02','w448'),('e9874','a2933','1902-03-10','w000');
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plane_service`
--

DROP TABLE IF EXISTS `plane_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plane_service` (
  `registration_num` char(5) NOT NULL,
  `date` date NOT NULL,
  `workcode` char(4) NOT NULL,
  `hours` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`registration_num`,`date`,`workcode`),
  UNIQUE KEY `registration_num` (`registration_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plane_service`
--

LOCK TABLES `plane_service` WRITE;
/*!40000 ALTER TABLE `plane_service` DISABLE KEYS */;
INSERT INTO `plane_service` VALUES ('a2933','1902-03-10','w000',93.00),('a9999','2022-10-02','w448',10.30);
/*!40000 ALTER TABLE `plane_service` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-14 19:08:01
