-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: gram_panchayat_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `certificate_application`
--

DROP TABLE IF EXISTS `certificate_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificate_application` (
  `application_id` int NOT NULL,
  `citizen_id` int DEFAULT NULL,
  `certificate_name` varchar(100) DEFAULT NULL,
  `application_date` date DEFAULT NULL,
  `purpose` varchar(300) DEFAULT NULL,
  `application_status` varchar(100) DEFAULT NULL,
  `fee_paid` decimal(8,2) DEFAULT NULL,
  `reference_number` varchar(100) DEFAULT NULL,
  `issued_date` date DEFAULT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate_application`
--

LOCK TABLES `certificate_application` WRITE;
/*!40000 ALTER TABLE `certificate_application` DISABLE KEYS */;
INSERT INTO `certificate_application` VALUES (1001,1,'residance certificate','2026-07-01','Bank account documentation','under review',30.00,'GP20260001',NULL),(1002,2,'Family member certificate','2026-07-02','welfare scheme application','approved',40.00,'GP202600002',NULL),(1003,3,'property certificate','2026-07-03','property documentation','submitted',50.00,'GP202600003',NULL),(1004,4,'residence certificate','2026-07-04','college admissiion','approved',30.00,'GP202600004',NULL),(1005,5,'No-Dues certificate','2026-07-05','local service requirment','under review',25.00,'GP202600005',NULL),(1006,6,'birth record requirmment','2026-07-06','personal documentaton','rejected',20.00,'GP202600006',NULL);
/*!40000 ALTER TABLE `certificate_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificate_type`
--

DROP TABLE IF EXISTS `certificate_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificate_type` (
  `certificate_type_id` int NOT NULL,
  `certificate_name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `processing_days` int DEFAULT NULL,
  `application_fee` decimal(8,2) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`certificate_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate_type`
--

LOCK TABLES `certificate_type` WRITE;
/*!40000 ALTER TABLE `certificate_type` DISABLE KEYS */;
INSERT INTO `certificate_type` VALUES (1,'Residance certificate','description the declared of residance',7,30.00,1),(2,'birth record system','request for a locally mantained birth record',5,20.00,1),(3,'death record request','requested for a locally maintained death record',5,20.00,1),(4,'family membeer certificate','records delared family-member information',10,40.00,1),(5,'property certificate','certificate relatedd to locally maintained property records',12,50.00,1),(6,'No-Dues certificate','indicates applicable local dues status',7,25.00,1),(7,'Income certificate','Provides Income certificates services',10,30.00,1);
/*!40000 ALTER TABLE `certificate_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gram_panchayat`
--

DROP TABLE IF EXISTS `gram_panchayat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gram_panchayat` (
  `citizen_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `mobile_number` varchar(15) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `village_name` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`citizen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram_panchayat`
--

LOCK TABLES `gram_panchayat` WRITE;
/*!40000 ALTER TABLE `gram_panchayat` DISABLE KEYS */;
INSERT INTO `gram_panchayat` VALUES (1,'ravi kumar ','1995-06-15','Male','9182217240','Farmer','Ramapuram',1,NULL),(2,'Lakshmi Devi','1998-11-22','Female','9182217243','Tailor','Ramapuram',1,NULL),(3,'Suresh Babu','1992-03-10','Male','9182217241','Shopkeeper','Seethampuram',1,NULL),(4,'Anjali rao','2000-08-05','Female','9182217242','Student','Ramapuram',1,NULL),(5,'Kiran Kumar','1985-01-18','Male','9182217244','Electrical Technician','Seethapuram',1,NULL),(6,'Meena Kumari','1998-12-30','Female','9182217245','Teacher','Lakshmipuram',0,NULL);
/*!40000 ALTER TABLE `gram_panchayat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panchayat_office`
--

DROP TABLE IF EXISTS `panchayat_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panchayat_office` (
  `office_id` int NOT NULL,
  `office_name` varchar(100) DEFAULT NULL,
  `village_name` varchar(50) DEFAULT NULL,
  `pincode` varchar(6) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `office_email` varchar(100) DEFAULT NULL,
  `opening_time` time DEFAULT NULL,
  `is_operational` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`office_id`),
  UNIQUE KEY `contact_number` (`contact_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panchayat_office`
--

LOCK TABLES `panchayat_office` WRITE;
/*!40000 ALTER TABLE `panchayat_office` DISABLE KEYS */;
INSERT INTO `panchayat_office` VALUES (1,'Ramapuram gram panchayat','Ramapuram','521101','9182217240','ramapuram@gp.example','09:00:00',1),(2,'Seethampeta gram panchayat','Seethampeta','521102','9182217241','seethampeta@gp.example','09:30:00',1),(3,'Lakshmipuram gram panchayat','Lakshmipuram','521103','9182217242','lakshmipuram@gp.example','09:00:00',1),(4,'Krishnapuram gram panchayat','Krishnapuram','521104','9182217243','krishnapuram@gp.example','10:00:00',1),(5,'Venkatapuram gram panchayat','Venkatapuram','521105','9182217244','venkatapuram@gp.example','09:30:00',1),(6,'Gopalapuram gram panchayat','Gopalapuram','521106','9182217245','gopalapuram@gp.example','09:00:00',0);
/*!40000 ALTER TABLE `panchayat_office` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-20 21:34:03
