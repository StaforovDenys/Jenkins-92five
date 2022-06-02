-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: 92five
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

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
-- Table structure for table `92five_event_user`
--

DROP TABLE IF EXISTS `92five_event_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_event_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `events_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_user_events_id_foreign` (`events_id`),
  KEY `event_user_user_id_foreign` (`user_id`),
  CONSTRAINT `event_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `92five_users` (`id`),
  CONSTRAINT `event_user_events_id_foreign` FOREIGN KEY (`events_id`) REFERENCES `92five_events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_event_user`
--

LOCK TABLES `92five_event_user` WRITE;
/*!40000 ALTER TABLE `92five_event_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `92five_event_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_events`
--

DROP TABLE IF EXISTS `92five_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `project` bigint(20) DEFAULT NULL,
  `task` int(10) unsigned DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `folder` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_events`
--

LOCK TABLES `92five_events` WRITE;
/*!40000 ALTER TABLE `92five_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `92five_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_file`
--

DROP TABLE IF EXISTS `92five_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_sys_ref` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_md5` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uploaded_by` int(10) unsigned DEFAULT NULL,
  `uploaded_date` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_file`
--

LOCK TABLES `92five_file` WRITE;
/*!40000 ALTER TABLE `92five_file` DISABLE KEYS */;
INSERT INTO `92five_file` VALUES (1,'Screenshot_8.png','assets/uploads/projects/uLIDu34c/','4e5ffd60564aab8d2039dfb6c283026c.png','4e5ffd60564aab8d2039dfb6c283026c','149.00 KB',1,'2022-05-17 11:13:23','2022-05-17 11:13:23','2022-05-17 11:13:23',NULL,NULL);
/*!40000 ALTER TABLE `92five_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_file_ref`
--

DROP TABLE IF EXISTS `92five_file_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_file_ref` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attachment_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `parent_type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_ref_attachment_id_foreign` (`attachment_id`),
  CONSTRAINT `file_ref_attachment_id_foreign` FOREIGN KEY (`attachment_id`) REFERENCES `92five_file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_file_ref`
--

LOCK TABLES `92five_file_ref` WRITE;
/*!40000 ALTER TABLE `92five_file_ref` DISABLE KEYS */;
INSERT INTO `92five_file_ref` VALUES (1,1,1,'project','2022-05-17 11:13:23','2022-05-17 11:13:23',NULL,NULL);
/*!40000 ALTER TABLE `92five_file_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_groups`
--

DROP TABLE IF EXISTS `92five_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_groups`
--

LOCK TABLES `92five_groups` WRITE;
/*!40000 ALTER TABLE `92five_groups` DISABLE KEYS */;
INSERT INTO `92five_groups` VALUES (1,'admin','{\"project.create\":1,\"project.update\":1,\"project.view\":1,\"project.delete\":1,\"task.create\":1,\"task.update\":1,\"task.view\":1,\"task.delete\":1,\"milestone.create\":1,\"milestone.update\":1,\"milestone.view\":1,\"milestone.delete\":1,\"user.create\":1,\"user.update\":1,\"user.view\":1,\"user.delete\":1,\"role.create\":1,\"role.update\":1,\"role.view\":1,\"role.delete\":1,\"reports.create\":1,\"reports.update\":1,\"reports.view\":1,\"reports.delete\":1,\"groups.create\":1,\"groups.update\":1,\"groups.view\":1,\"groups.delete\":1}','2022-05-17 10:35:43','2022-05-17 10:35:43'),(2,'manager','{\"project.create\":1,\"project.update\":1,\"project.view\":1,\"project.delete\":1,\"task.create\":1,\"task.update\":1,\"task.view\":1,\"task.delete\":1,\"milestone.create\":1,\"milestone.update\":1,\"milestone.view\":1,\"milestone.delete\":1,\"user.view\":1,\"role.view\":1,\"reports.create\":1,\"reports.update\":1,\"reports.view\":1,\"reports.delete\":1,\"groups.view\":1}','2022-05-17 10:35:43','2022-05-17 10:35:43'),(3,'leader','{\"project.update\":1,\"project.view\":1,\"task.create\":1,\"task.update\":1,\"task.view\":1,\"task.delete\":1,\"milestone.create\":1,\"milestone.update\":1,\"milestone.view\":1,\"milestone.delete\":1,\"user.view\":1,\"role.view\":1,\"reports.create\":1,\"reports.update\":1,\"reports.view\":1}','2022-05-17 10:35:43','2022-05-17 10:35:43'),(4,'user','{\"project.view\":1,\"task.create\":1,\"task.update\":1,\"task.view\":1,\"task.delete\":1,\"milestone.update\":1,\"milestone.view\":1,\"milestone.delete\":1,\"user.view\":1,\"reports.view\":1}','2022-05-17 10:35:43','2022-05-17 10:35:43');
/*!40000 ALTER TABLE `92five_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_migrations`
--

DROP TABLE IF EXISTS `92five_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_migrations`
--

LOCK TABLES `92five_migrations` WRITE;
/*!40000 ALTER TABLE `92five_migrations` DISABLE KEYS */;
INSERT INTO `92five_migrations` VALUES ('2014_07_23_161323_create_92_fiveapp_database',1);
/*!40000 ALTER TABLE `92five_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_project_user`
--

DROP TABLE IF EXISTS `92five_project_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_project_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_user_project_id_foreign` (`project_id`),
  KEY `project_user_user_id_foreign` (`user_id`),
  CONSTRAINT `project_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `92five_users` (`id`),
  CONSTRAINT `project_user_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `92five_projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_project_user`
--

LOCK TABLES `92five_project_user` WRITE;
/*!40000 ALTER TABLE `92five_project_user` DISABLE KEYS */;
INSERT INTO `92five_project_user` VALUES (1,1,1,'2022-05-17 11:16:17','2022-05-17 11:13:11','2022-05-17 11:16:17',1);
/*!40000 ALTER TABLE `92five_project_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_projects`
--

DROP TABLE IF EXISTS `92five_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `project_client` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `note` text COLLATE utf8_unicode_ci,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `folder` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `completed_on` datetime DEFAULT NULL,
  `mark_completed_by` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_projects`
--

LOCK TABLES `92five_projects` WRITE;
/*!40000 ALTER TABLE `92five_projects` DISABLE KEYS */;
INSERT INTO `92five_projects` VALUES (1,'kjnnlk','bbb','nnn','nn','2022-05-19','2022-05-26','active','uLIDu34c',1,NULL,'2022-05-17 11:16:17',1,NULL,NULL,'2022-05-17 11:13:11','2022-05-17 11:16:17');
/*!40000 ALTER TABLE `92five_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_quicknote`
--

DROP TABLE IF EXISTS `92five_quicknote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_quicknote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci,
  `user_id` int(10) unsigned DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_quicknote`
--

LOCK TABLES `92five_quicknote` WRITE;
/*!40000 ALTER TABLE `92five_quicknote` DISABLE KEYS */;
INSERT INTO `92five_quicknote` VALUES (1,'',1,'2022-05-17 11:16:27','2022-05-17 11:07:01');
/*!40000 ALTER TABLE `92five_quicknote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_subtasks`
--

DROP TABLE IF EXISTS `92five_subtasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_subtasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `task_id` int(10) unsigned NOT NULL,
  `completed_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subtasks_task_id_foreign` (`task_id`),
  CONSTRAINT `subtasks_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `92five_tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_subtasks`
--

LOCK TABLES `92five_subtasks` WRITE;
/*!40000 ALTER TABLE `92five_subtasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `92five_subtasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_task_user`
--

DROP TABLE IF EXISTS `92five_task_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_task_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_user_task_id_foreign` (`task_id`),
  KEY `task_user_user_id_foreign` (`user_id`),
  CONSTRAINT `task_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `92five_users` (`id`),
  CONSTRAINT `task_user_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `92five_tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_task_user`
--

LOCK TABLES `92five_task_user` WRITE;
/*!40000 ALTER TABLE `92five_task_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `92five_task_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_tasks`
--

DROP TABLE IF EXISTS `92five_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `folder` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `completed_on` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_foreign` (`project_id`),
  CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `92five_projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_tasks`
--

LOCK TABLES `92five_tasks` WRITE;
/*!40000 ALTER TABLE `92five_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `92five_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_throttle`
--

DROP TABLE IF EXISTS `92five_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(10) unsigned NOT NULL,
  `suspended` tinyint(1) NOT NULL,
  `banned` tinyint(1) NOT NULL,
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_throttle`
--

LOCK TABLES `92five_throttle` WRITE;
/*!40000 ALTER TABLE `92five_throttle` DISABLE KEYS */;
INSERT INTO `92five_throttle` VALUES (1,1,'192.168.0.106',0,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `92five_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_timesheet`
--

DROP TABLE IF EXISTS `92five_timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_timesheet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_id` int(10) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `total_time_spent` datetime DEFAULT NULL,
  `total_hours` int(10) unsigned DEFAULT NULL,
  `total_minutes` int(10) unsigned DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `remarks` text COLLATE utf8_unicode_ci,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timesheet_user_id_foreign` (`user_id`),
  KEY `timesheet_task_id_foreign` (`task_id`),
  CONSTRAINT `timesheet_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `92five_tasks` (`id`),
  CONSTRAINT `timesheet_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `92five_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_timesheet`
--

LOCK TABLES `92five_timesheet` WRITE;
/*!40000 ALTER TABLE `92five_timesheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `92five_timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_todos`
--

DROP TABLE IF EXISTS `92five_todos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_todos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `due_date` date DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_todos`
--

LOCK TABLES `92five_todos` WRITE;
/*!40000 ALTER TABLE `92five_todos` DISABLE KEYS */;
/*!40000 ALTER TABLE `92five_todos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_user_profile`
--

DROP TABLE IF EXISTS `92five_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_user_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facebook` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `googleplus` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `about` text COLLATE utf8_unicode_ci,
  `website` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_profile_id_foreign` FOREIGN KEY (`id`) REFERENCES `92five_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_user_profile`
--

LOCK TABLES `92five_user_profile` WRITE;
/*!40000 ALTER TABLE `92five_user_profile` DISABLE KEYS */;
INSERT INTO `92five_user_profile` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-05-17 11:07:01','2022-05-17 11:07:01',NULL,NULL,NULL);
/*!40000 ALTER TABLE `92five_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_users`
--

DROP TABLE IF EXISTS `92five_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `activated` tinyint(1) NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_users`
--

LOCK TABLES `92five_users` WRITE;
/*!40000 ALTER TABLE `92five_users` DISABLE KEYS */;
INSERT INTO `92five_users` VALUES (1,'staferovdenis7work@gmail.com','$2y$10$FLzaGVeNAlJY1xPoMhRXjeK5fm/7vaQz05V14d.L/d167C3MVu1sG',NULL,1,NULL,NULL,'2022-05-17 08:17:31','$2y$10$qrkD5kw47eC7QHANvBoCsuuH0wy4xP8Iof86MDmA5VcbHxRvj0T4u',NULL,'Denys','Staforov','2022-05-17 08:07:01','2022-05-17 08:17:31');
/*!40000 ALTER TABLE `92five_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `92five_users_groups`
--

DROP TABLE IF EXISTS `92five_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `92five_users_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_groups_user_id_foreign` (`user_id`),
  KEY `users_groups_group_id_foreign` (`group_id`),
  CONSTRAINT `users_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `92five_groups` (`id`),
  CONSTRAINT `users_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `92five_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `92five_users_groups`
--

LOCK TABLES `92five_users_groups` WRITE;
/*!40000 ALTER TABLE `92five_users_groups` DISABLE KEYS */;
INSERT INTO `92five_users_groups` VALUES (1,1,1);
/*!40000 ALTER TABLE `92five_users_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-17 15:08:18
