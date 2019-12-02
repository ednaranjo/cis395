CREATE DATABASE  IF NOT EXISTS `hoteldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hoteldb`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hoteldb
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `hotelNo` varchar(10) NOT NULL,
  `guestNo` decimal(5,0) NOT NULL,
  `dateFrom` date NOT NULL,
  `dateTo` date DEFAULT NULL,
  `roomNo` decimal(5,0) DEFAULT NULL,
  PRIMARY KEY (`hotelNo`,`guestNo`,`dateFrom`),
  KEY `roomNo` (`roomNo`,`hotelNo`),
  KEY `guestNo` (`guestNo`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`roomNo`, `hotelNo`) REFERENCES `room` (`roomNo`, `hotelNo`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`guestNo`) REFERENCES `guest` (`guestNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES ('ch01',10006,'2020-04-21',NULL,1101),('ch02',10002,'2014-04-25','2014-05-06',801),('dc01',10003,'2019-05-20',NULL,1001),('dc01',10007,'2014-05-13','2014-05-15',1001),('fb01',10001,'2004-04-01','2004-04-08',501),('fb01',10001,'2019-11-01',NULL,701),('fb01',10002,'2016-05-04','2016-05-11',601),('fb01',10004,'2004-04-15','2004-05-15',601),('fb01',10005,'2014-05-02','2014-05-07',501),('fb02',10003,'2011-04-05','2011-04-09',1001),('fb02',10005,'2018-05-12','2018-05-14',1101),('ny01',10001,'2019-04-19','2019-04-21',501),('ny01',10003,'2019-10-19',NULL,508),('ny02',10003,'2019-12-25','2019-12-31',622),('ny02',10007,'2019-07-19','2019-07-26',601);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `guestNo` decimal(5,0) NOT NULL,
  `guestName` varchar(20) DEFAULT NULL,
  `guestAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`guestNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (10001,'John Kay','56 High St, London'),(10002,'Mike Ritchie','18 Tain St, London'),(10003,'Mary Tregear','5 Tarbot Rd, Aberdeen'),(10004,'Joe Keogh','2 Fergus Dr, Aberdeen'),(10005,'Carol Farrel','6 Achray St, Glasgow'),(10006,'Tina Murphy','63 Well St, Glasgow'),(10007,'Tony Shaw','12 Park Pl, Glasgow');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `hotelNo` varchar(10) NOT NULL,
  `hotelName` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`hotelNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES ('ch01','Omni Shoreham','London'),('ch02','Phoenix Park','London'),('dc01','Latham','Berlin'),('fb01','Grosvenor','London'),('fb02','Watergate','Paris'),('ny01','Holiday Inn','New York'),('ny02','Hilton','New York');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomNo` decimal(5,0) NOT NULL,
  `hotelNo` varchar(10) NOT NULL,
  `roomType` varchar(10) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`roomNo`,`hotelNo`),
  KEY `hotelNo` (`hotelNo`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotelNo`) REFERENCES `hotel` (`hotelNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (501,'fb01','single',19.00),(501,'ny01','double',60.00),(508,'ny01','family',85.00),(601,'fb01','double',29.00),(601,'ny02','double',80.00),(622,'ny02','family',100.00),(701,'ch02','single',10.00),(701,'fb01','family',39.00),(801,'ch02','double',15.00),(901,'dc01','single',18.00),(1001,'ch01','single',29.99),(1001,'dc01','double',30.00),(1001,'fb02','single',58.00),(1101,'ch01','family',59.99),(1101,'dc01','family',35.00),(1101,'fb02','double',86.00);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-13 19:15:13
