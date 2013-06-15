# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.1.59)
# Datenbank: fuxcon2013_django
# Erstellungsdauer: 2013-06-15 00:38:42 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Export von Tabelle auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add permission',1,'add_permission'),
	(2,'Can change permission',1,'change_permission'),
	(3,'Can delete permission',1,'delete_permission'),
	(4,'Can add group',2,'add_group'),
	(5,'Can change group',2,'change_group'),
	(6,'Can delete group',2,'delete_group'),
	(7,'Can add user',3,'add_user'),
	(8,'Can change user',3,'change_user'),
	(9,'Can delete user',3,'delete_user'),
	(10,'Can add content type',4,'add_contenttype'),
	(11,'Can change content type',4,'change_contenttype'),
	(12,'Can delete content type',4,'delete_contenttype'),
	(13,'Can add session',5,'add_session'),
	(14,'Can change session',5,'change_session'),
	(15,'Can delete session',5,'delete_session'),
	(16,'Can add site',6,'add_site'),
	(17,'Can change site',6,'change_site'),
	(18,'Can delete site',6,'delete_site'),
	(19,'Can add log entry',7,'add_logentry'),
	(20,'Can change log entry',7,'change_logentry'),
	(21,'Can delete log entry',7,'delete_logentry'),
	(22,'Can add migration history',8,'add_migrationhistory'),
	(23,'Can change migration history',8,'change_migrationhistory'),
	(24,'Can delete migration history',8,'delete_migrationhistory'),
	(25,'Can add feedback',9,'add_feedback'),
	(26,'Can change feedback',9,'change_feedback'),
	(27,'Can delete feedback',9,'delete_feedback'),
	(28,'Can add gallery',10,'add_gallery'),
	(29,'Can change gallery',10,'change_gallery'),
	(30,'Can delete gallery',10,'delete_gallery'),
	(31,'Can add gallery upload',11,'add_galleryupload'),
	(32,'Can change gallery upload',11,'change_galleryupload'),
	(33,'Can delete gallery upload',11,'delete_galleryupload'),
	(34,'Can add photo',12,'add_photo'),
	(35,'Can change photo',12,'change_photo'),
	(36,'Can delete photo',12,'delete_photo'),
	(37,'Can add photo effect',13,'add_photoeffect'),
	(38,'Can change photo effect',13,'change_photoeffect'),
	(39,'Can delete photo effect',13,'delete_photoeffect'),
	(40,'Can add watermark',14,'add_watermark'),
	(41,'Can change watermark',14,'change_watermark'),
	(42,'Can delete watermark',14,'delete_watermark'),
	(43,'Can add photo size',15,'add_photosize'),
	(44,'Can change photo size',15,'change_photosize'),
	(45,'Can delete photo size',15,'delete_photosize'),
	(61,'Can add project',21,'add_project'),
	(62,'Can change project',21,'change_project'),
	(63,'Can delete project',21,'delete_project'),
	(64,'Can add tag',22,'add_tag'),
	(65,'Can change tag',22,'change_tag'),
	(66,'Can delete tag',22,'delete_tag'),
	(67,'Can add tagged item',23,'add_taggeditem'),
	(68,'Can change tagged item',23,'change_taggeditem'),
	(69,'Can delete tagged item',23,'delete_taggeditem'),
	(70,'Can add Tag',24,'add_tag'),
	(71,'Can change Tag',24,'change_tag'),
	(72,'Can delete Tag',24,'delete_tag'),
	(73,'Can add Tagged Item',25,'add_taggeditem'),
	(74,'Can change Tagged Item',25,'change_taggeditem'),
	(75,'Can delete Tagged Item',25,'delete_taggeditem'),
	(76,'Can add group_ perms',26,'add_group_perms'),
	(77,'Can change group_ perms',26,'change_group_perms'),
	(78,'Can delete group_ perms',26,'delete_group_perms');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` varchar(75) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `password` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`)
