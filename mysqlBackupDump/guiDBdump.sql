-- MySQL dump 10.13  Distrib 5.5.32, for Win64 (x86)
--
-- Host: localhost    Database: ho
-- ------------------------------------------------------
-- Server version	5.5.32

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` int(11) NOT NULL,
  `writer` varchar(10) NOT NULL,
  `passwd` varchar(20) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `reg_date` datetime NOT NULL,
  `content` text NOT NULL,
  `voteKor` tinyint(1) DEFAULT '0',
  `voteJpn` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,28,'test','test','1','2019-12-21 19:14:24','28 test',1,0),(2,28,'test','test','1','2019-12-21 19:15:13','28 test',1,0),(3,28,'testtest','test','0:0:0:0:0:0:0:1','2019-12-21 10:31:06','28번 항목 댓글 테스트',0,0),(4,28,'test2','test','0:0:0:0:0:0:0:1','2019-12-21 10:33:08','test 2',0,0),(5,35,'testtest','ttttt','0:0:0:0:0:0:0:1','2019-12-21 10:33:23','test12312321',0,0),(6,32,'sasdf','sdfs','0:0:0:0:0:0:0:1','2019-12-21 10:37:42','tttt',1,0),(7,28,'1234','1234','0:0:0:0:0:0:0:1','2019-12-21 10:37:50','asdgfav',0,1),(8,33,'adsf','asdf','0:0:0:0:0:0:0:1','2019-12-21 10:41:31','asdf',0,1),(9,33,'adsf','aaa','0:0:0:0:0:0:0:1','2019-12-21 10:42:09','asdf',0,1),(10,33,'gg','gg','0:0:0:0:0:0:0:1','2019-12-21 10:42:38','aaaasd',0,1),(11,28,'ㄴㄴ','ss','0:0:0:0:0:0:0:1','2019-12-21 11:32:48','ㅁㄴㅇㄹ',1,0),(12,28,'ㄴㄻㄴ','asdf','0:0:0:0:0:0:0:1','2019-12-21 11:51:14','ㅁㄴㅇㄹ',1,0),(13,28,'ㅁㄴㅇㄹ','sdf','0:0:0:0:0:0:0:1','2019-12-21 11:51:18','ㅁㄴㅇㄹ',0,1),(14,28,'ㅂㄷㄱ','234','0:0:0:0:0:0:0:1','2019-12-21 11:51:23','234ㅁㄴㅇㄹ',1,0),(15,34,'모바일','mm','192.168.0.5','2019-12-21 12:29:24','모바일 환경 테스트',0,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `writer` varchar(10) NOT NULL,
  `passwd` varchar(20) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `readCount` int(11) DEFAULT '0',
  `reg_date` datetime NOT NULL,
  `title` varchar(20) NOT NULL,
  `img` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `voteKor` int(11) DEFAULT '0',
  `voteJpn` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (23,'123','123','123',0,'2019-12-21 02:51:20','test','img/product.PNG','123',0,0),(24,'123','123','123',0,'2019-12-21 02:51:23','123','img/product.PNG','123',1,0),(25,'123','123','123',0,'2019-12-21 02:51:32','멈뭄미','img/product.PNG','123',123,87),(26,'123','123','123',2,'2019-12-21 02:51:43','네모네모','img/product.PNG','123',23,132),(27,'123','123','123',0,'2019-12-21 02:51:53','고?미','img/product.PNG','123',14,14),(28,'4545','4545','0:0:0:0:0:0:0:1',32,'2019-12-20 18:27:51','테스트','img/pepe.jpg','항목추가 기능 테스트',2,1),(29,'123','123','123',10,'2019-12-21 17:27:43','123','img/product.PNG','123',14,14),(30,'123','123','123',1,'2019-12-21 17:27:47','123','img/product.PNG','123',14,14),(31,'123','123','123',1,'2019-12-21 17:27:48','123','img/product.PNG','123',14,14),(32,'123','123','123',7,'2019-12-21 17:27:51','123','img/product.PNG','123',14,14),(33,'123','123','123',33,'2019-12-21 17:28:02','123','img/pepe.jpg','123',14,14),(34,'123','123','123',6,'2019-12-21 17:28:03','123','img/pepe.jpg','123',14,15),(35,'123','123','123',9,'2019-12-21 17:28:05','123','img/pepe.jpg','123',14,14),(36,'재현','wogus','0:0:0:0:0:0:0:1',1,'2019-12-21 12:42:05','1221','img/daebug.jpg','네',0,0);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-21 21:57:49
