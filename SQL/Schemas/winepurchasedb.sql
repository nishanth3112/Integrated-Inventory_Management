-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: winepurchase
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
-- Table structure for table `po_line`
--

DROP TABLE IF EXISTS `po_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `po_line` (
  `PONR` char(7) NOT NULL,
  `PRODNR` char(6) NOT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`PONR`,`PRODNR`),
  KEY `PRODNR` (`PRODNR`),
  CONSTRAINT `po_line_ibfk_1` FOREIGN KEY (`PONR`) REFERENCES `purchase_order` (`PONR`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `po_line_ibfk_2` FOREIGN KEY (`PRODNR`) REFERENCES `product` (`PRODNR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `po_line`
--

LOCK TABLES `po_line` WRITE;
/*!40000 ALTER TABLE `po_line` DISABLE KEYS */;
INSERT INTO `po_line` VALUES ('1511','212',2),('1511','345',4),('1511','783',1),('1511','856',9),('1512','178',3),('1512','639',13),('1512','885',3),('1512','977',10),('1513','295',9),('1513','668',7),('1514','185',2),('1514','306',9),('1514','847',9),('1514','900',2),('1523','347',1),('1523','783',2),('1523','900',3),('1523','915',13),('1523','977',1),('1537','386',8),('1537','632',2),('1537','657',7),('1537','766',2),('1538','178',6),('1538','212',15),('1560','766',1),('1560','795',3),('1560','900',9),('1577','212',6),('1577','668',9),('1594','306',2);
/*!40000 ALTER TABLE `po_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `PRODNR` char(6) NOT NULL,
  `PRODNAME` varchar(60) NOT NULL,
  `PRODTYPE` varchar(10) DEFAULT NULL,
  `AVAILABLE_QUANTITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`PRODNR`),
  UNIQUE KEY `UC1` (`PRODNAME`),
  CONSTRAINT `CC1` CHECK ((`PRODTYPE` in (_utf8mb4'white',_utf8mb4'red',_utf8mb4'rose',_utf8mb4'sparkling')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('119','Chateau Miraval, Cotes de Provence Rose, 2015','rose',126),('154','Chateau Haut Brion, 2008','red',111),('178','Meerdael, Methode Traditionnelle Chardonnay, 2014','sparkling',136),('185','Chateau Petrus, 1975','red',5),('199','Jacques Selosse, Brut Initial, 2012','sparkling',96),('212','Billecart-Salmon, Brut Réserve, 2014','sparkling',141),('219','Marques de Caceres, Rioja Crianza, 2010','red',0),('238','Cos d\'Estournel, Saint - Estephe, 2006','red',50),('265','Chateau Sociando-Mallet, Haut-Medoc, 1998','red',17),('289','Chateau Saint Estčve de Neri, 2015','rose',126),('295','Chateau Pape Clement, Pessac-Léognan, 2001','red',75),('300','Chateau des Rontets, Chardonnay, Birbettes','white',64),('306','Chateau Coupe Roses, Granaxa, 2011','red',57),('327','Chateau La Croix Saint-Michel, 2011','red',87),('331','Chateau La Commanderie, Lalande-de-Pomerol, 1998','red',3),('345','Vascosassetti, Brunello di Montalcino, 2004','red',64),('347','Chateau Corbin-Despagne, Saint-Emilion, 2005','red',145),('384','Dominio de Pingus, Ribera del Duero, Tempranillo, 2006','red',38),('386','Chateau Haut-Bailly, Pessac-Leognan, Grand Cru Classe, 1968','red',118),('404','Chateau Haut-Cadet, Saint-Emilion, 1997','red',115),('468','Domaine Trapet Pčre & Fils, Gevrey-Chambertin, 2008','red',43),('474','Chateau De La Tour, Clos-Vougeot, Grand cru, 2008','red',147),('494','Veuve-Cliquot, Brut, 2012','sparkling',1),('523','Chateau Andron Blanquet, Saint Estephe, 1979','red',13),('632','Meneghetti, Chardonnay, 2010','white',83),('637','Moët & Chandon, Rosé, Imperial, 2014','sparkling',121),('639','Chateau Mouton-Rotshild, Pauillac, 2007','red',35),('657','Le Brun Servenay, Brut, 2008','sparkling',34),('668','Gallo Family Vineyards, Grenache, 2014','rose',95),('760','Chateau Talbot, Saint-Julien, Grand Cru Classe, 2002','red',92),('766','GH Mum, Brut, 2012','sparkling',68),('783','Clos D\'Opleeuw, Chardonnay, 2012','white',8),('795','Casa Silva, Los Lingues, Carmenere, 2012','red',105),('832','Conde de Hervías, Rioja, 2004','red',121),('838','Piper Heidseck, Brut, 2014','sparkling',108),('847','Seresin, Merlot, 1999','red',41),('856','Domaine Chandon de Briailles, Savigny-Les-Beaune, 2006','red',93),('885','Chateau Margaux, Grand Cru Classé, 1956','red',147),('899','Trimbach, Riesling, 1989','white',142),('900','Chateau Cheval Blanc, Saint Emilion, Grand Cru Classé, 1972','red',45),('915','Champagne Boizel, Brut, Réserve, 2010','sparkling',76),('977','Chateau Batailley, Grand Cru Classé, 1975','red',21);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order` (
  `PONR` char(7) NOT NULL,
  `PODATE` date DEFAULT NULL,
  `SUPNR` char(4) NOT NULL,
  PRIMARY KEY (`PONR`),
  KEY `SUPNR` (`SUPNR`),
  CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`SUPNR`) REFERENCES `supplier` (`SUPNR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` VALUES ('1511','2015-03-24','37'),('1512','2015-04-10','94'),('1513','2015-04-11','37'),('1514','2015-04-12','32'),('1523','2015-04-19','37'),('1537','2015-04-27','69'),('1538','2015-05-01','68'),('1560','2015-05-05','32'),('1577','2015-05-10','37'),('1594','2015-05-13','37');
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `SUPNR` char(4) NOT NULL,
  `SUPNAME` varchar(40) NOT NULL,
  `SUPADDRESS` varchar(50) DEFAULT NULL,
  `SUPCITY` varchar(20) DEFAULT NULL,
  `SUPSTATUS` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`SUPNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('21','Deliwines','240, Avenue of the Americas','New York',20),('32','Best Wines','660, Market Street','San Francisco',90),('37','Ad Fundum','82, Wacker Drive','Chicago',95),('52','Spirits & co.','928, Strip','Las Vegas',NULL),('68','The Wine Depot','132, Montgomery Street','San Francisco',10),('69','Vinos del Mundo','4, Collins Avenue','Miami',92),('84','Wine Trade Logistics','1002, Rhode Island Avenue','Washington',92),('94','The Wine Crate','330, McKinney Avenue','Dallas',75);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplies` (
  `SUPNR` char(4) NOT NULL,
  `PRODNR` char(6) NOT NULL,
  `PURCHASE_PRICE` double(8,2) DEFAULT NULL,
  `DELIV_PERIOD` time DEFAULT NULL,
  PRIMARY KEY (`SUPNR`,`PRODNR`),
  KEY `PRODNR` (`PRODNR`),
  CONSTRAINT `supplies_ibfk_1` FOREIGN KEY (`SUPNR`) REFERENCES `supplier` (`SUPNR`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplies_ibfk_2` FOREIGN KEY (`PRODNR`) REFERENCES `product` (`PRODNR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES ('21','119',15.99,'00:00:01'),('21','178',NULL,NULL),('21','289',17.99,'00:00:01'),('21','327',56.00,'00:00:06'),('21','347',16.00,'00:00:02'),('21','384',55.00,'00:00:02'),('21','386',58.99,'00:00:02'),('21','468',14.99,'00:00:05'),('21','668',6.00,'00:00:01'),('32','154',21.00,'00:00:04'),('32','474',40.00,'00:00:01'),('32','494',15.00,'00:00:02'),('32','657',44.99,'00:00:04'),('32','760',52.00,'00:00:03'),('32','832',20.00,'00:00:02'),('37','178',16.99,'00:00:04'),('37','185',32.99,'00:00:03'),('37','468',14.00,'00:00:01'),('37','795',20.99,'00:00:03'),('68','178',17.99,'00:00:05'),('68','212',27.99,'00:00:06'),('68','300',19.00,'00:00:01'),('68','327',56.99,'00:00:04'),('68','468',15.99,'00:00:04'),('68','637',81.00,'00:00:02'),('68','639',5.00,'00:00:05'),('68','668',6.99,'00:00:03'),('68','760',52.99,'00:00:02'),('69','178',16.99,'00:00:00'),('69','199',32.00,'00:00:04'),('69','347',18.00,'00:00:04'),('69','783',7.00,'00:00:03'),('69','795',20.99,'00:00:01'),('69','832',21.00,'00:00:04'),('69','977',34.99,'00:00:01'),('84','185',33.00,'00:00:05'),('84','300',21.00,'00:00:02'),('84','306',25.00,'00:00:02'),('84','347',18.00,'00:00:04'),('84','468',15.00,'00:00:02'),('84','494',15.99,'00:00:02'),('84','832',20.99,'00:00:06'),('84','915',84.00,'00:00:03'),('94','154',22.00,'00:00:02'),('94','178',18.00,'00:00:06'),('94','185',32.99,'00:00:01'),('94','199',30.99,'00:00:01'),('94','474',39.99,'00:00:02'),('94','523',20.99,'00:00:03'),('94','632',15.99,'00:00:02'),('94','899',15.00,'00:00:01');
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-15 21:51:56
