-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: prac1
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `pass_in_trip`
--

DROP TABLE IF EXISTS `pass_in_trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pass_in_trip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trip_idx` int NOT NULL,
  `passenger` int NOT NULL,
  `place` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_idx_idx` (`trip_idx`),
  KEY `passenger_idx_idx` (`passenger`),
  CONSTRAINT `passenger_idx` FOREIGN KEY (`passenger`) REFERENCES `passenger` (`id`),
  CONSTRAINT `trip_idx` FOREIGN KEY (`trip_idx`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4; 
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pass_in_trip`
--

LOCK TABLES `pass_in_trip` WRITE;
/*!40000 ALTER TABLE `pass_in_trip` DISABLE KEYS */;
INSERT INTO `pass_in_trip` VALUES (1,1100,1,'1a'),(2,1123,3,'2a'),(3,1123,1,'4c'),(4,1123,6,'4b'),(5,1124,2,'2d'),(6,1145,3,'2c'),(7,1181,1,'1a'),(8,1181,6,'1b'),(9,1181,8,'3c'),(10,1181,5,'1b'),(11,1182,5,'4b'),(12,1187,8,'3a'),(13,1188,8,'3a'),(14,1182,9,'6d'),(15,1145,5,'1d'),(16,1187,10,'3d'),(17,8882,37,'1a'),(18,7771,37,'1c'),(19,7772,37,'1a'),(20,8881,37,'1d'),(21,7778,10,'2a'),(22,7772,10,'3a'),(23,7771,11,'4a'),(24,7771,11,'1b'),(25,7771,11,'5a'),(26,7772,12,'1d'),(27,7773,13,'2d'),(28,7772,13,'1b'),(29,8882,14,'3d'),(30,7771,14,'4d'),(31,7771,14,'5d'),(32,7772,14,'1c');
/*!40000 ALTER TABLE `pass_in_trip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-12 22:47:32
