prompt PL/SQL Developer import file
prompt Created on 2017年9月1日 by Administrator
set feedback off
set define off
prompt Creating T_ADMIN...
create table T_ADMIN
(
  USERID    VARCHAR2(40) not null,
  USERNAME  VARCHAR2(10),
  PASSWORD  VARCHAR2(10),
  AGE       NUMBER(3),
  SCORE     NUMBER(5,1),
  ENTERDATE DATE,
  HOBBY     VARCHAR2(30)
)
;
alter table T_ADMIN
  add constraint PK_USERID primary key (USERID);

prompt Creating T_CLAZZ...
create table T_CLAZZ
(
  CLAZZNO   NUMBER(11) not null,
  CNAME     VARCHAR2(20),
  CHTEACHER VARCHAR2(20),
  CLAZZROOM NUMBER(11)
)
;
alter table T_CLAZZ
  add constraint PK_T_CLAZZ primary key (CLAZZNO);

prompt Creating T_COURSE...
create table T_COURSE
(
  CNO         NUMBER(11) not null,
  NAME        VARCHAR2(20),
  CREDIT      NUMBER(1),
  PERIODSTART DATE,
  PERIODEND   DATE
)
;
alter table T_COURSE
  add constraint PK_T_COURSE primary key (CNO);

prompt Creating T_STUDENT...
create table T_STUDENT
(
  SNO     NUMBER(11) not null,
  PWD     VARCHAR2(20),
  SNAME   VARCHAR2(20),
  PHONE   VARCHAR2(20),
  GENDER  CHAR(2),
  BIRTH   DATE,
  CLAZZNO NUMBER(11),
  REMARK  VARCHAR2(255)
)
;
alter table T_STUDENT
  add constraint PK_T_STUDENT primary key (SNO);
alter table T_STUDENT
  add constraint FK_T_STUDENT_CLAZZNO foreign key (CLAZZNO)
  references T_CLAZZ (CLAZZNO) on delete cascade;

prompt Creating T_TEACHER...
create table T_TEACHER
(
  TNO      NUMBER(11) not null,
  TNAME    VARCHAR2(20),
  PWD      VARCHAR2(20),
  PHONE    VARCHAR2(20),
  HIREDATE DATE,
  REMARK   VARCHAR2(500)
)
;
alter table T_TEACHER
  add constraint PK_T_TEACHER primary key (TNO);

prompt Creating T_SC...
create table T_SC
(
  SNO   NUMBER(11) not null,
  CNO   NUMBER(11) not null,
  TNO   NUMBER(11) not null,
  SCORE NUMBER(5,2)
)
;
alter table T_SC
  add constraint PK_TC primary key (SNO, CNO, TNO);
alter table T_SC
  add constraint FK_TC_CNO foreign key (CNO)
  references T_COURSE (CNO) on delete cascade;
alter table T_SC
  add constraint FK_TC_SNO foreign key (SNO)
  references T_STUDENT (SNO) on delete cascade;
alter table T_SC
  add constraint FK_TC_TNO foreign key (TNO)
  references T_TEACHER (TNO) on delete cascade;

prompt Creating T_TC...
create table T_TC
(
  CNO NUMBER(11) default 0 not null,
  TNO NUMBER(11) default 0 not null
)
;
alter table T_TC
  add constraint PK_T_TC primary key (CNO, TNO);
alter table T_TC
  add constraint FK_TC_CNO2 foreign key (CNO)
  references T_COURSE (CNO) on delete cascade;
alter table T_TC
  add constraint FK_TC_TNO2 foreign key (TNO)
  references T_TEACHER (TNO) on delete cascade;

