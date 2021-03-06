# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.7.11)
# Database: dl
# Generation Time: 2016-10-09 05:09:05 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table helloworld
# ------------------------------------------------------------

DROP TABLE IF EXISTS `helloworld`;

CREATE TABLE `helloworld` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试练习表';

LOCK TABLES `helloworld` WRITE;
/*!40000 ALTER TABLE `helloworld` DISABLE KEYS */;

INSERT INTO `helloworld` (`id`, `message`)
VALUES
	(3,'更改后的信息'),
	(4,'信息化');

/*!40000 ALTER TABLE `helloworld` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shiro_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shiro_permission`;

CREATE TABLE `shiro_permission` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '权限名称',
  `permission` varchar(32) DEFAULT NULL COMMENT '权限标识',
  `type` varchar(32) DEFAULT NULL COMMENT '权限类型',
  `isActive` varchar(32) DEFAULT NULL COMMENT '是否有效/启用',
  `isDelete` varchar(32) DEFAULT NULL COMMENT '是否逻辑删除',
  `createdBy` varchar(32) DEFAULT NULL COMMENT 'createdBy',
  `updatedBy` varchar(32) DEFAULT NULL COMMENT 'updatedBy',
  `createdTime` datetime DEFAULT NULL COMMENT 'createdTime',
  `updatedTime` datetime DEFAULT NULL COMMENT 'updatedTime',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `e` varchar(32) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

LOCK TABLES `shiro_permission` WRITE;
/*!40000 ALTER TABLE `shiro_permission` DISABLE KEYS */;

INSERT INTO `shiro_permission` (`id`, `name`, `permission`, `type`, `isActive`, `isDelete`, `createdBy`, `updatedBy`, `createdTime`, `updatedTime`, `note`, `e`)
VALUES
	(0,'测试权限','query','默认','1','0','xx','xx','2016-10-09 12:12:12','2016-10-09 18:18:18','note','1');

/*!40000 ALTER TABLE `shiro_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shiro_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shiro_role`;

CREATE TABLE `shiro_role` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `isActive` varchar(32) DEFAULT NULL COMMENT '是否有效/启用',
  `isDelete` varchar(32) DEFAULT NULL COMMENT '是否逻辑删除',
  `createdBy` varchar(32) DEFAULT NULL COMMENT 'createdBy',
  `updatedBy` varchar(32) DEFAULT NULL COMMENT 'updatedBy',
  `createdTime` datetime DEFAULT NULL COMMENT 'createdTime',
  `updatedTime` datetime DEFAULT NULL COMMENT 'updatedTime',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `e` varchar(32) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

LOCK TABLES `shiro_role` WRITE;
/*!40000 ALTER TABLE `shiro_role` DISABLE KEYS */;

INSERT INTO `shiro_role` (`id`, `name`, `isActive`, `isDelete`, `createdBy`, `updatedBy`, `createdTime`, `updatedTime`, `note`, `e`)
VALUES
	(0,'查看消息的权限','1','0','xx','xx','2016-10-10 00:00:00','2016-10-10 00:00:00','xx','1');

/*!40000 ALTER TABLE `shiro_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shiro_role_permission_relation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shiro_role_permission_relation`;

CREATE TABLE `shiro_role_permission_relation` (
  `roleId` bigint(32) NOT NULL COMMENT '角色ID',
  `permissionId` bigint(32) NOT NULL COMMENT '权限ID',
  `isActive` varchar(32) DEFAULT NULL COMMENT '是否有效/启用',
  `isDelete` varchar(32) DEFAULT NULL COMMENT '是否逻辑删除',
  `createdBy` varchar(32) DEFAULT NULL COMMENT 'createdBy',
  `updatedBy` varchar(32) DEFAULT NULL COMMENT 'updatedBy',
  `createdTime` datetime DEFAULT NULL COMMENT 'createdTime',
  `updatedTime` datetime DEFAULT NULL COMMENT 'updatedTime',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`roleId`,`permissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';

LOCK TABLES `shiro_role_permission_relation` WRITE;
/*!40000 ALTER TABLE `shiro_role_permission_relation` DISABLE KEYS */;

INSERT INTO `shiro_role_permission_relation` (`roleId`, `permissionId`, `isActive`, `isDelete`, `createdBy`, `updatedBy`, `createdTime`, `updatedTime`, `note`)
VALUES
	(0,0,'1','0','xx','xx','2016-10-09 12:12:12','2016-10-09 18:18:19','n');

