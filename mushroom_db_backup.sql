-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: mushroom_db
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL COMMENT '用户ID',
  `receiver` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收件人姓名',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省份',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市',
  `district` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '区县',
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '详细地址',
  `postalCode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `isDefault` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认地址',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,2,'张三','13845557834','河北省','承德市','双桥区','xxxxxxxxxxxxxx','010000',0,'2026-01-24 09:35:29','2026-02-22 04:41:50'),(2,2,'ddd','13351326666','d','fefef','ddd','efdwf\ndwq',NULL,0,'2026-01-24 09:35:57','2026-02-22 04:41:50'),(3,3,'11111111','13351344444','wfefe','fefef','44444444','efdwf\ndwq',NULL,0,'2026-02-19 10:47:36','2026-02-19 10:47:36');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '璐?墿杞?D',
  `userId` int NOT NULL COMMENT '用户ID',
  `productId` int NOT NULL COMMENT '商品ID',
  `type` enum('product','box') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'product' COMMENT '????????roduct-????????box-???',
  `quantity` int NOT NULL DEFAULT '1' COMMENT '商品数量',
  `selected` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否选中',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carts_userId_productId_type_unique` (`userId`,`productId`,`type`),
  KEY `userId` (`userId`),
  KEY `productId` (`productId`),
  KEY `idx_type` (`type`),
  CONSTRAINT `carts_userId_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='璐?墿杞﹁〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (27,7,2,'product',2,1,'2026-01-24 09:57:15','2026-01-24 09:57:18');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `workId` int NOT NULL COMMENT '作品ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `content` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workId` (`workId`),
  KEY `userId` (`userId`),
  KEY `comments_work_id` (`workId`),
  KEY `comments_user_id` (`userId`),
  KEY `comments_created_at` (`createdAt`),
  KEY `comments_parentId_foreign_idx` (`parentId`),
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`workId`) REFERENCES `works` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_parentId_foreign_idx` FOREIGN KEY (`parentId`) REFERENCES `comments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,5,2,'杀杀杀杀杀杀杀杀杀','2026-02-07 14:42:55','2026-02-07 14:42:55',NULL,NULL),(2,5,2,'水水水水水水水水','2026-02-07 14:43:00','2026-02-07 14:43:00',NULL,NULL),(4,5,2,'l\n','2026-02-07 15:08:18','2026-02-07 15:08:18',NULL,NULL),(5,3,2,'顶顶顶顶顶顶顶顶顶','2026-02-07 15:14:17','2026-02-07 15:14:17',NULL,NULL),(6,3,2,'的','2026-02-07 15:15:34','2026-02-07 15:15:34',NULL,NULL),(7,3,2,'dddddd','2026-02-07 15:19:14','2026-02-07 15:19:14',NULL,NULL),(8,7,2,'ss','2026-02-07 15:51:10','2026-02-07 15:51:10',NULL,NULL),(9,7,2,'ss','2026-02-07 15:52:01','2026-02-07 15:52:01',NULL,NULL),(10,7,2,'','2026-02-07 16:01:51','2026-02-07 16:01:51',4,NULL),(11,7,2,'的','2026-02-07 16:02:03','2026-02-07 16:02:03',2,NULL),(13,7,2,'','2026-02-07 16:21:04','2026-02-07 16:21:04',3,NULL),(15,7,2,'','2026-02-07 16:33:46','2026-02-07 16:33:46',2,NULL),(16,3,2,'','2026-02-08 02:47:31','2026-02-08 02:47:31',2,NULL),(23,5,2,'ssss','2026-02-08 03:15:31','2026-02-08 03:15:31',NULL,NULL),(24,5,2,'','2026-02-08 03:17:07','2026-02-08 03:17:07',4,NULL),(25,5,2,'6566','2026-02-08 03:17:29','2026-02-08 03:17:29',3,NULL),(26,5,2,'','2026-02-08 03:47:50','2026-02-08 03:47:50',3,NULL),(27,5,2,'','2026-02-08 03:58:55','2026-02-08 03:58:55',3,NULL),(28,5,2,'44\n','2026-02-08 03:59:33','2026-02-08 03:59:33',5,NULL),(29,5,2,'地对地导弹的','2026-02-08 04:19:27','2026-02-08 04:19:27',5,NULL),(30,5,2,'顶顶顶顶顶','2026-02-08 04:19:56','2026-02-08 04:19:56',5,NULL),(31,5,2,'6','2026-02-08 04:45:04','2026-02-08 04:45:04',5,NULL),(32,5,2,'7\n','2026-02-08 05:43:17','2026-02-08 05:43:17',5,NULL),(33,5,2,'44','2026-02-08 05:49:57','2026-02-08 05:49:57',5,NULL),(34,5,2,'就看见','2026-02-08 05:51:31','2026-02-08 05:51:31',5,NULL),(35,3,2,'','2026-02-08 07:08:54','2026-02-08 07:08:54',2,NULL),(36,3,2,'ii','2026-02-08 07:09:05','2026-02-08 07:09:05',5,NULL),(37,8,2,'','2026-02-08 07:11:45','2026-02-08 07:11:45',3,NULL),(38,8,2,'ddd','2026-02-08 08:50:21','2026-02-08 08:50:21',4,NULL),(39,3,2,'','2026-02-08 13:00:30','2026-02-08 13:00:30',2,NULL),(40,3,2,'4444','2026-02-08 13:00:38','2026-02-08 13:00:38',4,NULL),(41,3,2,'呱呱呱呱呱呱','2026-02-08 13:00:42','2026-02-08 13:00:42',5,40),(42,3,2,'灌灌灌灌灌灌灌灌','2026-02-08 13:00:47','2026-02-08 13:00:47',5,40),(43,3,2,'嘎嘎嘎嘎嘎嘎嘎','2026-02-08 13:00:57','2026-02-08 13:00:57',5,39),(44,3,2,'111','2026-02-10 09:39:26','2026-02-10 09:39:26',5,40),(48,5,2,'','2026-02-17 02:43:22','2026-02-17 02:43:22',5,NULL),(49,5,2,'','2026-02-17 02:48:50','2026-02-17 02:48:50',3,NULL),(50,5,2,'','2026-02-17 02:50:28','2026-02-17 02:50:28',3,NULL),(51,5,2,'','2026-02-17 03:08:11','2026-02-17 03:08:11',2,NULL),(52,1,2,'','2026-02-17 03:35:13','2026-02-17 03:35:13',3,NULL),(53,3,2,'','2026-02-17 03:48:44','2026-02-17 03:48:44',4,NULL),(54,3,2,'','2026-02-17 04:03:12','2026-02-17 04:03:12',2,NULL),(55,3,2,'ddddddddd','2026-02-17 04:10:18','2026-02-17 04:10:18',4,NULL),(56,3,2,'','2026-02-17 04:18:28','2026-02-17 04:18:28',3,NULL),(57,3,2,'','2026-02-17 04:18:57','2026-02-17 04:18:57',5,NULL),(58,5,2,'','2026-02-17 04:32:07','2026-02-17 04:32:07',3,NULL),(59,5,3,'水水水水水水','2026-02-19 02:36:27','2026-02-19 02:36:27',5,34);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_reviews`
--

DROP TABLE IF EXISTS `content_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_reviews` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '审核ID',
  `contentType` enum('work','video','recipe') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容类型',
  `contentId` int NOT NULL COMMENT '内容ID',
  `reviewerId` int NOT NULL COMMENT '审核者ID',
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '审核状态',
  `comment` text COLLATE utf8mb4_unicode_ci COMMENT '审核意见',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `contentType` (`contentType`),
  KEY `contentId` (`contentId`),
  KEY `reviewerId` (`reviewerId`),
  KEY `status` (`status`),
  CONSTRAINT `content_reviews_reviewerId_foreign` FOREIGN KEY (`reviewerId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容审核表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_reviews`
--

LOCK TABLES `content_reviews` WRITE;
/*!40000 ALTER TABLE `content_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `initiatorId` int NOT NULL COMMENT '发起者ID',
  `initiatorRole` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发起者角色（user/seller/admin）',
  `receiverId` int NOT NULL COMMENT '接收者ID',
  `receiverRole` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接收者角色（user/seller/admin）',
  `lastMessageId` int DEFAULT NULL COMMENT '最后一条消息ID',
  `unreadCount` int DEFAULT '0' COMMENT '未读消息数量',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='对话表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES (1,2,'admin',2,'seller',23,0,'2026-01-24 12:10:39','2026-02-22 04:42:53'),(2,2,'admin',3,'seller',24,0,'2026-01-24 12:57:12','2026-02-22 04:43:37'),(3,3,'seller',3,'seller',NULL,0,'2026-02-05 07:01:26','2026-02-05 07:01:26');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cooking_videos`
--

DROP TABLE IF EXISTS `cooking_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cooking_videos` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '视频ID',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '视频标题',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '视频描述',
  `videoUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '视频URL',
  `thumbnailUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缩略图URL',
  `duration` int DEFAULT NULL COMMENT '视频时长(秒)',
  `mushroomType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菌菇类型',
  `difficulty` enum('easy','medium','hard') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium' COMMENT '难度等级',
  `views` int NOT NULL DEFAULT '0' COMMENT '观看次数',
  `likes` int NOT NULL DEFAULT '0' COMMENT '点赞数',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `createdBy` int DEFAULT NULL COMMENT '创建者ID',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `recipeId` int DEFAULT NULL,
  `mushroomId` int DEFAULT NULL,
  `mushroomBoxId` int DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cultivation',
  `sortOrder` int NOT NULL DEFAULT '0',
  `tags` text COLLATE utf8mb4_unicode_ci,
  `quality` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewCount` int NOT NULL DEFAULT '0',
  `likeCount` int NOT NULL DEFAULT '0',
  `favoriteCount` int NOT NULL DEFAULT '0',
  `reviewStatus` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `reviewNote` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mushroomType` (`mushroomType`),
  KEY `difficulty` (`difficulty`),
  KEY `status` (`status`),
  KEY `createdBy` (`createdBy`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='烹饪视频表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooking_videos`
--

