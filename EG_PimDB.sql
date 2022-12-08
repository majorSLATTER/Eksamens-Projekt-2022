-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: egpim
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `farve`
--

DROP TABLE IF EXISTS `farve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farve` (
  `FarveID` int NOT NULL,
  `FarveNavn` varchar(45) NOT NULL,
  PRIMARY KEY (`FarveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farve`
--

LOCK TABLES `farve` WRITE;
/*!40000 ALTER TABLE `farve` DISABLE KEYS */;
INSERT INTO `farve` VALUES (1,'Grøn'),(2,'Rød'),(3,'Brun'),(4,'Blå'),(5,'Gul'),(6,'Magenta'),(7,'Lilla'),(8,'Sort'),(9,'Hvid'),(10,'Orange'),(11,'Grå');
/*!40000 ALTER TABLE `farve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `KategoriID` int NOT NULL,
  `KatergoriNavn` varchar(45) NOT NULL,
  PRIMARY KEY (`KategoriID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'Tekstil'),(2,'Mejeri'),(3,'Carboniseret Drikkevarer'),(4,'Møbler'),(5,'Computerskærme');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiale`
--

DROP TABLE IF EXISTS `materiale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiale` (
  `MaterialeID` int NOT NULL,
  `MaterialeNavn` varchar(45) NOT NULL,
  `PrisPrUnit` varchar(45) NOT NULL,
  `Kommentar` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaterialeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiale`
--

LOCK TABLES `materiale` WRITE;
/*!40000 ALTER TABLE `materiale` DISABLE KEYS */;
INSERT INTO `materiale` VALUES (1,'MaximizedAluminium','424,95 kr.','2100x2400x2 mm - Vægt: 3,8 kg'),(2,'Ege planke','319,95 kr.','1200x200 mm'),(3,'Plastik','139,95 kr.','5 x 5 m'),(4,'Sukker','12,99 kr.','2 kg'),(5,'Mælk','9.659,67 kr.','1 MegaLiter'),(6,'Vand','12,00 kr.','1000 L'),(7,'Bomuld','399.99 kr.','500 g'),(8,'Nylon','199.99 kr','1 kg'),(9,'Karton Embellage','1.200,00 kr.','1000 stk.'),(10,'Koffein','6,00 kr.','50 mg');
/*!40000 ALTER TABLE `materiale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operationforlob`
--

DROP TABLE IF EXISTS `operationforlob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operationforlob` (
  `OperationID` int NOT NULL,
  `OperationNummer` varchar(45) NOT NULL,
  `Tid` varchar(45) NOT NULL,
  `Kapacitet` varchar(45) NOT NULL,
  `Kommentar` varchar(45) DEFAULT NULL,
  `Produkt_ProduktID` int NOT NULL,
  PRIMARY KEY (`OperationID`,`Produkt_ProduktID`),
  KEY `fk_OperationForlob_Produkt1_idx` (`Produkt_ProduktID`),
  CONSTRAINT `fk_OperationForlob_Produkt1` FOREIGN KEY (`Produkt_ProduktID`) REFERENCES `produkt` (`ProduktID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operationforlob`
--

LOCK TABLES `operationforlob` WRITE;
/*!40000 ALTER TABLE `operationforlob` DISABLE KEYS */;
INSERT INTO `operationforlob` VALUES (1,'10','2','5','Cutting',1),(2,'20','3','7,5','Sewing',1),(3,'30','6','15','Assembly',1),(4,'40','1','2,5','Print',1),(5,'10','0,25','5','Filling',2),(6,'20','0,25','5','Packing',2),(7,'10','1000','250','Processing',3),(8,'20','0,25','250','Packing',3),(9,'10','0,25','5','Filling',4),(10,'20','0,25','5','Print',4);
/*!40000 ALTER TABLE `operationforlob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimstatus`
--

DROP TABLE IF EXISTS `pimstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pimstatus` (
  `StatusID` int NOT NULL,
  `StatusNavn` varchar(45) NOT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimstatus`
--

LOCK TABLES `pimstatus` WRITE;
/*!40000 ALTER TABLE `pimstatus` DISABLE KEYS */;
INSERT INTO `pimstatus` VALUES (1,'Igang'),(2,'Færdig'),(3,'Udskudt'),(4,'Skrottet');
/*!40000 ALTER TABLE `pimstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt`
--

DROP TABLE IF EXISTS `produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produkt` (
  `ProduktID` int NOT NULL,
  `Varenummer` varchar(45) DEFAULT NULL,
  `Navn` varchar(45) DEFAULT NULL,
  `Vægt` varchar(45) DEFAULT NULL,
  `Bæredygtighed` varchar(255) DEFAULT NULL,
  `Sporbarhed` varchar(255) DEFAULT NULL,
  `Anvendelse` varchar(255) DEFAULT NULL,
  `Bortskaffelse` varchar(255) DEFAULT NULL,
  `StatusID` int NOT NULL,
  `KategoriID` int NOT NULL,
  `StartDate` date NOT NULL,
  `EstEndDate` date DEFAULT NULL,
  PRIMARY KEY (`ProduktID`,`StatusID`,`KategoriID`),
  KEY `fk_Produkt_PIM Status1_idx` (`StatusID`),
  KEY `fk_Produkt_Kategori1_idx` (`KategoriID`),
  CONSTRAINT `fk_Produkt_Kategori1` FOREIGN KEY (`KategoriID`) REFERENCES `kategori` (`KategoriID`),
  CONSTRAINT `fk_Produkt_PIM Status1` FOREIGN KEY (`StatusID`) REFERENCES `pimstatus` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt`
--

LOCK TABLES `produkt` WRITE;
/*!40000 ALTER TABLE `produkt` DISABLE KEYS */;
INSERT INTO `produkt` VALUES (1,'43290','Glizzy Shirt','200 g','Meget bærdygtig med afrika','Bombuld','Tøj; du tager det på?','brænd det',1,1,'2001-10-19','2005-01-23'),(2,'23423','Mælk','1000 kg','fritgående kør','Arla :)','Madlavning/indtagelse','drik det',2,2,'2003-09-21','2004-07-06'),(3,'75678','Hytte Ost','250 g','fritgående ged','Arla :)','Madlavning/indtagelse','drikkkkkke det',3,2,'2019-11-21','2019-12-20'),(4,'97645','Valley Dew','330 g','ingen vand + skill issue + bedre spawn + ratio','vand taget fra afrikaland','Indtagelse','Pant',4,3,'2001-10-29','2001-11-05');
/*!40000 ALTER TABLE `produkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt_farve`
--

DROP TABLE IF EXISTS `produkt_farve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produkt_farve` (
  `Produkt_ProduktID` int NOT NULL,
  `Farve_FarveID` int NOT NULL,
  PRIMARY KEY (`Produkt_ProduktID`,`Farve_FarveID`),
  KEY `fk_Produkt_Farve_Farve1_idx` (`Farve_FarveID`),
  CONSTRAINT `fk_Produkt_Farve_Farve1` FOREIGN KEY (`Farve_FarveID`) REFERENCES `farve` (`FarveID`),
  CONSTRAINT `fk_Produkt_Farve_Produkt` FOREIGN KEY (`Produkt_ProduktID`) REFERENCES `produkt` (`ProduktID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt_farve`
--

LOCK TABLES `produkt_farve` WRITE;
/*!40000 ALTER TABLE `produkt_farve` DISABLE KEYS */;
INSERT INTO `produkt_farve` VALUES (1,2),(3,2),(1,4),(2,4),(3,5),(4,6),(4,7),(2,9),(1,10),(4,10),(4,11);
/*!40000 ALTER TABLE `produkt_farve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt_materiale`
--

DROP TABLE IF EXISTS `produkt_materiale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produkt_materiale` (
  `Produkt_ProduktID` int NOT NULL,
  `Materiale_MaterialeID` int NOT NULL,
  `Antal` int DEFAULT NULL,
  `Enhed` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Produkt_ProduktID`,`Materiale_MaterialeID`),
  KEY `fk_Produkt_Materiale_Materiale1_idx` (`Materiale_MaterialeID`),
  CONSTRAINT `fk_Produkt_Materiale_Materiale1` FOREIGN KEY (`Materiale_MaterialeID`) REFERENCES `materiale` (`MaterialeID`),
  CONSTRAINT `fk_Produkt_Materiale_Produkt1` FOREIGN KEY (`Produkt_ProduktID`) REFERENCES `produkt` (`ProduktID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt_materiale`
--

LOCK TABLES `produkt_materiale` WRITE;
/*!40000 ALTER TABLE `produkt_materiale` DISABLE KEYS */;
INSERT INTO `produkt_materiale` VALUES (1,7,150,'g'),(1,8,50,'g'),(2,5,1,'L'),(2,9,1,'stk'),(3,3,12,'g'),(3,5,250,'ml'),(4,4,25,'g'),(4,6,230,'ml'),(4,10,250,'mg');
/*!40000 ALTER TABLE `produkt_materiale` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-08  3:00:59
