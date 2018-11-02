-----命令方式创建库、 表、 插入记录、外键约束-------------------------------
CREATE DATABASE qpgl
ON PRIMARY
(NAME=qpgl,
 FILENAME='D:\Data\qpgl_data.mdf'
)
LOG ON
(NAME=qpgl_log,
 FILENAME='D:\Data\qpgl_log.ldf')
 GO
 USE qpgl
 GO
CREATE TABLE customer
(cust_id char(6) NOT NULL CONSTRAINT PK_CUST PRIMARY KEY,
 cust_name nvarchar(60) NOT NULL,
 contacts nchar(10)NOT NULL,
 sex bit  NULL,
 age tinyint  NULL,
 address  nvarchar(80) NOT NULL,
 cellphone char(15) NOT NULL,
 telephone char(15)  NULL,
 bank nvarchar(60) NOT NULL,
 acct char(20) NOT NULL,
 E_mail char(20) NOT NULL,
 tex char(20)NOT NULL
)
GO
--创建配件表product prod
CREATE TABLE product
(prod_id char(8) NOT NULL CONSTRAINT PK_PROD PRIMARY KEY,
 prod_name NVARCHAR(40) NOT NULL,
 type char(20) NOT NULL,
 mfr  NVARCHAR(60) NULL,
 place NVARCHAR(40) NULL
) 
GO
USE qpgl
GO
--创建销售表sale s_
CREATE TABLE sale
(cust_id char(6) NOT NULL CONSTRAINT PK_SALE PRIMARY KEY(cust_id,prod_id) 
                           CONSTRAINT FK_s1 FOREIGN KEY REFERENCES customer(cust_id),
 prod_id char(8) NOT NULL CONSTRAINT FK_s2 FOREIGN KEY REFERENCES product(prod_id),
 s_amt int NOT NULL,
 s_price decimal(8,2) NOT NULL,
 s_date smalldatetime NOT NULL,
 
)
GO
USE qpgl
GO
--创建供货商表supplier sup
CREATE TABLE supplier
( sup_id char(6) NOT NULL CONSTRAINT PK_SUP  PRIMARY KEY , 
  sup_name NVARCHAR(60) NOT NULL,
  main_prod NVARCHAR(60) NOT NULL,
  sup_addr NVARCHAR(80) NOT NULL,
  sup_cell char(15) NULL,
  sup_tel char(15)  NOT NULL,
  sup_bank NVARCHAR(60)NOT NULL,
  sup_acct char(20) NULL,
  sup_Email char(30) NOT NULL
)
GO
USE qpgl
GO
--创建库存表stock 
CREATE TABLE stock
(prod_id char(8) NOT NULL CONSTRAINT PK_STOCK PRIMARY KEY(prod_id,sup_id)            
                          CONSTRAINT FK_st1 FOREIGN KEY REFERENCES product(prod_id),
 sup_id char(6) NOT NULL CONSTRAINT FK_st2 FOREIGN KEY REFERENCES supplier(sup_id),
 purchase_date smalldatetime NOT NULL,
 purchase_price decimal(8,2) NOT NULL,
 s_price int NOT NULL
)
GO

