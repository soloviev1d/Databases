-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: lab8
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Don_avia'),(2,'Aeroflot'),(3,'Dale_avia'),(4,'air_France'),(5,'British_AW');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pass_in_trip`
--

DROP TABLE IF EXISTS `pass_in_trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pass_in_trip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_idx` int(11) NOT NULL,
  `passenger` int(11) NOT NULL,
  `place` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_idx_idx` (`trip_idx`),
  KEY `passenger_idx_idx` (`passenger`),
  CONSTRAINT `passenger_idx` FOREIGN KEY (`passenger`) REFERENCES `passenger` (`id`),
  CONSTRAINT `trip_idx` FOREIGN KEY (`trip_idx`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pass_in_trip`
--

LOCK TABLES `pass_in_trip` WRITE;
/*!40000 ALTER TABLE `pass_in_trip` DISABLE KEYS */;
INSERT INTO `pass_in_trip` VALUES (1,1100,1,'1a'),(2,1123,3,'2a'),(3,1123,1,'4c'),(4,1123,6,'4b'),(5,1124,2,'2d'),(6,1145,3,'2c'),(7,1181,1,'1a'),(8,1181,6,'1b'),(9,1181,8,'3c'),(10,1181,5,'1b'),(11,1182,5,'4b'),(12,1187,8,'3a'),(13,1188,8,'3a'),(14,1182,9,'6d'),(15,1145,5,'1d'),(16,1187,10,'3d'),(17,8882,37,'1a'),(18,7771,37,'1c'),(19,7772,37,'1a'),(20,8881,37,'1d'),(21,7778,10,'2a'),(22,7772,10,'3a'),(23,7771,11,'4a'),(24,7771,11,'1b'),(25,7771,11,'5a'),(26,7772,12,'1d'),(27,7773,13,'2d'),(28,7772,13,'1b'),(29,8882,14,'3d'),(30,7771,14,'4d'),(31,7771,14,'5d'),(32,7772,14,'1c');
/*!40000 ALTER TABLE `pass_in_trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Bruce Willis'),(2,'George Clooney'),(3,'Kevin Costner'),(4,'Donald Sutherland'),(5,'Jennifer Lopez'),(6,'Ray Liotta'),(7,'Samuel L. Jackson'),(8,'Nikole Kidman'),(9,'Alan Rickman'),(10,'Kurt Russell'),(11,'Harrison Ford'),(12,'Russell Crowe'),(13,'Steve Martin'),(14,'Michael Caine'),(15,'Angelina Jolie'),(16,'Mel Gibson'),(17,'Michael Douglas'),(18,'John Travolta'),(19,'Sylvester Stallone'),(20,'Tommy Lee Jones'),(21,'Catherine Zeta-Jones'),(22,'Antonio Banderas'),(23,'Kim Basinger'),(24,'Sam Neill'),(25,'Gary Oldman'),(26,'ClINT Eastwood'),(27,'Brad Pitt'),(28,'Johnny Depp'),(29,'Pierce Brosnan'),(30,'Sean Connery'),(31,'Bruce Willis'),(37,'Mullah Omar');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trip` (
  `id` int(11) NOT NULL,
  `plane` varchar(45) NOT NULL,
  `town_from` varchar(128) NOT NULL,
  `town_to` varchar(128) NOT NULL,
  `time_out` datetime NOT NULL,
  `time_in` datetime NOT NULL,
  `company` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_idx` (`company`),
  CONSTRAINT `company` FOREIGN KEY (`company`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1100,'Boeing','Rostov','Paris','1900-01-01 14:30:00','1900-01-01 17:50:00',4),(1101,'Boeing','Paris','Rostov','1900-01-01 08:12:00','1900-01-01 11:45:00',4),(1123,'TU-154','Rostov','Vladivostok','1900-01-01 16:20:00','1900-01-02 03:40:00',3),(1124,'TU-154','Vladivostok','Rostov','1900-01-01 09:00:00','1900-01-01 19:50:00',3),(1145,'IL-86','Moscow','Rostov','1900-01-01 09:35:00','1900-01-01 11:23:00',2),(1146,'IL-86','Rostov','Moscow','1900-01-01 17:55:00','1900-01-01 20:01:00',2),(1181,'TU-134','Rostov','Moscow','1900-01-01 06:12:00','1900-01-01 08:01:00',1),(1182,'TU-134','Moscow','Rostov','1900-01-01 12:35:00','1900-01-01 14:30:00',1),(1187,'TU-134','Rostov','Moscow','1900-01-01 15:42:00','1900-01-01 17:39:00',1),(1188,'TU-134','Moscow','Rostov','1900-01-01 22:50:00','1900-01-02 00:48:00',1),(1195,'TU-154','Rostov','Moscow','1900-01-01 23:30:00','1900-01-02 01:11:00',1),(1196,'TU-154','Moscow','Rostov','1900-01-01 04:00:00','1900-01-01 05:45:00',1),(7771,'Boeing','London','Singapore','1900-01-01 01:00:00','1900-01-01 11:00:00',5),(7772,'Boeing','Singapore','London','1900-01-01 12:00:00','1900-01-02 02:00:00',5),(7773,'Boeing','London','Singapore','1900-01-01 03:00:00','1900-01-01 13:00:00',5),(7774,'Boeing','Singapore','London','1900-01-01 14:00:00','1900-01-02 06:00:00',5),(7775,'Boeing','London','Singapore','1900-01-01 09:00:00','1900-01-01 20:00:00',5),(7776,'Boeing','Singapore','London','1900-01-01 18:00:00','1900-01-02 08:00:00',5),(7777,'Boeing','London','Singapore','1900-01-01 18:00:00','1900-01-02 06:00:00',5),(7778,'Boeing','Singapore','London','1900-01-01 22:00:00','1900-01-02 12:00:00',5),(8881,'Boeing','London','Paris','1900-01-01 03:00:00','1900-01-01 04:00:00',5),(8882,'Boeing','Paris','London','1900-01-01 22:00:00','1900-01-01 23:00:00',5);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lab8'
--

--
-- Dumping routines for database 'lab8'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `flightsFrom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`bonch`@`localhost` PROCEDURE `flightsFrom`(IN city_out VARCHAR(128) COLLATE utf8mb4_general_ci)
BEGIN 
    DROP TABLE IF EXISTS flights;
    create temporary table flights as
        select town_to as 'destination', timediff(time_in, time_out) as 'flight_time' from trip WHERE town_from=city_out ORDER BY flight_time DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `least_flights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `least_flights`()
BEGIN
	SAVEPOINT sve;
    SET autocommit = 0;
	START TRANSACTION;
    	
		DROP TABLE IF EXISTS total_flights;
		CREATE TEMPORARY TABLE total_flights as
			SELECT company AS 'c_id', count(*) AS 'flights' from trip group by company;
		
		SELECT @minf := MIN(flights) from total_flights;
		DROP TABLE IF EXISTS least_flights;
		CREATE TEMPORARY TABLE least_flights as
			SELECT 
				c.name AS 'company',
                c.id as 'id'
			FROM
				total_flights t,
				company c
			WHERE
				t.flights = @minf AND
				c.id = t.c_id;
			DROP TABLE IF EXISTS total_flights;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `passengers_from_least_popular_companies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `passengers_from_least_popular_companies`()
BEGIN
	CALL lab8.least_flights();
	COMMIT;
    
	DROP TABLE IF EXISTS total_flights;
	CREATE TEMPORARY TABLE total_flights AS
		SELECT t.id AS 'trip', pit.passenger AS 'pass', t.company as 'c_id' FROM trip t RIGHT JOIN pass_in_trip pit ON t.id=pit.trip_idx;
	
    DROP TABLE IF EXISTS passenger_flights_c;
	CREATE TEMPORARY TABLE passenger_flights_c AS
		SELECT p.name AS 'name', count(t.trip) AS 'count', c_id FROM total_flights t LEFT JOIN passenger p ON t.pass=p.id GROUP BY pass HAVING count>0 ORDER BY count DESC, name ASC;
        
	DROP TABLE IF EXISTS passenger_flights;
    CREATE TEMPORARY TABLE passenger_flights AS
    SELECT p.name as 'name', p.count as 'count' FROM passenger_flights_c p, least_flights lf WHERE lf.id=p.c_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `passenger_flights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `passenger_flights`()
BEGIN
	DROP TABLE IF EXISTS total_flights;
	CREATE TEMPORARY TABLE total_flights AS
		SELECT t.id AS 'trip', pit.passenger AS 'pass' FROM trip t RIGHT JOIN pass_in_trip pit ON t.id=pit.trip_idx;
   
	DROP TABLE IF EXISTS passenger_flights;
	CREATE TEMPORARY TABLE passenger_flights AS
		SELECT p.name AS 'name', count(*) AS 'count' FROM total_flights t LEFT JOIN passenger p ON t.pass=p.id GROUP BY pass HAVING count>0 ORDER BY count DESC, name ASC;
	DROP TABLE IF EXISTS total_flights;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-09 21:10:25
