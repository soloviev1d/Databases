-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: ind_task
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
-- Table structure for table `Contract`
--

DROP TABLE IF EXISTS `Contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contract` (
  `id` int(11) NOT NULL,
  `order` int(11) unsigned NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `salesId_idx` (`sales_id`),
  KEY `prodId_idx` (`product_id`),
  CONSTRAINT `prodId` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `salesId` FOREIGN KEY (`sales_id`) REFERENCES `Sales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contract`
--

LOCK TABLES `Contract` WRITE;
/*!40000 ALTER TABLE `Contract` DISABLE KEYS */;
INSERT INTO `Contract` VALUES (1265,15,1,7437),(4761,325,3,6251);
/*!40000 ALTER TABLE `Contract` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bonch`@`localhost`*/ /*!50003 TRIGGER `ind_task`.`Contract_BEFORE_INSERT` BEFORE INSERT ON `Contract` FOR EACH ROW
BEGIN
	SELECT stock INTO @stock FROM product p WHERE p.id=NEW.product_id;
	IF @stock - NEW.order < 0 THEN
		SIGNAL sqlstate '45001' set message_text = "Order is more than stock";
	END IF;
    UPDATE product 
    SET stock = stock - NEW.order
    WHERE id = NEW.product_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `pc_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `pcId_idx` (`pc_id`),
  KEY `cId_idx` (`contract_id`),
  CONSTRAINT `cId` FOREIGN KEY (`contract_id`) REFERENCES `Contract` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `pcId` FOREIGN KEY (`pc_id`) REFERENCES `Potential_customer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (7,4761,1);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marketing`
--

DROP TABLE IF EXISTS `Marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Marketing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `job_title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marketing`
--

LOCK TABLES `Marketing` WRITE;
/*!40000 ALTER TABLE `Marketing` DISABLE KEYS */;
INSERT INTO `Marketing` VALUES (1,'Иванов Иван','Стажер'),(2,'Петрова Анна','Сотрудник'),(3,'Сидоров Дмитрий','Сотрудник'),(4,'Смирнова Елена','Директор'),(5,'Ковалев Максим','Сотрудник');
/*!40000 ALTER TABLE `Marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Potential_customer`
--

DROP TABLE IF EXISTS `Potential_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Potential_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `contact` varchar(45) NOT NULL DEFAULT '-',
  `marketing_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marketingId_idx` (`marketing_id`),
  CONSTRAINT `marketingId` FOREIGN KEY (`marketing_id`) REFERENCES `Marketing` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Potential_customer`
--

LOCK TABLES `Potential_customer` WRITE;
/*!40000 ALTER TABLE `Potential_customer` DISABLE KEYS */;
INSERT INTO `Potential_customer` VALUES (1,'Иван Петров','ivan.petrov@example.com',3),(2,'Анна Смирнова','+79012345678',2),(3,'Дмитрий Иванов','dmitry.ivanov@example.com',4),(4,'Екатерина Козлова','+79123456789',1),(5,'Алексей Соколов','alexey.sokolov@example.com',5),(6,'Мария Новикова','+79234567890',3),(7,'Анатолий Кузнецов','anatoliy.kuznetsov@example.com',2),(8,'Елена Павлова','+79345678901',4),(9,'Сергей Федоров','sergey.fedorov@example.com',1),(10,'Ольга Морозова','+79456789012',5),(11,'Александр Волков','alexandr.volkov@example.com',3),(12,'Наталья Лебедева','+79567890123',2),(13,'Игорь Королев','igor.korolev@example.com',4),(14,'Татьяна Сидорова','+79678901234',1),(15,'Максим Медведев','maxim.medvedev@example.com',5),(16,'Алена Романова','+79789012345',3),(17,'Илья Борисов','ilya.borisov@example.com',2),(18,'Маргарита Титова','+79890123456',4),(19,'Артем Кузьмин','artem.kuzmin@example.com',1),(20,'Евгения Жукова','+79901234567',5);
/*!40000 ALTER TABLE `Potential_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `job_title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales`
--

LOCK TABLES `Sales` WRITE;
/*!40000 ALTER TABLE `Sales` DISABLE KEYS */;
INSERT INTO `Sales` VALUES (2,'Мария Иванова','Стажер'),(3,'Александр Петров','Сотрудник'),(4,'Екатерина Смирнова','Сотрудник'),(5,'Дмитрий Козлов','Директор'),(6,'Ольга Николаева','Сотрудник');
/*!40000 ALTER TABLE `Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1357,'Скраб для тела',2500),(1597,'Крем для лица',7000),(2801,'Шампунь для волос',8500),(3968,'Бальзам для губ',4500),(4572,'Тушь для ресниц',5000),(4689,'Очищающий гель',4500),(5423,'Гель для душа',5500),(6251,'Тональный крем',5675),(6352,'Гель-лак для ногтей',2000),(6919,'Маска для волос',4000),(7203,'Палетка теней',3500),(7437,'Крем для рук',35),(8236,'Лосьон для увлажнения кожи',3000),(8546,'Помада',5000),(9824,'Матирующий порошок',4000);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ind_task'
--

--
-- Dumping routines for database 'ind_task'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `best_marketing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`bonch`@`localhost` PROCEDURE `best_marketing`()
BEGIN
	DROP TABLE IF EXISTS best_marketing;
    CREATE TEMPORARY TABLE best_marketing AS
		SELECT 
			m.name, m.job_title, COUNT(*) as `count`
		FROM
			Potential_customer pc
		LEFT JOIN
			Marketing m
		ON m.id=pc.marketing_id
		GROUP BY m.name
		ORDER BY `count` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `best_sales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`bonch`@`localhost` PROCEDURE `best_sales`()
BEGIN
	DROP TABLE IF EXISTS best_sales;
    CREATE TEMPORARY TABLE best_sales AS
		SELECT 
			s.name, s.job_title, COUNT(*) as `count`
		FROM
			Contract c
		LEFT JOIN
			Sales s
		ON s.id=c.sales_id
		GROUP BY s.name
		ORDER BY `count` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `contract` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`bonch`@`localhost` PROCEDURE `contract`(IN `c_id` INT, IN `pname` VARCHAR(128),IN `order` INT, IN `sales` VARCHAR(60), IN `customer` VARCHAR(60))
BEGIN
	SELECT id INTO @sname FROM Sales s WHERE s.name=sales;
    SELECT id INTO @prod FROM product p WHERE p.name=pname;
    SELECT id INTO @customer FROM Potential_customer pc WHERE pc.name=`customer`;
    INSERT INTO Contract(`id`, `order`, `product_id`, `sales_id`) VALUES (c_id, `order`, @prod, @sname);
    INSERT INTO Customer(`pc_id`, `contract_id`) VALUES(@customer, c_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_contract` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`bonch`@`localhost` PROCEDURE `get_contract`(IN `customer` VARCHAR(60))
BEGIN        
	DROP TABLE IF EXISTS contract;
    CREATE TEMPORARY TABLE contract AS
		SELECT
			c.contract_id as `Contract`, 
			pc.name as `Customer name`, 
			pc.contact as 'Contact', 
			p.name as `Product`, 
			cont.order as `Amount`
		FROM 
			Potential_customer pc 
		INNER JOIN
			Customer c ON pc.id=c.pc_id
		INNER JOIN
			Contract cont ON c.contract_id=cont.id
		INNER JOIN
			product p ON p.id=cont.product_id
		WHERE 
			pc.name=`customer`;
		
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

-- Dump completed on 2023-12-07 22:35:16