--插入记录
--插入表customer记录
USE qpgl
GO
INSERT INTO customer VALUES
('101','十堰市海峻工贸有限公司','丁广峰',1,26,'十堰市白浪汽配1栋1018号城大明C区','13986898779','0719-8410490','十堰农商行汽配城支行','82010000000616470','13986898779@126.com','420302591450133'),
('102','十堰永兰工贸有限公司','张永兰',0,36,'十堰泰安巷5号1-101市茅箭区武当路','13508680001','0719-8329356','十堰市农商行武当路支行','82010000000616234','8329356@qq.com','420302591367239')
INSERT INTO customer VALUES
('103','湖北腾鼎工贸有限公司','韩总',1,36,'湖北省十堰市白浪汽配城顺发精品园3017-3018号','15171368989','0719-8312110','十堰市工商银行','420382000231415','793673105@qq.com ','420382001234567'),
('104','湖北硕泽工贸有限公司','梁经理',1,25,'十堰市茅箭区天津路48号','15549950282','0719-8363116','十堰市建设银行白浪支行','40113872817619','807613246@qq.com','40113872813456'),
('105','湖北耀盈工贸有限公司','许玲',0,40,'十堰市茅箭区柳林路13号1幢3-3','13971950789','0719-8123777','十堰市建设银行三堰支行','420302000116314','59789@qq.com','91420302MA48W9HP3Y'),
('106','十堰永丽玮工贸有限公司','史中义',1,22,'湖北省十堰市茅箭区白浪汽配城银桥区16号','13593740499','0719-8319329','十堰市建设银行白浪支行','420382000719342','539971756@qq.com','420382000719323'),
('107','湖北联合贯达工贸有限公司','胡经理',1,35,'十堰白浪汽配城振亚201号','18942181079','0719-8318908','十堰市工商银行','420382000038199','qpsc888@163.com','420382000023566'),
('301','十堰越帮商贸有限公司','李总',1,18,'十堰市郧阳区城关镇沿江大道63号（香港花园）15栋7-401','13971920777','0719-3787999','十堰市工商银行红卫支行','0302011810102583797','3787999@qq.com','420302591450132'),
('501','丹江口市合鼎机械制造有限公司','刘经理',1,33,'丹江口市新港大道以东（电网旁)','13669098820','0719-8025568','十堰市农商行丹江支行','40513669098820','285225371@163.com','40513669034256'),
('701','房县劝都商贸有限公司','郝总',1,31,'房县城关镇西街63号','13425778973','0719-4356323','十堰市农商行房县支行','40513663327712','4356323@qq.com','40513663323565'
)
--插入表product记录
INSERT INTO product VALUES
('fdj001','康明斯发动机总成','6LTAA8.9-GM200','东风康明斯发动机有限公司','湖北襄阳'),
('fdj002','东风康明斯发动机总成','6BTAA5.9','东风康明斯发动机有限公司','湖北襄阳'),
('fdj003','东风康明斯发动机总成','ISLe8.9L/ISL315 50','东风康明斯发动机有限公司','湖北襄阳'),
('fdj004','东风天龙燃油泵康明斯燃油泵','3973228','东风康明斯发动机有限公司','湖北襄阳'),
('fdj005 ','福田康明斯ISG缸垫','3695880','北京福田康明斯发动机有限公司','北京市'),
('fdj006','玉柴动力发动机总成','YC4E160-33','玉柴联合动力股份有限公司','安徽芜湖'),
('fdj007','福田康明斯ISF2.8发动机总成','ISF2.8/ISF3.8','北京福田康明斯发电机有限公司','北京市'),
('kqlqq001','空气滤清器（上海弗列加）','AA2948','上海弗列加滤清器有限公司','上海市'),
('kqlqq002','东风康明斯空气滤芯连接支架','C4932594','东风康明斯发动机有限公司','湖北襄阳'),
('kqlqq003','康明斯发电机组空滤总成','6BTA5.9-G2','十堰东方赛琦国际贸易有限公司','湖北十堰'),
('kqlqq004','玉柴YK3048U空气滤芯','2960/YK3048U ','广西玉柴机器股份有限公司','广西玉林'),
('kqlqq005','东风天龙340P重卡空气滤清器弗列加滤清器','AA2960/PU3050','十堰原始设备制造商OEM','湖北十堰'),
('kqlqq006','道依茨空气滤清器','01180867/01180872','十堰市恩同汽车部件有限公司syenter','湖北十堰'),
('kqlqq007','玉柴淮柴南充发动机高压过滤器','M2A00-1107100614','广西玉柴机器股份有限公司','广西玉林'),
('lhq001','东风天龙出口专用硅油风扇带离合器总成','1308060-T0901','雪龙集团股份有限公司','浙江宁波'),
('lhq002','离合器分离轮承','360111','东风(十堰)发动机部件有限公司','湖北十堰'),
('lhq003','东风商用车离合器盖及压盘','1601DS300-090','东风康明斯发动机有限公司','湖北襄阳'),
('lhq004','东风天锦离合器助力器总成','1608010-K91M0','苏州东风汽车离合器有限公司','江苏苏州'),
('lhq005','法士特变速箱离合器分离拨叉','J75-1601026-1','陕西法士特集团公司','陕西西安'),
('lhq006','东风雷诺（国4）风扇带硅油离合器总成','1308060-T68M0','东风商用车公司','湖北十堰'),
('lhq007','苏州圆菱Dci雷诺离合器盖和压盘总成','1601090-AB601','苏州圆菱离合器有限公司','江苏苏州')

