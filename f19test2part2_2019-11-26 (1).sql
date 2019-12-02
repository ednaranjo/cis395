# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Database: f19test2part2
# Generation Time: 2019-11-27 04:12:09 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authors`;

CREATE TABLE `authors` (
  `aut_id` varchar(6) NOT NULL,
  `aut_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`aut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;

INSERT INTO `authors` (`aut_id`, `aut_name`)
VALUES
	('AUT001','Author1'),
	('AUT002','Author2'),
	('AUT003','Author3'),
	('AUT004','Author4'),
	('AUT005','Author5'),
	('AUT006','Author6'),
	('AUT007','Author7'),
	('AUT008','Author8'),
	('AUT009','Author9'),
	('AUT010','Author10'),
	('AUT011','Author11'),
	('AUT012','Author12'),
	('AUT013','Author13'),
	('AUT014','Author14'),
	('AUT015','Author15');

/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table book_mast
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_mast`;

CREATE TABLE `book_mast` (
  `book_id` varchar(5) NOT NULL,
  `book_name` varchar(40) DEFAULT NULL,
  `isbn_no` varchar(12) DEFAULT NULL,
  `cate_id` varchar(5) DEFAULT NULL,
  `aut_id` varchar(6) DEFAULT NULL,
  `pub_id` varchar(4) DEFAULT NULL,
  `dt_of_pub` varchar(10) DEFAULT NULL,
  `pub_lang` varchar(20) DEFAULT NULL,
  `no_page` int(11) DEFAULT NULL,
  `book_price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `cate_id` (`cate_id`),
  KEY `aut_id` (`aut_id`),
  KEY `pub_id` (`pub_id`),
  CONSTRAINT `book_mast_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`cate_id`),
  CONSTRAINT `book_mast_ibfk_2` FOREIGN KEY (`aut_id`) REFERENCES `authors` (`aut_id`),
  CONSTRAINT `book_mast_ibfk_3` FOREIGN KEY (`pub_id`) REFERENCES `publisher` (`pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `book_mast` WRITE;
/*!40000 ALTER TABLE `book_mast` DISABLE KEYS */;

INSERT INTO `book_mast` (`book_id`, `book_name`, `isbn_no`, `cate_id`, `aut_id`, `pub_id`, `dt_of_pub`, `pub_lang`, `no_page`, `book_price`)
VALUES
	('BK001','Introduction to Electrodynamics','0000979001','CA001','AUT001','P003','2001-05-08','English',201,85.00),
	('BK002','Understanding of Steel Construction','0000979002','CA002','AUT002','P001','2003-07-15','English',300,105.50),
	('BK003','Guide to Networking','0000979003','CA003','AUT003','P002','2002-09-10','Hindi',510,200.00),
	('BK004','Transfer of Heat and Mass','0000979004','CA002','AUT004','P004','2004-02-16','English',600,250.00),
	('BK005','Conceptual Physics','0000979005','CA001','AUT005','P006','2003-07-16',NULL,345,145.00),
	('BK006','Fundamentals of Heat','0000979006','CA001','AUT006','P005','2003-08-10','German',247,112.00),
	('BK007','Advanced 3d Graphics','0000979007','CA003','AUT007','P002','2004-02-16','Hindi',165,56.00),
	('BK008','Human Anatomy','0000979008','CA005','AUT008','P006','2001-05-17','German',88,50.50),
	('BK009','Mental Health Nursing','0000979009','CA005','AUT009','P007','2004-02-10','English',350,145.00),
	('BK010','Fundamentals of Thermodynamics','0000979010','CA002','AUT010','P007','2002-10-14','English',400,225.00),
	('BK011','The Experimental Analysis of Cat','0000979011','CA004','AUT011','P005','2007-06-09','French',225,95.00),
	('BK012','The Nature  of World','0000979012','CA004','AUT005','P008','2005-12-20','English',350,88.00),
	('BK013','Environment a Sustainable Future','0000979013','CA004','AUT012','P001','2003-10-27','German',165,100.00),
	('BK014','Concepts in Health','0000979014','CA005','AUT013','P004','2001-08-25',NULL,320,180.00),
	('BK015','Anatomy & Physiology','0000979015','CA005','AUT014','P008','2000-10-10','Hindi',225,135.00),
	('BK016','Networks and Telecommunications','00009790_16','CA003','AUT015','P003','2002-01-01','French',95,45.00);

/*!40000 ALTER TABLE `book_mast` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `cate_id` varchar(5) NOT NULL,
  `category_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`cate_id`, `category_name`)
VALUES
	('CA001','Physics'),
	('CA002','Thermodynamics'),
	('CA003','Computer Science'),
	('CA004','Natural Science'),
	('CA005','Nursing');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `country_id` varchar(2) NOT NULL,
  `country_name` varchar(30) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `countries_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;

INSERT INTO `countries` (`country_id`, `country_name`, `region_id`)
VALUES
	('AR','Argentina',2),
	('AU','Australia',3),
	('BE','Belgium',1),
	('BR','Brazil',2),
	('CA','Canada',2),
	('CH','Switzerland',1),
	('CN','China',3),
	('DE','Germany',1),
	('DK','Denmark',1),
	('EG','Egypt',4),
	('FR','France',1),
	('HK','HongKong',3),
	('IL','Israel',4),
	('IN','India',3),
	('IT','Italy',1),
	('JP','Japan',3),
	('KW','Kuwait',4),
	('MX','Mexico',2),
	('NG','Nigeria',4),
	('NL','Netherlands',1),
	('SG','Singapore',3),
	('UK','United Kingd',1),
	('US','United State',2),
	('ZM','Zambia',4),
	('ZW','Zimbabwe',4);

/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table departments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `DEPARTMENT_ID` varchar(4) NOT NULL,
  `DEPARTMENT_NAME` varchar(30) DEFAULT NULL,
  `MANAGER_ID` varchar(4) DEFAULT NULL,
  `LOCATION_ID` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`DEPARTMENT_ID`),
  KEY `LOCATION_ID` (`LOCATION_ID`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;

INSERT INTO `departments` (`DEPARTMENT_ID`, `DEPARTMENT_NAME`, `MANAGER_ID`, `LOCATION_ID`)
VALUES
	('10','Administration','200','1700'),
	('100','Finance','108','1700'),
	('110','Accounting','205','1700'),
	('120','Treasury ','-','1700'),
	('130','Corporate Tax','-','1700'),
	('140','Control And Credit','-','1700'),
	('150','Shareholder Services','-','1700'),
	('160','Benefits','-','1700'),
	('170','Manufacturing','-','1700'),
	('180','Construction','-','1700'),
	('190','Contracting','-','1700'),
	('20','Marketing','201','1800'),
	('200','Operations','-','1700'),
	('210','IT Support','-','1700'),
	('220','NOC','-','1700'),
	('230','IT Helpdesk','-','1700'),
	('240','Government Sales','-','1700'),
	('250','Retail Sales','-','1700'),
	('260','Recruiting','-','1700'),
	('270','Payroll','-','1700'),
	('30','Purchasing','114','1700'),
	('40','Human Resources','203','2400'),
	('50','Shipping','121','1500'),
	('60','IT','103','1400'),
	('70','Public Relations','204','2700'),
	('80','Sales','145','2500'),
	('90','Executive','100','1700');

/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table employees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `EMPLOYEE_ID` varchar(4) NOT NULL,
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(20) DEFAULT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` varchar(20) DEFAULT NULL,
  `JOB_ID` varchar(12) DEFAULT NULL,
  `SALARY` decimal(6,0) DEFAULT NULL,
  `COMMISSION_PCT` decimal(3,2) DEFAULT NULL,
  `MANAGER_ID` varchar(4) DEFAULT NULL,
  `DEPARTMENT_ID` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  KEY `JOB_ID` (`JOB_ID`),
  KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`JOB_ID`) REFERENCES `jobs` (`JOB_ID`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `departments` (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;

INSERT INTO `employees` (`EMPLOYEE_ID`, `FIRST_NAME`, `last_name`, `EMAIL`, `PHONE_NUMBER`, `HIRE_DATE`, `JOB_ID`, `SALARY`, `COMMISSION_PCT`, `MANAGER_ID`, `DEPARTMENT_ID`)
VALUES
	('100','Steven','King','SKING','515.123.4567','17-Jun-87','AD_PRES',24000,NULL,'','90'),
	('101','Neena','Kochhar','NKOCHHAR','515.123.4568','21-Sep-89','AD_VP',17000,NULL,'100','90'),
	('102','Lex','De Haan','LDEHAAN','515.123.4569','13-Jan-93','AD_VP',17000,NULL,'100','90'),
	('103','Alexander','Hunold','AHUNOLD','590.423.4567','3-Jan-90','IT_PROG',9000,NULL,'102','60'),
	('104','Bruce','Ernst','BERNST','590.423.4568','21-May-91','IT_PROG',6000,NULL,'103','60'),
	('105','David','Austin','DAUSTIN','590.423.4569','25-Jun-97','IT_PROG',4800,NULL,'103','60'),
	('106','Valli','Pataballa','VPATABAL','590.423.4560','5-Feb-98','IT_PROG',4800,NULL,'103','60'),
	('107','Diana','Lorentz','DLORENTZ','590.423.5567','7-Feb-99','IT_PROG',4200,NULL,'103','60'),
	('108','Nancy','Greenberg','NGREENBE','515.124.4569','17-Aug-94','FI_MGR',12000,NULL,'101','100'),
	('109','Daniel','Faviet','DFAVIET','515.124.4169','16-Aug-94','FI_ACCOUNT',9000,NULL,'108','100'),
	('110','John','Chen','JCHEN','515.124.4269','28-Sep-97','FI_ACCOUNT',8200,NULL,'108','100'),
	('111','Ismael','Sciarra','ISCIARRA','515.124.4369','30-Sep-97','FI_ACCOUNT',7700,NULL,'108','100'),
	('112','Jose Manuel','Urman','JMURMAN','515.124.4469','7-Mar-98','FI_ACCOUNT',7800,NULL,'108','100'),
	('113','Luis','Popp','LPOPP','515.124.4567','7-Dec-99','FI_ACCOUNT',6900,NULL,'108','100'),
	('114','Den','Raphaely','DRAPHEAL','515.127.4561','7-Dec-94','PU_MAN',11000,NULL,'100','30'),
	('115','Alexander','Khoo','AKHOO','515.127.4562','18-May-95','PU_CLERK',3100,NULL,'114','30'),
	('116','Shelli','Baida','SBAIDA','515.127.4563','24-Dec-97','PU_CLERK',2900,NULL,'114','30'),
	('117','Sigal','Tobias','STOBIAS','515.127.4564','24-Jul-97','PU_CLERK',2800,NULL,'114','30'),
	('118','Guy','Himuro','GHIMURO','515.127.4565','15-Nov-98','PU_CLERK',2600,NULL,'114','30'),
	('119','Karen','Colmenares','KCOLMENA','515.127.4566','10-Aug-99','PU_CLERK',2500,NULL,'114','30'),
	('120','Matthew','Weiss','MWEISS','650.123.1234','18-Jul-96','ST_MAN',8000,NULL,'100','50'),
	('121','Adam','Fripp','AFRIPP','650.123.2234','10-Apr-97','ST_MAN',8200,NULL,'100','50'),
	('122','Payam','Kaufling','PKAUFLIN','650.123.3234','1-May-95','ST_MAN',7900,NULL,'100','50'),
	('123','Shanta','Vollman','SVOLLMAN','650.123.4234','10-Oct-97','ST_MAN',6500,NULL,'100','50'),
	('124','Kevin','Mourgos','KMOURGOS','650.123.5234','16-Nov-99','ST_MAN',5800,NULL,'100','50'),
	('125','Julia','Nayer','JNAYER','650.124.1214','16-Jul-97','ST_CLERK',3200,NULL,'120','50'),
	('126','Irene','Mikkilineni','IMIKKILI','650.124.1224','28-Sep-98','ST_CLERK',2700,NULL,'120','50'),
	('127','James','Landry','JLANDRY','650.124.1334','14-Jan-99','ST_CLERK',2400,NULL,'120','50'),
	('128','Steven','Markle','SMARKLE','650.124.1434','8-Mar-00','ST_CLERK',2200,NULL,'120','50'),
	('129','Laura','Bissot','LBISSOT','650.124.5234','20-Aug-97','ST_CLERK',3300,NULL,'121','50'),
	('130','Mozhe','Atkinson','MATKINSO','650.124.6234','30-Oct-97','ST_CLERK',2800,NULL,'121','50'),
	('131','James','Marlow','JAMRLOW','650.124.7234','16-Feb-97','ST_CLERK',2500,NULL,'121','50'),
	('132','TJ','Olson','TJOLSON','650.124.8234','10-Apr-99','ST_CLERK',2100,NULL,'121','50'),
	('133','Jason','Mallin','JMALLIN','650.127.1934','14-Jun-96','ST_CLERK',3300,NULL,'122','50'),
	('134','Michael','Rogers','MROGERS','650.127.1834','26-Aug-98','ST_CLERK',2900,NULL,'122','50'),
	('135','Ki','Gee','KGEE','650.127.1734','12-Dec-99','ST_CLERK',2400,NULL,'122','50'),
	('136','Hazel','Philtanker','HPHILTAN','650.127.1634','6-Feb-00','ST_CLERK',2200,NULL,'122','50'),
	('137','Renske','Ladwig','RLADWIG','650.121.1234','14-Jul-95','ST_CLERK',3600,NULL,'123','50'),
	('138','Stephen','Stiles','SSTILES','650.121.2034','26-Oct-97','ST_CLERK',3200,NULL,'123','50'),
	('139','John','Seo','JSEO','650.121.2019','12-Feb-98','ST_CLERK',2700,NULL,'123','50'),
	('140','Joshua','Patel','JPATEL','650.121.1834','6-Apr-98','ST_CLERK',2500,NULL,'123','50'),
	('141','Trenna','Rajs','TRAJS','650.121.8009','17-Oct-95','ST_CLERK',3500,NULL,'124','50'),
	('142','Curtis','Davies','CDAVIES','650.121.2994','29-Jan-97','ST_CLERK',3100,NULL,'124','50'),
	('143','Randall','Matos','RMATOS','650.121.2874','15-Mar-98','ST_CLERK',2600,NULL,'124','50'),
	('144','Peter','Vargas','PVARGAS','650.121.2004','9-Jul-98','ST_CLERK',2500,NULL,'124','50'),
	('145','John','Russell','JRUSSEL','011.44.1344.429','1-Oct-96','SA_MAN',14000,0.40,'100','80'),
	('146','Karen','Partners','KPARTNER','011.44.1344.467','5-Jan-97','SA_MAN',13500,0.30,'100','80'),
	('147','Alberto','Errazuriz','AERRAZUR','011.44.1344.429','10-Mar-97','SA_MAN',12000,0.30,'100','80'),
	('148','Gerald','Cambrault','GCAMBRAU','011.44.1344.619','15-Oct-99','SA_MAN',11000,0.30,'100','80'),
	('149','Eleni','Zlotkey','EZLOTKEY','011.44.1344.429','29-Jan-00','SA_MAN',10500,0.20,'100','80'),
	('150','Peter','Tucker','PTUCKER','011.44.1344.129','30-Jan-97','SA_REP',10000,0.30,'145','80'),
	('151','David','Bernstein','DBERNSTE','011.44.1344.345','24-Mar-97','SA_REP',9500,0.25,'145','80'),
	('152','Peter','Hall','PHALL','011.44.1344.478','20-Aug-97','SA_REP',9000,0.25,'145','80'),
	('153','Christopher','Olsen','COLSEN','011.44.1344.498','30-Mar-98','SA_REP',8000,0.20,'145','80'),
	('154','Nanette','Cambrault','NCAMBRAU','011.44.1344.987','9-Dec-98','SA_REP',7500,0.20,'145','80'),
	('155','Oliver','Tuvault','OTUVAULT','011.44.1344.486','23-Nov-99','SA_REP',7000,0.15,'145','80'),
	('156','Janette','King','JKING','011.44.1345.429','30-Jan-96','SA_REP',10000,0.35,'146','80'),
	('157','Patrick','Sully','PSULLY','011.44.1345.929','4-Mar-96','SA_REP',9500,0.35,'146','80'),
	('158','Allan','McEwen','AMCEWEN','011.44.1345.829','1-Aug-96','SA_REP',9000,0.35,'146','80'),
	('159','Lindsey','Smith','LSMITH','011.44.1345.729','10-Mar-97','SA_REP',8000,0.30,'146','80'),
	('160','Louise','Doran','LDORAN','011.44.1345.629','15-Dec-97','SA_REP',7500,0.30,'146','80'),
	('161','Sarath','Sewall','SSEWALL','011.44.1345.529','3-Nov-98','SA_REP',7000,0.25,'146','80'),
	('162','Clara','Vishney','CVISHNEY','011.44.1346.129','11-Nov-97','SA_REP',10500,0.25,'147','80'),
	('163','Danielle','Greene','DGREENE','011.44.1346.229','19-Mar-99','SA_REP',9500,0.15,'147','80'),
	('164','Mattea','Marvins','MMARVINS','011.44.1346.329','24-Jan-00','SA_REP',7200,0.10,'147','80'),
	('165','David','Lee','DLEE','011.44.1346.529','23-Feb-00','SA_REP',6800,0.10,'147','80'),
	('166','Sundar','Ande','SANDE','011.44.1346.629','24-Mar-00','SA_REP',6400,0.10,'147','80'),
	('167','Amit','Banda','ABANDA','011.44.1346.729','21-Apr-00','SA_REP',6200,0.10,'147','80'),
	('168','Lisa','Ozer','LOZER','011.44.1343.929','11-Mar-97','SA_REP',11500,0.25,'148','80'),
	('169','Harrison','Bloom','HBLOOM','011.44.1343.829','23-Mar-98','SA_REP',10000,0.20,'148','80'),
	('170','Tayler','Fox','TFOX','011.44.1343.729','24-Jan-98','SA_REP',9600,0.20,'148','80'),
	('171','William','Smith','WSMITH','011.44.1343.629','23-Feb-99','SA_REP',7400,0.15,'148','80'),
	('172','Elizabeth','Bates','EBATES','011.44.1343.529','24-Mar-99','SA_REP',7300,0.15,'148','80'),
	('173','Sundita','Kumar','SKUMAR','011.44.1343.329','21-Apr-00','SA_REP',6100,0.10,'148','80'),
	('174','Ellen','Abel','EABEL','011.44.1644.429','11-May-96','SA_REP',11000,0.30,'149','80'),
	('175','Alyssa','Hutton','AHUTTON','011.44.1644.429','19-Mar-97','SA_REP',8800,0.25,'149','80'),
	('176','Jonathon','Taylor','JTAYLOR','011.44.1644.429','24-Mar-98','SA_REP',8600,0.20,'149','80'),
	('177','Jack','Livingston','JLIVINGS','011.44.1644.429','23-Apr-98','SA_REP',8400,0.20,'149','80'),
	('178','Kimberely','Grant','KGRANT','011.44.1644.429263','24-May-99','SA_REP',7000,0.15,'149',NULL),
	('179','Charles','Johnson','CJOHNSON','011.44.1644.429','4-Jan-00','SA_REP',6200,0.10,'149','80'),
	('180','Winston','Taylor','WTAYLOR','650.507.9876','24-Jan-98','SH_CLERK',3200,NULL,'120','50'),
	('181','Jean','Fleaur','JFLEAUR','650.507.9877','23-Feb-98','SH_CLERK',3100,NULL,'120','50'),
	('182','Martha','Sullivan','MSULLIVA','650.507.9878','21-Jun-99','SH_CLERK',2500,NULL,'120','50'),
	('183','Girard','Geoni','GGEONI','650.507.9879','3-Feb-00','SH_CLERK',2800,NULL,'120','50'),
	('184','Nandita','Sarchand','NSARCHAN','650.509.1876','27-Jan-96','SH_CLERK',4200,NULL,'121','50'),
	('185','Alexis','Bull','ABULL','650.509.2876','20-Feb-97','SH_CLERK',4100,NULL,'121','50'),
	('186','Julia','Dellinger','JDELLING','650.509.3876','24-Jun-98','SH_CLERK',3400,NULL,'121','50'),
	('187','Anthony','Cabrio','ACABRIO','650.509.4876','7-Feb-99','SH_CLERK',3000,NULL,'121','50'),
	('188','Kelly','Chung','KCHUNG','650.505.1876','14-Jun-97','SH_CLERK',3800,NULL,'122','50'),
	('189','Jennifer','Dilly','JDILLY','650.505.2876','13-Aug-97','SH_CLERK',3600,NULL,'122','50'),
	('190','Timothy','Gates','TGATES','650.505.3876','11-Jul-98','SH_CLERK',2900,NULL,'122','50'),
	('191','Randall','Perkins','RPERKINS','650.505.4876','19-Dec-99','SH_CLERK',2500,NULL,'122','50'),
	('192','Sarah','Bell','SBELL','650.501.1876','4-Feb-96','SH_CLERK',4000,NULL,'123','50'),
	('193','Britney','Everett','BEVERETT','650.501.2876','3-Mar-97','SH_CLERK',3900,NULL,'123','50'),
	('194','Samuel','McCain','SMCCAIN','650.501.3876','1-Jul-98','SH_CLERK',3200,NULL,'123','50'),
	('195','Vance','Jones','VJONES','650.501.4876','17-Mar-99','SH_CLERK',2800,NULL,'123','50'),
	('196','Alana','Walsh','AWALSH','650.507.9811','24-Apr-98','SH_CLERK',3100,NULL,'124','50'),
	('197','Kevin','Feeney','KFEENEY','650.507.9822','23-May-98','SH_CLERK',3000,NULL,'124','50'),
	('198','Donald','OConnell','DOCONNEL','650.507.9833','21-Jun-99','SH_CLERK',2600,NULL,'124','50'),
	('199','Douglas','Grant','DGRANT','650.507.9844','13-Jan-00','SH_CLERK',2600,NULL,'124','50'),
	('200','Jennifer','Whalen','JWHALEN','515.123.4444','17-Sep-87','AD_ASST',4400,NULL,'101','10'),
	('201','Michael','Hartstein','MHARTSTE','515.123.5555','17-Feb-96','MK_MAN',13000,NULL,'100','20'),
	('202','Pat','Fay','PFAY','603.123.6666','17-Aug-97','MK_REP',6000,NULL,'201','20'),
	('203','Susan','Mavris','SMAVRIS','515.123.7777','7-Jun-94','HR_REP',6500,NULL,'101','40'),
	('204','Hermann','Baer','HBAER','515.123.8888','7-Jun-94','PR_REP',10000,NULL,'101','70'),
	('205','Shelley','Higgins','SHIGGINS','515.123.8080','7-Jun-94','AC_MGR',12000,NULL,'101','110'),
	('206','William','Gietz','WGIETZ','515.123.8181','7-Jun-94','AC_ACCOUNT',8300,NULL,'205','110');

/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table job_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_history`;

CREATE TABLE `job_history` (
  `EMPLOYEE_ID` varchar(4) NOT NULL,
  `START_DATE` varchar(20) DEFAULT NULL,
  `END_DATE` varchar(20) DEFAULT NULL,
  `JOB_ID` varchar(12) NOT NULL,
  `DEPARTMENT_ID` varchar(4) NOT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`,`JOB_ID`,`DEPARTMENT_ID`),
  KEY `JOB_ID` (`JOB_ID`),
  KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`),
  CONSTRAINT `job_history_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employees` (`EMPLOYEE_ID`),
  CONSTRAINT `job_history_ibfk_2` FOREIGN KEY (`JOB_ID`) REFERENCES `jobs` (`JOB_ID`),
  CONSTRAINT `job_history_ibfk_3` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `departments` (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `job_history` WRITE;
/*!40000 ALTER TABLE `job_history` DISABLE KEYS */;

INSERT INTO `job_history` (`EMPLOYEE_ID`, `START_DATE`, `END_DATE`, `JOB_ID`, `DEPARTMENT_ID`)
VALUES
	('101','21-Sep-89','27-Oct-93','AC_ACCOUNT','110'),
	('101','28-Oct-93','15-Mar-97','AC_MGR','110'),
	('102','13-Jan-93','24-Jul-98','IT_PROG','60'),
	('114','24-Mar-98','31-Dec-99','ST_CLERK','50'),
	('122','1-Jan-99','31-Dec-99','ST_CLERK','50'),
	('176','1-Jan-99','31-Dec-99','SA_MAN','80'),
	('176','24-Mar-98','31-Dec-98','SA_REP','80'),
	('200','1-Jul-94','31-Dec-98','AC_ACCOUNT','90'),
	('200','17-Sep-87','17-Jun-93','AD_ASST','90'),
	('201','17-Feb-96','19-Dec-99','MK_REP','20');

/*!40000 ALTER TABLE `job_history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `JOB_ID` varchar(12) NOT NULL,
  `job_description` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;

INSERT INTO `jobs` (`JOB_ID`, `job_description`)
VALUES
	('AC_ACCOUNT','AC Accountant'),
	('AC_MGR','AC Manager'),
	('AD_ASST','Admin. Assistant'),
	('AD_PRES','President'),
	('AD_VP','Vice-President'),
	('FI_ACCOUNT','FInancial Accountant'),
	('FI_MGR','Financial Manager'),
	('HR_REP','HR representative'),
	('IT_PROG','Programmer'),
	('MK_MAN','Marketing Manager'),
	('MK_REP','Marketing Representative'),
	('PR_REP','PR Representative'),
	('PU_CLERK','PU Clerk'),
	('PU_MAN','PU Manager'),
	('SA_MAN','Sales Manager'),
	('SA_REP','Sales Representative'),
	('SH_CLERK','Shipping Clerk'),
	('ST_CLERK','Store Clerk'),
	('ST_MAN','Store Manager');

/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `location_id` varchar(4) NOT NULL,
  `street_address` varchar(30) DEFAULT NULL,
  `postal_code` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state_province` varchar(30) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;

INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`)
VALUES
	('1000','1297 Via Cola di Rie','989','Roma','','IT'),
	('1100','93091 Calle della Te','10934','Venice','','IT'),
	('1200','2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefectu','JP'),
	('1300','9450 Kamiya-cho','6823','Hiroshima','','JP'),
	('1400','2014 Jabberwocky Rd','26192','Southlake','Texas','US'),
	('1500','2011 Interiors Blvd','99236','South San Francisco','California','US'),
	('1600','2007 Zagora St','08810','South Brunswick','New Jersey','US'),
	('1700','2004 Charade Rd','98199','Seattle','Washington','US'),
	('1800','147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'),
	('1900','6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA'),
	('2000','40-5-12 Laogianggen','190518','Beijing','','CN'),
	('2100','1298 Vileparle (E) ','490231','Bombay','Maharashtra','IN'),
	('2200','12-98 Victoria Stree','2901','Sydney','New South Wales','AU'),
	('2300','198 Clementi North','540198','Singapore','','SG'),
	('2400','8204 Arthur St','','London','','UK'),
	('2500','Magdalen Centre, The','OX9 9ZB','Oxford','Oxford','UK'),
	('2600','9702 Chester Road','9629850293','Stretford','Manchester','UK'),
	('2700','Schwanthalerstr. 703','80925','Munich','Bavaria','DE'),
	('2800','Rua Frei Caneca 1360','01307-002','Sao Paulo','Sao Paulo','BR'),
	('2900','20 Rue des Corps-Sai','1730','Geneva','Geneve','CH'),
	('3000','Murtenstrasse 921','3095','Bern','BE','CH'),
	('3100','Pieter Breughelstraa','3029SK','Utrecht','Utrecht','NL'),
	('3200','Mariano Escobedo 999','11932','Mexico City','Distrito Federal','MX');

/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table publisher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `publisher`;

CREATE TABLE `publisher` (
  `pub_id` varchar(4) NOT NULL,
  `pub_name` varchar(30) DEFAULT NULL,
  `pub_city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `country_office` varchar(20) DEFAULT NULL,
  `no_of_branch` int(11) DEFAULT NULL,
  `estd` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;

INSERT INTO `publisher` (`pub_id`, `pub_name`, `pub_city`, `country`, `country_office`, `no_of_branch`, `estd`)
VALUES
	('P001','Jex Max Publication','New York','USA','New York',15,'1969-12-25'),
	('P002','BPP Publication','Mumbai','India','New Delhi',10,'1985-10-01'),
	('P003','New Harrold Publication','Adelaide','Australia','Sydney',6,'1975-09-05'),
	('P004','Ultra Press Inc.','London','UK','London',8,'1948-07-10'),
	('P005','Mountain Publication','Houstan','USA','Sun Diego',25,'1975-01-01'),
	('P006','Summer Night Publication','New York','USA','Atlanta ',10,'1990-12-10'),
	('P007','Pieterson Grp. of Publishers','Cambridge','UK','London',6,'1950-07-15'),
	('P008','Novel Publisher Ltd.','New Delhi','India','Bangalore',10,'2000-01-01');

/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table regions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `regions`;

CREATE TABLE `regions` (
  `region_id` int(11) NOT NULL,
  `region_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;

INSERT INTO `regions` (`region_id`, `region_name`)
VALUES
	(1,'Europe'),
	(2,'America'),
	(3,'Asia'),
	(4,'Africa/Middle East');

/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
