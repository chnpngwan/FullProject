/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : management

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-02-15 17:46:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `age` double NOT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `addr` varchar(50) NOT NULL,
  `memo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('3', 'admin', '4QrcOUm6Wau+VuBX8g+IPg==', '男', '21', null, null, '西安', '默认');

-- ----------------------------
-- Table structure for custom_account
-- ----------------------------
DROP TABLE IF EXISTS `custom_account`;
CREATE TABLE `custom_account` (
  `accountid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `ownerid` varchar(50) NOT NULL,
  `carid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`accountid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_account
-- ----------------------------
INSERT INTO `custom_account` VALUES ('2', 'goodym', '4QrcOUm6Wau+VuBX8g+IPg==', '001', '粤A5984');

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(50) NOT NULL,
  `dep` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `area` varchar(50) NOT NULL,
  `sell` varchar(50) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `floor` varchar(50) NOT NULL,
  `direction` varchar(50) NOT NULL,
  `memo` varchar(100) DEFAULT NULL,
  `ownerid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES ('2', '001', '1栋', '独栋', '广州白云山下面', '待售', '508', '5', '南', '非常好的一个房间', '001');

-- ----------------------------
-- Table structure for inspection
-- ----------------------------
DROP TABLE IF EXISTS `inspection`;
CREATE TABLE `inspection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `itime` date NOT NULL,
  `conductor` varchar(32) NOT NULL,
  `party` varchar(50) NOT NULL,
  `result` varchar(50) NOT NULL,
  `memo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inspection
-- ----------------------------
INSERT INTO `inspection` VALUES ('1', '张三', '扫垃圾', '2019-02-15', '李四', '李四', '地板扫得不够干净', '准备辞退当事人');

-- ----------------------------
-- Table structure for maintain
-- ----------------------------
DROP TABLE IF EXISTS `maintain`;
CREATE TABLE `maintain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thing` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `homesnumber` varchar(50) NOT NULL,
  `sdate` date NOT NULL,
  `rdate` date DEFAULT NULL,
  `tcost` double NOT NULL,
  `scost` double DEFAULT NULL,
  `maintainer` varchar(32) NOT NULL,
  `smemo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maintain
-- ----------------------------
INSERT INTO `maintain` VALUES ('3', '电灯', '等待处理', '503', '2019-02-15', '2019-02-16', '100', '99', '张三', '坏了一个灯泡');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(300) NOT NULL,
  `ndate` date NOT NULL,
  `title` varchar(50) NOT NULL,
  `uper` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('2', '超过明天不交，每天罚款100', '2019-02-15', '没交物业的赶紧交哦', '张三');