VALUES
	(2,'tester','','','olav+tester@schettler.net','pbkdf2_sha256$10000$oXMXfUdRplfZ$qcxe6EKUacP/EfP3iw4HAhlWv5Uu+aE0irYZSbc6VLk=',0,1,0,'2013-06-15 00:32:36','2013-06-07 07:20:00'),
	(3,'admin','','','olav+admin@schettler.net','pbkdf2_sha256$10000$QJgMMO7W8KTO$fOMzc4mwLiqVlIYPMl/J4TZL69cNWzA5xycR9hBz/Cs=',0,1,0,'2013-06-07 07:20:27','2013-06-07 07:20:27');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle contact_form_feedback
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact_form_feedback`;

CREATE TABLE `contact_form_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` varchar(75) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `body` longtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `sent_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_form_feedback_fbfc09f1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext CHARACTER SET latin1 COLLATE latin1_general_ci,
  `object_repr` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Export von Tabelle django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `app_label` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`)
VALUES
	(1,'permission','auth','permission'),
	(2,'group','auth','group'),
	(3,'user','auth','user'),
	(4,'content type','contenttypes','contenttype'),
	(5,'session','sessions','session'),
	(6,'site','sites','site'),
	(7,'log entry','admin','logentry'),
	(8,'migration history','south','migrationhistory'),
	(9,'feedback','contact_form','feedback'),
	(21,'project','projects','project'),
	(22,'tag','tagging','tag'),
	(23,'tagged item','tagging','taggeditem'),
	(26,'group_ perms','object_permissions','group_perms');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('n612u4hd1i77dj8odddly61t7aaa7iff','YzE0NDJhNDg0OGM5OGI3MTkyMDA4ZmRmODZiNjExMWU1M2ZkODY0MTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVRtwcm9qZWN0cy5tb2RlbHMuUGVybUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2013-06-29 00:32:36');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle django_site
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_site`;

CREATE TABLE `django_site` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;

INSERT INTO `django_site` (`id`, `domain`, `name`)
VALUES
	(1,'localhost','Projects (local)');

/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `slug` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `title` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `about` longtext COLLATE latin1_general_ci,
  `photo` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_6340c63c` (`user_id`),
  KEY `projects_f52cfca0` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `user_id`, `slug`, `title`, `about`, `photo`, `start_date`, `end_date`, `created`, `modified`)
VALUES
	(1,2,'','sdsca','asasCacs','project/fuxcon-testbild.jpg','2012-02-14','2013-06-24','2013-06-15 00:33:20','2013-06-15 00:33:20');

/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle south_migrationhistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `south_migrationhistory`;

CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `migration` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;

INSERT INTO `south_migrationhistory` (`id`, `app_name`, `migration`, `applied`)
VALUES
	(10,'taggit','0001_initial','2013-06-10 13:33:05'),
	(11,'taggit','0002_unique_tagnames','2013-06-10 13:33:05'),
	(12,'projects','0001_initial','2013-06-10 13:33:05');

/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle taggit_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taggit_tag`;

CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `slug` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `taggit_tag_name_4ed9aad194b72af1_uniq` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;

INSERT INTO `taggit_tag` (`id`, `name`, `slug`)
VALUES
	(9,'django','django'),
	(8,'fuxcon 2013','fuxcon-2013'),
	(7,'bdd','bdd');

/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle taggit_taggeditem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taggit_taggeditem`;

CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taggit_taggeditem_5659cca2` (`tag_id`),
  KEY `taggit_taggeditem_846f0221` (`object_id`),
  KEY `taggit_taggeditem_37ef4eb4` (`content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;

INSERT INTO `taggit_taggeditem` (`id`, `tag_id`, `object_id`, `content_type_id`)
VALUES
	(9,7,1,21),
	(8,9,1,21),
	(7,8,1,21);

/*!40000 ALTER TABLE `taggit_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
