-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: radius
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `fup`
--

DROP TABLE IF EXISTS `fup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fup`
--

LOCK TABLES `fup` WRITE;
/*!40000 ALTER TABLE `fup` DISABLE KEYS */;
INSERT INTO `fup` VALUES (1,'mockinqjaye','Mikrotik-Rate-Limit','=','512k/512k'),(2,'zaib','Mikrotik-Rate-Limit','=','2048k/2048k');
/*!40000 ALTER TABLE `fup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nas`
--

DROP TABLE IF EXISTS `nas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nasname` varchar(128) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT 'other',
  `ports` int(5) DEFAULT NULL,
  `secret` varchar(60) NOT NULL DEFAULT 'secret',
  `server` varchar(64) DEFAULT NULL,
  `community` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT 'RADIUS Client',
  PRIMARY KEY (`id`),
  KEY `nasname` (`nasname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nas`
--

LOCK TABLES `nas` WRITE;
/*!40000 ALTER TABLE `nas` DISABLE KEYS */;
/*!40000 ALTER TABLE `nas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radacct`
--

DROP TABLE IF EXISTS `radacct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radacct` (
  `radacctid` bigint(21) NOT NULL AUTO_INCREMENT,
  `acctsessionid` varchar(64) NOT NULL DEFAULT '',
  `acctuniqueid` varchar(32) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `realm` varchar(64) DEFAULT '',
  `nasipaddress` varchar(15) NOT NULL DEFAULT '',
  `nasportid` varchar(15) DEFAULT NULL,
  `nasporttype` varchar(32) DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctsessiontime` int(12) unsigned DEFAULT NULL,
  `acctauthentic` varchar(32) DEFAULT NULL,
  `connectinfo_start` varchar(50) DEFAULT NULL,
  `connectinfo_stop` varchar(50) DEFAULT NULL,
  `acctinputoctets` bigint(20) DEFAULT NULL,
  `acctoutputoctets` bigint(20) DEFAULT NULL,
  `calledstationid` varchar(50) NOT NULL DEFAULT '',
  `callingstationid` varchar(50) NOT NULL DEFAULT '',
  `acctterminatecause` varchar(32) NOT NULL DEFAULT '',
  `servicetype` varchar(32) DEFAULT NULL,
  `framedprotocol` varchar(32) DEFAULT NULL,
  `framedipaddress` varchar(15) NOT NULL DEFAULT '',
  `acctstartdelay` int(12) unsigned DEFAULT NULL,
  `acctstopdelay` int(12) unsigned DEFAULT NULL,
  `xascendsessionsvrkey` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`radacctid`),
  UNIQUE KEY `acctuniqueid` (`acctuniqueid`),
  KEY `username` (`username`),
  KEY `framedipaddress` (`framedipaddress`),
  KEY `acctsessionid` (`acctsessionid`),
  KEY `acctsessiontime` (`acctsessiontime`),
  KEY `acctstarttime` (`acctstarttime`),
  KEY `acctstoptime` (`acctstoptime`),
  KEY `nasipaddress` (`nasipaddress`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radacct`
--

LOCK TABLES `radacct` WRITE;
/*!40000 ALTER TABLE `radacct` DISABLE KEYS */;
INSERT INTO `radacct` VALUES (1,'80000008','3ded6e17069286d0','zaib','','','192.168.88.1','2147483656','Wireless-802.11','2018-01-21 18:56:42','2018-01-21 19:00:06',204,'','','',512597,1370540,'hotspot1','54:8C:A0:0F:90:D8','User-Request','','','192.168.6.243',0,0,'');
/*!40000 ALTER TABLE `radacct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radcheck`
--

DROP TABLE IF EXISTS `radcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radcheck` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radcheck`
--

LOCK TABLES `radcheck` WRITE;
/*!40000 ALTER TABLE `radcheck` DISABLE KEYS */;
INSERT INTO `radcheck` VALUES (3,'mockinqjaye','Cleartext-Password',':=','beepboop'),(4,'zaib','Mikrotik-Total-Limit',':=','100000'),(7,'zaib','Cleartext-Password',':=','tammy'),(8,'mockinqjaye','Mikrotik-Total-Limit',':=','100000');
/*!40000 ALTER TABLE `radcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radgroupcheck`
--

DROP TABLE IF EXISTS `radgroupcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radgroupcheck` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`(32))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radgroupcheck`
--

LOCK TABLES `radgroupcheck` WRITE;
/*!40000 ALTER TABLE `radgroupcheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `radgroupcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radgroupreply`
--

DROP TABLE IF EXISTS `radgroupreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radgroupreply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`(32))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radgroupreply`
--

LOCK TABLES `radgroupreply` WRITE;
/*!40000 ALTER TABLE `radgroupreply` DISABLE KEYS */;
INSERT INTO `radgroupreply` VALUES (1,'mamon','Acct-Interim-Interval','=\n','61');
/*!40000 ALTER TABLE `radgroupreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radpostauth`
--

DROP TABLE IF EXISTS `radpostauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radpostauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `pass` varchar(64) NOT NULL DEFAULT '',
  `reply` varchar(32) NOT NULL DEFAULT '',
  `authdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radpostauth`
--

LOCK TABLES `radpostauth` WRITE;
/*!40000 ALTER TABLE `radpostauth` DISABLE KEYS */;
INSERT INTO `radpostauth` VALUES (1,'zaib','zaib','Access-Accept','2017-11-27 06:18:20'),(2,'zaib','zaib','Access-Accept','2017-11-27 06:19:41'),(3,'zaib','zaib','Access-Accept','2017-11-27 07:00:41'),(4,'zaib','zaib','Access-Accept','2017-12-04 03:46:41'),(5,'zaib','0x90aa091c3489f2ebbf8fda4c60d596a935','Access-Accept','2017-12-04 06:34:23'),(6,'zaib','0x04c84cb2b4f36399c82d39a073db5cfb4e','Access-Accept','2017-12-04 06:38:25'),(7,'zaib','0x04c84cb2b4f36399c82d39a073db5cfb4e','Access-Accept','2017-12-04 06:40:20'),(8,'zaib','0x04c84cb2b4f36399c82d39a073db5cfb4e','Access-Accept','2017-12-04 06:40:30'),(9,'zaib','0x04c84cb2b4f36399c82d39a073db5cfb4e','Access-Accept','2017-12-04 06:40:38'),(10,'zaib','0x04c84cb2b4f36399c82d39a073db5cfb4e','Access-Accept','2017-12-04 06:41:10'),(11,'zaib','0x04c84cb2b4f36399c82d39a073db5cfb4e','Access-Accept','2017-12-04 06:41:23'),(12,'zaib','0x04c84cb2b4f36399c82d39a073db5cfb4e','Access-Accept','2017-12-04 06:41:40'),(13,'zaib','0x04c84cb2b4f36399c82d39a073db5cfb4e','Access-Accept','2017-12-04 06:41:42'),(14,'zaib','0x04c84cb2b4f36399c82d39a073db5cfb4e','Access-Accept','2017-12-04 06:41:45'),(15,'zaib','0x04c84cb2b4f36399c82d39a073db5cfb4e','Access-Accept','2017-12-04 06:41:48'),(16,'zaib','0x04c84cb2b4f36399c82d39a073db5cfb4e','Access-Accept','2017-12-04 06:43:36'),(17,'zaib','0x04c84cb2b4f36399c82d39a073db5cfb4e','Access-Accept','2017-12-04 06:44:15'),(18,'zaib','0x324a4784530262b0ac95f5694018bf75a7','Access-Accept','2017-12-04 06:51:39'),(19,'zaib','0x4c8a8a35a41efa547713469c65a86579bf','Access-Accept','2017-12-04 06:55:22'),(20,'zaib','0x7cd0de80dd6cab08fc7bf85043e13ef1a4','Access-Accept','2017-12-04 06:56:43'),(21,'zaib','0xcd342bfd8e3d6093a7b21af484787b51cc','Access-Accept','2017-12-04 06:58:41'),(22,'zaib','0x88aabbcbefd124f4adaf37327aa80d49a0','Access-Accept','2017-12-07 05:32:07'),(23,'zaib','0xfb6c32542e725f98e0bdcf494a26fd72b2','Access-Accept','2017-12-07 05:55:00'),(24,'zaib','0xba6f45bdd261a53eaf6296890b7694acd1','Access-Accept','2017-12-07 06:18:12'),(25,'zaib','0xfa87a4ac5a6ecb1688fd0cac8350401b20','Access-Accept','2018-01-11 03:41:32'),(26,'zaib','0xfa87a4ac5a6ecb1688fd0cac8350401b20','Access-Accept','2018-01-11 03:42:05'),(27,'zaib','0x809dae6d186ae2be58f53bad48072658a3','Access-Accept','2018-01-11 04:04:58'),(28,'zaib','0x41613b1601acbc94d36e6520aeb49548de','Access-Accept','2018-01-11 04:32:44'),(29,'zaib','zaib','Access-Accept','2018-01-16 11:48:23'),(30,'zaib','zaib','Access-Accept','2018-01-16 11:50:11'),(31,'zaib','0x39bb4409d2e3f8ef6556cbb5272a3d6aa5','Access-Accept','2018-01-16 03:51:42'),(32,'zaib','0xd18db4b181c1cf9583089ed281529857b4','Access-Accept','2018-01-16 03:52:32'),(33,'zaib','0x2dc98228c4c0400319344ae58da84d0d4b','Access-Accept','2018-01-16 03:55:28'),(34,'zaib','0xe852a2bcea0e70a6f9e43ba31d4d6f42dd','Access-Accept','2018-01-16 03:56:24'),(35,'zaib','0x3faf1e487abc4174517efd73a18e8006be','Access-Accept','2018-01-16 03:58:15'),(36,'zaib','zaib','Access-Accept','2018-01-16 03:58:17'),(37,'zaib','zaib','Access-Accept','2018-01-16 04:03:23'),(38,'zaib','zaib','Access-Accept','2018-01-16 04:06:08'),(39,'zaib','0x18893213a542bb3e70a8d8bb21a09cf0d4','Access-Accept','2018-01-16 04:07:32'),(40,'zaib','0x52712364b1c48e69883857e0fb9eeee8b8','Access-Accept','2018-01-16 04:08:00'),(41,'zaib','0xb5cda684ed6f7c5e9de2c108a8b897d1d4','Access-Accept','2018-01-16 04:13:21'),(42,'zaib','0x4646258466916583e17acc179ea28b9ac9','Access-Accept','2018-01-16 05:39:11'),(43,'zaib','zaib','Access-Accept','2018-01-16 05:39:15'),(44,'zaib','0x1e54775045e1a8628b7fa784324d0b98ed','Access-Accept','2018-01-16 05:40:14'),(45,'zaib','0xf800d404cdcebb8827cca237ec6c62de15','Access-Accept','2018-01-16 05:40:21'),(46,'zaib','0x76d1f7df53707f8d92352c020ef72bcf72','Access-Accept','2018-01-16 05:41:58'),(47,'zaib','zaib','Access-Accept','2018-01-16 05:42:13'),(48,'zaib','0xb875293b42743abfedc9418f35b6fa0208','Access-Accept','2018-01-16 05:43:13'),(49,'zaib','0xc2d13180bcf050461729f959dc47654af2','Access-Accept','2018-01-16 05:47:56'),(50,'zaib','0x828b2b3545cf736feaf62393b4e15ec230','Access-Accept','2018-01-16 05:48:22'),(51,'zaib','0x6d3ce3952b4f5e1c32c0626d5f13b2abe3','Access-Accept','2018-01-16 05:55:25'),(52,'zaib','0xeca6152ec02a17fc57905c02fdd9950517','Access-Accept','2018-01-16 06:01:38'),(53,'zaib','0x7fc61b6059e279e9b07408f717f3569e56','Access-Accept','2018-01-16 06:02:12'),(54,'zaib','0x463d3a219faf5e56e2457d20b82f9d110e','Access-Accept','2018-01-16 06:20:34'),(55,'zaib','0xe0ab9dc5e2f299a3408422a4cfa2f097ad','Access-Accept','2018-01-16 06:20:47'),(56,'zaib','0xc407638b069ea77912a2074a47461b0724','Access-Accept','2018-01-16 06:21:51'),(57,'zaib','0xb8166866ca0f39b8ff2dc92d4d86e9ac65','Access-Accept','2018-01-16 06:23:07'),(58,'zaib','0xb05f637ad70f277a8f256d562915563acb','Access-Accept','2018-01-16 06:25:39'),(59,'zaib','0x84c1760a4218bad5e731c94182ec92cffb','Access-Accept','2018-01-16 06:32:25'),(60,'zaib','0xe0d33e438e8f451dd2a936977934907468','Access-Accept','2018-01-16 06:33:03'),(61,'zaib','tammy','Access-Accept','2018-01-16 06:34:56'),(62,'zaib','0x44f8d9af1a9ddf5c89c34f4dfee52d7912','Access-Accept','2018-01-16 06:35:08'),(63,'zaib','tammy','Access-Accept','2018-01-16 08:03:38'),(64,'zaib','0xe60046d12aec89db68e70b4e7c061e0a7c','Access-Accept','2018-01-16 08:05:36'),(65,'zaib','0xee001637135c27819b9a1694c33d06dc30','Access-Accept','2018-01-16 08:18:11'),(66,'zaib','0x554629ee092792509b503c37a05d215f14','Access-Accept','2018-01-16 08:23:51'),(67,'mockinqjaye','0x7f997d6f7112cbe0acdcb27a00120b635d','Access-Accept','2018-01-16 08:29:21'),(68,'zaib','0x2d9b12316dcd19901c046a7908b98edd61','Access-Accept','2018-01-16 09:21:00'),(69,'zaib','0xa2d88677757563dd8ccd89597ed5310161','Access-Accept','2018-01-16 09:31:32'),(70,'zaib','0x23ea56efde100a3fdb5de337c29293ed21','Access-Accept','2018-01-16 09:32:28'),(71,'zaib','0xef3d38b8a69d6ff7deb0376b5347862274','Access-Accept','2018-01-16 09:38:03'),(72,'zaib','0x20bddd1f70c6e7b843ac6f37712ffc974a','Access-Accept','2018-01-16 09:39:55'),(73,'zaib','0x8868a1f9cc61c5d040f98765e3b04c503d','Access-Accept','2018-01-16 10:30:32'),(74,'zaib','0xfbd46c2d49b039a3cf0392c7aa6e685c75','Access-Accept','2018-01-16 10:30:59'),(75,'zaib','0xb6f4edf57f80fd8a8e310f9f2e7589b860','Access-Accept','2018-01-16 10:48:49'),(76,'zaib','0x5b1d72d3b1a040fcf11bd95766ef7cff8a','Access-Accept','2018-01-17 04:56:51'),(77,'zaib','0x18ee777c8ce75239dcd679e6180bf07654','Access-Accept','2018-01-17 04:56:55'),(78,'mockinqjaye','0x88a4c04f3f56cc19f8c7ad83f1d5a99641','Access-Accept','2018-01-17 04:57:01'),(79,'zaib','0x806f233b84b8ce475a8a7d8c3cc12a780f','Access-Accept','2018-01-17 05:03:16'),(80,'zaib','0x1e00dfe5b756d58096190201e6e899f95c','Access-Accept','2018-01-17 05:04:50'),(81,'zaib','0x725ad1d81a136006436c2234da9b5a11a5','Access-Accept','2018-01-17 05:07:28'),(82,'zaib','0xe9bc1d7223145088510e73a6addfedbfd7','Access-Accept','2018-01-17 05:09:51'),(83,'zaib','0x9c0e66426b07c739b4482fab6b0d08d350','Access-Accept','2018-01-17 05:12:50'),(84,'mockinqjaye','0x804c36fbaa8ac17d9abc18f24fdc8ba0e7','Access-Accept','2018-01-17 05:22:48'),(85,'mockinqjaye','0x110e511d0d742ba9eb988abadc9a32c35f','Access-Accept','2018-01-17 05:24:30'),(86,'mockinqjaye','0x8bcf99668d961c5be3e668488300b59cf5','Access-Accept','2018-01-17 05:29:25'),(87,'mockinqjaye','0x40767352060f38ac5c6bed56ae1d286e51','Access-Accept','2018-01-17 05:38:58'),(88,'zaib','0x77fa64ed0691cee581f7270e57721dbbed','Access-Accept','2018-01-17 05:48:45'),(89,'mockinqjaye','0xa11f846eef0145b5328d01f02a70c602df','Access-Accept','2018-01-17 05:50:44'),(90,'zaib','0x71ebca062115e39437b69f46e3d078d8d3','Access-Accept','2018-01-17 05:58:21'),(91,'zaib','0xd0137afa6c830146868eaaad0e04b43e5a','Access-Accept','2018-01-17 06:10:10'),(92,'zaib','0x3d8c64d676552c483616e17f876b3596cc','Access-Accept','2018-01-17 06:20:09'),(93,'zaib','tammy','Access-Accept','2018-01-17 06:25:51'),(94,'zaib','0x8b4a22940b22909f88c12c431965a699e3','Access-Accept','2018-01-17 06:28:44'),(95,'zaib','0x6974b007ad18a1de87d7cbad751e3df628','Access-Accept','2018-01-17 06:37:44'),(96,'zaib','0x3fd1bf705d992fac5b44575c85eb8cf66c','Access-Accept','2018-01-17 06:45:05'),(97,'zaib','0x0c4476bb97d056f797aa22cf10e5e8de5a','Access-Accept','2018-01-17 06:52:32'),(98,'zaib','0x9daf5b4ec4aa74a52410352b6d31e59537','Access-Accept','2018-01-17 06:52:53'),(99,'zaib','0x76b2f75cd2e31f0240a6442e080e3a971b','Access-Accept','2018-01-17 07:11:25'),(100,'zaib','0x3d397a491bd2cafb85453630cf3140c594','Access-Accept','2018-01-17 07:13:08'),(101,'zaib','0x83f9e606dd746b601f55d4510125167b96','Access-Accept','2018-01-17 07:19:47'),(102,'zaib','0xee120c367ba956bd7cc24ab24b3f333e32','Access-Accept','2018-01-17 07:31:27'),(103,'zaib','0xabb3eb87e07831620209eca404764e6799','Access-Accept','2018-01-17 07:51:17'),(104,'zaib','0x36c6be0a3273fa7dfe446ed17fdb7f13d9','Access-Accept','2018-01-17 08:03:52'),(105,'zaib','0xa73adcdbca671467c2f2f4854f9ea7c943','Access-Accept','2018-01-17 08:04:59'),(106,'zaib','0xfeea13e59ee9fe0a2a8a164b2a00f48eb3','Access-Accept','2018-01-17 08:05:13'),(107,'zaib','0x2243302f2d6d8c923fa6e0428474a8fb5a','Access-Accept','2018-01-17 08:06:11'),(108,'zaib','0xb918eaa5938f9643f8b8071951ed0e201d','Access-Accept','2018-01-17 08:07:34'),(109,'zaib','0xab9c78965cc85d095e8c5e905eb3cfa7d4','Access-Accept','2018-01-18 03:35:21'),(110,'zaib','0x3ac3a6f1533162f2b041b25172cc695a54','Access-Accept','2018-01-18 03:37:15'),(111,'zaib','0x30301c802e5732b154b2f7bca76a7fec33','Access-Accept','2018-01-18 03:45:18'),(112,'zaib','0x55d7b9666db7512bb94c28ac58b331f684','Access-Accept','2018-01-18 03:47:18'),(113,'zaib','0x8c467c376a3d65c59b7534d5c78847ec03','Access-Accept','2018-01-18 04:36:20'),(114,'zaib','tammy','Access-Accept','2018-01-18 05:26:28'),(115,'zaib','0x828f3165c65df20a19d6f8fbd71db1745d','Access-Accept','2018-01-18 05:35:18'),(116,'zaib','0x230976c05534446e1ef9504bb89289d190','Access-Accept','2018-01-18 05:38:01'),(117,'zaib','0x53c2ee08653c8ff0c194809fa44045a492','Access-Accept','2018-01-18 05:52:25'),(118,'zaib','0xc20c68070b6f09aa68989e72854ad669e5','Access-Accept','2018-01-18 05:55:18'),(119,'zaib','0xdd5c6fd0c7d7208b2e5117007079331bc1','Access-Accept','2018-01-19 05:59:32'),(120,'zaib','0x7d7f46e0001121a7b4ee7ca75a8831c65c','Access-Accept','2018-01-19 06:00:29'),(121,'zaib','0xfe63d7a5fbc55dd94657241543a560198c','Access-Accept','2018-01-19 06:03:26'),(122,'zaib','0x908d817670e190c6157509be2a0b82827e','Access-Accept','2018-01-19 06:13:52'),(123,'mockinqjaye','0xe3dbb99f35bdd3b383dd353ea942692c81','Access-Accept','2018-01-19 06:50:20'),(124,'mockinqjaye','0xc00cd3fe6f8277e2b20fc32bd0b2181eb2','Access-Accept','2018-01-19 06:58:02'),(125,'mockinqjaye','0x8990e3341196727cdadbf8f781fce11de7','Access-Accept','2018-01-19 06:59:24'),(126,'mockinqjaye','0x33335473cf8a99670866a349b56bb524e9','Access-Accept','2018-01-19 07:01:32'),(127,'mockinqjaye','0x1e085dea22d714c59775e91aa4b230b62a','Access-Accept','2018-01-19 07:18:39'),(128,'mockinqjaye','0x5bc289747963f8a0520df8366d8f4350b2','Access-Accept','2018-01-19 07:22:28'),(129,'mockinqjaye','0x156953fa4193cab17ac6022ce78e530410','Access-Accept','2018-01-19 07:31:49'),(130,'mockinqjaye','0x681fc264650f8928829c304ce653802708','Access-Accept','2018-01-19 07:36:35'),(131,'mockinqjaye','0x3a1fec2cdf70c8a616e0b4226d4558624a','Access-Accept','2018-01-19 07:37:41'),(132,'mockinqjaye','0xa9ef73b78dd1289ce675c9a7bc6fc8cd49','Access-Accept','2018-01-19 07:50:14'),(133,'mockinqjaye','0xcb7628865aa3a7b9eebe25b2c7dae66eb7','Access-Accept','2018-01-19 07:51:57'),(134,'mockinqjaye','0x0cecf78bc9f78c5fc26ac9853986ab30d7','Access-Accept','2018-01-19 07:55:28'),(135,'mockinqjaye','0x46c5bc8b5490b9d3cb554e4fe1bbac2315','Access-Accept','2018-01-19 08:00:17'),(136,'mockinqjaye','0xf21c5af82372f06e06f82b6d03571ec5ad','Access-Accept','2018-01-19 08:02:18'),(137,'zaib','0xee22e5f7736e1e1a3cbba5065c26c9d0fb','Access-Accept','2018-01-19 08:08:33'),(138,'zaib','0xd5c932ca74819416c7a43af0a88fd60757','Access-Accept','2018-01-19 08:10:43'),(139,'zaib','0xaf8e642b5424702fcbdc3be6bf1f5999b6','Access-Accept','2018-01-20 06:00:26'),(140,'mockinqjaye','0x920804222c3fa14e44b4ec33cbf352e03f','Access-Accept','2018-01-20 06:38:10'),(141,'zaib','0x0f3c592a2d3236971aa5976d039d603778','Access-Accept','2018-01-21 03:02:00'),(142,'zaib','tammy','Access-Accept','2018-01-21 03:23:36'),(143,'mockinqjaye','0x5cdc75b2ae696fd69fa4155ecf0bfffe0a','Access-Accept','2018-01-21 04:10:38'),(144,'zaib','0x354cb983964ab059b2db9497b10afd26a3','Access-Accept','2018-01-21 05:22:57'),(145,'zaib','0x1346e2572c7141cca49bcaa3f8e1decfc1','Access-Accept','2018-01-21 05:31:27'),(146,'zaib','0x2b57de2ec80058cfd127a3e422d2b1a3d2','Access-Accept','2018-01-21 05:33:17'),(147,'mockinqjaye','0xb89e98d89a4c46d24229fc74613467f040','Access-Accept','2018-01-21 05:34:19'),(148,'mockinqjaye','0x087439da0f4699403d3c318fcb4a683641','Access-Accept','2018-01-21 05:37:47'),(149,'mockinqjaye','0x6b673036b362c3087deaf90e4645a24c5c','Access-Accept','2018-01-21 05:48:29'),(150,'mockinqjaye','0xd1f4ab77aad62d043657856c54c5ce53b2','Access-Accept','2018-01-21 05:49:22'),(151,'mockinqjaye','0x0ee40db1865bf87a22f966cfcd3ffc69ef','Access-Accept','2018-01-21 05:54:52'),(152,'mockinqjaye','0xa198fd70330077932221172470e9956170','Access-Accept','2018-01-21 06:02:13'),(153,'mockinqjaye','0x49ff5ef9c890c53159eb0296a78a1fee27','Access-Accept','2018-01-21 06:05:29'),(154,'zaib','0x96551b9415bae49f2c11238db4b1d091d8','Access-Accept','2018-01-21 09:46:03'),(155,'zaib','0xea698e9277d40938468ab54611f7ad755d','Access-Accept','2018-01-21 09:48:23'),(156,'mockinqjaye','0x9d5ba73962317d9bf0af60b742684c8a68','Access-Accept','2018-01-21 09:51:22'),(157,'zaib','0xbffa5844869b3a7381af2c55cba288b1be','Access-Accept','2018-01-21 10:24:09'),(158,'zaib','0x91b7bc9d5d9992884c5923bd4af332d71a','Access-Accept','2018-01-21 10:26:25'),(159,'zaib','0xcb028c037834fc1e3eee5348f7237f7b3d','Access-Accept','2018-01-21 10:29:16'),(160,'zaib','0x9928bed07c5199bb4bd8623552524923d8','Access-Accept','2018-01-21 10:30:43'),(161,'zaib','0x9a2d81634fe317b60d3eb44646959cac50','Access-Accept','2018-01-21 10:47:23'),(162,'zaib','0x2f56ee1c16fac20f26b5b38d7553e1fb76','Access-Accept','2018-01-21 10:56:42');
/*!40000 ALTER TABLE `radpostauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radreply`
--

DROP TABLE IF EXISTS `radreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radreply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radreply`
--

LOCK TABLES `radreply` WRITE;
/*!40000 ALTER TABLE `radreply` DISABLE KEYS */;
INSERT INTO `radreply` VALUES (3,'zaib','Mikrotik-Rate-Limit','=','1024k/1024k'),(4,'mockinqjaye','Mikrotik-Rate-Limit','=','1024k/1024k');
/*!40000 ALTER TABLE `radreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radusergroup`
--

DROP TABLE IF EXISTS `radusergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radusergroup` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '1',
  KEY `username` (`username`(32))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radusergroup`
--

LOCK TABLES `radusergroup` WRITE;
/*!40000 ALTER TABLE `radusergroup` DISABLE KEYS */;
INSERT INTO `radusergroup` VALUES ('zaib','mamon',1),('mockinqjaye','mamon',1);
/*!40000 ALTER TABLE `radusergroup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-22  9:26:22
