/*
SQLyog Ultimate v9.62 
MySQL - 5.5.25a : Database - sxttest
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sxttest` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sxttest`;

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `ano` int(55) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `pwd` varchar(55) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `gender` varchar(55) DEFAULT NULL,
  `remark` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`ano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_admin` */

insert  into `t_admin`(`ano`,`name`,`pwd`,`phone`,`email`,`gender`,`remark`) values (20170101,'李四','111','1234','12345@123','男','222'),(20170102,'王五','22','123','12345@123','男',NULL),(20170103,'赵六','33','122','12345@123','男',NULL),(20170104,'田七','44','112','12345@123','男',NULL),(20170105,'宋八','55','222','12345@123','男',NULL),(20170106,'颖酒','66','111','12345@123','男',NULL),(20170818,'胖虎','2222','15830983396','27675014@qq.com','男','这是一个悲伤的故事'),(21070120,'','77','4444','12345@123','男',NULL);

/*Table structure for table `t_class` */

DROP TABLE IF EXISTS `t_class`;

CREATE TABLE `t_class` (
  `classno` int(55) NOT NULL,
  `cname` varchar(55) DEFAULT NULL,
  `cteacher` varchar(55) DEFAULT NULL,
  `classroom` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`classno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_class` */

insert  into `t_class`(`classno`,`cname`,`cteacher`,`classroom`) values (0,'暂无班级','暂无老师','暂无教室'),(1,'java7班','刘老师','102'),(2,'java2班','张老师','506'),(3,'java3班','李老师','407'),(4,'Java4班','周老师','201'),(5,'java5班','曹老师','209'),(6,'IOS1班','王老师','303');

/*Table structure for table `t_course` */

DROP TABLE IF EXISTS `t_course`;

CREATE TABLE `t_course` (
  `cno` int(55) NOT NULL AUTO_INCREMENT,
  `cname` varchar(55) DEFAULT NULL,
  `credit` int(55) DEFAULT NULL,
  `periodstart` date DEFAULT NULL,
  `periodend` date DEFAULT NULL,
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB AUTO_INCREMENT=20170111 DEFAULT CHARSET=utf8;

/*Data for the table `t_course` */

insert  into `t_course`(`cno`,`cname`,`credit`,`periodstart`,`periodend`) values (20170101,'JAVA编程语言',1,'2017-08-21','2017-08-26'),(20170103,'c#从入门到放弃',2,'2017-08-22','2017-08-30'),(20170104,'JavaWEB从入门到精通',2,'2017-08-29','2017-08-26'),(20170105,'电子线路',2,'2017-08-14','2017-08-26'),(20170106,'电路基础',2,'2017-08-13','2017-08-26'),(20170107,'数字电路',1,'2017-08-14','2017-08-15'),(20170108,'模拟电路',1,'2017-08-22','2017-08-25'),(20170109,'数据结构',2,'2017-08-07','2017-08-10'),(20170110,'编译原理',3,'2017-08-30','2017-09-12');

/*Table structure for table `t_sc` */

DROP TABLE IF EXISTS `t_sc`;

CREATE TABLE `t_sc` (
  `sno` int(55) DEFAULT NULL,
  `cno` int(55) DEFAULT NULL,
  `tno` int(55) DEFAULT NULL,
  `score` int(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sc` */

insert  into `t_sc`(`sno`,`cno`,`tno`,`score`) values (20170101,20170103,20170103,33),(20170101,20170108,20170106,0),(20170101,20170105,20170103,31),(20170101,20170106,20170107,0),(20170101,20170107,20170106,0),(20170102,20170101,20170101,33),(20170102,20170103,20170103,558),(20170102,20170107,20170106,0),(20170102,20170108,20170106,0),(20170102,20170109,20170104,0),(20170102,20170110,20170108,0),(20170103,20170101,20170101,55),(20170103,20170104,20170104,0),(20170103,20170103,20170103,23),(20170103,20170108,20170101,22),(20170103,20170105,20170103,44),(20170107,20170103,20170103,555),(20170107,20170104,20170104,0),(20170107,20170106,20170107,0),(20170107,20170108,20170101,33),(20170107,20170109,20170104,0);

/*Table structure for table `t_student` */

DROP TABLE IF EXISTS `t_student`;

CREATE TABLE `t_student` (
  `sno` int(55) NOT NULL AUTO_INCREMENT,
  `pwd` varchar(55) DEFAULT NULL,
  `sname` varchar(55) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `gender` varchar(55) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `classno` int(55) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `pr_claass` (`classno`),
  CONSTRAINT `pr_claass` FOREIGN KEY (`classno`) REFERENCES `t_class` (`classno`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20170117 DEFAULT CHARSET=utf8;

/*Data for the table `t_student` */

insert  into `t_student`(`sno`,`pwd`,`sname`,`phone`,`gender`,`birth`,`classno`,`remark`) values (20170101,'666','尼古拉斯.赵四','1234567','男','2017-02-02',6,'我们都爱笑你只懂啊吗'),(20170102,'222','阿伊土鳖.张','1234567','女','2017-08-30',2,NULL),(20170103,'333','张无忌','1234567','男','2017-08-22',3,NULL),(20170104,'444','梅超风','1234567','男','2017-08-23',4,NULL),(20170105,'111','灭绝师太','1234567','女','2017-08-23',3,NULL),(20170106,'222','乔峰张','1234567','男','2017-08-14',3,NULL),(20170107,'333','淑芬','1234567','女','2017-09-14',4,NULL),(20170109,'111','张三丰','1234567','男','2017-08-02',2,NULL),(20170110,'222','曾阿牛','1234567','男','2017-08-27',4,NULL),(20170112,'111','曾阿牛','1234567','男','2017-08-28',0,'ww13932222'),(20170114,'12345','刘帅龙','18911370041','男','2017-08-09',6,'我是一个爱学习的孩子，你只懂啊'),(20170116,'1234567','王六久','18911370041','男','1994-06-20',5,'我是一个学生，是一个做IOS的好学生');

/*Table structure for table `t_tc` */

DROP TABLE IF EXISTS `t_tc`;

CREATE TABLE `t_tc` (
  `cno` int(55) NOT NULL,
  `tno` int(55) NOT NULL,
  `id` int(55) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `cno` (`cno`),
  KEY `tno` (`tno`),
  CONSTRAINT `t_tc_ibfk_1` FOREIGN KEY (`cno`) REFERENCES `t_course` (`cno`),
  CONSTRAINT `t_tc_ibfk_2` FOREIGN KEY (`tno`) REFERENCES `t_teacher` (`tno`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `t_tc` */

insert  into `t_tc`(`cno`,`tno`,`id`) values (20170101,20170101,5),(20170104,20170104,9),(20170108,20170101,10),(20170110,20170108,11),(20170108,20170106,12),(20170105,20170103,13),(20170106,20170107,14),(20170107,20170106,15),(20170109,20170104,16),(20170103,20170103,17),(20170103,20170104,18);

/*Table structure for table `t_teacher` */

DROP TABLE IF EXISTS `t_teacher`;

CREATE TABLE `t_teacher` (
  `tno` int(55) NOT NULL AUTO_INCREMENT,
  `tname` varchar(55) DEFAULT NULL,
  `tpwd` varchar(55) DEFAULT NULL,
  `tphone` varchar(55) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB AUTO_INCREMENT=20170109 DEFAULT CHARSET=utf8;

/*Data for the table `t_teacher` */

insert  into `t_teacher`(`tno`,`tname`,`tpwd`,`tphone`,`hiredate`,`remark`) values (20170101,'刘老师','0101','15830983396','2017-08-22','没有了备注'),(20170103,'王府井','0','0','2017-08-23','00'),(20170104,'假正经','222','2222','2017-08-30','我就是一个程序员'),(20170105,'刘宝钢','333','15830983396','2017-08-21','我就是一个程序员'),(20170106,'张家辉','444','15830983396','2017-08-29','我就是一个程序员'),(20170107,'鲤鱼同','555','15830983396','2017-08-26','我就是一个程序员'),(20170108,'张晓风','666','15830983396','2017-08-20','我就是一个程序员');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
