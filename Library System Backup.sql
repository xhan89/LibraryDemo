CREATE DATABASE  IF NOT EXISTS `lib_sys` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `lib_sys`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lib_sys
-- ------------------------------------------------------
-- Server version	5.7.35-log

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
-- Table structure for table `tb_author`
--

DROP TABLE IF EXISTS `tb_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_f_name` varchar(45) DEFAULT NULL,
  `author_l_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_author`
--

LOCK TABLES `tb_author` WRITE;
/*!40000 ALTER TABLE `tb_author` DISABLE KEYS */;
INSERT INTO `tb_author` VALUES (1,'KHAN','MOHAMED'),(2,'STEPHEN','KING'),(3,'AMY','TAN'),(4,'DANZY','SENNA'),(5,'ATUL','GAWANDE'),(6,'KHALED','HOSSEINI'),(7,'TANA','FRENCH'),(8,'GEORGE','MARTIN'),(9,'DANZY','SENNA'),(10,'ATUL','GAWANDE'),(11,'BRIT','BENNETT');
/*!40000 ALTER TABLE `tb_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_author_book`
--

DROP TABLE IF EXISTS `tb_author_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_author_book` (
  `author_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`author_book_id`),
  KEY `b1_idx` (`book_id`),
  KEY `a1_idx` (`author_id`),
  CONSTRAINT `a1` FOREIGN KEY (`author_id`) REFERENCES `tb_author` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `b1` FOREIGN KEY (`book_id`) REFERENCES `tb_book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_author_book`
--

LOCK TABLES `tb_author_book` WRITE;
/*!40000 ALTER TABLE `tb_author_book` DISABLE KEYS */;
INSERT INTO `tb_author_book` VALUES (4,9,5),(5,10,5),(6,1,6),(7,4,7),(8,7,7),(9,9,8),(10,6,8),(11,2,9),(12,3,10),(13,4,10),(14,5,10),(15,9,11),(16,7,11);
/*!40000 ALTER TABLE `tb_author_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_book`
--

DROP TABLE IF EXISTS `tb_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(60) DEFAULT NULL,
  `book_rating` int(2) DEFAULT '0',
  `book_shelf` varchar(2) DEFAULT NULL,
  `book_qty` int(5) DEFAULT '0',
  `book_available` int(5) DEFAULT '0',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_book`
--

LOCK TABLES `tb_book` WRITE;
/*!40000 ALTER TABLE `tb_book` DISABLE KEYS */;
INSERT INTO `tb_book` VALUES (5,'DO ANDROIDS DREAM',0,'B',10,10),(6,'EVERYTHING I NEVER TOLD YOU',0,'A',5,5),(7,'THE DEVIL WEARS PRADA',0,'D',6,6),(8,'THE SUN ALSO RISES',0,'A',5,5),(9,'A SCANNER DARKLY',0,'B',2,2),(10,'NUMBER THE STARS',0,'C',4,3),(11,'BELOVED',0,'A',6,5);
/*!40000 ALTER TABLE `tb_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(145) NOT NULL,
  `user_phone` varchar(45) DEFAULT NULL,
  `user_join_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'GALAXYXHANI@GMAIL.COM','6475743636','2021-11-12 12:51:24');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_book`
--

DROP TABLE IF EXISTS `tb_user_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_book` (
  `user_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `book_date` datetime DEFAULT NULL,
  `book_returned` varchar(1) DEFAULT '0',
  PRIMARY KEY (`user_book_id`),
  KEY `book_idx` (`book_id`),
  KEY `usr_idx` (`user_id`),
  CONSTRAINT `book` FOREIGN KEY (`book_id`) REFERENCES `tb_book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usr` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_book`
--

LOCK TABLES `tb_user_book` WRITE;
/*!40000 ALTER TABLE `tb_user_book` DISABLE KEYS */;
INSERT INTO `tb_user_book` VALUES (1,1,5,'2021-11-12 15:40:21','1'),(3,1,11,'2021-11-12 15:54:14','0'),(4,1,10,'2021-11-12 15:57:13','0');
/*!40000 ALTER TABLE `tb_user_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lib_sys'
--

--
-- Dumping routines for database 'lib_sys'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-12 17:10:46
