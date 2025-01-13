/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: punto_venta
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add contacto',7,'add_contacto'),(26,'Can change contacto',7,'change_contacto'),(27,'Can delete contacto',7,'delete_contacto'),(28,'Can view contacto',7,'view_contacto'),(29,'Can add domicilio',8,'add_domicilio'),(30,'Can change domicilio',8,'change_domicilio'),(31,'Can delete domicilio',8,'delete_domicilio'),(32,'Can view domicilio',8,'view_domicilio'),(33,'Can add fiscal',9,'add_fiscal'),(34,'Can change fiscal',9,'change_fiscal'),(35,'Can delete fiscal',9,'delete_fiscal'),(36,'Can view fiscal',9,'view_fiscal'),(37,'Can add negocio',10,'add_negocio'),(38,'Can change negocio',10,'change_negocio'),(39,'Can delete negocio',10,'delete_negocio'),(40,'Can view negocio',10,'view_negocio'),(41,'Can add medida',11,'add_medida'),(42,'Can change medida',11,'change_medida'),(43,'Can delete medida',11,'delete_medida'),(44,'Can view medida',11,'view_medida'),(45,'Can add producto',12,'add_producto'),(46,'Can change producto',12,'change_producto'),(47,'Can delete producto',12,'delete_producto'),(48,'Can view producto',12,'view_producto'),(49,'Can add marca',13,'add_marca'),(50,'Can change marca',13,'change_marca'),(51,'Can delete marca',13,'delete_marca'),(52,'Can view marca',13,'view_marca'),(53,'Can add departamento',14,'add_departamento'),(54,'Can change departamento',14,'change_departamento'),(55,'Can delete departamento',14,'delete_departamento'),(56,'Can view departamento',14,'view_departamento'),(57,'Can add cliente',15,'add_cliente'),(58,'Can change cliente',15,'change_cliente'),(59,'Can delete cliente',15,'delete_cliente'),(60,'Can view cliente',15,'view_cliente'),(61,'Can add m caja',16,'add_mcaja'),(62,'Can change m caja',16,'change_mcaja'),(63,'Can delete m caja',16,'delete_mcaja'),(64,'Can view m caja',16,'view_mcaja'),(65,'Can add caja',17,'add_caja'),(66,'Can change caja',17,'change_caja'),(67,'Can delete caja',17,'delete_caja'),(68,'Can view caja',17,'view_caja'),(69,'Can add usuario',18,'add_usuario'),(70,'Can change usuario',18,'change_usuario'),(71,'Can delete usuario',18,'delete_usuario'),(72,'Can view usuario',18,'view_usuario'),(73,'Can add venta',19,'add_venta'),(74,'Can change venta',19,'change_venta'),(75,'Can delete venta',19,'delete_venta'),(76,'Can view venta',19,'view_venta');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$bIgZkql09pg9Ync3IEfEaZ$8r7InQWnoJvb1I9TRg1NlmESZXTq2shv7vC/HDAP0Io=','2025-01-10 21:39:31.842888',0,'chanchito','','','',0,1,'2025-01-09 22:22:52.478902'),(3,'pbkdf2_sha256$870000$LUXYwBBBRnAKu6v2mRJQLq$6jCwgd4LpGZ0kRGhr21WFITmQkIcGMmQAj7ymTXihpc=','2025-01-10 19:35:03.537253',0,'chanchot','','','',0,1,'2025-01-10 17:40:41.522808'),(6,'pbkdf2_sha256$870000$E9gfh1jytLW5Q7pZhilYfV$ZwxfGXgzVH1Yl2c1VRZg6xvMNghVEdwlBfZAGycW8G4=','2025-01-10 18:17:56.446611',0,'fulanita','','','',0,1,'2025-01-10 18:17:55.075695'),(7,'pbkdf2_sha256$870000$Jgc3qsHFhjXztrZ7GMyq3Z$Sfb4ED2TUNWzYOAqs3gLfG2WiHTH+L0Dbn8TEk6KxCs=','2025-01-10 22:50:35.357640',1,'oscarin','','','',0,1,'2025-01-10 18:19:28.148871');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(17,'venta','caja'),(15,'venta','cliente'),(7,'venta','contacto'),(14,'venta','departamento'),(8,'venta','domicilio'),(9,'venta','fiscal'),(13,'venta','marca'),(16,'venta','mcaja'),(11,'venta','medida'),(10,'venta','negocio'),(12,'venta','producto'),(18,'venta','usuario'),(19,'venta','venta');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-01-06 17:42:06.543633'),(2,'auth','0001_initial','2025-01-06 17:42:10.325124'),(3,'admin','0001_initial','2025-01-06 17:42:11.049918'),(4,'admin','0002_logentry_remove_auto_add','2025-01-06 17:42:11.084309'),(5,'admin','0003_logentry_add_action_flag_choices','2025-01-06 17:42:11.115292'),(6,'contenttypes','0002_remove_content_type_name','2025-01-06 17:42:11.750094'),(7,'auth','0002_alter_permission_name_max_length','2025-01-06 17:42:12.108337'),(8,'auth','0003_alter_user_email_max_length','2025-01-06 17:42:12.291677'),(9,'auth','0004_alter_user_username_opts','2025-01-06 17:42:12.323293'),(10,'auth','0005_alter_user_last_login_null','2025-01-06 17:42:12.624917'),(11,'auth','0006_require_contenttypes_0002','2025-01-06 17:42:12.639181'),(12,'auth','0007_alter_validators_add_error_messages','2025-01-06 17:42:12.669793'),(13,'auth','0008_alter_user_username_max_length','2025-01-06 17:42:12.841831'),(14,'auth','0009_alter_user_last_name_max_length','2025-01-06 17:42:13.016771'),(15,'auth','0010_alter_group_name_max_length','2025-01-06 17:42:13.191696'),(16,'auth','0011_update_proxy_permissions','2025-01-06 17:42:13.221382'),(17,'auth','0012_alter_user_first_name_max_length','2025-01-06 17:42:13.399828'),(18,'sessions','0001_initial','2025-01-06 17:42:13.741594'),(19,'venta','0001_initial','2025-01-06 17:46:59.194629'),(20,'venta','0002_alter_domicilio_cp_alter_domicilio_ne','2025-01-06 17:46:59.744671'),(21,'venta','0003_caja_departamento_marca_medida_cliente_producto_and_more','2025-01-07 17:01:43.773547'),(22,'venta','0004_venta','2025-01-07 17:05:14.544487'),(23,'venta','0005_rename_departamnto_producto_departamento_and_more','2025-01-09 20:32:24.751765'),(24,'django_registration','0001_initial','2025-01-10 15:43:29.720748'),(25,'venta','0006_alter_contacto_correo','2025-01-10 18:15:52.502341'),(26,'venta','0007_alter_contacto_correo','2025-01-10 18:16:56.826552');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('pdtsv8c3ze6you33thtvwywcwlv38525','e30:1tWJaN:kWrwoBD-1j8oFTAVwO5AsU18Db02nucWvYpbh_-N8Ls','2025-01-24 18:18:19.731515'),('poswnvap59wqfb0bofbg2wi4nannx67j','.eJxVjMEOwiAQRP-FsyEUoQsevfsNZGEXqRqalPZk_Hdp0oPeJm_ezFsE3NYStsZLmEhcBIjTL4uYnlz3gh5Y77NMc12XKcpdkUfb5G0mfl0P9--gYCt9bZw3GhCAk9LQU6Z4zhw96TRGwg7RG46W2VmCrLTlYUjIQGo0TonPF_dnOGk:1tWNpr:YRHZuLQXeK4St-zFhqxE-W9z0ZPklxv7APG7qZxWD3U','2025-01-24 22:50:35.374179');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_caja`
--