--插入表supplier记录
INSERT INTO supplier VALUES
('gys001','东风（十堰）有色铸件有限公司','有色金属压铸件','湖北十堰','NULL','0719-8208828','工商银行','420300000137809','8208828@qq.com'),
('gys002','东风康明斯发动机有限公司','柴油发动机','湖北襄阳','NULL','0710-3399192','建设银行','420000400003968','NULL'),
('gys003','北京福田康明斯发动机有限公司','柴油发动机','北京市','NULL','010-80736008','农业银行','110000450029190 ','qing.liang@cummins.com '),
('gys004','玉柴联合动力股份有限公司','发动机','安徽芜湖','NULL','0553-7528516','建设银行','340200000078043','yc6kzp@kengine.cn'),
('gys005','上海弗列加滤清器有限公司','空气滤清器','上海市','NULL','021-58657950','工商银行','310115400019321','mao.hawk@cummis.com'),
('gys006','十堰东方赛琦国际贸易有限公司','空气滤清器','湖北十堰','NULL','0719-8316730','工商银行','914203007068282999','Dongfangsaiqi2008@163.com'),
('gys007','广西玉柴机器股份有限公司','发动机','广西玉林','NULL','0775-3289000','工商银行','91450900619723149','sales@yuchai.cn'),
('gys008','十堰原始设备制造商','汽车零部件','湖北十堰','NULL','071210333','农业银行','91420300060695094','NULL'),
('gys009','十堰市恩同汽车部件有限公司','汽车零部件','湖北十堰','NULL','0719-8120213','工商银行','91420300060695094H','NULL'),
('gys010','雪龙集团股份有限公司','汽车模具','浙江宁波','NULL','0574-86805201','建设银行','91330200734267003','hclin@xuelong.net.cn'),
('gys011','东风（十堰）发动机部件有限公司','发动机','湖北十堰','13177480268','0719-8235157','工商银行','91420300878707397','NULL'),
('gys012','苏州东风汽车离合器有限公司','离合器','江苏苏州','NULL','0512-65333193','建设银行','320594000338277','szjc-xiejun@dfl.com.cn'),
('gys013','陕西法士特集团公司','齿轮','陕西西安','NULL','400-889-9901','工商银行','400889990188','sale@chinafastgear.com'),
('gys014','东风商用车公司','汽车零部件','湖北十堰','NULL','0719-8885555','建设银行','420300000165152','dongfeng@dfcv.com.cn'),
('gys015','苏州圆菱离合器有限公司','离合器','江苏苏州','181511111234','0512-68818111','工商银行','621537437898126','181511111234@qq.com')

