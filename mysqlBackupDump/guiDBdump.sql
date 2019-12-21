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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,28,'test','test','1','2019-12-21 19:14:24','28 test',1,0),(2,28,'test','test','1','2019-12-21 19:15:13','28 test',1,0),(3,28,'testtest','test','0:0:0:0:0:0:0:1','2019-12-21 10:31:06','28번 항목 댓글 테스트',0,0),(4,28,'test2','test','0:0:0:0:0:0:0:1','2019-12-21 10:33:08','test 2',0,0),(5,35,'testtest','ttttt','0:0:0:0:0:0:0:1','2019-12-21 10:33:23','test12312321',0,0),(6,32,'sasdf','sdfs','0:0:0:0:0:0:0:1','2019-12-21 10:37:42','tttt',1,0),(7,28,'1234','1234','0:0:0:0:0:0:0:1','2019-12-21 10:37:50','asdgfav',0,1),(8,33,'adsf','asdf','0:0:0:0:0:0:0:1','2019-12-21 10:41:31','asdf',0,1),(9,33,'adsf','aaa','0:0:0:0:0:0:0:1','2019-12-21 10:42:09','asdf',0,1),(10,33,'gg','gg','0:0:0:0:0:0:0:1','2019-12-21 10:42:38','aaaasd',0,1),(11,28,'ㄴㄴ','ss','0:0:0:0:0:0:0:1','2019-12-21 11:32:48','ㅁㄴㅇㄹ',1,0),(12,28,'ㄴㄻㄴ','asdf','0:0:0:0:0:0:0:1','2019-12-21 11:51:14','ㅁㄴㅇㄹ',1,0),(13,28,'ㅁㄴㅇㄹ','sdf','0:0:0:0:0:0:0:1','2019-12-21 11:51:18','ㅁㄴㅇㄹ',0,1),(14,28,'ㅂㄷㄱ','234','0:0:0:0:0:0:0:1','2019-12-21 11:51:23','234ㅁㄴㅇㄹ',1,0),(15,34,'모바일','mm','192.168.0.5','2019-12-21 12:29:24','모바일 환경 테스트',0,1),(16,37,'몽슈슈 성애자','123','0:0:0:0:0:0:0:1','2019-12-21 13:58:45','몽슈슈가더맛난데\r\n솔직히ㅋㅋ',0,1),(17,37,'두유노손흥민','dd','0:0:0:0:0:0:0:1','2019-12-21 14:00:23','몽슈슈가 맛있다고?',1,0),(18,37,'두유노손흥민','aa','0:0:0:0:0:0:0:1','2019-12-21 14:00:48','님 매국노임?',1,0),(19,37,'몽슈슈 성애자','aa','0:0:0:0:0:0:0:1','2019-12-21 14:01:52','zzzzzzzzzzzzzzz',0,1),(20,44,'심','aaa','0:0:0:0:0:0:0:1','2019-12-21 14:05:25','이스즈 트럭은AMT 적용 (자동화 수동변속기) 가 있다 저런거랑 비교를 뭐하러 함?',0,1),(21,44,'배달의민족','asdf','0:0:0:0:0:0:0:1','2019-12-21 14:06:11','솔직히 성능도 비슷하고 가격도 현대트럭이 더 싼데 굳이 이스즈 트럭을????????',1,0),(22,44,'zhao','zzzz','0:0:0:0:0:0:0:1','2019-12-21 14:08:53','taiwan no.1',0,1),(23,43,'황','11','0:0:0:0:0:0:0:1','2019-12-21 14:10:37','아 이건 대체 불가능하지',0,1),(24,43,'심','ss','0:0:0:0:0:0:0:1','2019-12-21 14:10:49','님 매국노임?',1,0),(25,43,'김','d','0:0:0:0:0:0:0:1','2019-12-21 14:11:35','hello world!',1,0),(26,43,'이','d','0:0:0:0:0:0:0:1','2019-12-21 14:11:46','gg',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (23,'123','123','123',1,'2019-12-21 02:51:20','test','img/product.PNG','123',0,0),(25,'123','123','123',0,'2019-12-21 02:51:32','멈뭄미','img/product.PNG','123',123,87),(26,'123','123','123',11,'2019-12-21 02:51:43','네모네모','img/product.PNG','123',23,132),(28,'4545','4545','0:0:0:0:0:0:0:1',35,'2019-12-20 18:27:51','테스트','img/pepe.jpg','항목추가 기능 테스트',2,1),(36,'재현','wogus','0:0:0:0:0:0:0:1',4,'2019-12-21 12:42:05','1221','img/daebug.jpg','네',0,0),(37,'관리자','rhksfl','0:0:0:0:0:0:0:1',12,'2019-12-21 13:34:21','케이크','img/desert.png','(한)달롤-롤케이크 vs (일)도지마롤-몽슈슈',2,3),(38,'관리자','rhksfl','0:0:0:0:0:0:0:1',0,'2019-12-21 13:35:49','전기면도기','img/shave.png','(한)브라운-면도기 vs (일)파나소닉면도기',0,0),(39,'관리자','rhksfl','0:0:0:0:0:0:0:1',0,'2019-12-21 13:41:08','공기청정기','img/aircleaner.png','(한) 오난코리아-공기청정기 vs (일)발뮤다-공기청정기',0,0),(40,'관리자','rhksfl','0:0:0:0:0:0:0:1',6,'2019-12-21 13:42:04','술','img/alchol.png','(한)화랑 vs (일)사케',0,0),(41,'관리자','rhksfl','0:0:0:0:0:0:0:1',0,'2019-12-21 13:42:46','카레','img/curry.png','(한)오뚜기카레 vs (일)골든커리',0,0),(42,'관리자','rhksfl','0:0:0:0:0:0:0:1',0,'2019-12-21 13:43:52','헬멧','img/helmat.png','(한)HJC-헬멧 vs (일)쇼에이-헬멧',0,0),(43,'관리자','rhksfl','0:0:0:0:0:0:0:1',7,'2019-12-21 13:44:30','사이다','img/spakle.png','(한)천연사이다 vs (일)라무네',3,1),(44,'관리자','rhksfl','0:0:0:0:0:0:0:1',9,'2019-12-21 13:45:11','트럭','img/truck.png','(한)현대 트럭 vs (일)이스즈 트럭',1,2);
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

-- Dump completed on 2019-12-21 23:18:54