LOCK TABLES `cooking_videos` WRITE;
/*!40000 ALTER TABLE `cooking_videos` DISABLE KEYS */;
INSERT INTO `cooking_videos` VALUES (2,'平菇种植全教程 - 从接种到收获','详细讲解平菇的完整种植过程，包括基质准备、接种、发菌管理和收获等关键步骤。适合初学者入门学习。','https://example.com/videos/oyster-mushroom-cultivation.mp4','https://example.com/thumbnails/oyster-mushroom.jpg',1800,'平菇','medium',1250,89,'active',2,'2026-02-17 00:48:22','2026-02-19 11:00:56',NULL,NULL,77,'cultivation',1,'[\"平菇\",\"种植\",\"教程\"]','hd','原创',1250,89,45,'approved',NULL),(3,'香菇滑鸡家常做法',NULL,'https://example.com/videos/chicken-mushroom.mp4','https://example.com/thumbnails/chicken-mushroom.jpg',1200,'香菇','easy',800,56,'active',2,'2026-02-17 00:48:22','2026-02-19 11:00:56',NULL,NULL,78,'cooking',2,NULL,'hd','原创',800,56,23,'approved',NULL),(4,'常见食用蘑菇识别指南',NULL,'https://example.com/videos/mushroom-identification.mp4','https://example.com/thumbnails/mushroom-id.jpg',900,'多种','easy',450,32,'active',2,'2026-02-17 00:48:22','2026-02-19 11:00:56',NULL,NULL,79,'identification',3,NULL,'hd','原创',450,32,12,'approved',NULL),(6,'11111111111','视频创建失败: 创建烹饪视频失败: Field \'mushroomType\' doesn\'t have a default value','http://localhost:3003/uploads/videos/video-1771334659939-9665984.mp4','http://localhost:3003/uploads/video-thumbnails/thumbnail-1771334714700-511010603.png',60,NULL,'medium',0,0,'active',NULL,'2026-02-17 13:24:27','2026-02-20 05:56:53',NULL,NULL,74,'cultivation',0,'[\"[\\\"[\\\\\\\"[]\\\\\\\"]\\\"]\"]','hd',NULL,0,0,0,'approved',NULL);
/*!40000 ALTER TABLE `cooking_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜肴名称',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '菜肴描述',
  `price` decimal(10,2) NOT NULL COMMENT '菜肴价格',
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜肴分类',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜肴图片',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active' COMMENT '菜肴状态：active-活跃 | inactive-非活跃',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜肴表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draw_results`
--

DROP TABLE IF EXISTS `draw_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `draw_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `boxId` int NOT NULL,
  `drawTime` datetime NOT NULL,
  `boxName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `boxImage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `boxPrice` decimal(10,2) NOT NULL,
  `items` json DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draw_results`
--

LOCK TABLES `draw_results` WRITE;
/*!40000 ALTER TABLE `draw_results` DISABLE KEYS */;
INSERT INTO `draw_results` VALUES (37,2,78,'2026-02-18 12:34:33','夏季清凉盲盒 - 清爽菌菇组合',NULL,79.00,'[{\"id\": 667, \"image\": \"/mushrooms/houtou.jpg\", \"quantity\": 2, \"mushroomId\": 10, \"mushroomName\": \"猴头菇\", \"mushroomType\": \"common\"}, {\"id\": 668, \"image\": \"https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=shiitake%20mushroom%20fresh%20with%20dark%20brown%20cap%20and%20white%20stem&image_size=square\", \"quantity\": 2, \"mushroomId\": 11, \"mushroomName\": \"香菇\", \"mushroomType\": \"common\"}, {\"id\": 669, \"image\": \"https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=oyster%20mushroom%20fresh%20with%20gray%20cap%20and%20white%20stem&image_size=square\", \"quantity\": 2, \"mushroomId\": 12, \"mushroomName\": \"平菇\", \"mushroomType\": \"common\"}, {\"id\": 670, \"image\": \"https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=king%20oyster%20mushroom%20fresh%20with%20white%20cap%20and%20long%20white%20stem&image_size=square\", \"quantity\": 2, \"mushroomId\": 13, \"mushroomName\": \"杏鲍菇\", \"mushroomType\": \"common\"}]','2026-02-18 12:34:33','2026-02-18 12:34:33'),(38,3,77,'2026-02-19 10:46:47','春季养生盲盒 - 鲜嫩菌菇礼盒',NULL,89.00,'[{\"id\": 663, \"image\": \"/mushrooms/xianggu.jpg\", \"quantity\": 2, \"mushroomId\": 6, \"mushroomName\": \"香菇\", \"mushroomType\": \"common\"}, {\"id\": 664, \"image\": \"/mushrooms/pinggu.jpg\", \"quantity\": 2, \"mushroomId\": 7, \"mushroomName\": \"平菇\", \"mushroomType\": \"common\"}, {\"id\": 665, \"image\": \"/mushrooms/xingbao.jpg\", \"quantity\": 2, \"mushroomId\": 8, \"mushroomName\": \"杏鲍菇\", \"mushroomType\": \"common\"}, {\"id\": 666, \"image\": \"/mushrooms/jinzhen.jpg\", \"quantity\": 2, \"mushroomId\": 9, \"mushroomName\": \"金针菇\", \"mushroomType\": \"common\"}]','2026-02-19 10:46:47','2026-02-19 10:46:47'),(39,2,79,'2026-02-19 11:02:12','秋季滋补盲盒 - 滋补菌菇套餐',NULL,129.00,'[{\"id\": 671, \"image\": \"https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=shiitake%20mushroom%20fresh%20with%20dark%20brown%20cap%20and%20white%20stem&image_size=square\", \"quantity\": 1, \"mushroomId\": 14, \"mushroomName\": \"香菇\", \"mushroomType\": \"common\"}, {\"id\": 672, \"image\": \"https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=oyster%20mushroom%20fresh%20with%20gray%20cap%20and%20white%20stem&image_size=square\", \"quantity\": 1, \"mushroomId\": 15, \"mushroomName\": \"平菇\", \"mushroomType\": \"common\"}, {\"id\": 673, \"image\": \"https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=king%20oyster%20mushroom%20fresh%20with%20white%20cap%20and%20long%20white%20stem&image_size=square\", \"quantity\": 1, \"mushroomId\": 16, \"mushroomName\": \"杏鲍菇\", \"mushroomType\": \"common\"}, {\"id\": 674, \"image\": \"https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=shiitake%20mushroom%20fresh%20with%20dark%20brown%20cap%20and%20white%20stem&image_size=square\", \"quantity\": 1, \"mushroomId\": 17, \"mushroomName\": \"香菇\", \"mushroomType\": \"common\"}]','2026-02-19 11:02:12','2026-02-19 11:02:12'),(40,2,80,'2026-02-21 14:21:56','冬季暖心盲盒 - 暖身菌菇礼盒',NULL,99.00,'[{\"id\": 675, \"image\": \"https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=oyster%20mushroom%20fresh%20with%20gray%20cap%20and%20white%20stem&image_size=square\", \"quantity\": 2, \"mushroomId\": 31, \"mushroomName\": \"平菇\", \"mushroomType\": \"common\"}, {\"id\": 676, \"image\": \"/uploads/upload-1771667923500-262170868.webp\", \"quantity\": 2, \"mushroomId\": 53, \"mushroomName\": \"杏鲍菇\", \"mushroomType\": \"common\"}, {\"id\": 677, \"image\": \"/uploads/upload-1771667893684-748051072.webp\", \"quantity\": 2, \"mushroomId\": 52, \"mushroomName\": \"香菇\", \"mushroomType\": \"common\"}, {\"id\": 678, \"image\": \"/mushrooms/pinggu.jpg\", \"quantity\": 2, \"mushroomId\": 31, \"mushroomName\": \"平菇\", \"mushroomType\": \"common\"}]','2026-02-21 14:21:56','2026-02-21 14:21:56'),(41,2,80,'2026-02-21 14:22:06','冬季暖心盲盒 - 暖身菌菇礼盒',NULL,99.00,'[{\"id\": 675, \"image\": \"https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=oyster%20mushroom%20fresh%20with%20gray%20cap%20and%20white%20stem&image_size=square\", \"quantity\": 2, \"mushroomId\": 31, \"mushroomName\": \"平菇\", \"mushroomType\": \"common\"}, {\"id\": 676, \"image\": \"/uploads/upload-1771667923500-262170868.webp\", \"quantity\": 2, \"mushroomId\": 53, \"mushroomName\": \"杏鲍菇\", \"mushroomType\": \"common\"}, {\"id\": 677, \"image\": \"/uploads/upload-1771667893684-748051072.webp\", \"quantity\": 2, \"mushroomId\": 52, \"mushroomName\": \"香菇\", \"mushroomType\": \"common\"}, {\"id\": 678, \"image\": \"/mushrooms/pinggu.jpg\", \"quantity\": 2, \"mushroomId\": 31, \"mushroomName\": \"平菇\", \"mushroomType\": \"common\"}]','2026-02-21 14:22:06','2026-02-21 14:22:06'),(42,2,80,'2026-02-21 14:22:09','冬季暖心盲盒 - 暖身菌菇礼盒',NULL,99.00,'[{\"id\": 675, \"image\": \"https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=oyster%20mushroom%20fresh%20with%20gray%20cap%20and%20white%20stem&image_size=square\", \"quantity\": 2, \"mushroomId\": 31, \"mushroomName\": \"平菇\", \"mushroomType\": \"common\"}, {\"id\": 676, \"image\": \"/uploads/upload-1771667923500-262170868.webp\", \"quantity\": 2, \"mushroomId\": 53, \"mushroomName\": \"杏鲍菇\", \"mushroomType\": \"common\"}, {\"id\": 677, \"image\": \"/uploads/upload-1771667893684-748051072.webp\", \"quantity\": 2, \"mushroomId\": 52, \"mushroomName\": \"香菇\", \"mushroomType\": \"common\"}, {\"id\": 678, \"image\": \"/mushrooms/pinggu.jpg\", \"quantity\": 2, \"mushroomId\": 31, \"mushroomName\": \"平菇\", \"mushroomType\": \"common\"}]','2026-02-21 14:22:09','2026-02-21 14:22:09'),(43,2,78,'2026-02-21 14:22:12','夏季清凉盲盒 - 清爽菌菇组合',NULL,79.00,'[{\"id\": 667, \"image\": \"/mushrooms/houtou.jpg\", \"quantity\": 2, \"mushroomId\": 34, \"mushroomName\": \"猴头菇\", \"mushroomType\": \"common\"}, {\"id\": 668, \"image\": \"/uploads/upload-1771667893684-748051072.webp\", \"quantity\": 2, \"mushroomId\": 52, \"mushroomName\": \"香菇\", \"mushroomType\": \"common\"}, {\"id\": 669, \"image\": \"https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=oyster%20mushroom%20fresh%20with%20gray%20cap%20and%20white%20stem&image_size=square\", \"quantity\": 2, \"mushroomId\": 31, \"mushroomName\": \"平菇\", \"mushroomType\": \"common\"}, {\"id\": 670, \"image\": \"/uploads/upload-1771667923500-262170868.webp\", \"quantity\": 2, \"mushroomId\": 53, \"mushroomName\": \"杏鲍菇\", \"mushroomType\": \"common\"}]','2026-02-21 14:22:12','2026-02-21 14:22:12'),(44,2,81,'2026-02-22 04:43:57','全家享盲盒 - 精选菌菇组合','/uploads/upload-1771726220885-254262274.webp',149.01,'[{\"id\": 847, \"image\": \"/uploads/upload-1771667893684-748051072.webp?t=1771726217002\", \"quantity\": 2, \"mushroomId\": 52, \"mushroomName\": \"香菇\", \"mushroomType\": \"common\"}, {\"id\": 848, \"image\": \"/uploads/upload-1771652237701-654685118.jpg?t=1771726217002\", \"quantity\": 2, \"mushroomId\": 31, \"mushroomName\": \"平菇\", \"mushroomType\": \"common\"}, {\"id\": 849, \"image\": \"/uploads/upload-1771667923500-262170868.webp?t=1771726217002\", \"quantity\": 2, \"mushroomId\": 53, \"mushroomName\": \"杏鲍菇\", \"mushroomType\": \"common\"}, {\"id\": 850, \"image\": \"/uploads/upload-1771652265102-229560094.jpg?t=1771726217002\", \"quantity\": 2, \"mushroomId\": 33, \"mushroomName\": \"金针菇\", \"mushroomType\": \"common\"}, {\"id\": 851, \"image\": \"/uploads/upload-1771652207680-244808221.jpg?t=1771726217002\", \"quantity\": 2, \"mushroomId\": 34, \"mushroomName\": \"猴头菇\", \"mushroomType\": \"common\"}, {\"id\": 852, \"image\": \"/uploads/upload-1771667893684-748051072.webp?t=1771726217002\", \"quantity\": 2, \"mushroomId\": 52, \"mushroomName\": \"香菇\", \"mushroomType\": \"common\"}]','2026-02-22 04:43:57','2026-02-22 04:43:57');
/*!40000 ALTER TABLE `draw_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `workId` int NOT NULL COMMENT '作品ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `workId_userId` (`workId`,`userId`),
  KEY `workId` (`workId`),
  KEY `userId` (`userId`),
  CONSTRAINT `favorites_userId_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorites_workId_foreign` FOREIGN KEY (`workId`) REFERENCES `works` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (2,3,2,'2026-02-07 05:09:39'),(5,7,2,'2026-02-19 11:04:04'),(8,2,2,'2026-02-22 03:45:32');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `followerId` int NOT NULL,
  `followingId` int NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `follows_follower_id_following_id` (`followerId`,`followingId`),
  KEY `follows_follower_id` (`followerId`),
  KEY `follows_following_id` (`followingId`),
  CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`followerId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`followingId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (1,3,2,'2026-01-31 01:07:05','2026-01-31 01:07:05');
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitchen_post_favorites`
--

DROP TABLE IF EXISTS `kitchen_post_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kitchen_post_favorites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `postId` int NOT NULL COMMENT '厨房帖子ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `favoritedAt` datetime NOT NULL COMMENT '收藏时间',
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kitchen_post_favorites_post_id_user_id` (`postId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='帖子收藏表（用户收藏的帖子）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchen_post_favorites`
--

LOCK TABLES `kitchen_post_favorites` WRITE;
/*!40000 ALTER TABLE `kitchen_post_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `kitchen_post_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitchen_post_likes`
--

DROP TABLE IF EXISTS `kitchen_post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kitchen_post_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `postId` int NOT NULL COMMENT '厨房帖子ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `likedAt` datetime NOT NULL COMMENT '点赞时间',
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kitchen_post_likes_post_id_user_id` (`postId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='帖子点赞表（用户对帖子的点赞）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchen_post_likes`
--

LOCK TABLES `kitchen_post_likes` WRITE;
/*!40000 ALTER TABLE `kitchen_post_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `kitchen_post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitchen_post_mushrooms`
--

DROP TABLE IF EXISTS `kitchen_post_mushrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kitchen_post_mushrooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `postId` int NOT NULL COMMENT '厨房帖子ID',
  `mushroomTypeId` int NOT NULL COMMENT '菌菇类型ID',
  `quantity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '使用的菌菇数量：如100g、2朵等',
  `isMainIngredient` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为主食材',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kitchen_post_mushrooms_post_id_mushroom_type_id` (`postId`,`mushroomTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='帖子-菌菇关联表（记录帖子使用的菌菇类型和数量）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchen_post_mushrooms`
--

LOCK TABLES `kitchen_post_mushrooms` WRITE;
/*!40000 ALTER TABLE `kitchen_post_mushrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `kitchen_post_mushrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitchen_post_ratings`
--

DROP TABLE IF EXISTS `kitchen_post_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kitchen_post_ratings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `postId` int NOT NULL COMMENT '厨房帖子ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `rating` int NOT NULL COMMENT '评分：1-5分',
  `comment` text COLLATE utf8mb4_unicode_ci COMMENT '评论内容',
  `createdAt` datetime NOT NULL COMMENT '评分时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kitchen_post_ratings_post_id_user_id` (`postId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='帖子评分表（用户对帖子的评分和评论）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchen_post_ratings`
--

LOCK TABLES `kitchen_post_ratings` WRITE;
/*!40000 ALTER TABLE `kitchen_post_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `kitchen_post_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitchen_posts`
--

DROP TABLE IF EXISTS `kitchen_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kitchen_posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL COMMENT '用户ID',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帖子标题',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '帖子描述',
  `images` json NOT NULL COMMENT '菜肴照片列表',
  `cookTime` int NOT NULL COMMENT '烹饪时间（分钟）',
  `difficulty` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '难度：easy-简单 | medium-中等 | hard-困难',
  `ingredients` json NOT NULL COMMENT '食材列表',
  `steps` json NOT NULL COMMENT '烹饪步骤',
  `tips` text COLLATE utf8mb4_unicode_ci COMMENT '烹饪心得或小贴士',
  `tags` json DEFAULT NULL COMMENT '标签：如素食、家常菜、快手菜等',
  `viewCount` int NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `likeCount` int NOT NULL DEFAULT '0' COMMENT '点赞数',
  `commentCount` int NOT NULL DEFAULT '0' COMMENT '评论数',
  `favoriteCount` int NOT NULL DEFAULT '0' COMMENT '收藏数',
  `rating` decimal(3,1) DEFAULT NULL COMMENT '评分：1-5分',
  `ratingCount` int NOT NULL DEFAULT '0' COMMENT '评分人数',
  `isActive` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用',
  `isFeatured` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精选',
  `leaderboardRank` int DEFAULT NULL COMMENT '在菌菇美食榜中的排名',
  `lastRankUpdate` datetime DEFAULT NULL COMMENT '排名最后更新时间',
  `rewardPoints` int NOT NULL DEFAULT '0' COMMENT '获得的奖励积分',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='厨房帖子表（用户上传的菌菇菜肴）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchen_posts`
--

LOCK TABLES `kitchen_posts` WRITE;
/*!40000 ALTER TABLE `kitchen_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `kitchen_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaderboard`
--

DROP TABLE IF EXISTS `leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaderboard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `postId` int NOT NULL COMMENT '厨房帖子ID',
  `rank` int NOT NULL COMMENT '排名',
  `score` decimal(10,2) NOT NULL COMMENT '排行榜分数：基于评分、点赞、收藏、评论等计算',
  `rating` decimal(3,1) NOT NULL COMMENT '帖子评分',
  `likeCount` int NOT NULL COMMENT '点赞数',
  `commentCount` int NOT NULL COMMENT '评论数',
  `favoriteCount` int NOT NULL COMMENT '收藏数',
  `viewCount` int NOT NULL COMMENT '浏览次数',
  `updatedAt` datetime NOT NULL COMMENT '排名更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `postId` (`postId`),
  UNIQUE KEY `rank` (`rank`),
  KEY `leaderboard_rank` (`rank`),
  KEY `leaderboard_score` (`score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菌菇美食榜（热门菌菇菜肴排行榜）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaderboard`
--

LOCK TABLES `leaderboard` WRITE;
/*!40000 ALTER TABLE `leaderboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '点赞ID',
  `workId` int NOT NULL COMMENT '作品ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `workId_userId` (`workId`,`userId`),
  KEY `workId` (`workId`),
  KEY `userId` (`userId`),
  CONSTRAINT `likes_userId_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_workId_foreign` FOREIGN KEY (`workId`) REFERENCES `works` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='点赞表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (4,5,2,'2026-02-08 05:51:53'),(5,3,2,'2026-02-21 12:19:58');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conversationId` int NOT NULL COMMENT '所属对话ID',
  `senderId` int NOT NULL COMMENT '发送者ID',
  `senderRole` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送者角色（user/seller/admin）',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息内容',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'text' COMMENT '消息类型（text/image/file）',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'sent' COMMENT '消息状态（sent/delivered/read）',
  `fileUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件URL（用于图片、文件等多媒体消息）',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `conversationId` (`conversationId`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`conversationId`) REFERENCES `conversations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,2,'admin','aaaa','text','sent',NULL,'2026-01-24 14:02:31','2026-01-24 14:02:31'),(2,2,2,'admin','gougougouGougoUgo狗','text','read',NULL,'2026-01-24 14:11:47','2026-01-25 19:58:29'),(3,2,2,'admin','灌灌灌灌','text','read',NULL,'2026-01-24 14:22:38','2026-01-25 19:58:29'),(4,2,2,'admin','666','text','read',NULL,'2026-01-24 14:23:18','2026-01-25 19:58:29'),(5,2,3,'seller','你装逼','text','read',NULL,'2026-01-24 14:39:06','2026-02-22 04:43:37'),(6,2,3,'seller','又主页','text','read',NULL,'2026-01-24 14:39:20','2026-02-22 04:43:37'),(7,2,2,'admin','你别管','text','read',NULL,'2026-01-24 14:40:25','2026-01-25 19:58:29'),(8,2,2,'admin','666','text','read',NULL,'2026-01-24 15:07:44','2026-01-25 19:58:29'),(9,2,2,'admin','44444444','text','read',NULL,'2026-01-25 01:36:06','2026-01-25 19:58:29'),(10,2,3,'seller','搜索','text','read',NULL,'2026-01-25 01:36:37','2026-02-22 04:43:37'),(11,2,2,'admin','诗人吗','text','read',NULL,'2026-01-25 02:06:13','2026-01-25 19:58:29'),(12,2,2,'admin','反反复复反反复复烦烦烦','text','read',NULL,'2026-01-25 09:40:50','2026-01-25 19:58:29'),(13,2,2,'admin','不是','text','read',NULL,'2026-01-25 13:04:32','2026-01-25 19:58:29'),(14,2,3,'seller','刚刚','text','read',NULL,'2026-01-25 13:04:57','2026-02-22 04:43:37'),(15,2,3,'seller','666','text','read',NULL,'2026-01-25 13:35:12','2026-02-22 04:43:37'),(16,2,2,'admin','dd','text','read',NULL,'2026-01-25 13:39:32','2026-01-25 19:58:29'),(17,2,2,'admin','s','text','read',NULL,'2026-01-25 19:58:09','2026-01-25 19:58:29'),(18,2,2,'admin','水水水水水水水杀杀杀sss','text','sent',NULL,'2026-02-05 11:35:19','2026-02-05 11:35:19'),(19,2,2,'admin','ssssssssssssssssss','text','sent',NULL,'2026-02-05 11:35:23','2026-02-05 11:35:23'),(20,2,2,'admin','sssssssssssssss','text','sent',NULL,'2026-02-05 11:35:25','2026-02-05 11:35:25'),(21,2,2,'admin','ssssssssssss','text','sent',NULL,'2026-02-05 11:35:27','2026-02-05 11:35:27'),(22,1,22,'user','WebSocket测试消息','text','read',NULL,'2026-02-07 10:54:11','2026-02-22 04:42:53'),(23,1,2,'admin','杀杀杀杀杀杀杀杀杀搜索','text','sent',NULL,'2026-02-17 02:11:38','2026-02-17 02:11:38'),(24,2,2,'admin','喜喜喜喜喜喜喜喜喜喜','text','sent',NULL,'2026-02-19 10:50:52','2026-02-19 10:50:52');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mushroom_box_items`
--

DROP TABLE IF EXISTS `mushroom_box_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mushroom_box_items` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `boxId` int NOT NULL COMMENT '盲盒ID',
  `mushroomId` int DEFAULT NULL COMMENT '菌菇/商品ID（可以是mushrooms表或products表的ID）',
  `quantity` int NOT NULL DEFAULT '1' COMMENT '数量（向后兼容）',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `probability` float NOT NULL DEFAULT '0' COMMENT '概率',
  `mushroomName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菌菇名称',
  `mushroomType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菌菇类型',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菌菇图片',
  `minQuantity` int NOT NULL DEFAULT '1' COMMENT '最小数量',
  `maxQuantity` int NOT NULL DEFAULT '1' COMMENT '最大数量',
  `probabilityWeight` float NOT NULL DEFAULT '1' COMMENT '概率权重',
  PRIMARY KEY (`id`),
  KEY `boxId` (`boxId`),
  KEY `mushroomId` (`mushroomId`)
) ENGINE=InnoDB AUTO_INCREMENT=853 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mushroom_box_items`
--

LOCK TABLES `mushroom_box_items` WRITE;
/*!40000 ALTER TABLE `mushroom_box_items` DISABLE KEYS */;
INSERT INTO `mushroom_box_items` VALUES (831,77,52,2,'2026-02-22 02:00:46','2026-02-22 02:00:46',25,'香菇','common','/uploads/upload-1771667893684-748051072.webp?t=1771725634252',1,3,1),(832,77,31,2,'2026-02-22 02:00:46','2026-02-22 02:00:46',25,'平菇','common','/uploads/upload-1771652237701-654685118.jpg?t=1771725634252',1,3,1),(833,77,53,2,'2026-02-22 02:00:46','2026-02-22 02:00:46',25,'杏鲍菇','common','/uploads/upload-1771667923500-262170868.webp?t=1771725634252',1,3,1),(834,77,33,2,'2026-02-22 02:00:46','2026-02-22 02:00:46',25,'金针菇','common','/uploads/upload-1771652265102-229560094.jpg?t=1771725634252',1,3,1),(835,78,34,2,'2026-02-22 02:05:38','2026-02-22 02:05:38',25,'猴头菇','common','/uploads/upload-1771652207680-244808221.jpg?t=1771725646791',1,3,1),(836,78,52,2,'2026-02-22 02:05:38','2026-02-22 02:05:38',25,'香菇','common','/uploads/upload-1771667893684-748051072.webp?t=1771725646791',1,3,1),(837,78,31,2,'2026-02-22 02:05:38','2026-02-22 02:05:38',25,'平菇','common','/uploads/upload-1771652237701-654685118.jpg?t=1771725646791',1,3,1),(838,78,53,2,'2026-02-22 02:05:38','2026-02-22 02:05:38',25,'杏鲍菇','common','/uploads/upload-1771667923500-262170868.webp?t=1771725646791',1,3,1),(839,79,52,1,'2026-02-22 02:10:04','2026-02-22 02:10:04',25,'香菇','common','/uploads/upload-1771667893684-748051072.webp?t=1771725947840',1,2,1),(840,79,31,1,'2026-02-22 02:10:04','2026-02-22 02:10:04',25,'平菇','common','/uploads/upload-1771652237701-654685118.jpg?t=1771725947840',1,2,1),(841,79,53,1,'2026-02-22 02:10:04','2026-02-22 02:10:04',25,'杏鲍菇','common','/uploads/upload-1771667923500-262170868.webp?t=1771725947840',1,2,1),(842,79,52,1,'2026-02-22 02:10:04','2026-02-22 02:10:04',25,'香菇','common','/uploads/upload-1771667893684-748051072.webp?t=1771725947840',1,2,1),(843,80,31,2,'2026-02-22 02:10:16','2026-02-22 02:10:16',25,'平菇','common','/uploads/upload-1771652237701-654685118.jpg?t=1771726204377',1,3,1),(844,80,53,2,'2026-02-22 02:10:16','2026-02-22 02:10:16',25,'杏鲍菇','common','/uploads/upload-1771667923500-262170868.webp?t=1771726204377',1,3,1),(845,80,52,2,'2026-02-22 02:10:16','2026-02-22 02:10:16',25,'香菇','common','/uploads/upload-1771667893684-748051072.webp?t=1771726204377',1,3,1),(846,80,31,2,'2026-02-22 02:10:16','2026-02-22 02:10:16',25,'平菇','common','/uploads/upload-1771652237701-654685118.jpg?t=1771726204377',1,3,1),(847,81,52,2,'2026-02-22 02:10:26','2026-02-22 02:10:26',16,'香菇','common','/uploads/upload-1771667893684-748051072.webp?t=1771726217002',1,3,1),(848,81,31,2,'2026-02-22 02:10:26','2026-02-22 02:10:26',16,'平菇','common','/uploads/upload-1771652237701-654685118.jpg?t=1771726217002',1,3,1),(849,81,53,2,'2026-02-22 02:10:26','2026-02-22 02:10:26',16,'杏鲍菇','common','/uploads/upload-1771667923500-262170868.webp?t=1771726217002',1,3,1),(850,81,33,2,'2026-02-22 02:10:26','2026-02-22 02:10:26',16,'金针菇','common','/uploads/upload-1771652265102-229560094.jpg?t=1771726217002',1,3,1),(851,81,34,2,'2026-02-22 02:10:26','2026-02-22 02:10:26',16,'猴头菇','common','/uploads/upload-1771652207680-244808221.jpg?t=1771726217002',1,3,1),(852,81,52,2,'2026-02-22 02:10:26','2026-02-22 02:10:26',20,'香菇','common','/uploads/upload-1771667893684-748051072.webp?t=1771726217002',1,3,1);
/*!40000 ALTER TABLE `mushroom_box_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mushroom_boxes`
--

DROP TABLE IF EXISTS `mushroom_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mushroom_boxes` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '盲盒ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '盲盒名称',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '盲盒描述',
  `price` decimal(10,2) NOT NULL COMMENT '盲盒价格',
  `stock` int NOT NULL DEFAULT '1' COMMENT '盲盒库存数量',
  `season` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '季节',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '盲盒图片',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active' COMMENT '状态（active/inactive）',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `cultivationService` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否包含代培服务',
  `cultivationPrice` decimal(10,2) DEFAULT NULL COMMENT '代培服务价格',
  `cultivationDuration` int DEFAULT NULL COMMENT '代培时长（天）',
  `cultivationInclusions` text COLLATE utf8mb4_unicode_ci COMMENT '代培服务包含内容',
  `cultivationDescription` text COLLATE utf8mb4_unicode_ci COMMENT '代培服务描述',
  `totalQuantity` int NOT NULL DEFAULT '10' COMMENT '盲盒内商品总数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mushroom_boxes`
--

LOCK TABLES `mushroom_boxes` WRITE;
/*!40000 ALTER TABLE `mushroom_boxes` DISABLE KEYS */;
INSERT INTO `mushroom_boxes` VALUES (77,'春季养生盲盒 - 鲜嫩菌菇礼盒','精选春季时令菌菇，春季养生必备！包含香菇、平菇、金针菇等多种美味菌菇',89.00,49,'spring','/uploads/upload-1771725644281-199753931.webp','active','2026-02-15 05:36:55','2026-02-22 02:00:46',0,NULL,NULL,'','',10),(78,'夏季清凉盲盒 - 清爽菌菇组合','夏季清爽口味，包含猴头菇、香菇、平菇、杏鲍菇等清凉菌菇',79.01,39,'summer','/uploads/upload-1771725933078-894649708.webp','active','2026-02-15 05:36:55','2026-02-22 04:42:26',0,NULL,NULL,'','',8),(79,'秋季滋补盲盒 - 滋补菌菇套餐','秋季滋补养生，包含多种珍贵菌菇组合',129.00,30,'autumn','/uploads/upload-1771726202406-297154618.webp','active','2026-02-15 05:36:55','2026-02-22 02:10:04',0,NULL,NULL,'','',6),(80,'冬季暖心盲盒 - 暖身菌菇礼盒','冬季暖心滋补，包含多种滋补菌菇组合',99.01,35,'winter','/uploads/upload-1771726209962-506702561.webp','active','2026-02-15 05:36:55','2026-02-22 02:10:16',0,NULL,NULL,'','',9),(81,'全家享盲盒 - 精选菌菇组合','全家分享装，多种菌菇一次拥有！',149.01,25,'all','/uploads/upload-1771726220885-254262274.webp','active','2026-02-15 05:36:55','2026-02-22 02:10:26',0,NULL,NULL,'','',12);
/*!40000 ALTER TABLE `mushroom_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mushroom_types`
--

DROP TABLE IF EXISTS `mushroom_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mushroom_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菌菇名称',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '菌菇描述',
  `season` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '季节：spring-春季 | summer-夏季 | autumn-秋季 | winter-冬季 | all-全年',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菌菇图片',
  `nutritionInfo` text COLLATE utf8mb4_unicode_ci COMMENT '营养信息',
  `isActive` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菌菇类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mushroom_types`
--

LOCK TABLES `mushroom_types` WRITE;
/*!40000 ALTER TABLE `mushroom_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `mushroom_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mushroom_varieties`
--

DROP TABLE IF EXISTS `mushroom_varieties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mushroom_varieties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菌菇品种名称',
  `scientificName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菌菇学名',
  `season` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生长季节：如春季、夏季、秋季、冬季、全年',
  `growthCycle` int NOT NULL COMMENT '生长周期（天）',
  `nutritionalValue` text COLLATE utf8mb4_unicode_ci COMMENT '营养价值',
  `tasteDescription` text COLLATE utf8mb4_unicode_ci COMMENT '口味描述',
  `cookingMethods` json DEFAULT NULL COMMENT '推荐烹饪方式',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菌菇图片',
  `isActive` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否为当前活动品种',
  `difficulty` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'easy' COMMENT '培育难度：easy-简单 | medium-中等 | hard-困难',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菌菇品种表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mushroom_varieties`
--

LOCK TABLES `mushroom_varieties` WRITE;
/*!40000 ALTER TABLE `mushroom_varieties` DISABLE KEYS */;
/*!40000 ALTER TABLE `mushroom_varieties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mushrooms`
--

DROP TABLE IF EXISTS `mushrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mushrooms` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '菌菇ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菌菇名称',
  `scientificName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学名',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `cultivationGuide` text COLLATE utf8mb4_unicode_ci COMMENT '培育指南',
  `season` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生长季节，支持多个季节，如："春季,秋季"',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菌菇图片',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `growthEnvironment` text COLLATE utf8mb4_unicode_ci COMMENT '生长环境，包括气候条件、土壤要求等',
  `nutritionalValue` json DEFAULT NULL COMMENT '营养价值，包括蛋白质、维生素、矿物质等含量',
  `safetyInfo` text COLLATE utf8mb4_unicode_ci COMMENT '食用安全性，包括毒性、食用禁忌等',
  `morphology` text COLLATE utf8mb4_unicode_ci COMMENT '形态特征，包括菌盖、菌褶、菌柄等描述',
  `cookingMethods` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '适宜的烹饪方法',
  `selectionTips` text COLLATE utf8mb4_unicode_ci COMMENT '选购建议，包括新鲜度判断、储存方法等',
  `cultivationDifficulty` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '培育难度（easy/medium/hard）',
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类，如："食用菇"、"药用菇"',
  `originInfo` json DEFAULT NULL COMMENT '产地信息，包括主要产区、地理环境等',
  `storageMethods` text COLLATE utf8mb4_unicode_ci COMMENT '保存方法，包括温度、湿度、保存时间等',
  `healthBenefits` text COLLATE utf8mb4_unicode_ci COMMENT '功效与作用，包括药用价值、保健功能等',
  `culturalInfo` text COLLATE utf8mb4_unicode_ci COMMENT '历史文化，包括食用历史、文化意义等',
  `marketInfo` json DEFAULT NULL COMMENT '市场信息，包括价格区间、市场需求等',
  `dataSource` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据来源，如："中国食用菌协会"',
  `dataUpdatedAt` datetime DEFAULT NULL COMMENT '数据更新时间',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active' COMMENT '状态（active/inactive）',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'common' COMMENT '菌菇类型（common: 常见菌菇, product: 自有商品菌菇）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mushrooms`
--

LOCK TABLES `mushrooms` WRITE;
/*!40000 ALTER TABLE `mushrooms` DISABLE KEYS */;
INSERT INTO `mushrooms` VALUES (6,'香菇','Lentinula edodes','香菇是一种常见的食用真菌，具有浓郁的香气和丰富的营养价值。',NULL,'秋季,冬季','/mushrooms/xianggu.jpg','2026-02-04 05:02:14','2026-02-04 05:02:14','生于阔叶树的倒木上，喜欢温暖湿润的环境，适宜生长温度为15-25℃，相对湿度80-90%。','{\"fat\": 0.3, \"fiber\": 3.3, \"protein\": 2.2, \"calories\": 25, \"minerals\": {\"iron\": 0.8, \"potassium\": 455, \"phosphorus\": 86}, \"vitamins\": {\"vitaminC\": 0, \"vitaminD\": 0.2, \"vitaminB2\": 0.1}, \"carbohydrates\": 5.2}','香菇是安全可食用的食用菌，但过敏体质者可能会出现过敏反应。','菌盖呈圆形或椭圆形，直径5-12厘米，表面呈褐色或深褐色，有鳞片；菌褶白色，密集；菌柄中生或偏生，白色或淡黄色。','炒、炖、煮、蒸、烤等','选择菌盖完整、菌褶紧密、无异味、无腐烂的香菇，储存时应放在阴凉干燥处或冰箱中。','medium','食用菇',NULL,NULL,NULL,NULL,NULL,'中国食用菌协会',NULL,'active','common'),(7,'平菇','Pleurotus ostreatus','平菇是一种广泛栽培的食用菌，味道鲜美，营养丰富。',NULL,'春季,秋季','/mushrooms/pinggu.jpg','2026-02-04 05:02:14','2026-02-04 05:02:14','生于阔叶树的倒木或腐木上，适应性强，生长温度范围广，10-30℃均可生长，最适温度20-25℃，相对湿度85-95%。','{\"fat\": 0.4, \"fiber\": 2.3, \"protein\": 3.3, \"calories\": 35, \"minerals\": {\"iron\": 0.9, \"potassium\": 370, \"phosphorus\": 80}, \"vitamins\": {\"vitaminC\": 2, \"vitaminB1\": 0.1, \"vitaminB2\": 0.3}, \"carbohydrates\": 6.1}','平菇是安全可食用的食用菌，无毒性报告。','菌盖呈扇形或贝壳形，直径5-15厘米，表面呈灰白色或浅灰色，边缘内卷；菌褶白色，延生；菌柄侧生，白色或淡黄色。','炒、炖、煮、蒸等','选择菌盖完整、菌褶紧密、无异味、无腐烂的平菇，储存时应放在冰箱中，避免潮湿。','easy','食用菇',NULL,NULL,NULL,NULL,NULL,'中国食用菌协会',NULL,'active','common'),(8,'杏鲍菇','Pleurotus eryngii','杏鲍菇具有杏仁香味和鲍鱼口感，是一种高档食用菌。',NULL,'秋季,冬季','/mushrooms/xingbao.jpg','2026-02-04 05:02:14','2026-02-04 05:02:14','生于伞形科植物的根部或枯茎上，适宜生长温度为15-25℃，相对湿度80-90%，需要较低的光照。','{\"fat\": 0.1, \"fiber\": 1.7, \"protein\": 1.4, \"calories\": 31, \"minerals\": {\"iron\": 0.5, \"potassium\": 240, \"phosphorus\": 46}, \"vitamins\": {\"vitaminC\": 0, \"vitaminB1\": 0.05, \"vitaminB2\": 0.11}, \"carbohydrates\": 7.3}','杏鲍菇是安全可食用的食用菌，无毒性报告。','菌盖呈圆形或扇形，直径3-8厘米，表面呈灰白色或浅褐色，光滑；菌褶白色，密集；菌柄粗壮，白色，肉质坚实。','炒、煎、烤、炖等','选择菌盖完整、菌柄粗壮、无异味、无腐烂的杏鲍菇，储存时应放在冰箱中，可保存3-5天。','medium','食用菇',NULL,NULL,NULL,NULL,NULL,'中国食用菌协会',NULL,'active','common'),(9,'金针菇','Flammulina velutipes','金针菇细长如针，味道鲜美，富含蛋白质和膳食纤维。',NULL,'冬季,春季','/mushrooms/jinzhen.jpg','2026-02-04 05:02:14','2026-02-04 05:02:14','生于阔叶树的倒木或腐木上，适宜生长温度为5-15℃，相对湿度85-95%，需要黑暗或弱光环境。','{\"fat\": 0.4, \"fiber\": 2.4, \"protein\": 2.4, \"calories\": 32, \"minerals\": {\"iron\": 1.4, \"potassium\": 195, \"phosphorus\": 42}, \"vitamins\": {\"vitaminC\": 2, \"vitaminB1\": 0.1, \"vitaminB2\": 0.3}, \"carbohydrates\": 6}','金针菇是安全可食用的食用菌，但未煮熟的金针菇可能会引起肠胃不适，应彻底煮熟后食用。','菌盖呈球形或半球形，直径1-3厘米，表面呈淡黄色或淡褐色，光滑；菌褶白色，延生；菌柄细长，白色，柔软。','炒、煮、涮、烤等','选择菌柄细长、菌盖小、颜色均匀、无异味的金针菇，储存时应放在冰箱中，可保存3-5天。','medium','食用菇',NULL,NULL,NULL,NULL,NULL,'中国食用菌协会',NULL,'active','common'),(10,'猴头菇','Hericium erinaceus','猴头菇因外形似猴子的头而得名，是一种珍贵的食用菌。',NULL,'春季,夏季','/mushrooms/houtou.jpg','2026-02-04 05:02:14','2026-02-04 05:02:14','生于阔叶树的活立木或倒木上，适宜生长温度为18-25℃，相对湿度85-90%，需要充足的通风。','{\"fat\": 0.2, \"fiber\": 4.2, \"protein\": 2.5, \"calories\": 35, \"minerals\": {\"iron\": 1.1, \"potassium\": 530, \"phosphorus\": 85}, \"vitamins\": {\"vitaminC\": 4, \"vitaminB1\": 0.1, \"vitaminB2\": 0.1}, \"carbohydrates\": 7.3}','猴头菇是安全可食用的食用菌，具有较高的营养价值和药用价值。','子实体呈块状，直径5-15厘米，表面覆盖着密集的针状菌刺，颜色为白色或淡黄色，成熟后变为淡褐色。','炖、煮、蒸、炒等','选择菌刺密集、颜色洁白、无异味、无腐烂的猴头菇，储存时应放在阴凉干燥处或冰箱中。','hard','食用菇',NULL,NULL,NULL,NULL,NULL,'中国食用菌协会',NULL,'active','common'),(11,'香菇','Lentinula edodes','香菇是一种常见的食用真菌，具有浓郁的香气和丰富的营养价值。它是世界第二大食用菌，也是我国特产之一，在民间素有“山珍”之称。','香菇的栽培主要采用木屑、棉籽壳等作为培养基，在塑料袋中进行。栽培过程中需要控制温度、湿度、通风和光照等条件。一般从接种到出菇需要30-45天。','秋季,冬季','https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=shiitake%20mushroom%20fresh%20with%20dark%20brown%20cap%20and%20white%20stem&image_size=square','2026-02-04 05:02:16','2026-02-04 05:02:16','香菇是一种木腐菌，主要生长在阔叶树的倒木上，喜欢温暖、湿润的环境。最适生长温度为22-26℃，最适相对湿度为80-90%。','{\"fat\": \"1-2%\", \"fiber\": \"30%\", \"protein\": \"20-30%\", \"minerals\": {\"iron\": \"19.4mg/100g\", \"calcium\": \"83mg/100g\", \"potassium\": \"1655mg/100g\", \"phosphorus\": \"258mg/100g\"}, \"vitamins\": {\"C\": \"5mg/100g\", \"D\": \"100IU/100g\", \"B1\": \"0.1mg/100g\", \"B2\": \"1.5mg/100g\"}, \"carbohydrates\": \"60-70%\"}','香菇是安全的食用真菌，没有毒性。但对于少数对蘑菇过敏的人，可能会引起过敏反应。此外，香菇不宜与河蟹、番茄、鹌鹑等食物同食。','香菇子实体单生、丛生或群生，菌盖圆形，直径5-12厘米，有时可达20厘米，表面茶褐色、暗褐色，有深色鳞片，边缘淡色。菌肉白色，厚。菌褶白色，稠密，弯生，不等长。菌柄中生或偏生，白色，内实，常弯曲，长3-8厘米，粗0.5-1.5厘米，菌环以下有鳞片。','炒、炖、煮、蒸、烤、煲汤','选购香菇时，应选择菌盖完整、菌褶紧密、菌柄短而粗壮的香菇。新鲜香菇的菌盖应该是湿润的，有弹性，没有异味。','medium','食用菇','{\"mainRegions\": [\"浙江\", \"福建\", \"江西\", \"湖北\", \"安徽\"], \"cultivationHistory\": \"我国是香菇的发源地，已有800多年的栽培历史。\", \"geographicEnvironment\": \"香菇主要生长在海拔300-1500米的山区，喜欢温暖湿润的气候和肥沃的土壤。\"}','新鲜香菇应存放在冰箱冷藏室中，温度控制在0-4℃，可保存3-5天。干香菇应密封存放在阴凉、干燥、通风的地方，可保存1-2年。','香菇具有提高免疫力、降血压、降血脂、抗肿瘤、抗氧化等功效。它含有丰富的香菇多糖，具有增强机体免疫力的作用。','香菇在我国有着悠久的历史，早在宋代就有关于香菇的记载。在民间，香菇被视为“山珍”，是宴席上的珍品。','{\"priceRange\": \"新鲜香菇: 10-30元/斤, 干香菇: 50-150元/斤\", \"exportStatus\": \"我国是世界上最大的香菇出口国，主要出口到日本、韩国、美国等国家。\", \"marketDemand\": \"香菇是一种受欢迎的食用菌，市场需求稳定增长。\"}','中国食用菌协会',NULL,'active','common'),(12,'平菇','Pleurotus ostreatus','平菇是一种广泛栽培的食用菌，味道鲜美，营养丰富。它是世界上第三大食用菌，也是我国主要的栽培食用菌之一。','平菇的栽培主要采用木屑、棉籽壳、玉米芯等作为培养基，在塑料袋中进行。栽培过程中需要控制温度、湿度、通风和光照等条件。一般从接种到出菇需要20-30天。','春季,秋季','https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=oyster%20mushroom%20fresh%20with%20gray%20cap%20and%20white%20stem&image_size=square','2026-02-04 05:02:16','2026-02-04 05:02:16','平菇是一种木腐菌，主要生长在阔叶树的倒木上，喜欢温暖、湿润的环境。最适生长温度为20-25℃，最适相对湿度为85-95%。','{\"fat\": \"1-2%\", \"fiber\": \"25%\", \"protein\": \"19-26%\", \"minerals\": {\"iron\": \"3.2mg/100g\", \"calcium\": \"22mg/100g\", \"potassium\": \"1655mg/100g\", \"phosphorus\": \"380mg/100g\"}, \"vitamins\": {\"C\": \"4mg/100g\", \"D\": \"80IU/100g\", \"B1\": \"0.1mg/100g\", \"B2\": \"1.3mg/100g\"}, \"carbohydrates\": \"60-70%\"}','平菇是安全的食用真菌，没有毒性。但对于少数对蘑菇过敏的人，可能会引起过敏反应。','平菇子实体丛生或叠生，菌盖扇形、贝壳形或不规则形，直径3-15厘米，表面灰白、浅灰、灰褐或深褐色，光滑或有细绒毛。菌肉白色，厚。菌褶白色，延生，不等长。菌柄侧生或偏生，白色，内实，长1-5厘米，粗0.5-1.5厘米。','炒、炖、煮、蒸、煲汤','选购平菇时，应选择菌盖完整、菌褶紧密、菌柄短而粗壮的平菇。新鲜平菇的菌盖应该是湿润的，有弹性，没有异味。','easy','食用菇','{\"mainRegions\": [\"河北\", \"河南\", \"山东\", \"江苏\", \"四川\"], \"cultivationHistory\": \"平菇的人工栽培始于20世纪初，我国从20世纪50年代开始大规模栽培。\", \"geographicEnvironment\": \"平菇适应性强，可在不同海拔和气候条件下生长。\"}','新鲜平菇应存放在冰箱冷藏室中，温度控制在0-4℃，可保存3-5天。干平菇应密封存放在阴凉、干燥、通风的地方，可保存1-2年。','平菇具有提高免疫力、降血压、降血脂、抗肿瘤、抗氧化等功效。它含有丰富的多糖和膳食纤维，对人体健康有益。','平菇在我国有着悠久的栽培历史，是一种常见的家常菜食材。','{\"priceRange\": \"新鲜平菇: 5-15元/斤, 干平菇: 30-80元/斤\", \"exportStatus\": \"我国是世界上最大的平菇出口国之一。\", \"marketDemand\": \"平菇是一种受欢迎的食用菌，市场需求稳定。\"}','中国食用菌协会',NULL,'active','common'),(13,'杏鲍菇','Pleurotus eryngii','杏鲍菇是一种珍稀的食用菌，味道鲜美，营养丰富。它具有独特的杏仁香味，因此得名杏鲍菇。','杏鲍菇的栽培主要采用木屑、棉籽壳、玉米芯等作为培养基，在塑料袋中进行。栽培过程中需要控制温度、湿度、通风和光照等条件。一般从接种到出菇需要30-45天。','秋季,冬季','https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=king%20oyster%20mushroom%20fresh%20with%20white%20cap%20and%20long%20white%20stem&image_size=square','2026-02-04 05:02:16','2026-02-04 05:02:16','杏鲍菇是一种木腐菌，主要生长在伞形科植物的根际，喜欢凉爽、湿润的环境。最适生长温度为15-20℃，最适相对湿度为85-95%。','{\"fat\": \"1-2%\", \"fiber\": \"20%\", \"protein\": \"20-25%\", \"minerals\": {\"iron\": \"2.5mg/100g\", \"calcium\": \"18mg/100g\", \"potassium\": \"1500mg/100g\", \"phosphorus\": \"350mg/100g\"}, \"vitamins\": {\"C\": \"4mg/100g\", \"D\": \"70IU/100g\", \"B1\": \"0.1mg/100g\", \"B2\": \"1.2mg/100g\"}, \"carbohydrates\": \"60-70%\"}','杏鲍菇是安全的食用真菌，没有毒性。但对于少数对蘑菇过敏的人，可能会引起过敏反应。','杏鲍菇子实体单生或丛生，菌盖圆形或扇形，直径2-12厘米，表面灰白色或浅褐色，光滑。菌肉白色，厚。菌褶白色，延生，不等长。菌柄中生或偏生，白色，内实，长5-15厘米，粗1-3厘米，基部膨大。','炒、炖、煮、蒸、烤、煲汤','选购杏鲍菇时，应选择菌盖完整、菌褶紧密、菌柄粗壮的杏鲍菇。新鲜杏鲍菇的菌盖应该是湿润的，有弹性，没有异味。','medium','食用菇','{\"mainRegions\": [\"福建\", \"广东\", \"浙江\", \"江苏\", \"山东\"], \"cultivationHistory\": \"杏鲍菇的人工栽培始于20世纪80年代，我国从20世纪90年代开始大规模栽培。\", \"geographicEnvironment\": \"杏鲍菇主要生长在海拔300-1000米的山区，喜欢凉爽湿润的气候。\"}','新鲜杏鲍菇应存放在冰箱冷藏室中，温度控制在0-4℃，可保存3-5天。干杏鲍菇应密封存放在阴凉、干燥、通风的地方，可保存1-2年。','杏鲍菇具有提高免疫力、降血压、降血脂、抗肿瘤、抗氧化等功效。它含有丰富的多糖和膳食纤维，对人体健康有益。','杏鲍菇是一种新兴的食用菌，近年来在我国的栽培面积不断扩大，受到消费者的喜爱。','{\"priceRange\": \"新鲜杏鲍菇: 15-30元/斤, 干杏鲍菇: 60-120元/斤\", \"exportStatus\": \"我国是世界上最大的杏鲍菇出口国之一。\", \"marketDemand\": \"杏鲍菇是一种受欢迎的珍稀食用菌，市场需求稳定增长。\"}','中国食用菌协会',NULL,'active','common'),(14,'香菇','Lentinula edodes','香菇是一种常见的食用真菌，具有浓郁的香气和丰富的营养价值。它是世界第二大食用菌，也是我国特产之一，在民间素有“山珍”之称。','香菇的栽培主要采用木屑、棉籽壳等作为培养基，在塑料袋中进行。栽培过程中需要控制温度、湿度、通风和光照等条件。一般从接种到出菇需要30-45天。','秋季,冬季','https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=shiitake%20mushroom%20fresh%20with%20dark%20brown%20cap%20and%20white%20stem&image_size=square','2026-02-04 05:03:00','2026-02-04 05:03:00','香菇是一种木腐菌，主要生长在阔叶树的倒木上，喜欢温暖、湿润的环境。最适生长温度为22-26℃，最适相对湿度为80-90%。','{\"fat\": \"1-2%\", \"fiber\": \"30%\", \"protein\": \"20-30%\", \"minerals\": {\"iron\": \"19.4mg/100g\", \"calcium\": \"83mg/100g\", \"potassium\": \"1655mg/100g\", \"phosphorus\": \"258mg/100g\"}, \"vitamins\": {\"C\": \"5mg/100g\", \"D\": \"100IU/100g\", \"B1\": \"0.1mg/100g\", \"B2\": \"1.5mg/100g\"}, \"carbohydrates\": \"60-70%\"}','香菇是安全的食用真菌，没有毒性。但对于少数对蘑菇过敏的人，可能会引起过敏反应。此外，香菇不宜与河蟹、番茄、鹌鹑等食物同食。','香菇子实体单生、丛生或群生，菌盖圆形，直径5-12厘米，有时可达20厘米，表面茶褐色、暗褐色，有深色鳞片，边缘淡色。菌肉白色，厚。菌褶白色，稠密，弯生，不等长。菌柄中生或偏生，白色，内实，常弯曲，长3-8厘米，粗0.5-1.5厘米，菌环以下有鳞片。','炒、炖、煮、蒸、烤、煲汤','选购香菇时，应选择菌盖完整、菌褶紧密、菌柄短而粗壮的香菇。新鲜香菇的菌盖应该是湿润的，有弹性，没有异味。','medium','食用菇','{\"mainRegions\": [\"浙江\", \"福建\", \"江西\", \"湖北\", \"安徽\"], \"cultivationHistory\": \"我国是香菇的发源地，已有800多年的栽培历史。\", \"geographicEnvironment\": \"香菇主要生长在海拔300-1500米的山区，喜欢温暖湿润的气候和肥沃的土壤。\"}','新鲜香菇应存放在冰箱冷藏室中，温度控制在0-4℃，可保存3-5天。干香菇应密封存放在阴凉、干燥、通风的地方，可保存1-2年。','香菇具有提高免疫力、降血压、降血脂、抗肿瘤、抗氧化等功效。它含有丰富的香菇多糖，具有增强机体免疫力的作用。','香菇在我国有着悠久的历史，早在宋代就有关于香菇的记载。在民间，香菇被视为“山珍”，是宴席上的珍品。','{\"priceRange\": \"新鲜香菇: 10-30元/斤, 干香菇: 50-150元/斤\", \"exportStatus\": \"我国是世界上最大的香菇出口国，主要出口到日本、韩国、美国等国家。\", \"marketDemand\": \"香菇是一种受欢迎的食用菌，市场需求稳定增长。\"}','中国食用菌协会',NULL,'active','common'),(15,'平菇','Pleurotus ostreatus','平菇是一种广泛栽培的食用菌，味道鲜美，营养丰富。它是世界上第三大食用菌，也是我国主要的栽培食用菌之一。','平菇的栽培主要采用木屑、棉籽壳、玉米芯等作为培养基，在塑料袋中进行。栽培过程中需要控制温度、湿度、通风和光照等条件。一般从接种到出菇需要20-30天。','春季,秋季','https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=oyster%20mushroom%20fresh%20with%20gray%20cap%20and%20white%20stem&image_size=square','2026-02-04 05:03:00','2026-02-04 05:03:00','平菇是一种木腐菌，主要生长在阔叶树的倒木上，喜欢温暖、湿润的环境。最适生长温度为20-25℃，最适相对湿度为85-95%。','{\"fat\": \"1-2%\", \"fiber\": \"25%\", \"protein\": \"19-26%\", \"minerals\": {\"iron\": \"3.2mg/100g\", \"calcium\": \"22mg/100g\", \"potassium\": \"1655mg/100g\", \"phosphorus\": \"380mg/100g\"}, \"vitamins\": {\"C\": \"4mg/100g\", \"D\": \"80IU/100g\", \"B1\": \"0.1mg/100g\", \"B2\": \"1.3mg/100g\"}, \"carbohydrates\": \"60-70%\"}','平菇是安全的食用真菌，没有毒性。但对于少数对蘑菇过敏的人，可能会引起过敏反应。','平菇子实体丛生或叠生，菌盖扇形、贝壳形或不规则形，直径3-15厘米，表面灰白、浅灰、灰褐或深褐色，光滑或有细绒毛。菌肉白色，厚。菌褶白色，延生，不等长。菌柄侧生或偏生，白色，内实，长1-5厘米，粗0.5-1.5厘米。','炒、炖、煮、蒸、煲汤','选购平菇时，应选择菌盖完整、菌褶紧密、菌柄短而粗壮的平菇。新鲜平菇的菌盖应该是湿润的，有弹性，没有异味。','easy','食用菇','{\"mainRegions\": [\"河北\", \"河南\", \"山东\", \"江苏\", \"四川\"], \"cultivationHistory\": \"平菇的人工栽培始于20世纪初，我国从20世纪50年代开始大规模栽培。\", \"geographicEnvironment\": \"平菇适应性强，可在不同海拔和气候条件下生长。\"}','新鲜平菇应存放在冰箱冷藏室中，温度控制在0-4℃，可保存3-5天。干平菇应密封存放在阴凉、干燥、通风的地方，可保存1-2年。','平菇具有提高免疫力、降血压、降血脂、抗肿瘤、抗氧化等功效。它含有丰富的多糖和膳食纤维，对人体健康有益。','平菇在我国有着悠久的栽培历史，是一种常见的家常菜食材。','{\"priceRange\": \"新鲜平菇: 5-15元/斤, 干平菇: 30-80元/斤\", \"exportStatus\": \"我国是世界上最大的平菇出口国之一。\", \"marketDemand\": \"平菇是一种受欢迎的食用菌，市场需求稳定。\"}','中国食用菌协会',NULL,'active','common'),(16,'杏鲍菇','Pleurotus eryngii','杏鲍菇是一种珍稀的食用菌，味道鲜美，营养丰富。它具有独特的杏仁香味，因此得名杏鲍菇。','杏鲍菇的栽培主要采用木屑、棉籽壳、玉米芯等作为培养基，在塑料袋中进行。栽培过程中需要控制温度、湿度、通风和光照等条件。一般从接种到出菇需要30-45天。','秋季,冬季','https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=king%20oyster%20mushroom%20fresh%20with%20white%20cap%20and%20long%20white%20stem&image_size=square','2026-02-04 05:03:00','2026-02-04 05:03:00','杏鲍菇是一种木腐菌，主要生长在伞形科植物的根际，喜欢凉爽、湿润的环境。最适生长温度为15-20℃，最适相对湿度为85-95%。','{\"fat\": \"1-2%\", \"fiber\": \"20%\", \"protein\": \"20-25%\", \"minerals\": {\"iron\": \"2.5mg/100g\", \"calcium\": \"18mg/100g\", \"potassium\": \"1500mg/100g\", \"phosphorus\": \"350mg/100g\"}, \"vitamins\": {\"C\": \"4mg/100g\", \"D\": \"70IU/100g\", \"B1\": \"0.1mg/100g\", \"B2\": \"1.2mg/100g\"}, \"carbohydrates\": \"60-70%\"}','杏鲍菇是安全的食用真菌，没有毒性。但对于少数对蘑菇过敏的人，可能会引起过敏反应。','杏鲍菇子实体单生或丛生，菌盖圆形或扇形，直径2-12厘米，表面灰白色或浅褐色，光滑。菌肉白色，厚。菌褶白色，延生，不等长。菌柄中生或偏生，白色，内实，长5-15厘米，粗1-3厘米，基部膨大。','炒、炖、煮、蒸、烤、煲汤','选购杏鲍菇时，应选择菌盖完整、菌褶紧密、菌柄粗壮的杏鲍菇。新鲜杏鲍菇的菌盖应该是湿润的，有弹性，没有异味。','medium','食用菇','{\"mainRegions\": [\"福建\", \"广东\", \"浙江\", \"江苏\", \"山东\"], \"cultivationHistory\": \"杏鲍菇的人工栽培始于20世纪80年代，我国从20世纪90年代开始大规模栽培。\", \"geographicEnvironment\": \"杏鲍菇主要生长在海拔300-1000米的山区，喜欢凉爽湿润的气候。\"}','新鲜杏鲍菇应存放在冰箱冷藏室中，温度控制在0-4℃，可保存3-5天。干杏鲍菇应密封存放在阴凉、干燥、通风的地方，可保存1-2年。','杏鲍菇具有提高免疫力、降血压、降血脂、抗肿瘤、抗氧化等功效。它含有丰富的多糖和膳食纤维，对人体健康有益。','杏鲍菇是一种新兴的食用菌，近年来在我国的栽培面积不断扩大，受到消费者的喜爱。','{\"priceRange\": \"新鲜杏鲍菇: 15-30元/斤, 干杏鲍菇: 60-120元/斤\", \"exportStatus\": \"我国是世界上最大的杏鲍菇出口国之一。\", \"marketDemand\": \"杏鲍菇是一种受欢迎的珍稀食用菌，市场需求稳定增长。\"}','中国食用菌协会',NULL,'active','common'),(17,'香菇','Lentinula edodes','香菇是一种常见的食用真菌，具有浓郁的香气和丰富的营养价值。它是世界第二大食用菌，也是我国特产之一，在民间素有“山珍”之称。','香菇的栽培主要采用木屑、棉籽壳等作为培养基，在塑料袋中进行。栽培过程中需要控制温度、湿度、通风和光照等条件。一般从接种到出菇需要30-45天。','秋季,冬季','https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=shiitake%20mushroom%20fresh%20with%20dark%20brown%20cap%20and%20white%20stem&image_size=square','2026-02-04 05:03:21','2026-02-04 05:03:21','香菇是一种木腐菌，主要生长在阔叶树的倒木上，喜欢温暖、湿润的环境。最适生长温度为22-26℃，最适相对湿度为80-90%。','{\"fat\": \"1-2%\", \"fiber\": \"30%\", \"protein\": \"20-30%\", \"minerals\": {\"iron\": \"19.4mg/100g\", \"calcium\": \"83mg/100g\", \"potassium\": \"1655mg/100g\", \"phosphorus\": \"258mg/100g\"}, \"vitamins\": {\"C\": \"5mg/100g\", \"D\": \"100IU/100g\", \"B1\": \"0.1mg/100g\", \"B2\": \"1.5mg/100g\"}, \"carbohydrates\": \"60-70%\"}','香菇是安全的食用真菌，没有毒性。但对于少数对蘑菇过敏的人，可能会引起过敏反应。此外，香菇不宜与河蟹、番茄、鹌鹑等食物同食。','香菇子实体单生、丛生或群生，菌盖圆形，直径5-12厘米，有时可达20厘米，表面茶褐色、暗褐色，有深色鳞片，边缘淡色。菌肉白色，厚。菌褶白色，稠密，弯生，不等长。菌柄中生或偏生，白色，内实，常弯曲，长3-8厘米，粗0.5-1.5厘米，菌环以下有鳞片。','炒、炖、煮、蒸、烤、煲汤','选购香菇时，应选择菌盖完整、菌褶紧密、菌柄短而粗壮的香菇。新鲜香菇的菌盖应该是湿润的，有弹性，没有异味。','medium','食用菇','{\"mainRegions\": [\"浙江\", \"福建\", \"江西\", \"湖北\", \"安徽\"], \"cultivationHistory\": \"我国是香菇的发源地，已有800多年的栽培历史。\", \"geographicEnvironment\": \"香菇主要生长在海拔300-1500米的山区，喜欢温暖湿润的气候和肥沃的土壤。\"}','新鲜香菇应存放在冰箱冷藏室中，温度控制在0-4℃，可保存3-5天。干香菇应密封存放在阴凉、干燥、通风的地方，可保存1-2年。','香菇具有提高免疫力、降血压、降血脂、抗肿瘤、抗氧化等功效。它含有丰富的香菇多糖，具有增强机体免疫力的作用。','香菇在我国有着悠久的历史，早在宋代就有关于香菇的记载。在民间，香菇被视为“山珍”，是宴席上的珍品。','{\"priceRange\": \"新鲜香菇: 10-30元/斤, 干香菇: 50-150元/斤\", \"exportStatus\": \"我国是世界上最大的香菇出口国，主要出口到日本、韩国、美国等国家。\", \"marketDemand\": \"香菇是一种受欢迎的食用菌，市场需求稳定增长。\"}','中国食用菌协会',NULL,'active','common'),(18,'平菇','Pleurotus ostreatus','平菇是一种广泛栽培的食用菌，味道鲜美，营养丰富。它是世界上第三大食用菌，也是我国主要的栽培食用菌之一。','平菇的栽培主要采用木屑、棉籽壳、玉米芯等作为培养基，在塑料袋中进行。栽培过程中需要控制温度、湿度、通风和光照等条件。一般从接种到出菇需要20-30天。','春季,秋季','https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=oyster%20mushroom%20fresh%20with%20gray%20cap%20and%20white%20stem&image_size=square','2026-02-04 05:03:21','2026-02-04 05:03:21','平菇是一种木腐菌，主要生长在阔叶树的倒木上，喜欢温暖、湿润的环境。最适生长温度为20-25℃，最适相对湿度为85-95%。','{\"fat\": \"1-2%\", \"fiber\": \"25%\", \"protein\": \"19-26%\", \"minerals\": {\"iron\": \"3.2mg/100g\", \"calcium\": \"22mg/100g\", \"potassium\": \"1655mg/100g\", \"phosphorus\": \"380mg/100g\"}, \"vitamins\": {\"C\": \"4mg/100g\", \"D\": \"80IU/100g\", \"B1\": \"0.1mg/100g\", \"B2\": \"1.3mg/100g\"}, \"carbohydrates\": \"60-70%\"}','平菇是安全的食用真菌，没有毒性。但对于少数对蘑菇过敏的人，可能会引起过敏反应。','平菇子实体丛生或叠生，菌盖扇形、贝壳形或不规则形，直径3-15厘米，表面灰白、浅灰、灰褐或深褐色，光滑或有细绒毛。菌肉白色，厚。菌褶白色，延生，不等长。菌柄侧生或偏生，白色，内实，长1-5厘米，粗0.5-1.5厘米。','炒、炖、煮、蒸、煲汤','选购平菇时，应选择菌盖完整、菌褶紧密、菌柄短而粗壮的平菇。新鲜平菇的菌盖应该是湿润的，有弹性，没有异味。','easy','食用菇','{\"mainRegions\": [\"河北\", \"河南\", \"山东\", \"江苏\", \"四川\"], \"cultivationHistory\": \"平菇的人工栽培始于20世纪初，我国从20世纪50年代开始大规模栽培。\", \"geographicEnvironment\": \"平菇适应性强，可在不同海拔和气候条件下生长。\"}','新鲜平菇应存放在冰箱冷藏室中，温度控制在0-4℃，可保存3-5天。干平菇应密封存放在阴凉、干燥、通风的地方，可保存1-2年。','平菇具有提高免疫力、降血压、降血脂、抗肿瘤、抗氧化等功效。它含有丰富的多糖和膳食纤维，对人体健康有益。','平菇在我国有着悠久的栽培历史，是一种常见的家常菜食材。','{\"priceRange\": \"新鲜平菇: 5-15元/斤, 干平菇: 30-80元/斤\", \"exportStatus\": \"我国是世界上最大的平菇出口国之一。\", \"marketDemand\": \"平菇是一种受欢迎的食用菌，市场需求稳定。\"}','中国食用菌协会',NULL,'active','common'),(19,'杏鲍菇','Pleurotus eryngii','杏鲍菇是一种珍稀的食用菌，味道鲜美，营养丰富。它具有独特的杏仁香味，因此得名杏鲍菇。','杏鲍菇的栽培主要采用木屑、棉籽壳、玉米芯等作为培养基，在塑料袋中进行。栽培过程中需要控制温度、湿度、通风和光照等条件。一般从接种到出菇需要30-45天。','秋季,冬季','https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=king%20oyster%20mushroom%20fresh%20with%20white%20cap%20and%20long%20white%20stem&image_size=square','2026-02-04 05:03:21','2026-02-04 05:03:21','杏鲍菇是一种木腐菌，主要生长在伞形科植物的根际，喜欢凉爽、湿润的环境。最适生长温度为15-20℃，最适相对湿度为85-95%。','{\"fat\": \"1-2%\", \"fiber\": \"20%\", \"protein\": \"20-25%\", \"minerals\": {\"iron\": \"2.5mg/100g\", \"calcium\": \"18mg/100g\", \"potassium\": \"1500mg/100g\", \"phosphorus\": \"350mg/100g\"}, \"vitamins\": {\"C\": \"4mg/100g\", \"D\": \"70IU/100g\", \"B1\": \"0.1mg/100g\", \"B2\": \"1.2mg/100g\"}, \"carbohydrates\": \"60-70%\"}','杏鲍菇是安全的食用真菌，没有毒性。但对于少数对蘑菇过敏的人，可能会引起过敏反应。','杏鲍菇子实体单生或丛生，菌盖圆形或扇形，直径2-12厘米，表面灰白色或浅褐色，光滑。菌肉白色，厚。菌褶白色，延生，不等长。菌柄中生或偏生，白色，内实，长5-15厘米，粗1-3厘米，基部膨大。','炒、炖、煮、蒸、烤、煲汤','选购杏鲍菇时，应选择菌盖完整、菌褶紧密、菌柄粗壮的杏鲍菇。新鲜杏鲍菇的菌盖应该是湿润的，有弹性，没有异味。','medium','食用菇','{\"mainRegions\": [\"福建\", \"广东\", \"浙江\", \"江苏\", \"山东\"], \"cultivationHistory\": \"杏鲍菇的人工栽培始于20世纪80年代，我国从20世纪90年代开始大规模栽培。\", \"geographicEnvironment\": \"杏鲍菇主要生长在海拔300-1000米的山区，喜欢凉爽湿润的气候。\"}','新鲜杏鲍菇应存放在冰箱冷藏室中，温度控制在0-4℃，可保存3-5天。干杏鲍菇应密封存放在阴凉、干燥、通风的地方，可保存1-2年。','杏鲍菇具有提高免疫力、降血压、降血脂、抗肿瘤、抗氧化等功效。它含有丰富的多糖和膳食纤维，对人体健康有益。','杏鲍菇是一种新兴的食用菌，近年来在我国的栽培面积不断扩大，受到消费者的喜爱。','{\"priceRange\": \"新鲜杏鲍菇: 15-30元/斤, 干杏鲍菇: 60-120元/斤\", \"exportStatus\": \"我国是世界上最大的杏鲍菇出口国之一。\", \"marketDemand\": \"杏鲍菇是一种受欢迎的珍稀食用菌，市场需求稳定增长。\"}','中国食用菌协会',NULL,'active','common');
/*!40000 ALTER TABLE `mushrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '璁㈠崟椤笽D',
  `orderId` int NOT NULL COMMENT '订单ID',
  `productId` int NOT NULL COMMENT '商品ID',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'product' COMMENT '类型：product-商品 | box-盲盒',
  `productName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `quantity` int NOT NULL COMMENT '商品数量',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品图片',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `productId` (`productId`),
  CONSTRAINT `order_items_orderId_foreign` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='璁㈠崟椤硅〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,2,'product','蜜汁小憨包',0.03,7,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 03:57:05','2026-01-24 03:57:05'),(2,2,2,'product','蜜汁小憨包',0.03,2,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 04:24:09','2026-01-24 04:24:09'),(3,3,2,'product','蜜汁小憨包',0.03,2,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 04:28:44','2026-01-24 04:28:44'),(4,4,2,'product','蜜汁小憨包',0.03,2,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 04:29:06','2026-01-24 04:29:06'),(5,5,2,'product','蜜汁小憨包',0.03,3,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 04:40:32','2026-01-24 04:40:32'),(6,6,2,'product','蜜汁小憨包',0.03,7,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 06:08:11','2026-01-24 06:08:11'),(8,8,2,'product','蜜汁小憨包',0.03,3,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 06:26:36','2026-01-24 06:26:36'),(11,11,2,'product','蜜汁小憨包',0.03,3,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 08:50:11','2026-01-24 08:50:11'),(12,12,2,'product','蜜汁小憨包',0.03,2,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 08:50:48','2026-01-24 08:50:48'),(13,13,2,'product','蜜汁小憨包',0.03,1,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 09:08:47','2026-01-24 09:08:47'),(14,14,2,'product','蜜汁小憨包',0.03,2,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 09:22:01','2026-01-24 09:22:01'),(15,15,2,'product','蜜汁小憨包',0.03,2,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 09:22:21','2026-01-24 09:22:21'),(16,16,2,'product','蜜汁小憨包',0.03,2,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 09:35:31','2026-01-24 09:35:31'),(17,17,2,'product','蜜汁小憨包',0.03,2,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 09:36:03','2026-01-24 09:36:03'),(18,18,2,'product','蜜汁小憨包',0.03,1,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-01-24 15:49:26','2026-01-24 15:49:26'),(19,19,4,'product','xxxxxxxxxxxx',0.01,2,'/uploads/1769259406625-çæç¹å®çº¢è²çº¿æ¡å¾ç.png','2026-01-25 04:42:10','2026-01-25 04:42:10'),(20,20,4,'product','xxxxxxxxxxxx',0.01,2,'/uploads/1769259406625-çæç¹å®çº¢è²çº¿æ¡å¾ç.png','2026-02-03 05:19:37','2026-02-03 05:19:37'),(21,21,6,'product','反反复复反反复复烦烦烦',1.01,2,'/uploads/1769327963650-çæç¹å®çº¢è²çº¿æ¡å¾ç (2).png','2026-02-05 07:39:00','2026-02-05 07:39:00'),(22,21,24,'product','xhb',0.04,2,'/uploads/çæç¹å®çº¢è²çº¿æ¡å¾ç (3)-1770262603868-836844484.png','2026-02-05 07:39:00','2026-02-05 07:39:00'),(23,22,6,'product','反反复复反反复复烦烦烦',1.01,1,'/uploads/1769327963650-çæç¹å®çº¢è²çº¿æ¡å¾ç (2).png','2026-02-05 07:39:41','2026-02-05 07:39:41'),(24,23,6,'product','反反复复反反复复烦烦烦',1.01,1,'/uploads/1769327963650-çæç¹å®çº¢è²çº¿æ¡å¾ç (2).png','2026-02-05 07:56:48','2026-02-05 07:56:48'),(25,24,6,'product','反反复复反反复复烦烦烦',1.01,3,'/uploads/1769327963650-çæç¹å®çº¢è²çº¿æ¡å¾ç (2).png','2026-02-05 07:57:29','2026-02-05 07:57:29'),(26,25,6,'product','反反复复反反复复烦烦烦',1.01,2,'/uploads/1769327963650-çæç¹å®çº¢è²çº¿æ¡å¾ç (2).png','2026-02-05 08:46:48','2026-02-05 08:46:48'),(27,26,6,'product','反反复复反反复复烦烦烦',1.01,3,'/uploads/1769327963650-çæç¹å®çº¢è²çº¿æ¡å¾ç (2).png','2026-02-05 08:54:47','2026-02-05 08:54:47'),(28,27,2,'product','蜜汁小憨包',0.03,2,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-02-05 09:52:24','2026-02-05 09:52:24'),(29,28,2,'product','蜜汁小憨包',0.03,1,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-02-05 09:54:15','2026-02-05 09:54:15'),(30,29,6,'product','反反复复反反复复烦烦烦',1.01,2,'/uploads/1769327963650-çæç¹å®çº¢è²çº¿æ¡å¾ç (2).png','2026-02-05 10:05:24','2026-02-05 10:05:24'),(31,30,2,'product','蜜汁小憨包',0.03,1,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-02-06 03:22:15','2026-02-06 03:22:15'),(32,30,6,'product','反反复复反反复复烦烦烦',1.01,1,'/uploads/1769327963650-çæç¹å®çº¢è²çº¿æ¡å¾ç (2).png','2026-02-06 03:22:15','2026-02-06 03:22:15'),(33,30,34,'product','猴头菇',29.99,2,'/mushrooms/houtougu.jpg','2026-02-06 03:22:15','2026-02-06 03:22:15'),(34,31,31,'product','平菇',15.99,1,'/mushrooms/pinggu.jpg','2026-02-07 02:28:46','2026-02-07 02:28:46'),(35,32,2,'product','蜜汁小憨包',0.03,1,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-02-07 10:45:32','2026-02-07 10:45:32'),(36,33,2,'product','蜜汁小憨包',0.03,1,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-02-07 10:46:00','2026-02-07 10:46:00'),(37,34,2,'product','蜜汁小憨包',0.03,1,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-02-07 10:46:00','2026-02-07 10:46:00'),(38,35,2,'product','蜜汁小憨包',0.03,1,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-02-07 10:46:00','2026-02-07 10:46:00'),(39,36,2,'product','蜜汁小憨包',0.03,1,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-02-07 10:46:00','2026-02-07 10:46:00'),(40,37,2,'product','蜜汁小憨包',0.03,1,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-02-07 10:46:00','2026-02-07 10:46:00'),(41,38,2,'product','蜜汁小憨包',0.03,1,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-02-07 10:46:00','2026-02-07 10:46:00'),(42,39,2,'product','蜜汁小憨包',0.03,1,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-02-07 10:46:00','2026-02-07 10:46:00'),(43,40,4,'product','xxxxxxxxxxxx',0.01,1,'/uploads/1769259406625-çæç¹å®çº¢è²çº¿æ¡å¾ç.png','2026-02-07 10:50:04','2026-02-07 10:50:04'),(44,41,31,'product','平菇',15.99,2,'/mushrooms/pinggu.jpg','2026-02-07 11:43:21','2026-02-07 11:43:21'),(45,42,31,'product','平菇',15.99,2,'/mushrooms/pinggu.jpg','2026-02-07 12:06:31','2026-02-07 12:06:31'),(46,43,31,'product','平菇',15.99,2,'/mushrooms/pinggu.jpg','2026-02-07 13:35:30','2026-02-07 13:35:30'),(47,44,46,'product','123',0.01,1,'/uploads/çæç¹å®çº¢è²çº¿æ¡å¾ç (3) (1)-1770637738253-955307801.png','2026-02-10 09:38:38','2026-02-10 09:38:38'),(48,45,2,'product','蜜汁小憨包',0.03,1,'/uploads/1769180426737-çæç¹å®çº¢è²çº¿æ¡å¾ç (4).png','2026-02-19 10:47:49','2026-02-19 10:47:49'),(50,47,46,'product','123',0.01,3,'/uploads/çæç¹å®çº¢è²çº¿æ¡å¾ç (3) (1)-1770637738253-955307801.png','2026-02-20 12:51:47','2026-02-20 12:51:47'),(67,52,33,'product','金针菇',12.99,2,'/mushrooms/jinzhengu.jpg','2026-02-20 14:07:04','2026-02-20 14:07:04'),(68,52,46,'product','123',0.01,1,'/uploads/çæç¹å®çº¢è²çº¿æ¡å¾ç (3) (1)-1770637738253-955307801.png','2026-02-20 14:07:04','2026-02-20 14:07:04'),(69,52,50,'product','杀杀杀杀杀杀杀杀杀搜索',0.01,2,'/uploads/å±å¹æªå¾ 2025-05-21 175006-1771078204423-907928225.png','2026-02-20 14:07:04','2026-02-20 14:07:04'),(70,52,77,'box','春季养生盲盒 - 鲜嫩菌菇礼盒',89.00,1,'','2026-02-20 14:07:04','2026-02-20 14:07:04'),(71,53,31,'product','平菇',16.00,1,'/uploads/upload-1771652237701-654685118.jpg','2026-02-22 04:42:26','2026-02-22 04:42:26'),(72,53,53,'product','杏鲍菇',29.91,1,'/uploads/upload-1771667923500-262170868.webp','2026-02-22 04:42:26','2026-02-22 04:42:26'),(73,53,78,'box','夏季清凉盲盒 - 清爽菌菇组合',79.01,1,'/uploads/upload-1771725933078-894649708.webp','2026-02-22 04:42:26','2026-02-22 04:42:26');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '璁㈠崟ID',
  `orderNo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `userId` int NOT NULL COMMENT '用户ID',
  `totalAmount` decimal(10,2) NOT NULL COMMENT '总金额',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '订单状态：pending-待支付 | paid-已支付 | delivered-已发货 | completed-已完成 | cancelled-已取消',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货地址',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `receiver` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货人',
  `paymentMethod` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付方式',
  `paymentTime` datetime DEFAULT NULL COMMENT '支付时间',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `paymentSignature` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付签名',
  `paymentTimeout` datetime DEFAULT NULL COMMENT '支付超时时间',
  `transactionId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易ID',
  `paymentInfo` json DEFAULT NULL COMMENT '支付信息',
  `cancelledReason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取消原因',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNo` (`orderNo`),
  UNIQUE KEY `orderNo_2` (`orderNo`),
  UNIQUE KEY `orderNo_3` (`orderNo`),
  UNIQUE KEY `orderNo_4` (`orderNo`),
  UNIQUE KEY `orderNo_5` (`orderNo`),
  UNIQUE KEY `orderNo_6` (`orderNo`),
  UNIQUE KEY `orderNo_7` (`orderNo`),
  UNIQUE KEY `orderNo_8` (`orderNo`),
  UNIQUE KEY `orderNo_9` (`orderNo`),
  UNIQUE KEY `orderNo_10` (`orderNo`),
  UNIQUE KEY `orderNo_11` (`orderNo`),
  UNIQUE KEY `orderNo_12` (`orderNo`),
  UNIQUE KEY `orderNo_13` (`orderNo`),
  UNIQUE KEY `orderNo_14` (`orderNo`),
  UNIQUE KEY `orderNo_15` (`orderNo`),
  UNIQUE KEY `orderNo_16` (`orderNo`),
  UNIQUE KEY `orderNo_17` (`orderNo`),
  UNIQUE KEY `orderNo_18` (`orderNo`),
  UNIQUE KEY `orderNo_19` (`orderNo`),
  UNIQUE KEY `orderNo_20` (`orderNo`),
  UNIQUE KEY `orderNo_21` (`orderNo`),
  UNIQUE KEY `orderNo_22` (`orderNo`),
  UNIQUE KEY `orderNo_23` (`orderNo`),
  UNIQUE KEY `orderNo_24` (`orderNo`),
  UNIQUE KEY `orderNo_25` (`orderNo`),
  UNIQUE KEY `orderNo_26` (`orderNo`),
  UNIQUE KEY `orderNo_27` (`orderNo`),
  UNIQUE KEY `orderNo_28` (`orderNo`),
  UNIQUE KEY `orderNo_29` (`orderNo`),
  UNIQUE KEY `orderNo_30` (`orderNo`),
  KEY `userId` (`userId`),
  KEY `status` (`status`),
  CONSTRAINT `orders_userId_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='璁㈠崟琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'ORD1769227025204849',2,0.21,'pending','建国路88号','13800138000','张三','alipay',NULL,'2026-01-24 03:57:05','2026-01-24 03:57:05',NULL,NULL,NULL,NULL,NULL),(2,'ORD1769228649977376',2,0.06,'pending','建国路88号','13800138000','张三','alipay',NULL,'2026-01-24 04:24:09','2026-01-24 04:24:09',NULL,NULL,NULL,NULL,NULL),(3,'ORD1769228924759851',2,0.06,'pending','建国路88号','13800138000','张三','wechat',NULL,'2026-01-24 04:28:44','2026-01-24 04:28:44',NULL,NULL,NULL,NULL,NULL),(4,'ORD176922894646223',2,0.06,'pending','建国路88号','13800138000','张三','alipay',NULL,'2026-01-24 04:29:06','2026-01-24 04:29:06',NULL,NULL,NULL,NULL,NULL),(5,'ORD176922963200836',2,0.09,'pending','建国路88号','13800138000','张三','alipay',NULL,'2026-01-24 04:40:32','2026-01-24 04:40:32',NULL,NULL,NULL,NULL,NULL),(6,'ORD1769234891836774',2,0.21,'pending','建国路88号','13800138000','张三','alipay',NULL,'2026-01-24 06:08:11','2026-01-24 06:08:11',NULL,NULL,NULL,NULL,NULL),(7,'ORD1769235235678280',6,0.01,'pending','????','13800138000','????','alipay',NULL,'2026-01-24 06:13:55','2026-01-24 06:13:55',NULL,NULL,NULL,NULL,NULL),(8,'ORD1769235996130327',2,0.09,'pending','建国路88号','13800138000','张三','alipay',NULL,'2026-01-24 06:26:36','2026-01-24 06:26:36',NULL,NULL,NULL,NULL,NULL),(9,'ORD1769236456329696',2,0.01,'pending','建国路88号','13800138000','张三','alipay',NULL,'2026-01-24 06:34:16','2026-01-24 06:34:16',NULL,NULL,NULL,NULL,NULL),(10,'ORD176923650063651',2,0.02,'pending','efdwf\ndwq','13351324444','xxx','wechat',NULL,'2026-01-24 06:35:00','2026-01-24 06:35:00',NULL,NULL,NULL,NULL,NULL),(11,'ORD176924461148289',2,0.09,'cancelled','建国路88号','13800138000','张三','wechat',NULL,'2026-01-24 08:50:11','2026-01-24 08:50:25',NULL,NULL,NULL,NULL,NULL),(12,'ORD1769244648830847',2,0.06,'cancelled','建国路88号','13800138000','张三','alipay',NULL,'2026-01-24 08:50:48','2026-01-24 08:51:11',NULL,NULL,NULL,NULL,NULL),(13,'ORD1769245727467635',2,0.03,'pending','建国路88号','13800138000','张三','alipay',NULL,'2026-01-24 09:08:47','2026-01-24 09:08:47',NULL,NULL,NULL,NULL,NULL),(14,'ORD1769246521641101',2,0.06,'cancelled','efdwf\ndwq','13351324444','xxx','alipay',NULL,'2026-01-24 09:22:01','2026-01-24 09:22:09',NULL,NULL,NULL,NULL,NULL),(15,'ORD1769246541215219',2,0.06,'cancelled','建国路88号','13800138000','张三','alipay',NULL,'2026-01-24 09:22:21','2026-01-24 09:22:24',NULL,NULL,NULL,NULL,NULL),(16,'ORD1769247331874122',2,0.06,'pending','efdwf\ndwq','13351324444','xxx','alipay',NULL,'2026-01-24 09:35:31','2026-01-24 09:35:31',NULL,NULL,NULL,NULL,NULL),(17,'ORD1769247363275482',2,0.06,'pending','efdwf\ndwq','13351326666','ddd','alipay',NULL,'2026-01-24 09:36:03','2026-01-24 09:36:03',NULL,NULL,NULL,NULL,NULL),(18,'ORD1769269766821619',2,0.03,'pending','efdwf\ndwq','13351324444','xxx','alipay',NULL,'2026-01-24 15:49:26','2026-01-24 15:49:26',NULL,NULL,NULL,NULL,NULL),(19,'ORD1769316130686959',2,0.02,'pending','efdwf\ndwq','13351326666','ddd','alipay',NULL,'2026-01-25 04:42:10','2026-01-25 04:42:10',NULL,NULL,NULL,NULL,NULL),(20,'ORD1770095977885126',2,0.02,'paid','efdwf\ndwq','13351324444','xxx','alipay',NULL,'2026-02-03 05:19:37','2026-02-05 05:52:44',NULL,NULL,NULL,NULL,NULL),(21,'ORD1770277140534486',2,2.10,'pending','efdwf\ndwq','13351326666','ddd','alipay',NULL,'2026-02-05 07:39:00','2026-02-05 07:39:00',NULL,NULL,NULL,NULL,NULL),(22,'ORD1770277181477758',2,1.01,'cancelled','efdwf\ndwq','13351326666','ddd','alipay',NULL,'2026-02-05 07:39:41','2026-02-05 07:39:57',NULL,NULL,NULL,NULL,NULL),(23,'ORD177027820823548',2,1.01,'cancelled','efdwf\ndwq','13351326666','ddd','alipay',NULL,'2026-02-05 07:56:48','2026-02-05 08:26:05',NULL,NULL,NULL,NULL,NULL),(24,'ORD1770278249268101',2,3.03,'pending','efdwf\ndwq','13351326666','ddd','alipay',NULL,'2026-02-05 07:57:29','2026-02-05 07:57:29',NULL,NULL,NULL,NULL,NULL),(25,'ORD17702812084563',2,2.02,'pending','efdwf\ndwq','13351326666','ddd','alipay',NULL,'2026-02-05 08:46:48','2026-02-05 08:46:48',NULL,NULL,NULL,NULL,NULL),(26,'ORD1770281687031616',2,3.03,'pending','efdwf\ndwq','13351326666','ddd','alipay',NULL,'2026-02-05 08:54:47','2026-02-05 08:54:47',NULL,NULL,NULL,NULL,NULL),(27,'ORD1770285144426898',2,0.06,'pending','efdwf\ndwq','13351326666','ddd','alipay',NULL,'2026-02-05 09:52:24','2026-02-05 09:52:24',NULL,NULL,NULL,NULL,NULL),(28,'ORD1770285255602396',2,0.03,'pending','efdwf\ndwq','13351324444','xxx','wechat',NULL,'2026-02-05 09:54:15','2026-02-05 09:54:15',NULL,NULL,NULL,NULL,NULL),(29,'ORD1770285924342171',2,2.02,'pending','efdwf\ndwq','13351324444','xxx','alipay',NULL,'2026-02-05 10:05:24','2026-02-05 10:05:24',NULL,NULL,NULL,NULL,NULL),(30,'ORD1770348135719114',2,61.02,'pending','efdwf\ndwq','13351326666','ddd','alipay',NULL,'2026-02-06 03:22:15','2026-02-06 03:22:15',NULL,NULL,NULL,NULL,NULL),(31,'ORD1770431326434155',2,15.99,'pending','efdwf\ndwq','13351326666','ddd','alipay',NULL,'2026-02-07 02:28:46','2026-02-07 02:28:46',NULL,NULL,NULL,NULL,NULL),(32,'ORD1770461132299556',22,0.03,'pending','测试地址','13800138000','测试用户','alipay',NULL,'2026-02-07 10:45:32','2026-02-07 10:45:32','298d65d4fef8299b039cadfc5c1b448f','2026-02-07 11:15:32',NULL,'{\"method\": \"alipay\", \"signature\": \"298d65d4fef8299b039cadfc5c1b448f\", \"timestamp\": 1770461132307}',NULL),(33,'ORD177046116077581',22,0.03,'pending','测试地址','13800138000','测试用户','alipay',NULL,'2026-02-07 10:46:00','2026-02-07 10:46:00','6fa42030b04592b832e572e0dd44d17d','2026-02-07 11:16:00',NULL,'{\"method\": \"alipay\", \"signature\": \"6fa42030b04592b832e572e0dd44d17d\", \"timestamp\": 1770461160782}',NULL),(34,'ORD1770461160831265',22,0.03,'pending','测试地址','13800138000','测试用户','wechat',NULL,'2026-02-07 10:46:00','2026-02-07 10:46:00','df15b9399f28b46c9674fba12d731375','2026-02-07 11:16:00',NULL,'{\"method\": \"wechat\", \"signature\": \"df15b9399f28b46c9674fba12d731375\", \"timestamp\": 1770461160833}',NULL),(35,'ORD1770461160853428',22,0.03,'pending','测试地址','13800138000','测试用户','alipay',NULL,'2026-02-07 10:46:00','2026-02-07 10:46:00','b7bcb153b4a2f475ab6e766a2cf8955c','2026-02-07 11:16:00',NULL,'{\"method\": \"alipay\", \"signature\": \"b7bcb153b4a2f475ab6e766a2cf8955c\", \"timestamp\": 1770461160854}',NULL),(36,'ORD1770461160871979',22,0.03,'pending','测试地址','13800138000','测试用户','wechat',NULL,'2026-02-07 10:46:00','2026-02-07 10:46:00','d8b6e4f7693f6e93c6afa79157ec611f','2026-02-07 11:16:00',NULL,'{\"method\": \"wechat\", \"signature\": \"d8b6e4f7693f6e93c6afa79157ec611f\", \"timestamp\": 1770461160873}',NULL),(37,'ORD1770461160893417',22,0.03,'pending','测试地址','13800138000','测试用户','bank',NULL,'2026-02-07 10:46:00','2026-02-07 10:46:00','10eb16e9eeea3b2d57cfcb39174d8f38','2026-02-07 11:16:00',NULL,'{\"method\": \"bank\", \"signature\": \"10eb16e9eeea3b2d57cfcb39174d8f38\", \"timestamp\": 1770461160895}',NULL),(38,'ORD1770461160911647',22,0.03,'pending','测试地址','13800138000','测试用户','alipay',NULL,'2026-02-07 10:46:00','2026-02-07 10:46:00','809ebc68587186015d9a2b9cdedb38a2','2026-02-07 11:16:00',NULL,'{\"method\": \"alipay\", \"signature\": \"809ebc68587186015d9a2b9cdedb38a2\", \"timestamp\": 1770461160913}',NULL),(39,'ORD177046116093463',22,0.03,'pending','测试地址','13800138000','测试用户','bank',NULL,'2026-02-07 10:46:00','2026-02-07 10:46:00','f0f26315a0bfe067cc974a29787a743d','2026-02-07 11:16:00',NULL,'{\"method\": \"bank\", \"signature\": \"f0f26315a0bfe067cc974a29787a743d\", \"timestamp\": 1770461160936}',NULL),(40,'ORD1770461404869856',2,0.01,'pending','efdwf\ndwq','13351326666','ddd','wechat',NULL,'2026-02-07 10:50:04','2026-02-07 10:50:04','87174105786c514af6dd0453109c63e6','2026-02-07 11:20:04',NULL,'{\"method\": \"wechat\", \"signature\": \"87174105786c514af6dd0453109c63e6\", \"timestamp\": 1770461404872}',NULL),(41,'ORD1770464601083417',2,31.98,'pending','efdwf\ndwq','13351326666','ddd','wechat',NULL,'2026-02-07 11:43:21','2026-02-07 11:43:21','3fc1aa47fa2ae6c996f8b7eb2d7bbeec','2026-02-07 12:13:21',NULL,'{\"method\": \"wechat\", \"signature\": \"3fc1aa47fa2ae6c996f8b7eb2d7bbeec\", \"timestamp\": 1770464601085}',NULL),(42,'ORD1770465991538341',2,31.98,'shipping','efdwf\ndwq','13351326666','ddd','alipay',NULL,'2026-02-07 12:06:31','2026-02-21 10:22:14','8191b7659069c717b47ba9122ca8cac9','2026-02-07 12:36:31',NULL,'{\"method\": \"alipay\", \"signature\": \"8191b7659069c717b47ba9122ca8cac9\", \"timestamp\": 1770465991540}',NULL),(43,'ORD1770471330580856',2,31.98,'pending','efdwf\ndwq','13351326666','ddd','alipay',NULL,'2026-02-07 13:35:30','2026-02-07 13:35:30','c5e83524ee9c52b5140734152b9c5056','2026-02-07 14:05:30',NULL,'{\"method\": \"alipay\", \"signature\": \"c5e83524ee9c52b5140734152b9c5056\", \"timestamp\": 1770471330583}',NULL),(44,'ORD1770716318820668',2,0.01,'cancelled','efdwf\ndwq','13351326666','ddd','alipay',NULL,'2026-02-10 09:38:38','2026-02-10 09:38:51','e154decdc49370adbdc4cf93b2f66c5c','2026-02-10 10:08:38',NULL,'{\"method\": \"alipay\", \"signature\": \"e154decdc49370adbdc4cf93b2f66c5c\", \"timestamp\": 1770716318824}',NULL),(45,'ORD1771498069124750',3,0.03,'pending','efdwf\ndwq','13351344444','11111111','alipay',NULL,'2026-02-19 10:47:49','2026-02-19 10:47:49','b462f1ac1cffcd7bed4bf966739366dd','2026-02-19 11:17:49',NULL,'{\"method\": \"alipay\", \"signature\": \"b462f1ac1cffcd7bed4bf966739366dd\", \"timestamp\": 1771498069133}',NULL),(46,'ORD1771591039435326',2,60.07,'pending','efdwf\ndwq','13351324444','xxx','alipay',NULL,'2026-02-20 12:37:19','2026-02-20 12:37:19','d018315080e289e7b449d7c2b3d240c3','2026-02-20 13:07:19',NULL,'{\"method\": \"alipay\", \"signature\": \"d018315080e289e7b449d7c2b3d240c3\", \"timestamp\": 1771591039447}',NULL),(47,'ORD1771591907020527',2,0.03,'cancelled','efdwf\ndwq','13351324444','xxx','alipay',NULL,'2026-02-20 12:51:47','2026-02-20 12:51:53','bc15efdbae305fbbed5e62f47adf1a55','2026-02-20 13:21:47',NULL,'{\"method\": \"alipay\", \"signature\": \"bc15efdbae305fbbed5e62f47adf1a55\", \"timestamp\": 1771591907023}',NULL),(52,'ORD1771596424299610',2,115.01,'pending','efdwf\ndwq','13351324444','xxx','alipay',NULL,'2026-02-20 14:07:04','2026-02-20 14:07:04','be02df3b7ba24178b868bdeb1b623355','2026-02-20 14:37:04',NULL,'{\"method\": \"alipay\", \"signature\": \"be02df3b7ba24178b868bdeb1b623355\", \"timestamp\": 1771596424326}',NULL),(53,'ORD1771735346044237',2,124.92,'pending','xxxxxxxxxxxxxx','13845557834','张三','bank',NULL,'2026-02-22 04:42:26','2026-02-22 04:42:26','9aa275b591e5badef6b87951d4af58ac','2026-02-22 05:12:26',NULL,'{\"method\": \"bank\", \"signature\": \"9aa275b591e5badef6b87951d4af58ac\", \"timestamp\": 1771735346064}',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '鍟嗗搧ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '商品描述',
  `price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `stock` int NOT NULL DEFAULT '0' COMMENT '库存数量',
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品分类',
  `images` json DEFAULT NULL COMMENT '商品图片',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '商品状态：pending-待审核 | approved-已审核 | rejected-已拒绝',
  `viewCount` int NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `sellerId` int NOT NULL COMMENT '卖家ID',
  `rejectReason` text COLLATE utf8mb4_unicode_ci COMMENT '拒绝原因文本',
  `rejectType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '拒绝类型：如内容违规、价格异常、图片违规等',
  `rejectRule` text COLLATE utf8mb4_unicode_ci COMMENT '相关规则依据',
  `rejectedAt` datetime DEFAULT NULL COMMENT '拒绝时间',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `isHot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否热门商品',
  PRIMARY KEY (`id`),
  KEY `sellerId` (`sellerId`),
  KEY `category` (`category`),
  KEY `status` (`status`),
  KEY `idx_isHot` (`isHot`),
  CONSTRAINT `products_sellerId_foreign` FOREIGN KEY (`sellerId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鍟嗗搧琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (5,'灌灌灌灌','嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎',0.01,16,'菌包','[\"/uploads/1769270194934-çæç¹å®çº¢è²çº¿æ¡å¾ç (2).png\"]','rejected',12,2,NULL,NULL,NULL,NULL,'2026-01-24 15:57:03','2026-01-25 07:03:27',0),(11,'ddddddddd','ddddddddddd',0.01,4,'食用菌','[\"/uploads/1769331171737-çæç¹å®çº¢è²çº¿æ¡å¾ç (2).png\"]','rejected',0,3,NULL,NULL,NULL,NULL,'2026-01-25 08:52:52','2026-01-25 08:53:17',0),(14,'嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡我','少时诵诗书水水水水水水水水',0.01,4,'药用菌','[\"/uploads/1769333969096-çæç¹å®çº¢è²çº¿æ¡å¾ç (5).png\"]','rejected',0,3,'水水水水','price','杀杀杀','2026-01-25 09:39:45','2026-01-25 09:39:30','2026-01-25 09:39:45',0),(16,'靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠','酷酷酷酷酷酷酷酷酷酷酷酷酷酷酷酷酷酷',0.01,5,'野生菌','[\"/uploads/1769336512856-çæç¹å®çº¢è²çº¿æ¡å¾ç (2).png\"]','rejected',0,3,'就将计就计','quality','斤斤计较经济界','2026-01-25 10:22:14','2026-01-25 10:21:53','2026-01-25 10:22:14',0),(31,'平菇','平菇是一种广泛栽培的食用菌，味道鲜美，营养丰富。',16.00,92,'菌菇','[\"/uploads/upload-1771652237701-654685118.jpg\"]','approved',14,3,NULL,NULL,NULL,NULL,'2026-02-05 16:45:59','2026-02-22 04:42:26',1),(33,'金针菇','金针菇口感脆嫩，富含多种氨基酸和维生素。',13.00,98,'菌菇','[\"/uploads/upload-1771652265102-229560094.jpg\"]','approved',5,3,NULL,NULL,NULL,NULL,'2026-02-05 16:45:59','2026-02-21 07:43:50',1),(34,'猴头菇','猴头菇是一种珍贵的食用菌，具有很高的营养价值和药用价值。',30.00,98,'菌菇','[\"/uploads/upload-1771652207680-244808221.jpg\"]','approved',12,3,NULL,NULL,NULL,NULL,'2026-02-05 16:45:59','2026-02-21 12:42:08',1),(35,'sssssssz','aaaaaaaaaaaaaaaaa',0.01,7,'食用菌','[\"/uploads/å±å¹æªå¾ 2025-05-21 194643-1770565747519-947619695.png\"]','pending',0,2,NULL,NULL,NULL,NULL,'2026-02-08 15:49:46','2026-02-08 15:49:46',0),(36,'666666s','ssssssssss',0.01,6,'菌包','[\"/uploads/çæç¹å®çº¢è²çº¿æ¡å¾ç (2) (1)-1770565925736-883086986.png\"]','pending',0,2,NULL,NULL,NULL,NULL,'2026-02-08 15:52:07','2026-02-08 15:52:07',0),(37,'xxxxx','xxxxxxxxxxxxxxxx',0.01,1,'食用菌','[\"/uploads/çæç¹å®çº¢è²çº¿æ¡å¾ç (2)-1770568058066-643298763.png\"]','pending',0,2,NULL,NULL,NULL,NULL,'2026-02-08 16:27:39','2026-02-08 16:27:39',0),(38,'aa','aaaaaaaaaaaaaaa',0.01,1,'菌包','[\"/uploads/çæç¹å®çº¢è²çº¿æ¡å¾ç (1)-1770568100858-360659775.png\"]','pending',0,2,NULL,NULL,NULL,NULL,'2026-02-08 16:28:26','2026-02-08 16:28:26',0),(39,'sssssq','aaaaaaaaaaaaaaaa',0.01,1,'食用菌','[\"/uploads/çæç¹å®çº¢è²çº¿æ¡å¾ç (2) (1)-1770568664779-117737282.png\"]','pending',0,2,NULL,NULL,NULL,NULL,'2026-02-08 16:37:46','2026-02-08 16:37:46',0),(40,'3333333','33333333333',0.01,30,'菌包','[\"/uploads/çæç¹å®çº¢è²çº¿æ¡å¾ç (5)-1770569740120-456583406.png\"]','pending',1,2,NULL,NULL,NULL,NULL,'2026-02-08 16:55:41','2026-02-21 13:24:21',0),(41,'111111111','111111111111111',0.01,1,'食用菌','[\"/uploads/çæç¹å®çº¢è²çº¿æ¡å¾ç (2)-1770570042620-30883244.png\"]','rejected',0,2,NULL,NULL,NULL,'2026-02-21 13:16:51','2026-02-08 17:00:43','2026-02-21 13:16:51',0),(47,'1111111111111111','11111111111111111111',0.01,4,'菌包','[\"/uploads/çæç¹å®çº¢è²çº¿æ¡å¾ç (2) (1)-1770637793664-940963499.png\"]','rejected',0,3,'水水水水水水水水','content','杀杀杀杀杀杀杀杀杀','2026-02-09 13:35:47','2026-02-09 11:49:54','2026-02-09 13:35:47',0),(52,'香菇','香菇是一种常见的食用真菌，具有浓郁的香气和丰富的营养价值。',29.91,100,'菌菇','[\"/uploads/upload-1771667893684-748051072.webp\"]','approved',5,2,NULL,NULL,NULL,NULL,'2026-02-21 08:02:39','2026-02-21 14:13:59',0),(53,'杏鲍菇','杏鲍菇具有杏仁香味和鲍鱼口感，是一种高档食用菌。',29.91,99,'菌菇','[\"/uploads/upload-1771667923500-262170868.webp\"]','approved',2,2,NULL,NULL,NULL,NULL,'2026-02-21 08:02:39','2026-02-22 04:42:26',0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_histories`
--

DROP TABLE IF EXISTS `rating_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_histories` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '历史ID',
  `workId` int NOT NULL COMMENT '作品ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `oldRating` int DEFAULT NULL COMMENT '旧评分',
  `newRating` int NOT NULL COMMENT '新评分',
  `changeReason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '变更原因',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `workId` (`workId`),
  KEY `userId` (`userId`),
  CONSTRAINT `rating_histories_userId_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rating_histories_workId_foreign` FOREIGN KEY (`workId`) REFERENCES `works` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评分历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_histories`
--

LOCK TABLES `rating_histories` WRITE;
/*!40000 ALTER TABLE `rating_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_weights`
--

DROP TABLE IF EXISTS `rating_weights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_weights` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '权重ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `ratingWeight` float NOT NULL DEFAULT '0.5' COMMENT '评分权重',
  `interactionWeight` float NOT NULL DEFAULT '0.3' COMMENT '互动权重',
  `qualityWeight` float NOT NULL DEFAULT '0.2' COMMENT '质量权重',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId` (`userId`),
  CONSTRAINT `rating_weights_userId_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评分权重表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_weights`
--

LOCK TABLES `rating_weights` WRITE;
/*!40000 ALTER TABLE `rating_weights` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_weights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredients`
--

DROP TABLE IF EXISTS `recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipeId` int NOT NULL,
  `mushroomId` int DEFAULT NULL,
  `ingredientName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `recipeId` (`recipeId`),
  CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`recipeId`) REFERENCES `recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredients`
--

LOCK TABLES `recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `recipe_ingredients` DISABLE KEYS */;
INSERT INTO `recipe_ingredients` VALUES (166,69,NULL,'口蘑','200','克','2026-02-21 10:02:23','2026-02-21 10:02:23'),(167,69,NULL,'洋葱','1','个','2026-02-21 10:02:23','2026-02-21 10:02:23'),(168,69,NULL,'黄油','30','克','2026-02-21 10:02:23','2026-02-21 10:02:23'),(169,69,NULL,'面粉','2','勺','2026-02-21 10:02:23','2026-02-21 10:02:23'),(170,69,NULL,'淡奶油','200','毫升','2026-02-21 10:02:23','2026-02-21 10:02:23'),(171,69,NULL,'鸡汤','500','毫升','2026-02-21 10:02:23','2026-02-21 10:02:23'),(172,69,NULL,'盐','1','克','2026-02-21 10:02:23','2026-02-21 10:02:23'),(173,69,NULL,'黑胡椒','1','克','2026-02-21 10:02:23','2026-02-21 10:02:23'),(174,68,NULL,'香菇','10','朵','2026-02-21 10:04:24','2026-02-21 10:04:24'),(175,68,NULL,'鸡胸肉','300','克','2026-02-21 10:04:24','2026-02-21 10:04:24'),(176,68,NULL,'生姜','3','片','2026-02-21 10:04:24','2026-02-21 10:04:24'),(177,68,NULL,'大蒜','3','瓣','2026-02-21 10:04:24','2026-02-21 10:04:24'),(178,68,NULL,'生抽','2','勺','2026-02-21 10:04:24','2026-02-21 10:04:24'),(179,68,NULL,'料酒','1','勺','2026-02-21 10:04:24','2026-02-21 10:04:24'),(180,68,NULL,'淀粉','1','勺','2026-02-21 10:04:24','2026-02-21 10:04:24'),(181,68,NULL,'盐','1','克','2026-02-21 10:04:24','2026-02-21 10:04:24'),(182,70,NULL,'金针菇','150','克','2026-02-21 10:05:03','2026-02-21 10:05:03'),(183,70,NULL,'肥牛片','200','克','2026-02-21 10:05:03','2026-02-21 10:05:03'),(184,70,NULL,'生抽','2','勺','2026-02-21 10:05:03','2026-02-21 10:05:03'),(185,70,NULL,'料酒','1','勺','2026-02-21 10:05:03','2026-02-21 10:05:03'),(186,70,NULL,'白糖','1','勺','2026-02-21 10:05:03','2026-02-21 10:05:03'),(187,70,NULL,'蚝油','1','勺','2026-02-21 10:05:03','2026-02-21 10:05:03'),(188,70,NULL,'白芝麻','1','克','2026-02-21 10:05:03','2026-02-21 10:05:03'),(189,71,NULL,'杏鲍菇','2','个','2026-02-21 10:06:01','2026-02-21 10:06:01'),(190,71,NULL,'牛肉','250','克','2026-02-21 10:06:01','2026-02-21 10:06:01'),(191,71,NULL,'青椒','1','个','2026-02-21 10:06:01','2026-02-21 10:06:01'),(192,71,NULL,'红椒','1','个','2026-02-21 10:06:01','2026-02-21 10:06:01'),(193,71,NULL,'生姜','3','片','2026-02-21 10:06:01','2026-02-21 10:06:01'),(194,71,NULL,'大蒜','3','瓣','2026-02-21 10:06:01','2026-02-21 10:06:01'),(195,71,NULL,'生抽','2','勺','2026-02-21 10:06:01','2026-02-21 10:06:01'),(196,71,NULL,'淀粉','1','勺','2026-02-21 10:06:01','2026-02-21 10:06:01'),(197,71,NULL,'料酒','1','勺','2026-02-21 10:06:01','2026-02-21 10:06:01'),(198,72,NULL,'平菇','200','克','2026-02-21 10:07:46','2026-02-21 10:07:46'),(199,72,NULL,'青菜','300','克','2026-02-21 10:07:46','2026-02-21 10:07:46'),(200,72,NULL,'大蒜','3','瓣','2026-02-21 10:07:46','2026-02-21 10:07:46'),(201,72,NULL,'盐','1','克','2026-02-21 10:07:46','2026-02-21 10:07:46'),(202,72,NULL,'生抽','1','勺','2026-02-21 10:07:46','2026-02-21 10:07:46'),(203,73,NULL,'松茸','4','个','2026-02-21 10:08:29','2026-02-21 10:08:29'),(204,73,NULL,'黄油','20','克','2026-02-21 10:08:29','2026-02-21 10:08:29'),(205,73,NULL,'盐','1','克','2026-02-21 10:08:29','2026-02-21 10:08:29'),(206,73,NULL,'黑胡椒','1','克','2026-02-21 10:08:29','2026-02-21 10:08:29'),(207,73,NULL,'柠檬','1','瓣','2026-02-21 10:08:29','2026-02-21 10:08:29'),(215,74,NULL,'茶树菇','100','克','2026-02-21 10:15:32','2026-02-21 10:15:32'),(216,74,NULL,'老鸭','1','只','2026-02-21 10:15:32','2026-02-21 10:15:32'),(217,74,NULL,'生姜','5','片','2026-02-21 10:15:32','2026-02-21 10:15:32'),(218,74,NULL,'大葱','2','段','2026-02-21 10:15:32','2026-02-21 10:15:32'),(219,74,NULL,'料酒','3','勺','2026-02-21 10:15:32','2026-02-21 10:15:32'),(220,74,NULL,'盐','1','克','2026-02-21 10:15:32','2026-02-21 10:15:32'),(221,74,NULL,'枸杞','20','粒','2026-02-21 10:15:32','2026-02-21 10:15:32'),(230,75,NULL,'木耳','50','克','2026-02-21 10:16:30','2026-02-21 10:16:30'),(231,75,NULL,'黄瓜','2','根','2026-02-21 10:16:30','2026-02-21 10:16:30'),(232,75,NULL,'大蒜','4','瓣','2026-02-21 10:16:30','2026-02-21 10:16:30'),(233,75,NULL,'小米辣','3','个','2026-02-21 10:16:30','2026-02-21 10:16:30'),(234,75,NULL,'生抽','2','勺','2026-02-21 10:16:30','2026-02-21 10:16:30'),(235,75,NULL,'醋','2','勺','2026-02-21 10:16:30','2026-02-21 10:16:30'),(236,75,NULL,'香油','1','勺','2026-02-21 10:16:30','2026-02-21 10:16:30'),(237,75,NULL,'白糖','1','勺','2026-02-21 10:16:30','2026-02-21 10:16:30');
/*!40000 ALTER TABLE `recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_mushrooms`
--

DROP TABLE IF EXISTS `recipe_mushrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_mushrooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipeId` int NOT NULL COMMENT '食谱ID',
  `mushroomTypeId` int NOT NULL COMMENT '菌菇类型ID',
  `quantity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所需菌菇数量：如100g、2朵等',
  `isMainIngredient` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为主食材',
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipe_mushrooms_recipe_id_mushroom_type_id` (`recipeId`,`mushroomTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='食谱-菌菇关联表（记录食谱所需的菌菇类型和数量）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_mushrooms`
--

LOCK TABLES `recipe_mushrooms` WRITE;
/*!40000 ALTER TABLE `recipe_mushrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipe_mushrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_steps`
--

DROP TABLE IF EXISTS `recipe_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_steps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipeId` int NOT NULL,
  `stepNumber` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `videoUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `recipeId` (`recipeId`),
  CONSTRAINT `recipe_steps_ibfk_1` FOREIGN KEY (`recipeId`) REFERENCES `recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_steps`
--

LOCK TABLES `recipe_steps` WRITE;
/*!40000 ALTER TABLE `recipe_steps` DISABLE KEYS */;
INSERT INTO `recipe_steps` VALUES (203,69,1,'口蘑洗净切片，洋葱切碎备用',NULL,NULL,'2026-02-21 10:02:23','2026-02-21 10:02:23'),(204,69,2,'锅中小火融化黄油，放入洋葱碎炒至透明',NULL,NULL,'2026-02-21 10:02:23','2026-02-21 10:02:23'),(205,69,3,'加入口蘑片，中火翻炒至口蘑出水变软',NULL,NULL,'2026-02-21 10:02:23','2026-02-21 10:02:23'),(206,69,4,'筛入面粉，快速翻炒均匀，炒出香味',NULL,NULL,'2026-02-21 10:02:23','2026-02-21 10:02:23'),(207,69,5,'慢慢倒入鸡汤，边倒边搅拌，避免结块',NULL,NULL,'2026-02-21 10:02:23','2026-02-21 10:02:23'),(208,69,6,'大火煮沸后转小火，煮10分钟让汤浓稠',NULL,NULL,'2026-02-21 10:02:23','2026-02-21 10:02:23'),(209,69,7,'倒入淡奶油，搅拌均匀，加盐和黑胡椒调味',NULL,NULL,'2026-02-21 10:02:23','2026-02-21 10:02:23'),(210,69,8,'关火，汤可以用搅拌机打至更顺滑（可选），即可享用',NULL,NULL,'2026-02-21 10:02:23','2026-02-21 10:02:23'),(211,68,1,'鸡胸肉洗净切成薄片，加入1勺生抽、1勺料酒、1勺淀粉抓匀，腌制15分钟',NULL,NULL,'2026-02-21 10:04:24','2026-02-21 10:04:24'),(212,68,2,'香菇去蒂洗净，切成薄片备用；生姜切丝，大蒜切末',NULL,NULL,'2026-02-21 10:04:24','2026-02-21 10:04:24'),(213,68,3,'热锅倒入适量油，放入姜丝和蒜末爆香',NULL,NULL,'2026-02-21 10:04:24','2026-02-21 10:04:24'),(214,68,4,'放入腌制好的鸡肉片，快速翻炒至变色',NULL,NULL,'2026-02-21 10:04:24','2026-02-21 10:04:24'),(215,68,5,'加入香菇片继续翻炒2-3分钟，让香菇出香味',NULL,NULL,'2026-02-21 10:04:24','2026-02-21 10:04:24'),(216,68,6,'加入剩余的1勺生抽和适量盐调味，翻炒均匀',NULL,NULL,'2026-02-21 10:04:24','2026-02-21 10:04:24'),(217,68,7,'转小火收汁1分钟，即可出锅装盘',NULL,NULL,'2026-02-21 10:04:24','2026-02-21 10:04:24'),(218,70,1,'金针菇去蒂洗净，分成小撮备用',NULL,NULL,'2026-02-21 10:05:03','2026-02-21 10:05:03'),(219,70,2,'取一片肥牛，放上一小撮金针菇，从一头卷起',NULL,NULL,'2026-02-21 10:05:03','2026-02-21 10:05:03'),(220,70,3,'依次卷好所有的肥牛卷',NULL,NULL,'2026-02-21 10:05:03','2026-02-21 10:05:03'),(221,70,4,'调制酱汁：生抽2勺、料酒1勺、白糖1勺、蚝油1勺混合均匀',NULL,NULL,'2026-02-21 10:05:03','2026-02-21 10:05:03'),(222,70,5,'平底锅刷少许油，放入肥牛卷，中小火煎至两面金黄',NULL,NULL,'2026-02-21 10:05:03','2026-02-21 10:05:03'),(223,70,6,'倒入调好的酱汁，中小火煮2分钟让肥牛入味',NULL,NULL,'2026-02-21 10:05:03','2026-02-21 10:05:03'),(224,70,7,'大火收汁，撒上白芝麻点缀，即可出锅',NULL,NULL,'2026-02-21 10:05:03','2026-02-21 10:05:03'),(225,71,1,'牛肉洗净切片，加1勺生抽、1勺料酒、1勺淀粉抓匀腌制15分钟',NULL,NULL,'2026-02-21 10:06:01','2026-02-21 10:06:01'),(226,71,2,'杏鲍菇洗净切片，青椒和红椒洗净去籽切小块',NULL,NULL,'2026-02-21 10:06:01','2026-02-21 10:06:01'),(227,71,3,'生姜切丝，大蒜切末备用',NULL,NULL,'2026-02-21 10:06:01','2026-02-21 10:06:01'),(228,71,4,'热锅多倒些油，油温六成热放入牛肉片滑炒至变色盛出',NULL,NULL,'2026-02-21 10:06:01','2026-02-21 10:06:01'),(229,71,5,'锅中留底油，放入姜丝和蒜末爆香',NULL,NULL,'2026-02-21 10:06:01','2026-02-21 10:06:01'),(230,71,6,'放入杏鲍菇片，中火炒至变软出水',NULL,NULL,'2026-02-21 10:06:01','2026-02-21 10:06:01'),(231,71,7,'加入青椒和红椒块，翻炒1分钟',NULL,NULL,'2026-02-21 10:06:01','2026-02-21 10:06:01'),(232,71,8,'倒入滑好的牛肉片，加入剩余1勺生抽调味',NULL,NULL,'2026-02-21 10:06:01','2026-02-21 10:06:01'),(233,71,9,'大火快速翻炒均匀，即可出锅',NULL,NULL,'2026-02-21 10:06:01','2026-02-21 10:06:01'),(234,72,1,'平菇去蒂洗净，撕成小朵，沥干水分备用',NULL,NULL,'2026-02-21 10:07:46','2026-02-21 10:07:46'),(235,72,2,'青菜洗净，切成段备用；大蒜切末',NULL,NULL,'2026-02-21 10:07:46','2026-02-21 10:07:46'),(236,72,3,'热锅倒入油，放入蒜末爆香',NULL,NULL,'2026-02-21 10:07:46','2026-02-21 10:07:46'),(237,72,4,'放入平菇，大火翻炒2-3分钟至出水变软',NULL,NULL,'2026-02-21 10:07:46','2026-02-21 10:07:46'),(238,72,5,'加入青菜段，继续大火翻炒1-2分钟至青菜断生',NULL,NULL,'2026-02-21 10:07:46','2026-02-21 10:07:46'),(239,72,6,'加入适量盐和1勺生抽调味',NULL,NULL,'2026-02-21 10:07:46','2026-02-21 10:07:46'),(240,72,7,'翻炒均匀后立即出锅，保持青菜脆嫩',NULL,NULL,'2026-02-21 10:07:46','2026-02-21 10:07:46'),(241,73,1,'松茸用干净的布轻轻擦去表面泥土（不要用水洗）',NULL,NULL,'2026-02-21 10:08:29','2026-02-21 10:08:29'),(242,73,2,'松茸切成3-5毫米厚的片',NULL,NULL,'2026-02-21 10:08:29','2026-02-21 10:08:29'),(243,73,3,'烤盘铺上锡纸，刷上一层融化的黄油',NULL,NULL,'2026-02-21 10:08:29','2026-02-21 10:08:29'),(244,73,4,'将松茸片均匀摆放在烤盘上',NULL,NULL,'2026-02-21 10:08:29','2026-02-21 10:08:29'),(245,73,5,'在松茸片上再刷上一层黄油，撒少许盐和黑胡椒',NULL,NULL,'2026-02-21 10:08:29','2026-02-21 10:08:29'),(246,73,6,'烤箱预热200℃，放入松茸烤8-10分钟',NULL,NULL,'2026-02-21 10:08:29','2026-02-21 10:08:29'),(247,73,7,'取出后挤上几滴柠檬汁，趁热享用',NULL,NULL,'2026-02-21 10:08:29','2026-02-21 10:08:29'),(257,74,1,'茶树菇提前用温水泡发30分钟，去蒂洗净',NULL,NULL,'2026-02-21 10:15:32','2026-02-21 10:15:32'),(258,74,2,'老鸭处理干净，剁成大块，冷水下锅焯水去血沫',NULL,NULL,'2026-02-21 10:15:32','2026-02-21 10:15:32'),(259,74,3,'焯水后捞出鸭子，用温水冲洗干净',NULL,NULL,'2026-02-21 10:15:32','2026-02-21 10:15:32'),(260,74,4,'砂锅加入足够的清水，放入鸭块、姜片、葱段',NULL,NULL,'2026-02-21 10:15:32','2026-02-21 10:15:32'),(261,74,5,'加入3勺料酒，大火煮沸后撇去浮沫',NULL,NULL,'2026-02-21 10:15:32','2026-02-21 10:15:32'),(262,74,6,'转小火，盖上盖子慢炖1.5小时',NULL,NULL,'2026-02-21 10:15:32','2026-02-21 10:15:32'),(263,74,7,'加入泡好的茶树菇，继续小火炖30分钟',NULL,NULL,'2026-02-21 10:15:32','2026-02-21 10:15:32'),(264,74,8,'最后10分钟加入枸杞，加盐调味',NULL,NULL,'2026-02-21 10:15:32','2026-02-21 10:15:32'),(265,74,9,'关火，盛出享用鲜美的老鸭汤',NULL,NULL,'2026-02-21 10:15:32','2026-02-21 10:15:32'),(275,75,1,'木耳提前用冷水泡发1-2小时，泡发后去蒂洗净',NULL,NULL,'2026-02-21 10:16:30','2026-02-21 10:16:30'),(276,75,2,'锅中烧开水，放入木耳焯水2-3分钟，捞出过凉水',NULL,NULL,'2026-02-21 10:16:30','2026-02-21 10:16:30'),(277,75,3,'黄瓜洗净，用刀背轻轻拍裂，切成滚刀块',NULL,NULL,'2026-02-21 10:16:30','2026-02-21 10:16:30'),(278,75,4,'大蒜切末，小米辣切圈备用',NULL,NULL,'2026-02-21 10:16:30','2026-02-21 10:16:30'),(279,75,5,'木耳沥干水分，和黄瓜块一起放入大碗中',NULL,NULL,'2026-02-21 10:16:30','2026-02-21 10:16:30'),(280,75,6,'加入蒜末、小米辣圈',NULL,NULL,'2026-02-21 10:16:30','2026-02-21 10:16:30'),(281,75,7,'加入2勺生抽、2勺醋、1勺香油、1勺白糖',NULL,NULL,'2026-02-21 10:16:30','2026-02-21 10:16:30'),(282,75,8,'充分拌匀，腌制10分钟让其入味',NULL,NULL,'2026-02-21 10:16:30','2026-02-21 10:16:30'),(283,75,9,'装盘即可享用爽脆的凉拌菜',NULL,NULL,'2026-02-21 10:16:30','2026-02-21 10:16:30');
/*!40000 ALTER TABLE `recipe_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_videos`
--

DROP TABLE IF EXISTS `recipe_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipeId` int NOT NULL COMMENT '关联食谱ID',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '视频标题',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '视频描述',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '视频链接',
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频缩略图',
  `duration` int NOT NULL COMMENT '视频时长（秒）',
  `videoType` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'recipe' COMMENT '视频类型：recipe-完整食谱 | step-分步指导',
  `stepIndex` int DEFAULT NULL COMMENT '如果是分步视频，标识步骤索引',
  `viewCount` int NOT NULL DEFAULT '0' COMMENT '观看次数',
  `isActive` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否为当前活动视频',
  `pushStatus` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '推送状态：pending-待推送 | pushed-已推送 | failed-推送失败',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipeId` (`recipeId`),
  CONSTRAINT `recipe_videos_ibfk_1` FOREIGN KEY (`recipeId`) REFERENCES `recipes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='烹饪视频表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_videos`
--

LOCK TABLES `recipe_videos` WRITE;
/*!40000 ALTER TABLE `recipe_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipe_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '食谱描述',
  `videoUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '烹饪视频URL',
  `cookTime` int NOT NULL COMMENT '烹饪时间（分钟）',
  `difficulty` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '烹饪难度（beginner/intermediate/advanced）',
  `servings` int NOT NULL COMMENT '份量',
  `rating` float NOT NULL DEFAULT '0' COMMENT '评分',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '食谱名称',
  `prepTime` int NOT NULL COMMENT '准备时间（分钟）',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '食谱图片',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active' COMMENT '状态（active/inactive）',
  `nutritionalAnalysis` json DEFAULT NULL COMMENT '营养成分分析',
  `suitableFor` json DEFAULT NULL COMMENT '适用人群',
  `flavorProfile` json DEFAULT NULL COMMENT '口味特点',
  `cuisineType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜系类型',
  `mealType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '餐点类型',
  `mushroomCount` int NOT NULL DEFAULT '0' COMMENT '蘑菇数量',
  `popularity` float NOT NULL DEFAULT '0' COMMENT '流行度',
  `reviewCount` int NOT NULL DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='食谱表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (68,'经典粤菜，香菇的鲜香与鸡肉的嫩滑完美结合，是一道老少皆宜的家常菜。',NULL,0,'beginner',2,4.5,'2026-02-16 03:59:57','2026-02-21 10:04:24','香菇滑鸡',0,'/uploads/upload-1771668261110-873209853.jpg','active','{\"fat\": 0, \"carbs\": 0, \"fiber\": 0, \"sodium\": 0, \"protein\": 0, \"calories\": 0}',NULL,'\"savory\"','中式','晚餐',1,45,120),(69,'浓郁丝滑的西式经典汤品，蘑菇的鲜香与奶油的醇厚完美融合。',NULL,0,'intermediate',2,4.8,'2026-02-16 03:59:57','2026-02-21 10:02:14','奶油蘑菇汤',0,'/uploads/upload-1771668127078-292830760.jpg','active','{\"fat\": 0, \"carbs\": 0, \"fiber\": 0, \"sodium\": 0, \"protein\": 0, \"calories\": 0}',NULL,'\"savory\"','西式','午餐',1,52,180),(70,'日式料理经典，肥牛的鲜嫩与金针菇的脆爽完美搭配，一口一个超满足！',NULL,0,'beginner',2,4.7,'2026-02-16 03:59:57','2026-02-21 10:05:03','金针菇肥牛卷',0,'/uploads/upload-1771668299541-520506628.jpg','active','{\"fat\": 0, \"carbs\": 0, \"fiber\": 0, \"sodium\": 0, \"protein\": 0, \"calories\": 0}',NULL,'\"sweet\"','日式','晚餐',1,68,250),(71,'杏鲍菇的嚼劲与牛肉的嫩滑相得益彰，是一道营养丰富的下饭菜。',NULL,0,'intermediate',2,4.6,'2026-02-16 03:59:57','2026-02-21 10:06:01','杏鲍菇炒牛肉',0,'/uploads/upload-1771668350685-272412315.jpg','active','{\"fat\": 0, \"carbs\": 0, \"fiber\": 0, \"sodium\": 0, \"protein\": 0, \"calories\": 0}',NULL,'\"savory\"','中式','晚餐',1,48,150),(72,'清淡健康的家常菜，平菇的鲜香让简单的青菜也变得美味可口。',NULL,0,'beginner',2,4.3,'2026-02-16 03:59:57','2026-02-21 10:07:46','平菇炒青菜',0,'/uploads/upload-1771668456438-448192198.jpg','active','{\"fat\": 0, \"carbs\": 0, \"fiber\": 0, \"sodium\": 0, \"protein\": 0, \"calories\": 0}',NULL,'\"savory\"','中式','午餐',1,35,90),(73,'高端料理的代表，只需简单的调味就能激发出松茸最原始的鲜美。',NULL,0,'beginner',2,5,'2026-02-16 03:59:57','2026-02-21 10:08:29','烤松茸',0,'/uploads/upload-1771668503985-803763858.jpg','active','{\"fat\": 0, \"carbs\": 0, \"fiber\": 0, \"sodium\": 0, \"protein\": 0, \"calories\": 0}',NULL,'\"sweet\"','日式','晚餐',1,75,320),(74,'滋补养生的经典汤品，茶树菇的独特香气与鸭肉的鲜美完美融合。',NULL,0,'advanced',2,4.9,'2026-02-16 03:59:57','2026-02-21 10:15:32','茶树菇老鸭汤',0,'/uploads/upload-1771668930557-524232492.jpg','active','{\"fat\": 0, \"carbs\": 0, \"fiber\": 0, \"sodium\": 0, \"protein\": 0, \"calories\": 0}',NULL,'\"savory\"','中式','晚餐',1,58,200),(75,'清爽开胃的夏日凉菜，木耳的脆爽与黄瓜的清香，简单却美味。',NULL,0,'beginner',2,4.4,'2026-02-16 03:59:57','2026-02-21 10:16:30','木耳凉拌黄瓜',0,'/uploads/upload-1771668986313-343550356.jpg','active','{\"fat\": 0, \"carbs\": 0, \"fiber\": 0, \"sodium\": 0, \"protein\": 0, \"calories\": 0}',NULL,'\"savory\"','中式','点心',1,42,110);
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommended_recipes`
--

DROP TABLE IF EXISTS `recommended_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommended_recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL COMMENT '用户ID',
  `recipeId` int NOT NULL COMMENT '食谱ID',
  `recommendedAt` datetime NOT NULL COMMENT '推荐时间',
  `reason` json DEFAULT NULL COMMENT '推荐原因：如基于口味偏好、拥有的菌菇等',
  `hasViewed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户是否已查看',
  `viewedAt` datetime DEFAULT NULL COMMENT '用户查看时间',
  `hasMade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户是否已尝试制作',
  `madeAt` datetime DEFAULT NULL COMMENT '用户制作时间',
  `rating` int DEFAULT NULL COMMENT '用户对推荐的评分：1-5分',
  `usedMushrooms` json DEFAULT NULL COMMENT '用户使用的菌菇列表：基于哪些菌菇推荐的',
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='推荐记录（存储系统推荐历史）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommended_recipes`
--

LOCK TABLES `recommended_recipes` WRITE;
/*!40000 ALTER TABLE `recommended_recipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommended_recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_config_logs`
--

DROP TABLE IF EXISTS `score_config_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_config_logs` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `configId` int NOT NULL COMMENT '配置ID',
  `operatorId` int NOT NULL COMMENT '操作者ID',
  `changeReason` text COLLATE utf8mb4_unicode_ci COMMENT '变更原因',
  `oldConfig` json DEFAULT NULL COMMENT '旧配置',
  `newConfig` json DEFAULT NULL COMMENT '新配置',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `configId` (`configId`),
  KEY `operatorId` (`operatorId`),
  CONSTRAINT `score_config_logs_configId_foreign` FOREIGN KEY (`configId`) REFERENCES `score_configs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `score_config_logs_operatorId_foreign` FOREIGN KEY (`operatorId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评分配置变更日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_config_logs`
--

LOCK TABLES `score_config_logs` WRITE;
/*!40000 ALTER TABLE `score_config_logs` DISABLE KEYS */;
INSERT INTO `score_config_logs` VALUES (5,1,2,'??????','{\"ratingWeight\": 0.3, \"qualityWeight\": 0.2, \"recencyWeight\": 0.1, \"creativityWeight\": 0.15, \"interactionWeight\": 0.25}','{\"ratingWeight\": 0.3, \"qualityWeight\": 0.2, \"recencyWeight\": 0.1, \"creativityWeight\": 0.15, \"interactionWeight\": 0.25}','2026-02-07 11:23:59','2026-02-07 11:23:59'),(6,1,2,'','{\"ratingWeight\": 0.3, \"qualityWeight\": 0.2, \"recencyWeight\": 0.1, \"creativityWeight\": 0.15, \"interactionWeight\": 0.25}','{\"ratingWeight\": 0.3, \"qualityWeight\": 0.2, \"recencyWeight\": 0.1, \"creativityWeight\": 0.15, \"interactionWeight\": 0.25}','2026-02-07 11:25:02','2026-02-07 11:25:02'),(7,1,2,'','{\"ratingWeight\": 0.3, \"qualityWeight\": 0.2, \"recencyWeight\": 0.1, \"creativityWeight\": 0.15, \"interactionWeight\": 0.25}','{\"ratingWeight\": 0.3, \"qualityWeight\": 0.2, \"recencyWeight\": 0.1, \"creativityWeight\": 0.15, \"interactionWeight\": 0.25}','2026-02-19 11:00:02','2026-02-19 11:00:02');
/*!40000 ALTER TABLE `score_config_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_configs`
--

DROP TABLE IF EXISTS `score_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_configs` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `ratingWeight` float NOT NULL DEFAULT '0.3' COMMENT '评分权重',
  `interactionWeight` float NOT NULL DEFAULT '0.25' COMMENT '互动权重',
  `qualityWeight` float NOT NULL DEFAULT '0.2' COMMENT '质量权重',
  `creativityWeight` float NOT NULL DEFAULT '0.15' COMMENT '创新权重',
  `recencyWeight` float NOT NULL DEFAULT '0.1' COMMENT '时效权重',
  `isActive` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否激活',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评分配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_configs`
--

LOCK TABLES `score_configs` WRITE;
/*!40000 ALTER TABLE `score_configs` DISABLE KEYS */;
INSERT INTO `score_configs` VALUES (1,0.3,0.25,0.2,0.15,0.1,1,'2026-02-07 01:47:40','2026-02-07 01:47:40');
/*!40000 ALTER TABLE `score_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_box_contents`
--

DROP TABLE IF EXISTS `subscription_box_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_box_contents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subscriptionBoxId` int NOT NULL COMMENT '盲盒套餐ID',
  `mushroomId` int NOT NULL COMMENT '菌菇品种ID',
  `quantity` int NOT NULL DEFAULT '1' COMMENT '菌菇数量',
  `isMain` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为主打品种',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptionBoxId` (`subscriptionBoxId`),
  KEY `mushroomId` (`mushroomId`),
  CONSTRAINT `subscription_box_contents_ibfk_1` FOREIGN KEY (`subscriptionBoxId`) REFERENCES `subscription_boxes` (`id`),
  CONSTRAINT `subscription_box_contents_ibfk_2` FOREIGN KEY (`mushroomId`) REFERENCES `mushroom_varieties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='盲盒内容关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_box_contents`
--

LOCK TABLES `subscription_box_contents` WRITE;
/*!40000 ALTER TABLE `subscription_box_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_box_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_boxes`
--

DROP TABLE IF EXISTS `subscription_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_boxes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '盲盒套餐名称',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '盲盒套餐描述',
  `price` decimal(10,2) NOT NULL COMMENT '盲盒套餐价格',
  `duration` int NOT NULL COMMENT '套餐周期（周）',
  `mushroomCount` int NOT NULL DEFAULT '3' COMMENT '每个盲盒包含的菌菇品种数量',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '盲盒套餐图片',
  `isActive` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否为当前活动套餐',
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '盲盒分类：如新手入门、进阶尝鲜、高端品鉴',
  `features` json DEFAULT NULL COMMENT '套餐特色',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='盲盒套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_boxes`
--

LOCK TABLES `subscription_boxes` WRITE;
/*!40000 ALTER TABLE `subscription_boxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_items`
--

DROP TABLE IF EXISTS `subscription_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subscriptionId` int NOT NULL COMMENT '订阅ID',
  `deliveryDate` datetime NOT NULL COMMENT '配送日期',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '配送状态：pending-待配送 | delivered-已配送 | failed-配送失败 | canceled-已取消',
  `mushrooms` json NOT NULL COMMENT '本次配送的菌菇列表：包含菌菇类型ID、数量、重量等信息',
  `actualDeliveryDate` datetime DEFAULT NULL COMMENT '实际配送日期',
  `orderId` int DEFAULT NULL COMMENT '关联订单ID',
  `notes` text COLLATE utf8mb4_unicode_ci COMMENT '配送备注',
  `trackingNumber` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流追踪号',
  `rating` int DEFAULT NULL COMMENT '用户评分：1-5分',
  `feedback` text COLLATE utf8mb4_unicode_ci COMMENT '用户反馈',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订阅项表（每次配送的具体内容）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_items`
--

LOCK TABLES `subscription_items` WRITE;
/*!40000 ALTER TABLE `subscription_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptionboxcontents`
--

DROP TABLE IF EXISTS `subscriptionboxcontents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptionboxcontents` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `mushroomId` int NOT NULL,
  `subscriptionBoxId` int NOT NULL,
  PRIMARY KEY (`mushroomId`,`subscriptionBoxId`),
  KEY `subscriptionBoxId` (`subscriptionBoxId`),
  CONSTRAINT `subscriptionboxcontents_ibfk_1` FOREIGN KEY (`mushroomId`) REFERENCES `mushroom_varieties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriptionboxcontents_ibfk_2` FOREIGN KEY (`subscriptionBoxId`) REFERENCES `subscription_boxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菌菇品种表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptionboxcontents`
--

LOCK TABLES `subscriptionboxcontents` WRITE;
/*!40000 ALTER TABLE `subscriptionboxcontents` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptionboxcontents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL COMMENT '用户ID',
  `planType` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订阅计划类型：monthly-月度 | quarterly-季度 | yearly-年度',
  `deliveryCycle` int NOT NULL COMMENT '配送周期（天）',
  `startDate` datetime NOT NULL COMMENT '订阅开始日期',
  `endDate` datetime DEFAULT NULL COMMENT '订阅结束日期',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active' COMMENT '订阅状态：active-活跃 | paused-暂停 | canceled-已取消 | expired-已过期',
  `totalPrice` decimal(10,2) NOT NULL COMMENT '订阅总价格',
  `deliveryAddress` json NOT NULL COMMENT '配送地址',
  `mushroomCount` int NOT NULL DEFAULT '3' COMMENT '每次配送的菌菇种类数量',
  `preferences` json DEFAULT NULL COMMENT '订阅偏好：如喜欢的菌菇类型、配送时间等',
  `lastDeliveryDate` datetime DEFAULT NULL COMMENT '上次配送日期',
  `nextDeliveryDate` datetime DEFAULT NULL COMMENT '下次配送日期',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订阅表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_box_orders`
--

DROP TABLE IF EXISTS `user_box_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_box_orders` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `boxId` int NOT NULL COMMENT '盲盒ID',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '订单状态（pending/paid/shipped/completed）',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货地址',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `receiver` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货人',
  `paymentMethod` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付方式',
  `paymentTime` datetime DEFAULT NULL COMMENT '支付时间',
  `deliveryDate` datetime DEFAULT NULL COMMENT '发货日期',
  `deliveryMethod` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配送方式',
  `trackingNumber` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流单号',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `boxId` (`boxId`),
  CONSTRAINT `user_box_orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_box_orders_ibfk_2` FOREIGN KEY (`boxId`) REFERENCES `mushroom_boxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_box_orders`
--

LOCK TABLES `user_box_orders` WRITE;
/*!40000 ALTER TABLE `user_box_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_box_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_taste_histories`
--

DROP TABLE IF EXISTS `user_taste_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_taste_histories` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '历史ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `workId` int NOT NULL COMMENT '作品ID',
  `mushroomType` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菌菇类型',
  `rating` int NOT NULL COMMENT '评分',
  `interactionType` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '互动类型',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `workId` (`workId`),
  KEY `mushroomType` (`mushroomType`),
  CONSTRAINT `user_taste_histories_userId_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_taste_histories_workId_foreign` FOREIGN KEY (`workId`) REFERENCES `works` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户品尝历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_taste_histories`
--

LOCK TABLES `user_taste_histories` WRITE;
/*!40000 ALTER TABLE `user_taste_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_taste_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '加密密码',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user-普通用户 | seller-卖家 | admin-管理员',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账号状态：true-正常，false-禁用',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `lastLoginAt` datetime DEFAULT NULL COMMENT '最后登录时间',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`),
  UNIQUE KEY `username_3` (`username`),
  UNIQUE KEY `username_4` (`username`),
  UNIQUE KEY `username_5` (`username`),
  UNIQUE KEY `username_6` (`username`),
  UNIQUE KEY `username_7` (`username`),
  UNIQUE KEY `username_8` (`username`),
  UNIQUE KEY `username_9` (`username`),
  UNIQUE KEY `username_10` (`username`),
  UNIQUE KEY `username_11` (`username`),
  UNIQUE KEY `username_12` (`username`),
  UNIQUE KEY `username_13` (`username`),
  UNIQUE KEY `username_14` (`username`),
  UNIQUE KEY `username_15` (`username`),
  UNIQUE KEY `username_16` (`username`),
  UNIQUE KEY `username_17` (`username`),
  UNIQUE KEY `username_18` (`username`),
  UNIQUE KEY `username_19` (`username`),
  UNIQUE KEY `username_20` (`username`),
  UNIQUE KEY `username_21` (`username`),
  UNIQUE KEY `username_22` (`username`),
  UNIQUE KEY `username_23` (`username`),
  UNIQUE KEY `username_24` (`username`),
  UNIQUE KEY `username_25` (`username`),
  UNIQUE KEY `username_26` (`username`),
  UNIQUE KEY `username_27` (`username`),
  UNIQUE KEY `username_28` (`username`),
  UNIQUE KEY `username_29` (`username`),
  UNIQUE KEY `username_30` (`username`),
  UNIQUE KEY `username_31` (`username`),
  UNIQUE KEY `username_32` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`),
  UNIQUE KEY `email_3` (`email`),
  UNIQUE KEY `email_4` (`email`),
  UNIQUE KEY `email_5` (`email`),
  UNIQUE KEY `email_6` (`email`),
  UNIQUE KEY `email_7` (`email`),
  UNIQUE KEY `email_8` (`email`),
  UNIQUE KEY `email_9` (`email`),
  UNIQUE KEY `email_10` (`email`),
  UNIQUE KEY `email_11` (`email`),
  UNIQUE KEY `email_12` (`email`),
  UNIQUE KEY `email_13` (`email`),
  UNIQUE KEY `email_14` (`email`),
  UNIQUE KEY `email_15` (`email`),
  UNIQUE KEY `email_16` (`email`),
  UNIQUE KEY `email_17` (`email`),
  UNIQUE KEY `email_18` (`email`),
  UNIQUE KEY `email_19` (`email`),
  UNIQUE KEY `email_20` (`email`),
  UNIQUE KEY `email_21` (`email`),
  UNIQUE KEY `email_22` (`email`),
  UNIQUE KEY `email_23` (`email`),
  UNIQUE KEY `email_24` (`email`),
  UNIQUE KEY `email_25` (`email`),
  UNIQUE KEY `email_26` (`email`),
  UNIQUE KEY `email_27` (`email`),
  UNIQUE KEY `email_28` (`email`),
  UNIQUE KEY `email_29` (`email`),
  UNIQUE KEY `email_30` (`email`),
  UNIQUE KEY `email_31` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'admin','$2a$10$6eiBnD0G9PqeZH5rWTTK5ur.MB9TCql0qVm5ZhY6/ED487Dxu1YjS','3130826545@qq.com','13305446541','admin',1,NULL,'2026-03-29 08:57:02','2026-01-21 13:08:03','2026-03-29 08:57:02'),(3,'小狗狗','$2a$10$nNZdi3lnTAdigM/H/vOK2uuqXPvmLu0qXHjzxz9DCsaGkju8u8nJG','3130826555@qq.com','13354546666','seller',1,NULL,'2026-02-21 12:53:14','2026-01-21 17:49:29','2026-02-21 12:53:14'),(4,'普通人','$2a$10$RtlZeKqCtviSwdl5neKBlOwpOPFBg1vM.lgYPCZWyVUnZiMLWhnGC','3130825555@qq.com','','user',1,NULL,'2026-03-05 04:52:58','2026-01-21 17:49:58','2026-03-05 04:52:58'),(5,'testuser','$2a$10$wMzJgavX5eeq/vEUbPBzyeLM0VlS1okp1dkHqgafNRcQeIyPU0FQS',NULL,NULL,'user',1,NULL,'2026-02-06 02:58:51','2026-01-22 05:40:41','2026-02-06 02:58:51'),(6,'testuser2','$2a$10$WnWM0CYRbHvfdmeEycZwQ.7COLA5GA7/BWI6okE55wU0Aqkg4N7e6','test2@example.com',NULL,'user',1,NULL,'2026-01-24 13:45:11','2026-01-24 06:01:02','2026-01-24 13:45:11'),(7,'普通人01','$2a$10$SugqQc3St1gFg0Eqf6Hncula9/w9N6V.RmCwZi58Ht1T9fKxrsA3u','3130855555@qq.com','13351327777','user',1,NULL,'2026-01-24 09:57:05','2026-01-24 09:57:01','2026-01-24 09:57:05'),(22,'paymenttest','$2a$10$TqmYAgnnLSTp1JhYEW7GReu82hv9bpAJUeTRtF8/1V5y6j01V3cKq','payment@example.com',NULL,'user',1,NULL,'2026-02-07 10:37:13','2026-02-07 10:36:58','2026-02-07 10:37:13');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_recipes`
--

DROP TABLE IF EXISTS `video_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_recipes` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `videoId` int NOT NULL COMMENT '视频ID',
  `recipeId` int NOT NULL COMMENT '食谱ID',
  `matchingScore` float NOT NULL DEFAULT '0' COMMENT '匹配度评分（0-1之间）',
  `isPrimary` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为主视频',
  `relevance` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联类型（如：完整食谱、单个步骤）',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `video_recipes_video_id_recipe_id` (`videoId`,`recipeId`),
  KEY `recipeId` (`recipeId`),
  CONSTRAINT `video_recipes_ibfk_1` FOREIGN KEY (`videoId`) REFERENCES `videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `video_recipes_ibfk_2` FOREIGN KEY (`recipeId`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_recipes`
--

LOCK TABLES `video_recipes` WRITE;
/*!40000 ALTER TABLE `video_recipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '视频ID',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '视频标题',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '视频描述',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '视频URL',
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频缩略图',
  `duration` int NOT NULL COMMENT '视频时长（秒）',
  `source` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '视频来源（如：B站、YouTube）',
  `copyrightInfo` text COLLATE utf8mb4_unicode_ci COMMENT '版权信息',
  `quality` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '720p' COMMENT '视频质量（如：480p、720p、1080p）',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active' COMMENT '视频状态（active/inactive）',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_ratings`
--

DROP TABLE IF EXISTS `work_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_ratings` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评分ID',
  `workId` int NOT NULL COMMENT '作品ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `rating` int NOT NULL COMMENT '评分(1-5)',
  `comment` text COLLATE utf8mb4_unicode_ci COMMENT '评分评论',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `workId_userId` (`workId`,`userId`),
  KEY `workId` (`workId`),
  KEY `userId` (`userId`),
  CONSTRAINT `work_ratings_userId_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `work_ratings_workId_foreign` FOREIGN KEY (`workId`) REFERENCES `works` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作品评分表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_ratings`
--

LOCK TABLES `work_ratings` WRITE;
/*!40000 ALTER TABLE `work_ratings` DISABLE KEYS */;
INSERT INTO `work_ratings` VALUES (3,7,2,5,'','2026-02-07 10:19:25','2026-02-07 16:35:05',1),(4,5,2,3,'订单','2026-02-07 14:42:52','2026-02-17 04:32:07',1),(5,3,2,5,'非常好吃看着，想吃\n','2026-02-07 15:07:36','2026-02-21 12:09:21',1),(6,8,2,4,NULL,'2026-02-08 07:11:45','2026-02-08 08:50:21',1),(7,1,2,3,NULL,'2026-02-17 03:35:13','2026-02-17 03:35:13',1);
/*!40000 ALTER TABLE `work_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '作品ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作品标题',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作品描述',
  `imageUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作品图片URL',
  `rating` int NOT NULL DEFAULT '5' COMMENT '作品评分(1-5)',
  `mushroomType` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菌菇类型',
  `likes` int NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comments` int NOT NULL DEFAULT '0' COMMENT '评论数',
  `totalScore` float NOT NULL DEFAULT '0' COMMENT '总评分',
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved' COMMENT '作品状态',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `mushroomType` (`mushroomType`),
  KEY `rating` (`rating`),
  KEY `likes` (`likes`),
  KEY `totalScore` (`totalScore`),
  KEY `createdAt` (`createdAt`),
  KEY `status` (`status`),
  CONSTRAINT `works_userId_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
INSERT INTO `works` VALUES (1,2,'香菇炒青菜','这是一道简单易做的家常菜，香菇的鲜美与青菜的清爽完美结合，营养丰富，口感鲜美。香菇富含多种氨基酸和维生素，青菜提供丰富的纤维素，这道菜既美味又健康。','/uploads/upload-1771640709832-124802072.webp',5,'shiitake',15,4,6.88636,'approved','2026-02-07 01:48:20','2026-02-21 12:36:25'),(2,2,'金针菇豆腐汤','金针菇豆腐汤是一道清爽的汤品，金针菇的鲜味与豆腐的嫩滑相得益彰。这道汤制作简单，营养丰富，适合全家老少食用。金针菇含有丰富的蛋白质和多种氨基酸，豆腐则是优质植物蛋白的来源。','/uploads/upload-1771640027143-374709583.jpg',4,'enoki',12,5,6.08301,'approved','2026-02-07 01:48:20','2026-02-21 12:36:26'),(3,2,'杏鲍菇烤串','杏鲍菇烤串是一道美味的素食烧烤，杏鲍菇肉质厚实，口感类似肉类，搭配特制调料烤制，香气四溢。这是一道适合聚会和户外烧烤的菜品，既健康又美味。','/uploads/upload-1771640078976-375587406.jpg',5,'king',21,25,7.38876,'approved','2026-02-07 01:48:20','2026-02-21 12:36:26'),(4,2,'平菇意大利面','平菇意大利面是一道融合中西美食的创新菜品，平菇的鲜美与意大利面的经典口感相结合，搭配奶油白酱，味道浓郁丰富。这道菜既保留了平菇的营养，又展现了西餐的魅力。','/uploads/upload-1771640758308-969788937.png',4,'oyster',18,6,6.67854,'approved','2026-02-07 01:48:20','2026-02-21 12:36:26'),(5,2,'松茸土鸡煲','松茸土鸡煲是一道高端滋补菜品，松茸的浓郁香气与土鸡的鲜美完美融合，汤汁醇厚，营养丰富。松茸是珍贵的食用菌，具有很高的营养价值和独特的风味，搭配土鸡煲制，是一道不可多得的美味佳肴。','/uploads/upload-1771645036324-182311587.jpg',5,'松茸',26,31,7.62705,'approved','2026-02-07 01:48:20','2026-02-21 12:36:26'),(6,2,'混合菌菇披萨','混合菌菇披萨是一道融合多种菌菇美味的创意菜品，将香菇、平菇、杏鲍菇等多种菌菇搭配芝士和特制酱料，铺在酥脆的披萨底上烤制而成。这道菜既有菌菇的鲜美，又有披萨的经典风味。','/uploads/upload-1771645076907-256094994.webp',4,'other',22,7,6.65961,'approved','2026-02-07 01:48:20','2026-02-21 12:36:26'),(7,2,'香菇滑鸡','香菇滑鸡是一道经典的中式菜品，香菇的鲜味与鸡肉的嫩滑相得益彰，口感丰富，营养均衡。这道菜制作简单，适合家庭日常食用，也是宴客的不错选择。','/uploads/upload-1771641411641-132075816.webp',5,'shiitake',30,18,7.70487,'approved','2026-02-07 01:48:20','2026-02-21 12:36:26'),(8,2,'金针菇肥牛卷','金针菇肥牛卷是一道美味的火锅菜品，金针菇的脆嫩与肥牛的鲜嫩相结合，口感丰富，味道鲜美。这道菜既适合火锅涮制，也可以作为独立菜品煎制，是很多人喜爱的美食。','/uploads/upload-1771641397690-711263275.jpg',4,'enoki',28,11,7.07375,'approved','2026-02-07 01:48:20','2026-02-21 12:36:26');
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 18:38:59