--插入表stock记录
INSERT INTO stock VALUES('fdj001','gys002','2018-03-03 00:00:00',33000.00,5),
('fdj002','gys002','2018-03-06 00:00:00',40700.00,5),
('fdj003','gys002','2018-03-08 00:00:00',50435.00,2),
('fdj005','gys003','2018-03-13 00:00:00',462.00,200),
('fdj007','gys003','2018-03-16 00:00:00',33000.00,5),
('kqlqq001','gys005','2018-03-10 00:00:00',198.00,500),
('kqlqq003','gys006','2018-03-10 00:00:00',572.00,200),
('kqlqq004','gys007','2018-03-08 00:00:00',226.00,300),
('kqlqq005','gys008','2018-03-14 00:00:00',205.00,350),
('kqlqq007','gys009','2018-03-16 00:00:00',315.00,400),
('lhq004','gys012','2018-03-16 00:00:00',198.00,500),
('lhq005','gys013','2018-03-19 00:00:00',53.00,800)

--插入表sale记录
USE qpgl
GO

INSERT INTO sale VALUES
('101','fdj001',3,36300.00,'2018-04-02 00:00:00'),
--('101','xjc001 ','1','150000.00','2018-09-10 00:00:00'),
('102','fdj002',3,44770.00,'2018-04-03 00:00:00'),
('105','fdj003',1,55500.00,'2018-04-06 00:00:00'),
('105','fdj005',100,510.00,'2018-04-06 00:00:00'),
('105','fdj007',3,36350.00,'2018-04-08 00:00:00'),
('107','lhq004',100,218.00,'2018-04-12 00:00:00'),
('107','lhq005',50,58.00,'2018-04-18 00:00:00'),
('301','kqlqq001',220,218.00,'2018-04-09 00:00:00'),
('501','kqlqq003',110,630.00,'2018-04-10 00:00:00'),
('701','kqlqq005',50,200.00,'2018-04-10 00:00:00')

----实体完整性
--	--标识属性
--	  ALTER TABLE sale add  sale_id INT IDENTITY(1,1) NOT NULL
--	  ALTER TABLE sale DROP COLUMN sale_id
	
----域的完整性
----1.定义列的数据类型 
--  --在product表里增加一个字段 颜色color
   
----2.非空属性
--  --在product表里增加一个字段 是否热销 hotSale

----3.默认值
--ALTER TABLE product ADD  hotSale  bit CONSTRAINT DF_rx DEFAULT(0)
--ALTER TABLE product ADD  hotSale  nchar(2) CONSTRAINT DF_rx DEFAULT('是')
--INSERT INTO product VALUES
--('fdj013','康明斯发动机总成','6LTAA8.9-GM200','东风康明斯发动机有限公司','湖北襄阳','' )


--ALTER TABLE product DROP CONSTRAINT DF_rx
--ALTER TABLE product DROP COLUMN hotSale
--USE qpglDemo
--GO
----4.CHECK  约束
--检验库存数量不能小于2
----ALTER COLUMN s_amt
--ALTER TABLE stock   ADD CONSTRAINT CK_amt CHECK(s_amt>=2)


----域完整性
------添加一个字段“是否热销”
----分析
--1.修改数据表，添加字段 hotSale
--2.添加约束 -默认值约束
--3.运行代码
--4.检查是否成功
--ALTER TABLE product ADD hotSale NCHAR(2) CONSTRAINT DF_hot DEFAULT('是')
----删除约束 
----删除字段
--ALTER TABLE product DROP CONSTRAINT DF_hot
--ALTER TABLE product DROP COLUMN hotSale
--INSERT INTO product VALUES
--('lhq008','康明斯发动机总成','6LTAA8.9-GM200','东风康明斯发动机有限公司','湖北襄阳',' ')
--DELETE FROM product WHERE prod_id='lhq008'

----参照完整性
----第一步：主表里设好主键
----第二步：在从表里设置外键
----思考：在创建表的时候设置主键
--采购意向（purList）
--CREATE TABlE purList(pl_id char(6) not null PRIMARY KEY,
--                     cust_id  char(6) not null CONSTRAINT FK_c REFERENCES customer(cust_id)
--					 )


