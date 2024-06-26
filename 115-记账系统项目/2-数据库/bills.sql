/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50735
Source Host           : localhost:3306
Source Database       : bills

Target Server Type    : MYSQL
Target Server Version : 50735
File Encoding         : 65001

Date: 2022-01-22 16:34:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '账单标题',
  `billtime` datetime DEFAULT NULL COMMENT '账单时间',
  `typeid` int(11) DEFAULT NULL COMMENT '账单类型ID',
  `price` double(65,2) DEFAULT NULL COMMENT '金额',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bills
-- ----------------------------
INSERT INTO `bills` VALUES ('1', '小明借我的钱去喝酒', '2019-08-09 11:29:29', '3', '200.00', '111');
INSERT INTO `bills` VALUES ('2', '21231', '2019-08-09 04:25:21', '4', '22.00', '22');
INSERT INTO `bills` VALUES ('3', '222', '2019-09-03 16:00:00', '1', '222.00', '222');
INSERT INTO `bills` VALUES ('4', '发工资', '2022-01-22 02:56:21', '2', '5000.00', '本月工资');
INSERT INTO `bills` VALUES ('5', '家庭支出', '2022-01-23 02:57:09', '1', '4500.00', '给媳妇上交工资');

-- ----------------------------
-- Table structure for billtype
-- ----------------------------
DROP TABLE IF EXISTS `billtype`;
CREATE TABLE `billtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of billtype
-- ----------------------------
INSERT INTO `billtype` VALUES ('1', '支出');
INSERT INTO `billtype` VALUES ('2', '收入');
INSERT INTO `billtype` VALUES ('3', '借出');
INSERT INTO `billtype` VALUES ('4', '借入');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(55) DEFAULT NULL COMMENT '用户姓名',
  `loginname` varchar(55) DEFAULT NULL COMMENT '登陆账号',
  `pwd` varchar(55) DEFAULT NULL COMMENT '登录密码',
  `sex` varchar(1) DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '小明', 'xiaoming', '123456', '男');
INSERT INTO `user` VALUES ('2', '管理员', 'admin', '123456', '女');