DROP TABLE IF EXISTS `venta_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_caja` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clave` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_caja`
--

LOCK TABLES `venta_caja` WRITE;
/*!40000 ALTER TABLE `venta_caja` DISABLE KEYS */;
INSERT INTO `venta_caja` VALUES (1,'001','Caja1'),(2,'002','Caja2'),(3,'003','Caja3'),(4,'004','Caja Expres');
/*!40000 ALTER TABLE `venta_caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_cliente`
--

DROP TABLE IF EXISTS `venta_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_cliente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `contacto_id` bigint(20) DEFAULT NULL,
  `fiscal_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venta_cliente_contacto_id_0f832fec_fk_venta_contacto_id` (`contacto_id`),
  KEY `venta_cliente_fiscal_id_59f58ac9_fk_venta_fiscal_id` (`fiscal_id`),
  CONSTRAINT `venta_cliente_contacto_id_0f832fec_fk_venta_contacto_id` FOREIGN KEY (`contacto_id`) REFERENCES `venta_contacto` (`id`),
  CONSTRAINT `venta_cliente_fiscal_id_59f58ac9_fk_venta_fiscal_id` FOREIGN KEY (`fiscal_id`) REFERENCES `venta_fiscal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_cliente`
--

LOCK TABLES `venta_cliente` WRITE;
/*!40000 ALTER TABLE `venta_cliente` DISABLE KEYS */;
INSERT INTO `venta_cliente` VALUES (1,'Chanchito','Triste',3,3);
/*!40000 ALTER TABLE `venta_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_contacto`
--

DROP TABLE IF EXISTS `venta_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_contacto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `telefono` varchar(10) DEFAULT NULL,
  `celular` varchar(10) NOT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_contacto`
--

LOCK TABLES `venta_contacto` WRITE;
/*!40000 ALTER TABLE `venta_contacto` DISABLE KEYS */;
INSERT INTO `venta_contacto` VALUES (1,'4435672356','3456782345','loschachos@gmail.com',NULL),(2,'4435672356','3456782345','loschachos@hotmail.com',NULL),(3,'3456782345','45343433','chtriste@hotmail.com',NULL),(4,'3456782345','4435672356','cht@outlook.com',NULL),(5,NULL,'','',NULL),(8,NULL,'',NULL,NULL),(9,NULL,'4171161181','oscarinramirez13@gmail.com',NULL);
/*!40000 ALTER TABLE `venta_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_departamento`
--

DROP TABLE IF EXISTS `venta_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_departamento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_departamento`
--

LOCK TABLES `venta_departamento` WRITE;
/*!40000 ALTER TABLE `venta_departamento` DISABLE KEYS */;
INSERT INTO `venta_departamento` VALUES (1,'Lacteos'),(2,'Bebidas'),(3,'Botanas'),(4,'Cereales'),(5,'Dulces');
/*!40000 ALTER TABLE `venta_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_domicilio`
--

DROP TABLE IF EXISTS `venta_domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_domicilio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pais` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `municipio` varchar(50) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `ne` varchar(50) NOT NULL,
  `ni` varchar(50) DEFAULT NULL,
  `referencia` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_domicilio`
--

LOCK TABLES `venta_domicilio` WRITE;
/*!40000 ALTER TABLE `venta_domicilio` DISABLE KEYS */;
INSERT INTO `venta_domicilio` VALUES (1,'Mexico','Chihhuahua','Abasolo','32323','Centro','Madero','12',NULL,'dfsdkdkdkdkdkdkdkdkdkdkd'),(2,'Mexico','Chihhuahua','Abasolo','32323','Centro','Madero','12','23','gygygyyjggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg'),(3,'Mexico','Sinalia','Culiacan','54321','Las arboledas','Abasolo','5',NULL,'ddkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
/*!40000 ALTER TABLE `venta_domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_fiscal`
--

DROP TABLE IF EXISTS `venta_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_fiscal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rfc` varchar(10) NOT NULL,
  `rs` varchar(200) NOT NULL,
  `domicilio_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venta_fiscal_domicilio_id_b3fd51e7_fk_venta_domicilio_id` (`domicilio_id`),
  CONSTRAINT `venta_fiscal_domicilio_id_b3fd51e7_fk_venta_domicilio_id` FOREIGN KEY (`domicilio_id`) REFERENCES `venta_domicilio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_fiscal`
--

LOCK TABLES `venta_fiscal` WRITE;
/*!40000 ALTER TABLE `venta_fiscal` DISABLE KEYS */;
INSERT INTO `venta_fiscal` VALUES (1,'CH45656mnn','Los Chanchos SA DE CV',1),(2,'CH45656mnn','Los Chanchos SA DE CV',2),(3,'CHTR456544','Chanchito Triste',3);
/*!40000 ALTER TABLE `venta_fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_marca`
--

DROP TABLE IF EXISTS `venta_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_marca` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_marca`
--

LOCK TABLES `venta_marca` WRITE;
/*!40000 ALTER TABLE `venta_marca` DISABLE KEYS */;
INSERT INTO `venta_marca` VALUES (1,'Sabritas'),(3,'Alpura'),(4,'Coca'),(5,'Gamesa'),(6,'Sonrics');
/*!40000 ALTER TABLE `venta_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_mcaja`
--

DROP TABLE IF EXISTS `venta_mcaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_mcaja` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `movimento` varchar(1) NOT NULL,
  `ma` decimal(11,2) NOT NULL,
  `mc` decimal(11,2) DEFAULT NULL,
  `ganacia` decimal(11,2) DEFAULT NULL,
  `caja_id` bigint(20) DEFAULT NULL,
  `empleado_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venta_mcaja_caja_id_a3fc47b1_fk_venta_caja_id` (`caja_id`),
  KEY `venta_mcaja_empleado_id_a683d757_fk_venta_usuario_id` (`empleado_id`),
  CONSTRAINT `venta_mcaja_caja_id_a3fc47b1_fk_venta_caja_id` FOREIGN KEY (`caja_id`) REFERENCES `venta_caja` (`id`),
  CONSTRAINT `venta_mcaja_empleado_id_a683d757_fk_venta_usuario_id` FOREIGN KEY (`empleado_id`) REFERENCES `venta_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_mcaja`
--

LOCK TABLES `venta_mcaja` WRITE;
/*!40000 ALTER TABLE `venta_mcaja` DISABLE KEYS */;
INSERT INTO `venta_mcaja` VALUES (6,'2025-01-10 21:39:40.071249','A',100.00,NULL,NULL,2,1),(7,'2025-01-10 21:40:10.140083','C',100.00,200.00,NULL,2,1),(8,'2025-01-10 21:41:38.344366','A',200.00,NULL,NULL,3,1),(9,'2025-01-10 21:41:43.305620','C',200.00,500.00,300.00,3,1),(10,'2025-01-10 22:51:41.795021','A',100.00,NULL,NULL,1,1),(11,'2025-01-10 22:51:55.484676','C',100.00,300.00,200.00,1,1);
/*!40000 ALTER TABLE `venta_mcaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_medida`
--

DROP TABLE IF EXISTS `venta_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_medida` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_medida`
--

LOCK TABLES `venta_medida` WRITE;
/*!40000 ALTER TABLE `venta_medida` DISABLE KEYS */;
INSERT INTO `venta_medida` VALUES (1,'Metro');
/*!40000 ALTER TABLE `venta_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_negocio`
--

DROP TABLE IF EXISTS `venta_negocio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_negocio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `contacto_id` bigint(20) DEFAULT NULL,
  `fiscal_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venta_negocio_contacto_id_bf93f8dd_fk_venta_contacto_id` (`contacto_id`),
  KEY `venta_negocio_fiscal_id_be605f53_fk_venta_fiscal_id` (`fiscal_id`),
  CONSTRAINT `venta_negocio_contacto_id_bf93f8dd_fk_venta_contacto_id` FOREIGN KEY (`contacto_id`) REFERENCES `venta_contacto` (`id`),
  CONSTRAINT `venta_negocio_fiscal_id_be605f53_fk_venta_fiscal_id` FOREIGN KEY (`fiscal_id`) REFERENCES `venta_fiscal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_negocio`
--

LOCK TABLES `venta_negocio` WRITE;
/*!40000 ALTER TABLE `venta_negocio` DISABLE KEYS */;
INSERT INTO `venta_negocio` VALUES (1,'Los Chanchos',2,2);
/*!40000 ALTER TABLE `venta_negocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_producto`
--

DROP TABLE IF EXISTS `venta_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_producto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `existencia` int(11) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `em` int(11) NOT NULL,
  `departamento_id` bigint(20) DEFAULT NULL,
  `marca_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venta_producto_marca_id_a3612a11_fk_venta_marca_id` (`marca_id`),
  KEY `venta_producto_departamento_id_8f8dcdff_fk_venta_departamento_id` (`departamento_id`),
  CONSTRAINT `venta_producto_departamento_id_8f8dcdff_fk_venta_departamento_id` FOREIGN KEY (`departamento_id`) REFERENCES `venta_departamento` (`id`),
  CONSTRAINT `venta_producto_marca_id_a3612a11_fk_venta_marca_id` FOREIGN KEY (`marca_id`) REFERENCES `venta_marca` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_producto`
--

LOCK TABLES `venta_producto` WRITE;
/*!40000 ALTER TABLE `venta_producto` DISABLE KEYS */;
INSERT INTO `venta_producto` VALUES (1,'Leche sabor chocolate','Leche de vaca pasteurizada sabor a chocolate',20,15.00,1,1,3),(2,'Coca cola 1 litro','Refresco sabor cola de un litro',25,20.00,1,2,4),(3,'Chokis','Galletas con chispas de chocolate',18,10.00,1,4,5);
/*!40000 ALTER TABLE `venta_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_usuario`
--

DROP TABLE IF EXISTS `venta_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `contacto_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venta_usuario_contacto_id_6f7051d4_fk_venta_contacto_id` (`contacto_id`),
  KEY `venta_usuario_user_id_2904a411_fk_auth_user_id` (`user_id`),
  CONSTRAINT `venta_usuario_contacto_id_6f7051d4_fk_venta_contacto_id` FOREIGN KEY (`contacto_id`) REFERENCES `venta_contacto` (`id`),
  CONSTRAINT `venta_usuario_user_id_2904a411_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_usuario`
--

LOCK TABLES `venta_usuario` WRITE;
/*!40000 ALTER TABLE `venta_usuario` DISABLE KEYS */;
INSERT INTO `venta_usuario` VALUES (1,'Chanchito','Feliz','M',2,4,1,'users/fallout.png'),(2,'Chancho','Triste','M',2,5,3,''),(3,'Fulana','De tal','F',2,8,6,''),(4,'Oscar Armando','Ramirez Acevedo','M',1,9,7,'');
/*!40000 ALTER TABLE `venta_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_venta`
--

DROP TABLE IF EXISTS `venta_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_venta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `total_descuento` decimal(11,2) NOT NULL,
  `importe` decimal(11,2) NOT NULL,
  `cambio` decimal(11,2) NOT NULL,
  `caja_id` bigint(20) DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `empleado_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venta_venta_caja_id_2f13b4b1_fk_venta_caja_id` (`caja_id`),
  KEY `venta_venta_cliente_id_ccc2a041_fk_venta_cliente_id` (`cliente_id`),
  KEY `venta_venta_empleado_id_2b50dca5_fk_venta_usuario_id` (`empleado_id`),
  CONSTRAINT `venta_venta_caja_id_2f13b4b1_fk_venta_caja_id` FOREIGN KEY (`caja_id`) REFERENCES `venta_caja` (`id`),
  CONSTRAINT `venta_venta_cliente_id_ccc2a041_fk_venta_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `venta_cliente` (`id`),
  CONSTRAINT `venta_venta_empleado_id_2b50dca5_fk_venta_usuario_id` FOREIGN KEY (`empleado_id`) REFERENCES `venta_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_venta`
--

LOCK TABLES `venta_venta` WRITE;
/*!40000 ALTER TABLE `venta_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-12 17:07:00