/*!40000 ALTER TABLE `shiro_role_permission_relation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shiro_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shiro_user`;

CREATE TABLE `shiro_user` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) DEFAULT NULL COMMENT '登录账号',
  `pwd` varchar(32) DEFAULT NULL COMMENT '登录密码',
  `nickName` varchar(32) DEFAULT NULL COMMENT '昵称',
  `photo` varchar(32) DEFAULT NULL COMMENT '头像',
  `sign` varchar(32) DEFAULT NULL COMMENT '签名',
  `skin` varchar(32) DEFAULT NULL COMMENT '皮肤',
  `score` int(11) DEFAULT NULL COMMENT '分数',
  `honor` varchar(32) DEFAULT NULL COMMENT '荣誉称号',
  `realName` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `NID` varchar(32) DEFAULT NULL COMMENT '身份证号:National ID number',
  `phone` varchar(32) DEFAULT NULL COMMENT '手机号',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `company` varchar(32) DEFAULT NULL COMMENT '所在的公司',
  `title` varchar(32) DEFAULT NULL COMMENT '职称',
  `position` varchar(32) DEFAULT NULL COMMENT '职位',
  `QQ` varchar(32) DEFAULT NULL COMMENT 'QQ',
  `weChat` varchar(32) DEFAULT NULL COMMENT '微信号',
  `QRCode` varchar(32) DEFAULT NULL COMMENT '微信二维码',
  `microBlog` varchar(32) DEFAULT NULL COMMENT '新浪微博账号',
  `renRen` varchar(32) DEFAULT NULL COMMENT '人人网账号',
  `twitter` varchar(32) DEFAULT NULL COMMENT 'twitter',
  `facebook` varchar(32) DEFAULT NULL COMMENT 'facebook',
  `postcode` varchar(32) DEFAULT NULL COMMENT '邮政编码',
  `nowAddress` varchar(32) DEFAULT NULL COMMENT '现地址',
  `homeland` varchar(32) DEFAULT NULL COMMENT '故乡',
  `isActive` varchar(32) DEFAULT NULL COMMENT '是否有效/启用',
  `isDelete` varchar(32) DEFAULT NULL COMMENT '是否逻辑删除',
  `createdBy` varchar(32) DEFAULT NULL COMMENT 'createdBy',
  `updatedBy` varchar(32) DEFAULT NULL COMMENT 'updatedBy',
  `createdTime` datetime DEFAULT NULL COMMENT 'createdTime',
  `updatedTime` datetime DEFAULT NULL COMMENT 'updatedTime',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `e` varchar(32) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

LOCK TABLES `shiro_user` WRITE;
/*!40000 ALTER TABLE `shiro_user` DISABLE KEYS */;

INSERT INTO `shiro_user` (`id`, `account`, `pwd`, `nickName`, `photo`, `sign`, `skin`, `score`, `honor`, `realName`, `NID`, `phone`, `email`, `company`, `title`, `position`, `QQ`, `weChat`, `QRCode`, `microBlog`, `renRen`, `twitter`, `facebook`, `postcode`, `nowAddress`, `homeland`, `isActive`, `isDelete`, `createdBy`, `updatedBy`, `createdTime`, `updatedTime`, `note`, `e`)
VALUES
	(0,'290315636@qq.com','123456','tikie','xx','xx','xx',1,'xx','xx','1234567890','13621239684','290315636@qq.com','xx','xx','xx','2','w','w','w','w','w','w','w','w','w','1','0','w','w','2016-10-04 00:00:00','2016-10-01 00:00:00','w','w');

/*!40000 ALTER TABLE `shiro_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shiro_user_role_relation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shiro_user_role_relation`;

CREATE TABLE `shiro_user_role_relation` (
  `userId` bigint(32) NOT NULL COMMENT '用户ID',
  `roleId` bigint(32) NOT NULL COMMENT '角色ID',
  `isActive` varchar(32) DEFAULT NULL COMMENT '是否有效/启用',
  `isDelete` varchar(32) DEFAULT NULL COMMENT '是否逻辑删除',
  `createdBy` varchar(32) DEFAULT NULL COMMENT 'createdBy',
  `updatedBy` varchar(32) DEFAULT NULL COMMENT 'updatedBy',
  `createdTime` datetime DEFAULT NULL COMMENT 'createdTime',
  `updatedTime` datetime DEFAULT NULL COMMENT 'updatedTime',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

LOCK TABLES `shiro_user_role_relation` WRITE;
/*!40000 ALTER TABLE `shiro_user_role_relation` DISABLE KEYS */;

INSERT INTO `shiro_user_role_relation` (`userId`, `roleId`, `isActive`, `isDelete`, `createdBy`, `updatedBy`, `createdTime`, `updatedTime`, `note`)
VALUES
	(0,0,'1','0','xx','xx','2016-10-09 12:12:12','2016-10-09 12:12:12',NULL);

/*!40000 ALTER TABLE `shiro_user_role_relation` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