prompt Loading T_ADMIN...
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('142c38973f4748e2b779684e9ec2c8e4', 'lisi', '123', 12, 12, to_date('22-08-2017', 'dd-mm-yyyy'), '[sports, music, drawing]');
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('885f2b0a154b4314986499d9d2b1b85b', 'wangwu', '123', 12, 12, to_date('22-08-2017', 'dd-mm-yyyy'), 'null');
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('4721ec1970484996aeeb4c3d034d6abd', '1111', '11', 12, 2, to_date('24-08-2017', 'dd-mm-yyyy'), '[sports, music]');
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('victor', 'victor', '111111', 66, 66.6, to_date('06-06-2016', 'dd-mm-yyyy'), '[sports]');
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('大王巡山', '韩征宇', '134134', 6, 66.6, to_date('01-02-2016', 'dd-mm-yyyy'), '[sports]');
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('zhangxue', '张雪', '******', 26, 98.5, to_date('09-08-2016', 'dd-mm-yyyy'), null);
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('wulan', '乌兰', 'wlan', 25, 98.5, to_date('14-03-2017', 'dd-mm-yyyy'), null);
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('baiyali', '白亚力', 'byl', 23, 95, to_date('23-12-2016', 'dd-mm-yyyy'), '[sports, music, drawing]');
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('zhdd', '朱敦达', 'zhdd', 23, 90, to_date('23-12-2016', 'dd-mm-yyyy'), '[sports, music, drawing]');
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('堂吉诃德', '堂吉诃德', '堂吉诃德', 99, 100, to_date('01-01-2100', 'dd-mm-yyyy'), '[sports, music]');
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('张大民', '张大民', '111', 11, 11.1, to_date('06-06-2016', 'dd-mm-yyyy'), '[sports]');
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('1', '2', '3', 5, 6, to_date('23-12-2016', 'dd-mm-yyyy'), '[sports, music, drawing]');
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('yuxuefei', '于雪飞', '123456', 27, 60, to_date('12-12-2016', 'dd-mm-yyyy'), '[sports, music]');
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('timo', '提莫', 'timo', 10, 80, to_date('12-12-2009', 'dd-mm-yyyy'), '[sports, music, drawing]');
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('zhangsan', 'zhangsan', '123', 20, 80, to_date('12-12-2009', 'dd-mm-yyyy'), '[sports, music, drawing]');
insert into T_ADMIN (USERID, USERNAME, PASSWORD, AGE, SCORE, ENTERDATE, HOBBY)
values ('97c4b49d6a9e430daeb7cda76440cb0a', 'zhaoliu', '123', 12, 12, to_date('22-08-2017', 'dd-mm-yyyy'), null);
commit;
prompt 16 records loaded
prompt Loading T_CLAZZ...
insert into T_CLAZZ (CLAZZNO, CNAME, CHTEACHER, CLAZZROOM)
values (1, 'JavaEE01', '刘老师', 401);
insert into T_CLAZZ (CLAZZNO, CNAME, CHTEACHER, CLAZZROOM)
values (2, 'Android04', '张老师', 201);
insert into T_CLAZZ (CLAZZNO, CNAME, CHTEACHER, CLAZZROOM)
values (3, 'HTML505', '李老师', 305);
commit;
prompt 3 records loaded
prompt Loading T_COURSE...
insert into T_COURSE (CNO, NAME, CREDIT, PERIODSTART, PERIODEND)
values (1, 'html', 5, to_date('22-08-2017', 'dd-mm-yyyy'), to_date('24-08-2017', 'dd-mm-yyyy'));
insert into T_COURSE (CNO, NAME, CREDIT, PERIODSTART, PERIODEND)
values (2, 'css', 4, to_date('22-08-2017', 'dd-mm-yyyy'), to_date('24-08-2017', 'dd-mm-yyyy'));
insert into T_COURSE (CNO, NAME, CREDIT, PERIODSTART, PERIODEND)
values (3, 'js', 5, to_date('22-08-2017', 'dd-mm-yyyy'), to_date('24-08-2017', 'dd-mm-yyyy'));
insert into T_COURSE (CNO, NAME, CREDIT, PERIODSTART, PERIODEND)
values (4, 'servlet', 5, to_date('22-08-2017', 'dd-mm-yyyy'), to_date('24-08-2017', 'dd-mm-yyyy'));
insert into T_COURSE (CNO, NAME, CREDIT, PERIODSTART, PERIODEND)
values (5, 'jquery', 4, to_date('22-08-2017', 'dd-mm-yyyy'), to_date('24-08-2017', 'dd-mm-yyyy'));
insert into T_COURSE (CNO, NAME, CREDIT, PERIODSTART, PERIODEND)
values (109, '大数据', 5, to_date('22-08-2017', 'dd-mm-yyyy'), to_date('24-08-2017', 'dd-mm-yyyy'));
insert into T_COURSE (CNO, NAME, CREDIT, PERIODSTART, PERIODEND)
values (110, '人工智能', 5, to_date('23-08-2017', 'dd-mm-yyyy'), to_date('25-08-2017', 'dd-mm-yyyy'));
commit;
prompt 7 records loaded
prompt Loading T_STUDENT...
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (220, '123', '张飞', '12312441', '男', to_date('07-08-2017', 'dd-mm-yyyy'), 3, '阿斯蒂芬');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (221, '123', 'zhangsan0', '1230', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (222, '123', 'zhangsan1', '1231', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (223, '123', 'zhangsan2', '1232', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (224, '123', 'zhangsan3', '1233', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (225, '123', 'zhangsan4', '1234', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (226, '123', 'zhangsan5', '1235', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (227, '123', 'zhangsan6', '1236', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (228, '123', 'zhangsan7', '1237', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (230, '123', 'zhangsan9', '1239', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (231, '123', 'zhangsan10', '12310', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (232, '123', 'zhangsan11', '12311', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (233, '123', 'zhangsan12', '12312', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (234, '123', 'zhangsan13', '12313', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (235, '123', 'zhangsan14', '12314', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (236, '123', 'zhangsan15', '12315', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (237, '123', 'zhangsan16', '12316', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (238, '123', 'zhangsan17', '12317', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (239, '123', 'zhangsan18', '12318', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (240, '123', 'zhangsan19', '12319', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (241, '123', 'zhangsan20', '12320', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (242, '123', 'zhangsan21', '12321', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (243, '123', 'zhangsan22', '12322', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (244, '123', 'zhangsan23', '12323', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (245, '123', 'zhangsan24', '12324', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (246, '123', 'zhangsan25', '12325', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (247, '123', 'zhangsan26', '12326', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (248, '123', 'zhangsan27', '12327', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (249, '123', 'zhangsan28', '12328', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (250, '123', 'zhangsan29', '12329', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (251, '123', 'zhangsan30', '12330', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (252, '123', 'zhangsan31', '12331', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (253, '123', 'zhangsan32', '12332', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (254, '123', 'zhangsan33', '12333', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (255, '123', 'zhangsan34', '12334', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (256, '123', 'zhangsan35', '12335', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (257, '123', 'zhangsan36', '12336', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (258, '123', 'zhangsan37', '12337', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (259, '123', 'zhangsan38', '12338', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (260, '123', 'zhangsan39', '12339', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (261, '123', 'zhangsan40', '12340', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (262, '123', 'zhangsan41', '12341', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (263, '123', 'zhangsan42', '12342', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (264, '123', 'zhangsan43', '12343', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (265, '123', 'zhangsan44', '12344', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (266, '123', 'zhangsan45', '12345', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (267, '123', 'zhangsan46', '12346', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (268, '123', 'zhangsan47', '12347', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (269, '123', 'zhangsan48', '12348', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (270, '123', 'zhangsan49', '12349', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (271, '123', 'zhangsan50', '12350', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (272, '123', 'zhangsan51', '12351', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (273, '123', 'zhangsan52', '12352', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (274, '123', 'zhangsan53', '12353', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (275, '123', 'zhangsan54', '12354', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (276, '123', 'zhangsan55', '12355', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (277, '123', 'zhangsan56', '12356', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (278, '123', 'zhangsan57', '12357', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (279, '123', 'zhangsan58', '12358', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (280, '123', 'zhangsan59', '12359', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (281, '123', 'zhangsan60', '12360', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (282, '123', 'zhangsan61', '12361', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (283, '123', 'zhangsan62', '12362', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (284, '123', 'zhangsan63', '12363', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (285, '123', 'zhangsan64', '12364', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (286, '123', 'zhangsan65', '12365', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (287, '123', 'zhangsan66', '12366', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (288, '123', 'zhangsan67', '12367', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (289, '123', 'zhangsan68', '12368', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (290, '123', 'zhangsan69', '12369', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (291, '123', 'zhangsan70', '12370', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (292, '123', 'zhangsan71', '12371', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (293, '123', 'zhangsan72', '12372', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (294, '123', 'zhangsan73', '12373', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (295, '123', 'zhangsan74', '12374', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (296, '123', 'zhangsan75', '12375', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (297, '123', 'zhangsan76', '12376', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (298, '123', 'zhangsan77', '12377', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (299, '123', 'zhangsan78', '12378', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (300, '123', 'zhangsan79', '12379', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (301, '123', 'zhangsan80', '12380', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (302, '123', 'zhangsan81', '12381', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (303, '123', 'zhangsan82', '12382', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (304, '123', 'zhangsan83', '12383', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (305, '123', 'zhangsan84', '12384', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (306, '123', 'zhangsan85', '12385', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (307, '123', 'zhangsan86', '12386', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (308, '123', 'zhangsan87', '12387', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (309, '123', 'zhangsan88', '12388', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (310, '123', 'zhangsan89', '12389', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (311, '123', 'zhangsan90', '12390', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (312, '123', 'zhangsan91', '12391', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (313, '123', 'zhangsan92', '12392', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (314, '123', 'zhangsan93', '12393', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (315, '123', 'zhangsan94', '12394', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (316, '123', 'zhangsan95', '12395', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (317, '123', 'zhangsan96', '12396', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (318, '123', 'zhangsan97', '12397', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (319, '123', 'zhangsan98', '12398', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (320, '123', 'zhangsan99', '12399', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
commit;
prompt 100 records committed...
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (321, '123', 'zhangsan100', '123100', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (322, '123', 'zhangsan101', '123101', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (323, '123', 'zhangsan102', '123102', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (324, '123', 'zhangsan103', '123103', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (325, '123', 'zhangsan104', '123104', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (326, '123', 'zhangsan105', '123105', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (327, '123', 'zhangsan106', '123106', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (328, '123', 'zhangsan107', '123107', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (329, '123', 'zhangsan108', '123108', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (330, '123', 'zhangsan109', '123109', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (331, '123', 'zhangsan110', '123110', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (332, '123', 'zhangsan111', '123111', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (333, '123', 'zhangsan112', '123112', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (334, '123', 'zhangsan113', '123113', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (335, '123', 'zhangsan114', '123114', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (336, '123', 'zhangsan115', '123115', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (337, '123', 'zhangsan116', '123116', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (338, '123', 'zhangsan117', '123117', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (339, '123', 'zhangsan118', '123118', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (340, '123', 'zhangsan119', '123119', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (341, '123', 'zhangsan120', '123120', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (342, '123', 'zhangsan121', '123121', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (343, '123', 'zhangsan122', '123122', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (344, '123', 'zhangsan123', '123123', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (345, '123', 'zhangsan124', '123124', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (346, '123', 'zhangsan125', '123125', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (347, '123', 'zhangsan126', '123126', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (348, '123', 'zhangsan127', '123127', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (349, '123', 'zhangsan128', '123128', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (350, '123', 'zhangsan129', '123129', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (351, '123', 'zhangsan130', '123130', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (352, '123', 'zhangsan131', '123131', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (353, '123', 'zhangsan132', '123132', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (354, '123', 'zhangsan133', '123133', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (355, '123', 'zhangsan134', '123134', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (356, '123', 'zhangsan135', '123135', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (357, '123', 'zhangsan136', '123136', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (358, '123', 'zhangsan137', '123137', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (359, '123', 'zhangsan138', '123138', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (360, '123', 'zhangsan139', '123139', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (361, '123', 'zhangsan140', '123140', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (362, '123', 'zhangsan141', '123141', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (363, '123', 'zhangsan142', '123142', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (364, '123', 'zhangsan143', '123143', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (365, '123', 'zhangsan144', '123144', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (366, '123', 'zhangsan145', '123145', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (367, '123', 'zhangsan146', '123146', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (368, '123', 'zhangsan147', '123147', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (369, '123', 'zhangsan148', '123148', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (804, '123', 'zhangsan583', '123583', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (805, '123', 'zhangsan584', '123584', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (806, '123', 'zhangsan585', '123585', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (807, '123', 'zhangsan586', '123586', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (808, '123', 'zhangsan587', '123587', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (809, '123', 'zhangsan588', '123588', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (810, '123', 'zhangsan589', '123589', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (93, '123', '许新颖', '520', '男', to_date('20-05-2014', 'dd-mm-yyyy'), 3, 'asdas');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (811, '123', 'zhangsan590', '123590', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (812, '123', 'zhangsan591', '123591', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (813, '123', 'zhangsan592', '123592', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (814, '123', 'zhangsan593', '123593', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (815, '123', 'zhangsan594', '123594', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (816, '123', 'zhangsan595', '123595', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (817, '123', 'zhangsan596', '123596', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (818, '123', 'zhangsan597', '123597', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (819, '123', 'zhangsan598', '123598', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (820, '123', 'zhangsan599', '123599', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (821, '123', 'zhangsan600', '123600', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (822, '123', 'zhangsan601', '123601', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (823, '123', 'zhangsan602', '123602', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (824, '123', 'zhangsan603', '123603', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (825, '123', 'zhangsan604', '123604', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (826, '123', 'zhangsan605', '123605', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (827, '123', 'zhangsan606', '123606', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (828, '123', 'zhangsan607', '123607', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (829, '123', 'zhangsan608', '123608', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (830, '123', 'zhangsan609', '123609', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (831, '123', 'zhangsan610', '123610', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (832, '123', 'zhangsan611', '123611', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (833, '123', 'zhangsan612', '123612', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (834, '123', 'zhangsan613', '123613', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (835, '123', 'zhangsan614', '123614', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (836, '123', 'zhangsan615', '123615', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (837, '123', 'zhangsan616', '123616', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (838, '123', 'zhangsan617', '123617', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (839, '123', 'zhangsan618', '123618', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (840, '123', 'zhangsan619', '123619', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (841, '123', 'zhangsan620', '123620', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (842, '123', 'zhangsan621', '123621', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (843, '123', 'zhangsan622', '123622', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (844, '123', 'zhangsan623', '123623', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (845, '123', 'zhangsan624', '123624', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (846, '123', 'zhangsan625', '123625', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (847, '123', 'zhangsan626', '123626', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (848, '123', 'zhangsan627', '123627', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (849, '123', 'zhangsan628', '123628', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (850, '123', 'zhangsan629', '123629', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (851, '123', 'zhangsan630', '123630', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (852, '123', 'zhangsan631', '123631', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (853, '123', 'zhangsan632', '123632', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
commit;
prompt 200 records committed...
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (854, '123', 'zhangsan633', '123633', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (855, '123', 'zhangsan634', '123634', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (856, '123', 'zhangsan635', '123635', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (857, '123', 'zhangsan636', '123636', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (858, '123', 'zhangsan637', '123637', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (859, '123', 'zhangsan638', '123638', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (860, '123', 'zhangsan639', '123639', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (861, '123', 'zhangsan640', '123640', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (862, '123', 'zhangsan641', '123641', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (863, '123', 'zhangsan642', '123642', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (864, '123', 'zhangsan643', '123643', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (865, '123', 'zhangsan644', '123644', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (866, '123', 'zhangsan645', '123645', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (867, '123', 'zhangsan646', '123646', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (868, '123', 'zhangsan647', '123647', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (869, '123', 'zhangsan648', '123648', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (870, '123', 'zhangsan649', '123649', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (871, '123', 'zhangsan650', '123650', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (872, '123', 'zhangsan651', '123651', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (873, '123', 'zhangsan652', '123652', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (874, '123', 'zhangsan653', '123653', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (875, '123', 'zhangsan654', '123654', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (876, '123', 'zhangsan655', '123655', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (877, '123', 'zhangsan656', '123656', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (878, '123', 'zhangsan657', '123657', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (879, '123', 'zhangsan658', '123658', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (880, '123', 'zhangsan659', '123659', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (881, '123', 'zhangsan660', '123660', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (882, '123', 'zhangsan661', '123661', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (883, '123', 'zhangsan662', '123662', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (884, '123', 'zhangsan663', '123663', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (885, '123', 'zhangsan664', '123664', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (886, '123', 'zhangsan665', '123665', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (887, '123', 'zhangsan666', '123666', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (888, '123', 'zhangsan667', '123667', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (889, '123', 'zhangsan668', '123668', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (890, '123', 'zhangsan669', '123669', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (891, '123', 'zhangsan670', '123670', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (892, '123', 'zhangsan671', '123671', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (893, '123', 'zhangsan672', '123672', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (894, '123', 'zhangsan673', '123673', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (895, '123', 'zhangsan674', '123674', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (896, '123', 'zhangsan675', '123675', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (897, '123', 'zhangsan676', '123676', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (898, '123', 'zhangsan677', '123677', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (899, '123', 'zhangsan678', '123678', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (900, '123', 'zhangsan679', '123679', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (901, '123', 'zhangsan680', '123680', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (902, '123', 'zhangsan681', '123681', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (903, '123', 'zhangsan682', '123682', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (904, '123', 'zhangsan683', '123683', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (905, '123', 'zhangsan684', '123684', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (906, '123', 'zhangsan685', '123685', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (907, '123', 'zhangsan686', '123686', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (908, '123', 'zhangsan687', '123687', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (909, '123', 'zhangsan688', '123688', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (910, '123', 'zhangsan689', '123689', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (911, '123', 'zhangsan690', '123690', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (912, '123', 'zhangsan691', '123691', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (913, '123', 'zhangsan692', '123692', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (914, '123', 'zhangsan693', '123693', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (915, '123', 'zhangsan694', '123694', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (916, '123', 'zhangsan695', '123695', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (917, '123', 'zhangsan696', '123696', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (918, '123', 'zhangsan697', '123697', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (919, '123', 'zhangsan698', '123698', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (920, '123', 'zhangsan699', '123699', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (921, '123', 'zhangsan700', '123700', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (922, '123', 'zhangsan701', '123701', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (923, '123', 'zhangsan702', '123702', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (924, '123', 'zhangsan703', '123703', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (925, '123', 'zhangsan704', '123704', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (926, '123', 'zhangsan705', '123705', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (927, '123', 'zhangsan706', '123706', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (928, '123', 'zhangsan707', '123707', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (929, '123', 'zhangsan708', '123708', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (930, '123', 'zhangsan709', '123709', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (931, '123', 'zhangsan710', '123710', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (932, '123', 'zhangsan711', '123711', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (933, '123', 'zhangsan712', '123712', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (934, '123', 'zhangsan713', '123713', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (935, '123', 'zhangsan714', '123714', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (936, '123', 'zhangsan715', '123715', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (937, '123', 'zhangsan716', '123716', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (938, '123', 'zhangsan717', '123717', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (939, '123', 'zhangsan718', '123718', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (940, '123', 'zhangsan719', '123719', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (941, '123', 'zhangsan720', '123720', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (942, '123', 'zhangsan721', '123721', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (943, '123', 'zhangsan722', '123722', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (944, '123', 'zhangsan723', '123723', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (945, '123', 'zhangsan724', '123724', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (946, '123', 'zhangsan725', '123725', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (370, '123', 'zhangsan149', '123149', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (371, '123', 'zhangsan150', '123150', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (99, '123', 'zhangsan', '123', '男', to_date('20-05-2014', 'dd-mm-yyyy'), 2, 'aaa');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (372, '123', 'zhangsan151', '123151', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (373, '123', 'zhangsan152', '123152', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (374, '123', 'zhangsan153', '123153', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (375, '123', 'zhangsan154', '123154', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
commit;
prompt 300 records committed...
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (376, '123', 'zhangsan155', '123155', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (377, '123', 'zhangsan156', '123156', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (378, '123', 'zhangsan157', '123157', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (379, '123', 'zhangsan158', '123158', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (380, '123', 'zhangsan159', '123159', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (381, '123', 'zhangsan160', '123160', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (382, '123', 'zhangsan161', '123161', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (383, '123', 'zhangsan162', '123162', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (384, '123', 'zhangsan163', '123163', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (385, '123', 'zhangsan164', '123164', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (386, '123', 'zhangsan165', '123165', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (387, '123', 'zhangsan166', '123166', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (388, '123', 'zhangsan167', '123167', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (389, '123', 'zhangsan168', '123168', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (390, '123', 'zhangsan169', '123169', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (391, '123', 'zhangsan170', '123170', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (392, '123', 'zhangsan171', '123171', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (393, '123', 'zhangsan172', '123172', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (394, '123', 'zhangsan173', '123173', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (395, '123', 'zhangsan174', '123174', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (396, '123', 'zhangsan175', '123175', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (397, '123', 'zhangsan176', '123176', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (398, '123', 'zhangsan177', '123177', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (399, '123', 'zhangsan178', '123178', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (400, '123', 'zhangsan179', '123179', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (401, '123', 'zhangsan180', '123180', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (402, '123', 'zhangsan181', '123181', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (403, '123', 'zhangsan182', '123182', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (404, '123', 'zhangsan183', '123183', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (405, '123', 'zhangsan184', '123184', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (406, '123', 'zhangsan185', '123185', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (407, '123', 'zhangsan186', '123186', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (408, '123', 'zhangsan187', '123187', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (409, '123', 'zhangsan188', '123188', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (410, '123', 'zhangsan189', '123189', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (411, '123', 'zhangsan190', '123190', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (412, '123', 'zhangsan191', '123191', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (413, '123', 'zhangsan192', '123192', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (414, '123', 'zhangsan193', '123193', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (415, '123', 'zhangsan194', '123194', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (416, '123', 'zhangsan195', '123195', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (417, '123', 'zhangsan196', '123196', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (418, '123', 'zhangsan197', '123197', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (419, '123', 'zhangsan198', '123198', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (420, '123', 'zhangsan199', '123199', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (421, '123', 'zhangsan200', '123200', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (422, '123', 'zhangsan201', '123201', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (423, '123', 'zhangsan202', '123202', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (424, '123', 'zhangsan203', '123203', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (425, '123', 'zhangsan204', '123204', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (426, '123', 'zhangsan205', '123205', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (427, '123', 'zhangsan206', '123206', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (428, '123', 'zhangsan207', '123207', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (429, '123', 'zhangsan208', '123208', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (430, '123', 'zhangsan209', '123209', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (431, '123', 'zhangsan210', '123210', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (432, '123', 'zhangsan211', '123211', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (433, '123', 'zhangsan212', '123212', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (434, '123', 'zhangsan213', '123213', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (435, '123', 'zhangsan214', '123214', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (436, '123', 'zhangsan215', '123215', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (437, '123', 'zhangsan216', '123216', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (438, '123', 'zhangsan217', '123217', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (439, '123', 'zhangsan218', '123218', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (440, '123', 'zhangsan219', '123219', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (441, '123', 'zhangsan220', '123220', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (442, '123', 'zhangsan221', '123221', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (443, '123', 'zhangsan222', '123222', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (444, '123', 'zhangsan223', '123223', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (445, '123', 'zhangsan224', '123224', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (446, '123', 'zhangsan225', '123225', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (447, '123', 'zhangsan226', '123226', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (448, '123', 'zhangsan227', '123227', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (449, '123', 'zhangsan228', '123228', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (450, '123', 'zhangsan229', '123229', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (451, '123', 'zhangsan230', '123230', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (452, '123', 'zhangsan231', '123231', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (453, '123', 'zhangsan232', '123232', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (454, '123', 'zhangsan233', '123233', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (455, '123', 'zhangsan234', '123234', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (456, '123', 'zhangsan235', '123235', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (457, '123', 'zhangsan236', '123236', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (458, '123', 'zhangsan237', '123237', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (459, '123', 'zhangsan238', '123238', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (460, '123', 'zhangsan239', '123239', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (461, '123', 'zhangsan240', '123240', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (462, '123', 'zhangsan241', '123241', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (463, '123', 'zhangsan242', '123242', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (464, '123', 'zhangsan243', '123243', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (465, '123', 'zhangsan244', '123244', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (466, '123', 'zhangsan245', '123245', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (467, '123', 'zhangsan246', '123246', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (468, '123', 'zhangsan247', '123247', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (469, '123', 'zhangsan248', '123248', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (470, '123', 'zhangsan249', '123249', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (471, '123', 'zhangsan250', '123250', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (472, '123', 'zhangsan251', '123251', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (473, '123', 'zhangsan252', '123252', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (474, '123', 'zhangsan253', '123253', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (475, '123', 'zhangsan254', '123254', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
commit;
prompt 400 records committed...
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (476, '123', 'zhangsan255', '123255', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (477, '123', 'zhangsan256', '123256', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (478, '123', 'zhangsan257', '123257', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (479, '123', 'zhangsan258', '123258', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (480, '123', 'zhangsan259', '123259', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (481, '123', 'zhangsan260', '123260', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (482, '123', 'zhangsan261', '123261', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (483, '123', 'zhangsan262', '123262', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (484, '123', 'zhangsan263', '123263', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (485, '123', 'zhangsan264', '123264', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (486, '123', 'zhangsan265', '123265', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (487, '123', 'zhangsan266', '123266', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (488, '123', 'zhangsan267', '123267', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (489, '123', 'zhangsan268', '123268', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (490, '123', 'zhangsan269', '123269', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (491, '123', 'zhangsan270', '123270', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (492, '123', 'zhangsan271', '123271', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (493, '123', 'zhangsan272', '123272', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (494, '123', 'zhangsan273', '123273', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (495, '123', 'zhangsan274', '123274', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (496, '123', 'zhangsan275', '123275', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (497, '123', 'zhangsan276', '123276', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (498, '123', 'zhangsan277', '123277', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (499, '123', 'zhangsan278', '123278', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (500, '123', 'zhangsan279', '123279', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (501, '123', 'zhangsan280', '123280', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (502, '123', 'zhangsan281', '123281', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (503, '123', 'zhangsan282', '123282', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (504, '123', 'zhangsan283', '123283', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (505, '123', 'zhangsan284', '123284', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (506, '123', 'zhangsan285', '123285', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (507, '123', 'zhangsan286', '123286', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (508, '123', 'zhangsan287', '123287', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (509, '123', 'zhangsan288', '123288', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (510, '123', 'zhangsan289', '123289', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (511, '123', 'zhangsan290', '123290', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (512, '123', 'zhangsan291', '123291', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (513, '123', 'zhangsan292', '123292', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (514, '123', 'zhangsan293', '123293', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (515, '123', 'zhangsan294', '123294', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (516, '123', 'zhangsan295', '123295', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (517, '123', 'zhangsan296', '123296', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (518, '123', 'zhangsan297', '123297', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (519, '123', 'zhangsan298', '123298', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (520, '123', 'zhangsan299', '123299', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (521, '123', 'zhangsan300', '123300', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (522, '123', 'zhangsan301', '123301', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (523, '123', 'zhangsan302', '123302', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (524, '123', 'zhangsan303', '123303', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (525, '123', 'zhangsan304', '123304', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (526, '123', 'zhangsan305', '123305', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (527, '123', 'zhangsan306', '123306', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (528, '123', 'zhangsan307', '123307', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (529, '123', 'zhangsan308', '123308', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (530, '123', 'zhangsan309', '123309', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (531, '123', 'zhangsan310', '123310', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (532, '123', 'zhangsan311', '123311', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (533, '123', 'zhangsan312', '123312', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (534, '123', 'zhangsan313', '123313', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (535, '123', 'zhangsan314', '123314', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (536, '123', 'zhangsan315', '123315', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (537, '123', 'zhangsan316', '123316', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (538, '123', 'zhangsan317', '123317', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (539, '123', 'zhangsan318', '123318', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (540, '123', 'zhangsan319', '123319', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (541, '123', 'zhangsan320', '123320', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (542, '123', 'zhangsan321', '123321', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (543, '123', 'zhangsan322', '123322', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (544, '123', 'zhangsan323', '123323', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (545, '123', 'zhangsan324', '123324', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (546, '123', 'zhangsan325', '123325', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (547, '123', 'zhangsan326', '123326', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (548, '123', 'zhangsan327', '123327', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (549, '123', 'zhangsan328', '123328', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (550, '123', 'zhangsan329', '123329', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (551, '123', 'zhangsan330', '123330', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (552, '123', 'zhangsan331', '123331', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (553, '123', 'zhangsan332', '123332', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (554, '123', 'zhangsan333', '123333', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (555, '123', 'zhangsan334', '123334', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (556, '123', 'zhangsan335', '123335', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (557, '123', 'zhangsan336', '123336', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (558, '123', 'zhangsan337', '123337', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (559, '123', 'zhangsan338', '123338', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (560, '123', 'zhangsan339', '123339', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (561, '123', 'zhangsan340', '123340', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (562, '123', 'zhangsan341', '123341', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (563, '123', 'zhangsan342', '123342', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (564, '123', 'zhangsan343', '123343', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (565, '123', 'zhangsan344', '123344', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (566, '123', 'zhangsan345', '123345', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (567, '123', 'zhangsan346', '123346', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (568, '123', 'zhangsan347', '123347', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (569, '123', 'zhangsan348', '123348', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (570, '123', 'zhangsan349', '123349', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (571, '123', 'zhangsan350', '123350', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (572, '123', 'zhangsan351', '123351', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (573, '123', 'zhangsan352', '123352', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (574, '123', 'zhangsan353', '123353', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (575, '123', 'zhangsan354', '123354', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
commit;
prompt 500 records committed...
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (576, '123', 'zhangsan355', '123355', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (577, '123', 'zhangsan356', '123356', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (578, '123', 'zhangsan357', '123357', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (579, '123', 'zhangsan358', '123358', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (580, '123', 'zhangsan359', '123359', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (581, '123', 'zhangsan360', '123360', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (582, '123', 'zhangsan361', '123361', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (583, '123', 'zhangsan362', '123362', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (584, '123', 'zhangsan363', '123363', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (585, '123', 'zhangsan364', '123364', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (586, '123', 'zhangsan365', '123365', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (587, '123', 'zhangsan366', '123366', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (588, '123', 'zhangsan367', '123367', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (589, '123', 'zhangsan368', '123368', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (590, '123', 'zhangsan369', '123369', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (591, '123', 'zhangsan370', '123370', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (592, '123', 'zhangsan371', '123371', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (593, '123', 'zhangsan372', '123372', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (594, '123', 'zhangsan373', '123373', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (595, '123', 'zhangsan374', '123374', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (596, '123', 'zhangsan375', '123375', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (597, '123', 'zhangsan376', '123376', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (598, '123', 'zhangsan377', '123377', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (599, '123', 'zhangsan378', '123378', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (600, '123', 'zhangsan379', '123379', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (601, '123', 'zhangsan380', '123380', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (602, '123', 'zhangsan381', '123381', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (603, '123', 'zhangsan382', '123382', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (604, '123', 'zhangsan383', '123383', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (605, '123', 'zhangsan384', '123384', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (606, '123', 'zhangsan385', '123385', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (607, '123', 'zhangsan386', '123386', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (608, '123', 'zhangsan387', '123387', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (609, '123', 'zhangsan388', '123388', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (610, '123', 'zhangsan389', '123389', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (611, '123', 'zhangsan390', '123390', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (612, '123', 'zhangsan391', '123391', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (613, '123', 'zhangsan392', '123392', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (614, '123', 'zhangsan393', '123393', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (615, '123', 'zhangsan394', '123394', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (616, '123', 'zhangsan395', '123395', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (617, '123', 'zhangsan396', '123396', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (618, '123', 'zhangsan397', '123397', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (619, '123', 'zhangsan398', '123398', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (620, '123', 'zhangsan399', '123399', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (621, '123', 'zhangsan400', '123400', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (622, '123', 'zhangsan401', '123401', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (623, '123', 'zhangsan402', '123402', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (624, '123', 'zhangsan403', '123403', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (625, '123', 'zhangsan404', '123404', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (626, '123', 'zhangsan405', '123405', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (627, '123', 'zhangsan406', '123406', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (628, '123', 'zhangsan407', '123407', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (629, '123', 'zhangsan408', '123408', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (630, '123', 'zhangsan409', '123409', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (631, '123', 'zhangsan410', '123410', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (632, '123', 'zhangsan411', '123411', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (633, '123', 'zhangsan412', '123412', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (634, '123', 'zhangsan413', '123413', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (635, '123', 'zhangsan414', '123414', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (636, '123', 'zhangsan415', '123415', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (637, '123', 'zhangsan416', '123416', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (638, '123', 'zhangsan417', '123417', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (639, '123', 'zhangsan418', '123418', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (640, '123', 'zhangsan419', '123419', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (641, '123', 'zhangsan420', '123420', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (642, '123', 'zhangsan421', '123421', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (643, '123', 'zhangsan422', '123422', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (644, '123', 'zhangsan423', '123423', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (645, '123', 'zhangsan424', '123424', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (646, '123', 'zhangsan425', '123425', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (647, '123', 'zhangsan426', '123426', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (648, '123', 'zhangsan427', '123427', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (649, '123', 'zhangsan428', '123428', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (650, '123', 'zhangsan429', '123429', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (651, '123', 'zhangsan430', '123430', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (652, '123', 'zhangsan431', '123431', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (653, '123', 'zhangsan432', '123432', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (654, '123', 'zhangsan433', '123433', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (655, '123', 'zhangsan434', '123434', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (656, '123', 'zhangsan435', '123435', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (657, '123', 'zhangsan436', '123436', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (658, '123', 'zhangsan437', '123437', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (659, '123', 'zhangsan438', '123438', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (660, '123', 'zhangsan439', '123439', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (661, '123', 'zhangsan440', '123440', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (662, '123', 'zhangsan441', '123441', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (663, '123', 'zhangsan442', '123442', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (664, '123', 'zhangsan443', '123443', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (665, '123', 'zhangsan444', '123444', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (666, '123', 'zhangsan445', '123445', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (667, '123', 'zhangsan446', '123446', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (668, '123', 'zhangsan447', '123447', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (669, '123', 'zhangsan448', '123448', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (670, '123', 'zhangsan449', '123449', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (671, '123', 'zhangsan450', '123450', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (672, '123', 'zhangsan451', '123451', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (673, '123', 'zhangsan452', '123452', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (674, '123', 'zhangsan453', '123453', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (675, '123', 'zhangsan454', '123454', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
commit;
prompt 600 records committed...
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (676, '123', 'zhangsan455', '123455', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (677, '123', 'zhangsan456', '123456', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (678, '123', 'zhangsan457', '123457', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (679, '123', 'zhangsan458', '123458', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (680, '123', 'zhangsan459', '123459', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (681, '123', 'zhangsan460', '123460', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (682, '123', 'zhangsan461', '123461', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (683, '123', 'zhangsan462', '123462', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (684, '123', 'zhangsan463', '123463', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (685, '123', 'zhangsan464', '123464', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (686, '123', 'zhangsan465', '123465', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (687, '123', 'zhangsan466', '123466', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (688, '123', 'zhangsan467', '123467', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (689, '123', 'zhangsan468', '123468', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (690, '123', 'zhangsan469', '123469', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (691, '123', 'zhangsan470', '123470', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (692, '123', 'zhangsan471', '123471', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (693, '123', 'zhangsan472', '123472', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (694, '123', 'zhangsan473', '123473', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (695, '123', 'zhangsan474', '123474', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (696, '123', 'zhangsan475', '123475', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (697, '123', 'zhangsan476', '123476', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (698, '123', 'zhangsan477', '123477', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (699, '123', 'zhangsan478', '123478', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (700, '123', 'zhangsan479', '123479', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (701, '123', 'zhangsan480', '123480', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (702, '123', 'zhangsan481', '123481', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (703, '123', 'zhangsan482', '123482', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (704, '123', 'zhangsan483', '123483', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (705, '123', 'zhangsan484', '123484', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (706, '123', 'zhangsan485', '123485', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (707, '123', 'zhangsan486', '123486', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (708, '123', 'zhangsan487', '123487', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (709, '123', 'zhangsan488', '123488', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (710, '123', 'zhangsan489', '123489', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (711, '123', 'zhangsan490', '123490', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (712, '123', 'zhangsan491', '123491', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (713, '123', 'zhangsan492', '123492', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (714, '123', 'zhangsan493', '123493', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (715, '123', 'zhangsan494', '123494', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (716, '123', 'zhangsan495', '123495', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (717, '123', 'zhangsan496', '123496', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (718, '123', 'zhangsan497', '123497', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (719, '123', 'zhangsan498', '123498', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (720, '123', 'zhangsan499', '123499', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (721, '123', 'zhangsan500', '123500', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (722, '123', 'zhangsan501', '123501', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (723, '123', 'zhangsan502', '123502', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (724, '123', 'zhangsan503', '123503', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (725, '123', 'zhangsan504', '123504', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (726, '123', 'zhangsan505', '123505', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (727, '123', 'zhangsan506', '123506', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (728, '123', 'zhangsan507', '123507', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (729, '123', 'zhangsan508', '123508', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (730, '123', 'zhangsan509', '123509', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (731, '123', 'zhangsan510', '123510', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (732, '123', 'zhangsan511', '123511', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (733, '123', 'zhangsan512', '123512', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (734, '123', 'zhangsan513', '123513', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (735, '123', 'zhangsan514', '123514', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (736, '123', 'zhangsan515', '123515', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (737, '123', 'zhangsan516', '123516', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (738, '123', 'zhangsan517', '123517', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (739, '123', 'zhangsan518', '123518', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (740, '123', 'zhangsan519', '123519', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (741, '123', 'zhangsan520', '123520', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (742, '123', 'zhangsan521', '123521', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (743, '123', 'zhangsan522', '123522', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (744, '123', 'zhangsan523', '123523', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (745, '123', 'zhangsan524', '123524', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (746, '123', 'zhangsan525', '123525', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (747, '123', 'zhangsan526', '123526', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (748, '123', 'zhangsan527', '123527', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (749, '123', 'zhangsan528', '123528', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (750, '123', 'zhangsan529', '123529', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (751, '123', 'zhangsan530', '123530', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (752, '123', 'zhangsan531', '123531', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (753, '123', 'zhangsan532', '123532', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (754, '123', 'zhangsan533', '123533', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (755, '123', 'zhangsan534', '123534', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (756, '123', 'zhangsan535', '123535', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (757, '123', 'zhangsan536', '123536', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (758, '123', 'zhangsan537', '123537', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (759, '123', 'zhangsan538', '123538', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (760, '123', 'zhangsan539', '123539', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (761, '123', 'zhangsan540', '123540', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (762, '123', 'zhangsan541', '123541', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (763, '123', 'zhangsan542', '123542', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (764, '123', 'zhangsan543', '123543', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (765, '123', 'zhangsan544', '123544', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (766, '123', 'zhangsan545', '123545', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (767, '123', 'zhangsan546', '123546', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (768, '123', 'zhangsan547', '123547', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (769, '123', 'zhangsan548', '123548', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (770, '123', 'zhangsan549', '123549', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (771, '123', 'zhangsan550', '123550', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (772, '123', 'zhangsan551', '123551', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (773, '123', 'zhangsan552', '123552', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (774, '123', 'zhangsan553', '123553', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (775, '123', 'zhangsan554', '123554', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
commit;
prompt 700 records committed...
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (776, '123', 'zhangsan555', '123555', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (777, '123', 'zhangsan556', '123556', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (778, '123', 'zhangsan557', '123557', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (779, '123', 'zhangsan558', '123558', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (780, '123', 'zhangsan559', '123559', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (781, '123', 'zhangsan560', '123560', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (782, '123', 'zhangsan561', '123561', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (783, '123', 'zhangsan562', '123562', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (784, '123', 'zhangsan563', '123563', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (785, '123', 'zhangsan564', '123564', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (786, '123', 'zhangsan565', '123565', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (787, '123', 'zhangsan566', '123566', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (788, '123', 'zhangsan567', '123567', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (789, '123', 'zhangsan568', '123568', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (790, '123', 'zhangsan569', '123569', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (791, '123', 'zhangsan570', '123570', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (792, '123', 'zhangsan571', '123571', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (793, '123', 'zhangsan572', '123572', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (794, '123', 'zhangsan573', '123573', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (795, '123', 'zhangsan574', '123574', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (796, '123', 'zhangsan575', '123575', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (797, '123', 'zhangsan576', '123576', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (798, '123', 'zhangsan577', '123577', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (799, '123', 'zhangsan578', '123578', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (800, '123', 'zhangsan579', '123579', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (801, '123', 'zhangsan580', '123580', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (802, '123', 'zhangsan581', '123581', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (803, '123', 'zhangsan582', '123582', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1240, '123', '鹿晗', '12345678', '男', to_date('25-08-2017', 'dd-mm-yyyy'), 2, '呵呵');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (947, '123', 'zhangsan726', '123726', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (948, '123', 'zhangsan727', '123727', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (949, '123', 'zhangsan728', '123728', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (950, '123', 'zhangsan729', '123729', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (951, '123', 'zhangsan730', '123730', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (952, '123', 'zhangsan731', '123731', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (953, '123', 'zhangsan732', '123732', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (954, '123', 'zhangsan733', '123733', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (955, '123', 'zhangsan734', '123734', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (956, '123', 'zhangsan735', '123735', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (957, '123', 'zhangsan736', '123736', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (958, '123', 'zhangsan737', '123737', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (959, '123', 'zhangsan738', '123738', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (960, '123', 'zhangsan739', '123739', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (961, '123', 'zhangsan740', '123740', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (962, '123', 'zhangsan741', '123741', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (963, '123', 'zhangsan742', '123742', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (964, '123', 'zhangsan743', '123743', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (965, '123', 'zhangsan744', '123744', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (966, '123', 'zhangsan745', '123745', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (967, '123', 'zhangsan746', '123746', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (968, '123', 'zhangsan747', '123747', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (969, '123', 'zhangsan748', '123748', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (970, '123', 'zhangsan749', '123749', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (971, '123', 'zhangsan750', '123750', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (972, '123', 'zhangsan751', '123751', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (973, '123', 'zhangsan752', '123752', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (974, '123', 'zhangsan753', '123753', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (975, '123', 'zhangsan754', '123754', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (976, '123', 'zhangsan755', '123755', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (977, '123', 'zhangsan756', '123756', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (978, '123', 'zhangsan757', '123757', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (979, '123', 'zhangsan758', '123758', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (980, '123', 'zhangsan759', '123759', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (981, '123', 'zhangsan760', '123760', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (982, '123', 'zhangsan761', '123761', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (983, '123', 'zhangsan762', '123762', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (984, '123', 'zhangsan763', '123763', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (985, '123', 'zhangsan764', '123764', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (986, '123', 'zhangsan765', '123765', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (987, '123', 'zhangsan766', '123766', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (988, '123', 'zhangsan767', '123767', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (989, '123', 'zhangsan768', '123768', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (990, '123', 'zhangsan769', '123769', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (991, '123', 'zhangsan770', '123770', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (992, '123', 'zhangsan771', '123771', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (993, '123', 'zhangsan772', '123772', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (994, '123', 'zhangsan773', '123773', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (995, '123', 'zhangsan774', '123774', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (996, '123', 'zhangsan775', '123775', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (997, '123', 'zhangsan776', '123776', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (998, '123', 'zhangsan777', '123777', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (999, '123', 'zhangsan778', '123778', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1000, '123', 'zhangsan779', '123779', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1001, '123', 'zhangsan780', '123780', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1002, '123', 'zhangsan781', '123781', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1003, '123', 'zhangsan782', '123782', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1004, '123', 'zhangsan783', '123783', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1005, '123', 'zhangsan784', '123784', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1006, '123', 'zhangsan785', '123785', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1007, '123', 'zhangsan786', '123786', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1008, '123', 'zhangsan787', '123787', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1009, '123', 'zhangsan788', '123788', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1010, '123', 'zhangsan789', '123789', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1011, '123', 'zhangsan790', '123790', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1012, '123', 'zhangsan791', '123791', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1013, '123', 'zhangsan792', '123792', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1014, '123', 'zhangsan793', '123793', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1015, '123', 'zhangsan794', '123794', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1016, '123', 'zhangsan795', '123795', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1017, '123', 'zhangsan796', '123796', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
commit;
prompt 800 records committed...
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1018, '123', 'zhangsan797', '123797', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1019, '123', 'zhangsan798', '123798', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1020, '123', 'zhangsan799', '123799', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1021, '123', 'zhangsan800', '123800', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1022, '123', 'zhangsan801', '123801', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1023, '123', 'zhangsan802', '123802', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1024, '123', 'zhangsan803', '123803', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1025, '123', 'zhangsan804', '123804', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1026, '123', 'zhangsan805', '123805', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1027, '123', 'zhangsan806', '123806', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1028, '123', 'zhangsan807', '123807', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1029, '123', 'zhangsan808', '123808', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1030, '123', 'zhangsan809', '123809', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1031, '123', 'zhangsan810', '123810', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1032, '123', 'zhangsan811', '123811', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1033, '123', 'zhangsan812', '123812', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1034, '123', 'zhangsan813', '123813', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1035, '123', 'zhangsan814', '123814', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1036, '123', 'zhangsan815', '123815', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1037, '123', 'zhangsan816', '123816', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1038, '123', 'zhangsan817', '123817', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1039, '123', 'zhangsan818', '123818', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1040, '123', 'zhangsan819', '123819', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1041, '123', 'zhangsan820', '123820', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1042, '123', 'zhangsan821', '123821', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1043, '123', 'zhangsan822', '123822', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1044, '123', 'zhangsan823', '123823', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1045, '123', 'zhangsan824', '123824', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1046, '123', 'zhangsan825', '123825', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1047, '123', 'zhangsan826', '123826', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1048, '123', 'zhangsan827', '123827', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1049, '123', 'zhangsan828', '123828', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1050, '123', 'zhangsan829', '123829', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1051, '123', 'zhangsan830', '123830', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1052, '123', 'zhangsan831', '123831', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1053, '123', 'zhangsan832', '123832', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1054, '123', 'zhangsan833', '123833', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1055, '123', 'zhangsan834', '123834', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1056, '123', 'zhangsan835', '123835', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1057, '123', 'zhangsan836', '123836', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1058, '123', 'zhangsan837', '123837', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1059, '123', 'zhangsan838', '123838', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1060, '123', 'zhangsan839', '123839', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1061, '123', 'zhangsan840', '123840', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1062, '123', 'zhangsan841', '123841', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1063, '123', 'zhangsan842', '123842', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1064, '123', 'zhangsan843', '123843', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1065, '123', 'zhangsan844', '123844', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1066, '123', 'zhangsan845', '123845', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1067, '123', 'zhangsan846', '123846', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1068, '123', 'zhangsan847', '123847', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1069, '123', 'zhangsan848', '123848', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1070, '123', 'zhangsan849', '123849', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1071, '123', 'zhangsan850', '123850', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1072, '123', 'zhangsan851', '123851', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1073, '123', 'zhangsan852', '123852', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1074, '123', 'zhangsan853', '123853', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1075, '123', 'zhangsan854', '123854', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1076, '123', 'zhangsan855', '123855', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1077, '123', 'zhangsan856', '123856', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1078, '123', 'zhangsan857', '123857', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1079, '123', 'zhangsan858', '123858', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1080, '123', 'zhangsan859', '123859', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1081, '123', 'zhangsan860', '123860', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1082, '123', 'zhangsan861', '123861', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1083, '123', 'zhangsan862', '123862', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1084, '123', 'zhangsan863', '123863', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1085, '123', 'zhangsan864', '123864', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1086, '123', 'zhangsan865', '123865', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1087, '123', 'zhangsan866', '123866', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1088, '123', 'zhangsan867', '123867', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1089, '123', 'zhangsan868', '123868', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1090, '123', 'zhangsan869', '123869', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1091, '123', 'zhangsan870', '123870', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1092, '123', 'zhangsan871', '123871', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1093, '123', 'zhangsan872', '123872', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1094, '123', 'zhangsan873', '123873', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1095, '123', 'zhangsan874', '123874', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1096, '123', 'zhangsan875', '123875', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1097, '123', 'zhangsan876', '123876', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1098, '123', 'zhangsan877', '123877', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1099, '123', 'zhangsan878', '123878', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1100, '123', 'zhangsan879', '123879', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1101, '123', 'zhangsan880', '123880', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1102, '123', 'zhangsan881', '123881', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1103, '123', 'zhangsan882', '123882', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1104, '123', 'zhangsan883', '123883', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1105, '123', 'zhangsan884', '123884', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1106, '123', 'zhangsan885', '123885', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1107, '123', 'zhangsan886', '123886', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1108, '123', 'zhangsan887', '123887', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1109, '123', 'zhangsan888', '123888', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1110, '123', 'zhangsan889', '123889', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1111, '123', 'zhangsan890', '123890', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1112, '123', 'zhangsan891', '123891', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1113, '123', 'zhangsan892', '123892', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1114, '123', 'zhangsan893', '123893', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1115, '123', 'zhangsan894', '123894', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1116, '123', 'zhangsan895', '123895', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1117, '123', 'zhangsan896', '123896', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
commit;
prompt 900 records committed...
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1118, '123', 'zhangsan897', '123897', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1119, '123', 'zhangsan898', '123898', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1120, '123', 'zhangsan899', '123899', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1121, '123', 'zhangsan900', '123900', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1122, '123', 'zhangsan901', '123901', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1123, '123', 'zhangsan902', '123902', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1124, '123', 'zhangsan903', '123903', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1125, '123', 'zhangsan904', '123904', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1126, '123', 'zhangsan905', '123905', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1127, '123', 'zhangsan906', '123906', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1128, '123', 'zhangsan907', '123907', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1129, '123', 'zhangsan908', '123908', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1130, '123', 'zhangsan909', '123909', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1131, '123', 'zhangsan910', '123910', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1132, '123', 'zhangsan911', '123911', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1133, '123', 'zhangsan912', '123912', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1134, '123', 'zhangsan913', '123913', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1135, '123', 'zhangsan914', '123914', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1136, '123', 'zhangsan915', '123915', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1137, '123', 'zhangsan916', '123916', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1138, '123', 'zhangsan917', '123917', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1139, '123', 'zhangsan918', '123918', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1140, '123', 'zhangsan919', '123919', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1141, '123', 'zhangsan920', '123920', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1142, '123', 'zhangsan921', '123921', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1143, '123', 'zhangsan922', '123922', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1144, '123', 'zhangsan923', '123923', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1145, '123', 'zhangsan924', '123924', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1146, '123', 'zhangsan925', '123925', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1147, '123', 'zhangsan926', '123926', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1148, '123', 'zhangsan927', '123927', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1149, '123', 'zhangsan928', '123928', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1150, '123', 'zhangsan929', '123929', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1151, '123', 'zhangsan930', '123930', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1152, '123', 'zhangsan931', '123931', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1153, '123', 'zhangsan932', '123932', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1154, '123', 'zhangsan933', '123933', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1155, '123', 'zhangsan934', '123934', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1156, '123', 'zhangsan935', '123935', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1157, '123', 'zhangsan936', '123936', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1158, '123', 'zhangsan937', '123937', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1159, '123', 'zhangsan938', '123938', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1160, '123', 'zhangsan939', '123939', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1161, '123', 'zhangsan940', '123940', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1162, '123', 'zhangsan941', '123941', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1163, '123', 'zhangsan942', '123942', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1164, '123', 'zhangsan943', '123943', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1165, '123', 'zhangsan944', '123944', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1166, '123', 'zhangsan945', '123945', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1167, '123', 'zhangsan946', '123946', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1168, '123', 'zhangsan947', '123947', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1169, '123', 'zhangsan948', '123948', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1170, '123', 'zhangsan949', '123949', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1171, '123', 'zhangsan950', '123950', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1172, '123', 'zhangsan951', '123951', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1173, '123', 'zhangsan952', '123952', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1174, '123', 'zhangsan953', '123953', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1175, '123', 'zhangsan954', '123954', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1176, '123', 'zhangsan955', '123955', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1177, '123', 'zhangsan956', '123956', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1178, '123', 'zhangsan957', '123957', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1179, '123', 'zhangsan958', '123958', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1180, '123', 'zhangsan959', '123959', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1181, '123', 'zhangsan960', '123960', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1182, '123', 'zhangsan961', '123961', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1183, '123', 'zhangsan962', '123962', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1184, '123', 'zhangsan963', '123963', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1185, '123', 'zhangsan964', '123964', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1186, '123', 'zhangsan965', '123965', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1187, '123', 'zhangsan966', '123966', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1188, '123', 'zhangsan967', '123967', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1189, '123', 'zhangsan968', '123968', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1190, '123', 'zhangsan969', '123969', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1191, '123', 'zhangsan970', '123970', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1192, '123', 'zhangsan971', '123971', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1193, '123', 'zhangsan972', '123972', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1194, '123', 'zhangsan973', '123973', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1195, '123', 'zhangsan974', '123974', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1196, '123', 'zhangsan975', '123975', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1197, '123', 'zhangsan976', '123976', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1198, '123', 'zhangsan977', '123977', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1199, '123', 'zhangsan978', '123978', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1200, '123', 'zhangsan979', '123979', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1201, '123', 'zhangsan980', '123980', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1202, '123', 'zhangsan981', '123981', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1203, '123', 'zhangsan982', '123982', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1204, '123', 'zhangsan983', '123983', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1205, '123', 'zhangsan984', '123984', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1206, '123', 'zhangsan985', '123985', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1207, '123', 'zhangsan986', '123986', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1208, '123', 'zhangsan987', '123987', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1209, '123', 'zhangsan988', '123988', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1210, '123', 'zhangsan989', '123989', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1211, '123', 'zhangsan990', '123990', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1212, '123', 'zhangsan991', '123991', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1213, '123', 'zhangsan992', '123992', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1214, '123', 'zhangsan993', '123993', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1215, '123', 'zhangsan994', '123994', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1216, '123', 'zhangsan995', '123995', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1217, '123', 'zhangsan996', '123996', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
commit;
prompt 1000 records committed...
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1218, '123', 'zhangsan997', '123997', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 2, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1219, '123', 'zhangsan998', '123998', '女', to_date('23-08-2017', 'dd-mm-yyyy'), 3, '123');
insert into T_STUDENT (SNO, PWD, SNAME, PHONE, GENDER, BIRTH, CLAZZNO, REMARK)
values (1220, '123', 'zhangsan999', '123999', '男', to_date('23-08-2017', 'dd-mm-yyyy'), 1, '123');
commit;
prompt 1003 records loaded
prompt Loading T_TEACHER...
insert into T_TEACHER (TNO, TNAME, PWD, PHONE, HIREDATE, REMARK)
values (1, '李老师', '123', '123456', to_date('21-08-2017', 'dd-mm-yyyy'), '帅哥');
insert into T_TEACHER (TNO, TNAME, PWD, PHONE, HIREDATE, REMARK)
values (2, '刘老师', '123', '123456', to_date('21-08-2017', 'dd-mm-yyyy'), '帅哥');
insert into T_TEACHER (TNO, TNAME, PWD, PHONE, HIREDATE, REMARK)
values (3, '王老师', '123', '123456', to_date('21-08-2017', 'dd-mm-yyyy'), '帅哥');
insert into T_TEACHER (TNO, TNAME, PWD, PHONE, HIREDATE, REMARK)
values (4, '张老师', '123', '123456', to_date('21-08-2017', 'dd-mm-yyyy'), '帅哥');
insert into T_TEACHER (TNO, TNAME, PWD, PHONE, HIREDATE, REMARK)
values (5, '赵老师', '123', '123456', to_date('21-08-2017', 'dd-mm-yyyy'), '帅哥');
insert into T_TEACHER (TNO, TNAME, PWD, PHONE, HIREDATE, REMARK)
values (102, '喻老师', '123', '12345678', to_date('23-08-2017', 'dd-mm-yyyy'), '我是一个好人');
commit;
prompt 6 records loaded
prompt Loading T_SC...
insert into T_SC (SNO, CNO, TNO, SCORE)
values (221, 2, 1, 4);
insert into T_SC (SNO, CNO, TNO, SCORE)
values (1240, 110, 102, 5);
insert into T_SC (SNO, CNO, TNO, SCORE)
values (221, 1, 1, 4);
commit;
prompt 3 records loaded
prompt Loading T_TC...
insert into T_TC (CNO, TNO)
values (1, 1);
insert into T_TC (CNO, TNO)
values (1, 102);
insert into T_TC (CNO, TNO)
values (2, 1);
insert into T_TC (CNO, TNO)
values (3, 1);
insert into T_TC (CNO, TNO)
values (4, 1);
insert into T_TC (CNO, TNO)
values (5, 1);
insert into T_TC (CNO, TNO)
values (109, 102);
insert into T_TC (CNO, TNO)
values (110, 102);
commit;
prompt 8 records loaded
set feedback on
set define on
prompt Done.
