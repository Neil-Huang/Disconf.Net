-- --------------------------------------------------------
-- 主机:                           172.16.1.25
-- 服务器版本:                        5.6.36-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 z_disconf 的数据库结构
CREATE DATABASE IF NOT EXISTS `z_disconf` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `z_disconf`;


-- 导出  表 z_disconf.apps 结构
CREATE TABLE IF NOT EXISTS `apps` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '应用名称',
  `description` varchar(255) NOT NULL COMMENT '应用说明',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- 正在导出表  z_disconf.apps 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `apps` DISABLE KEYS */;
INSERT INTO `apps` (`id`, `name`, `description`, `ctime`, `mtime`) VALUES
	(14, 'devapp', ' ', '2017-07-12 10:35:50', '2017-07-12 10:35:50');
/*!40000 ALTER TABLE `apps` ENABLE KEYS */;


-- 导出  表 z_disconf.configs 结构
CREATE TABLE IF NOT EXISTS `configs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_id` bigint(20) NOT NULL COMMENT 'Templates.Id',
  `env_id` bigint(20) NOT NULL COMMENT 'Env.Id',
  `value` text NOT NULL COMMENT '特定环境下的节点值',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- 正在导出表  z_disconf.configs 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
INSERT INTO `configs` (`id`, `template_id`, `env_id`, `value`, `ctime`, `mtime`) VALUES
	(21, 20, 10, '<?xml version="1.0" encoding="utf-8" ?>\n<appSettings>\n  <add key="aaa" value="abcd"/>\n  <add key="bbb" value="b"/>\n</appSettings>', '2017-07-12 10:34:19', '2017-07-12 10:51:29');
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;


-- 导出  表 z_disconf.envs 结构
CREATE TABLE IF NOT EXISTS `envs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '环境名称',
  `description` varchar(255) NOT NULL COMMENT '环境说明',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 正在导出表  z_disconf.envs 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `envs` DISABLE KEYS */;
INSERT INTO `envs` (`id`, `name`, `description`, `ctime`, `mtime`) VALUES
	(10, 'DEV', 'DEV', '2017-07-12 09:33:56', '2017-07-12 09:33:56');
/*!40000 ALTER TABLE `envs` ENABLE KEYS */;


-- 导出  表 z_disconf.operation_log 结构
CREATE TABLE IF NOT EXISTS `operation_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增量',
  `uid` bigint(11) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  z_disconf.operation_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `operation_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_log` ENABLE KEYS */;


-- 导出  表 z_disconf.permission 结构
CREATE TABLE IF NOT EXISTS `permission` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增列',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `app_id` bigint(11) NOT NULL DEFAULT '0',
  `parent_id` bigint(11) NOT NULL,
  `permission_type` tinyint(4) NOT NULL COMMENT '权限类型',
  `code` varchar(20) NOT NULL COMMENT '权限代码',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- 正在导出表  z_disconf.permission 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` (`id`, `name`, `app_id`, `parent_id`, `permission_type`, `code`, `ctime`, `mtime`, `is_delete`) VALUES
	(54, 'devapp', 14, 0, 1, '14.0', '2017-07-12 10:32:24', '2017-07-12 10:32:24', b'0'),
	(55, 'DEV', 14, 54, 2, '14.10', '2017-07-12 10:32:25', '2017-07-12 10:32:25', b'0');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;


-- 导出  表 z_disconf.role 结构
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增列',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `permission_ids` varchar(200) NOT NULL COMMENT '权限集合,按,分割',
  `create_id` bigint(11) NOT NULL,
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` bit(1) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 正在导出表  z_disconf.role 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `permission_ids`, `create_id`, `ctime`, `mtime`, `is_delete`) VALUES
	(1, '超级管理员', '0', 0, '2017-07-11 16:27:18', '2017-07-11 16:27:18', b'0');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- 导出  表 z_disconf.templates 结构
CREATE TABLE IF NOT EXISTS `templates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL COMMENT 'Apps.Id',
  `name` varchar(100) NOT NULL COMMENT '节点名称',
  `description` varchar(255) NOT NULL COMMENT '节点说明',
  `default_value` text NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL,
  `is_delete` bit(1) NOT NULL DEFAULT b'0',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- 正在导出表  z_disconf.templates 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` (`id`, `app_id`, `name`, `description`, `default_value`, `type`, `version`, `is_delete`, `ctime`, `mtime`) VALUES
	(20, 14, 'appSettings.config', ' ', '<?xml version="1.0" encoding="utf-8" ?>\n<appSettings>\n  <add key="aaa" value="a"/>\n  <add key="bbb" value="b"/>\n</appSettings>', 1, '1.0', b'0', '2017-07-12 10:33:24', '2017-07-12 10:33:24');
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;


-- 导出  表 z_disconf.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增列',
  `name` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL COMMENT '手机号码',
  `password` varchar(100) NOT NULL COMMENT '用户密码',
  `role_id` bigint(11) NOT NULL DEFAULT '0',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `is_system` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否系统用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在导出表  z_disconf.user 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `username`, `password`, `role_id`, `ctime`, `mtime`, `is_delete`, `is_system`) VALUES
	(6, '超级管理员', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, '2017-07-11 16:27:18', '2017-07-11 16:27:18', b'0', b'1');

-- 密码：admin

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
