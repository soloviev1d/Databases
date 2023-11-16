-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: lab3
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
-- Dumping routines for database 'lab3'
--
/*!50003 DROP PROCEDURE IF EXISTS `createTask` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bonch`@`localhost` PROCEDURE `createTask`(IN tname VARCHAR(45), IN tdate INT, OUT muchdays VARCHAR(45)) BEGIN 
    DECLARE tmonth VARCHAR(45); 
    DECLARE ymd_date DATETIME;
    SET ymd_date  = DATE_ADD(now(), interval tdate day);
    SELECT CONCAT('Task month is: ', 
                 (CASE MONTH(ymd_date) 
                        WHEN 1 THEN 'Jan' 
                        WHEN 2 THEN 'Feb' 
                        WHEN 3 THEN 'Mar' 
                        WHEN 4 THEN 'Apr' 
                        WHEN 5 THEN 'May' 
                        WHEN 6 THEN 'Jun' 
                        WHEN 7 THEN 'Jul' 
                        WHEN 8 THEN 'Aug' 
                        WHEN 9 THEN 'Sep' 
                        WHEN 10 THEN 'Oct' 
                        WHEN 11 THEN 'Nov' 
                        WHEN 12 THEN 'Dec' 
                        ELSE 'None' 
                        END 
                  )) INTO tmonth; 
    INSERT INTO tasks (taskname, taskday, taskmonth) VALUES (tname, DAY(ymd_date), tmonth); 
    SELECT CONCAT('Remains days: ', DATEDIFF(ymd_date, CURDATE())) INTO muchdays;    
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

-- Dump completed on 2023-10-05 19:26:06
