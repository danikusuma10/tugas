/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.14-MariaDB : Database - aashiapf
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`aashiapf` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `aashiapf`;

/*Table structure for table `bulan` */

DROP TABLE IF EXISTS `bulan`;

CREATE TABLE `bulan` (
  `id_bulan` int(255) NOT NULL AUTO_INCREMENT,
  `bulan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_bulan`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

/*Data for the table `bulan` */

insert  into `bulan`(`id_bulan`,`bulan`) values (1,'JANUARI'),(2,'FEBRUARI'),(3,'MARET'),(4,'APRIL'),(5,'MEI'),(6,'JUNI'),(7,'JULI'),(8,'AGUSTUS'),(9,'SEPTEMBER'),(10,'OKTOBER'),(11,'NOVEMBER'),(12,'DESEMBER');

/*Table structure for table `hapus_transaksi` */

DROP TABLE IF EXISTS `hapus_transaksi`;

CREATE TABLE `hapus_transaksi` (
  `id` varchar(255) DEFAULT NULL,
  `id_transaksi` varchar(255) DEFAULT NULL,
  `transaksi` varchar(255) DEFAULT NULL,
  `id_bayar` varchar(255) DEFAULT NULL,
  `tahin_ajaran` varchar(255) DEFAULT NULL,
  `id_bulan` varchar(255) DEFAULT NULL,
  `id_tahun` varchar(255) DEFAULT NULL,
  `tanggal_bayar` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `hapus_transaksi` */

insert  into `hapus_transaksi`(`id`,`id_transaksi`,`transaksi`,`id_bayar`,`tahin_ajaran`,`id_bulan`,`id_tahun`,`tanggal_bayar`) values ('40','SPP270621001',NULL,'202090',NULL,'1','8',2021),('40','SPP270621001',NULL,'202090',NULL,'2','8',2021),('40','SPP270621001',NULL,'202090',NULL,'3','8',2021),('40','SPP270621001',NULL,'202090',NULL,'4','8',2021);

/*Table structure for table `jurnal` */

DROP TABLE IF EXISTS `jurnal`;

CREATE TABLE `jurnal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_transaksi` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `tgl_transaksi` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_transaksi` (`id_transaksi`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `jurnal` */

insert  into `jurnal`(`id`,`id_transaksi`,`keterangan`,`tgl_transaksi`) values (8,'27062021-1953','Dana Bos','2021-06-01 00:00:00'),(9,'27062021-8429','SPP 2020','2020-12-31 00:00:00'),(10,'27062021-2850','Beli Komputer','2021-06-25 00:00:00'),(11,'27062021-5717','Bayar Listrik','2021-06-28 00:00:00');

/*Table structure for table `jurnal_detail` */

DROP TABLE IF EXISTS `jurnal_detail`;

CREATE TABLE `jurnal_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_jurnal` varchar(255) DEFAULT NULL,
  `kredit` int(255) DEFAULT NULL,
  `debit` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jurnal` (`id_jurnal`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `jurnal_detail` */

insert  into `jurnal_detail`(`id`,`id_jurnal`,`kredit`,`debit`) values (6,'8',0,200000000),(7,'9',0,150000000),(8,'10',150000000,0),(9,'11',2500000,0);

/*Table structure for table `kas` */

DROP TABLE IF EXISTS `kas`;

CREATE TABLE `kas` (
  `id_transaksi` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `tipe_kas` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `nominal` int(255) DEFAULT NULL,
  `tgl_transaksi` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kas` */

insert  into `kas`(`id_transaksi`,`tipe_kas`,`keterangan`,`nominal`,`tgl_transaksi`) values ('27062021-1953','masuk','Dana Bos',200000000,'2021-06-01 00:00:00'),('27062021-8429','masuk','SPP 2020',150000000,'2020-12-31 00:00:00'),('27062021-2850','keluar','Beli Komputer',150000000,'2021-06-25 00:00:00'),('27062021-5717','keluar','Bayar Listrik',2500000,'2021-06-28 00:00:00');

/*Table structure for table `kelas` */

DROP TABLE IF EXISTS `kelas`;

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kelas` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

/*Data for the table `kelas` */

insert  into `kelas`(`id`,`nama_kelas`) values (1,'X TEI'),(2,'X TKJ'),(3,'X TFL'),(4,'X TPBO'),(5,'X TKR'),(6,'XI TEI'),(7,'XI TKJ'),(8,'XI TFL'),(9,'XI TPBO'),(10,'XI TKR'),(11,'XII TEI'),(12,'XII TKJ'),(13,'XII TFL'),(14,'XII TPBO'),(15,'XII TKR');

/*Table structure for table `siswa` */

DROP TABLE IF EXISTS `siswa`;

CREATE TABLE `siswa` (
  `id_bayar` int(100) NOT NULL,
  `nama_siswa` varchar(100) DEFAULT NULL,
  `jenis_kelamin` varchar(2) DEFAULT NULL,
  `kelas_id` int(3) DEFAULT NULL,
  `emailwalimurid` varchar(100) DEFAULT NULL,
  `no_hp_siswa` decimal(20,0) DEFAULT NULL,
  `role_id` int(3) DEFAULT NULL,
  `is_active` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_bayar`),
  KEY `kelas_id` (`kelas_id`),
  CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `siswa` */

insert  into `siswa`(`id_bayar`,`nama_siswa`,`jenis_kelamin`,`kelas_id`,`emailwalimurid`,`no_hp_siswa`,`role_id`,`is_active`) values (1010,'kaka','l',2,'kak@gmail.com',922727,2,1),(202090,'Dani Alfida Kusuma',NULL,1,'danikusumaelektro@gmail.com',81542040173,2,1),(201701030,'Andika Prtama','La',15,'andika@gmail.com',89999999,2,1),(201901029,'Kiki Amelia','Pe',6,'kikia@gmail,com',8227277,2,1);

/*Table structure for table `tahun_aktif` */

DROP TABLE IF EXISTS `tahun_aktif`;

CREATE TABLE `tahun_aktif` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `id_bayar` int(100) NOT NULL,
  `id_tahun` int(100) NOT NULL,
  PRIMARY KEY (`id`,`id_bayar`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tahun_aktif` */

insert  into `tahun_aktif`(`id`,`id_bayar`,`id_tahun`) values (5,202090,1),(6,12121,5),(12,1111111,7),(13,201701026,7),(14,202090,7),(15,1010,5),(16,202090,8);

/*Table structure for table `tahun_masuk` */

DROP TABLE IF EXISTS `tahun_masuk`;

CREATE TABLE `tahun_masuk` (
  `id_tahun` int(100) NOT NULL AUTO_INCREMENT,
  `tahun_masuk` int(100) NOT NULL,
  `besar_spp` int(100) NOT NULL,
  PRIMARY KEY (`id_tahun`),
  KEY `id_tahun` (`id_tahun`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tahun_masuk` */

insert  into `tahun_masuk`(`id_tahun`,`tahun_masuk`,`besar_spp`) values (8,2021,250000),(9,2022,300000);

/*Table structure for table `tbl_requesttransaksi` */

DROP TABLE IF EXISTS `tbl_requesttransaksi`;

CREATE TABLE `tbl_requesttransaksi` (
  `order_id` int(255) NOT NULL,
  `id_bayar` int(100) DEFAULT NULL,
  `nama_siswa` varchar(255) DEFAULT NULL,
  `gross_amount` int(255) DEFAULT NULL,
  `berapa_bulan` varchar(100) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `va_number` decimal(65,0) DEFAULT NULL,
  `transaction_time` datetime DEFAULT NULL,
  `settlement_time` datetime DEFAULT NULL,
  `bill_key` varchar(255) DEFAULT NULL,
  `biller_code` varchar(255) DEFAULT NULL,
  `transaction_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_requesttransaksi` */

insert  into `tbl_requesttransaksi`(`order_id`,`id_bayar`,`nama_siswa`,`gross_amount`,`berapa_bulan`,`payment_type`,`bank`,`va_number`,`transaction_time`,`settlement_time`,`bill_key`,`biller_code`,`transaction_status`) values (1266783851,202090,'Dani Alfida Kusuma',7,NULL,'gopay','-',0,'2021-06-23 19:56:48',NULL,'-','-','pending'),(942286630,202090,'Dani Alfida Kusuma',8,NULL,'cstore','-',0,'2021-06-28 11:24:04',NULL,'-','-','pending'),(1181091926,202090,'Dani Alfida Kusuma',8,NULL,'bank_transfer','bni',9881350441117129,'2021-06-28 19:00:02',NULL,'-','-','pending'),(1932797797,202090,'Dani Alfida Kusuma',250000,NULL,'cstore','-',0,'2021-06-28 19:58:17',NULL,'-','-','pending'),(1463348828,202090,'Dani Alfida Kusuma',250000,'1','qris','-',0,'2021-06-28 20:36:05',NULL,'-','-','pending'),(1642278835,202090,'Dani Alfida Kusuma',250000,'1','gopay','-',0,'2021-06-28 20:39:59',NULL,'-','-','pending'),(2089108168,202090,'Dani Alfida Kusuma',250000,'1','qris','-',0,'2021-06-28 20:42:07',NULL,'-','-','pending'),(99244015,202090,'Dani Alfida Kusuma',250000,'1','qris','-',0,'2021-06-28 20:44:38',NULL,'-','-','pending'),(1828192176,202090,'Dani Alfida Kusuma',250000,'1','gopay','-',0,'2021-06-28 20:45:34',NULL,'-','-','pending'),(1759752861,202090,'Dani Alfida Kusuma',250000,'1','gopay','-',0,'2021-06-28 20:46:56',NULL,'-','-','pending'),(328254949,202090,'Dani Alfida Kusuma',250000,'1','qris','-',0,'2021-06-28 20:49:05',NULL,'-','-','pending'),(717366855,202090,'Dani Alfida Kusuma',250000,'1','cstore','-',0,'2021-06-28 20:55:39',NULL,'-','-','pending'),(1126619554,202090,'Dani Alfida Kusuma',250000,'1','gopay','-',0,'2021-06-28 21:08:10',NULL,'-','-','settlement'),(42203315,202090,'Dani Alfida Kusuma',250000,'1','gopay','-',0,'2021-06-28 21:09:50',NULL,'-','-','settlement'),(121359252,202090,'Dani Alfida Kusuma',250000,'1','gopay','-',0,'2021-06-28 21:29:47',NULL,'-','-','pending'),(1824290265,202090,'Dani Alfida Kusuma',250000,'1','cstore','-',0,'2021-06-28 21:35:16',NULL,'-','-','pending'),(871145841,202090,'Dani Alfida Kusuma',250000,'1','bank_transfer','bni',9881350432093476,'2021-06-28 21:41:31',NULL,'-','-','pending'),(420225369,202090,'Dani Alfida Kusuma',250000,'1','cstore','-',0,'2021-06-28 21:42:47',NULL,'-','-','pending'),(1413299510,202090,'Dani Alfida Kusuma',250000,'1','gopay','-',0,'2021-06-28 21:45:16',NULL,'-','-','pending');

/*Table structure for table `transaksi1` */

DROP TABLE IF EXISTS `transaksi1`;

CREATE TABLE `transaksi1` (
  `id_transaksi` varchar(100) NOT NULL,
  `id_bayar` int(100) DEFAULT NULL,
  `id_bulan` int(100) DEFAULT NULL,
  `id_tahun` int(3) DEFAULT NULL,
  `tanggal_bayar` int(100) DEFAULT NULL,
  `id` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `transaksi1` */

insert  into `transaksi1`(`id_transaksi`,`id_bayar`,`id_bulan`,`id_tahun`,`tanggal_bayar`,`id`) values ('SPP190621001',201701026,1,7,2021,40),('SPP190621001',201701026,2,7,2021,40),('SPP280621001',202090,1,8,2021,40);

/*Table structure for table `tunggakan` */

DROP TABLE IF EXISTS `tunggakan`;

CREATE TABLE `tunggakan` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `id_bayar` int(100) DEFAULT NULL,
  `id_tahun` int(100) DEFAULT NULL,
  `tunggakan` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tunggakan` */

insert  into `tunggakan`(`id`,`id_bayar`,`id_tahun`,`tunggakan`) values (1,12121,5,6000000),(2,201701026,5,5500000),(3,1111111,5,5000000),(4,1111111,7,11000000),(5,1111111,5,6000000),(6,1111111,7,11000000),(7,1111111,7,11000000),(8,201701026,7,9000000),(9,202090,7,12000000),(10,1010,5,5500000),(11,202090,8,2250000);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `image` blob DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` int(1) DEFAULT 0,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`email`,`image`,`password`,`role_id`,`is_active`,`date_created`) values (40,'Eti Triani S,Sos','E@gmail.com','yyy11.png','$2y$10$7AgULuqSmZYpOMcSqGIByORjugzsUDSNOVi1a9B.kxlS9V47UDQqa',2,1,1623293338),(41,'dani','dani@gmail.com','default.jpg','$2y$10$LNY/CdCfejkOtKjJVQvP0.7ilGyX3PbdYOdUUNgILdkK/pQNK.nlG',2,1,1624095104);

/*Table structure for table `user_access_menu` */

DROP TABLE IF EXISTS `user_access_menu`;

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_access_menu` */

insert  into `user_access_menu`(`id`,`role_id`,`menu_id`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,6),(9,2,8),(10,3,9),(11,3,6);

/*Table structure for table `user_menu` */

DROP TABLE IF EXISTS `user_menu`;

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_menu` */

insert  into `user_menu`(`id`,`menu`) values (1,'admin'),(2,'transaksi masuk'),(3,'siswa'),(5,'kas jurnal umum'),(6,'user'),(7,'settings'),(8,'riwayat'),(9,'Laporan Jurnal Umum');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`role`) values (1,'Administrator'),(2,'Siswa'),(3,'Kepala');

/*Table structure for table `user_sub_menu` */

DROP TABLE IF EXISTS `user_sub_menu`;

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_sub_menu` */

insert  into `user_sub_menu`(`id`,`menu_id`,`title`,`url`,`icon`,`is_active`) values (1,1,'Dashboard','admin','fas fa-fw fa-tachometer-alt',1),(2,6,'My Profile','user','fas fa-fw fa-user',1),(3,6,'Edit Profile','user/edit','fas fa-fw fa-user-edit',1),(4,6,'Change Password','user/changepassword','fas fa-fw fa-key',1),(5,3,'Data Siswa','siswa','fas fa-fw fa-user',1),(6,3,'Tambah Siswa','siswa/tambahsiswa','fas fa-fw fa-users',1),(7,3,'Tambah Transaksi Siswa','transaksi1/','fas fa-fw fa-cash-register',1),(8,7,'Hak Akses','admin/hakakses','fas fa-fw fa-users',1),(9,5,'Kas Masuk','transaksi/kasmasuk','fas fa-fw fa-database',1),(10,5,'Kas Keluar','transaksi/kaskeluar','fas fa-fw fa-database',1),(11,5,'Laporan Kas','laporan/','fas fa-fw fa-users',1),(12,2,'Tranksaksi Masuk','pembayaran/data_tranksaksi','fas fa-fw fa-key',1),(13,8,'Riwayat','riwayat','fas fa-fw fa-key',1),(14,9,'Laporan Kas','laporan','fas fa-fw fa-users',1),(33,0,'','laporan','',0);

/*Table structure for table `user_token` */

DROP TABLE IF EXISTS `user_token`;

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_token` */

insert  into `user_token`(`id`,`email`,`token`,`date_created`) values (36,'E@gmail.com','5gLo8vaPvw7ar6wvYkUh5Mpc+3D53DEwIN2SWBuDpxs=',1623293338),(37,'dani@gmail.com','OAzlW9BGK1y8XPNV7E4VhiHreUxbVXIfy3nom1oP+fE=',1624095104),(38,'dani@gmail.com','Y9sur2TK210ySIXuhOo6gLMlFDTZAldwI2FkeQRyEjE=',1624549556);

/* Trigger structure for table `kas` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_kas_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_kas_insert` AFTER INSERT ON `kas` FOR EACH ROW BEGIN
	DECLARE id_jurnal INT;
         INSERT INTO jurnal(id_transaksi, keterangan,tgl_transaksi)
        VALUES(NEW.id_transaksi,NEW.keterangan,NEW.tgl_transaksi);
				
    SELECT id INTO id_jurnal
    FROM jurnal WHERE id_transaksi=NEW.id_transaksi;
		
    IF NEW.tipe_kas = 'keluar' THEN
		 INSERT INTO jurnal_detail(id_jurnal, kredit,debit)
        VALUES(id_jurnal,NEW.nominal,0);
				ELSE
				 INSERT INTO jurnal_detail(id_jurnal, kredit,debit)
        VALUES(id_jurnal,0,NEW.nominal);
		END IF;
END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
