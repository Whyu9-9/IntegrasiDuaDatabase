/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 8.0.13 : Database - db_bankk
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_bankk` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `db_bankk`;

/*Table structure for table `tb_integrasi` */

DROP TABLE IF EXISTS `tb_integrasi`;

CREATE TABLE `tb_integrasi` (
  `id_transaksi` varchar(10) NOT NULL,
  `no_rekening` varchar(10) DEFAULT NULL,
  `tgl_transaksi` datetime DEFAULT NULL,
  `total_transaksi` int(11) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_integrasi` */

insert  into `tb_integrasi`(`id_transaksi`,`no_rekening`,`tgl_transaksi`,`total_transaksi`,`status`) values 
('1','12345678','2020-03-29 14:47:52',100000,'1'),
('5','1234','2020-03-31 21:17:52',123,'1'),
('7','900','2020-04-27 00:15:09',4,'0');

/*Table structure for table `tb_nasabah` */

DROP TABLE IF EXISTS `tb_nasabah`;

CREATE TABLE `tb_nasabah` (
  `no_rekening` char(10) NOT NULL,
  `nama_nasabah` varchar(255) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`no_rekening`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_nasabah` */

insert  into `tb_nasabah`(`no_rekening`,`nama_nasabah`,`email`,`alamat`,`no_telepon`) values 
('123','wahyu','wahyu@gmail.com','jalan kenangan','12341545');

/*Table structure for table `tb_pegawai` */

DROP TABLE IF EXISTS `tb_pegawai`;

CREATE TABLE `tb_pegawai` (
  `id_pegawai` bigint(20) NOT NULL,
  `nama_pegawai` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_pegawai` */

/*Table structure for table `tb_transaksi` */

DROP TABLE IF EXISTS `tb_transaksi`;

CREATE TABLE `tb_transaksi` (
  `id_transaksi` varchar(10) NOT NULL,
  `no_rekening` varchar(10) DEFAULT NULL,
  `tgl_transaksi` datetime DEFAULT NULL,
  `total_transaksi` int(11) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_transaksi` */

insert  into `tb_transaksi`(`id_transaksi`,`no_rekening`,`tgl_transaksi`,`total_transaksi`,`status`) values 
('1','12345678','2020-03-29 14:47:52',100000,'1'),
('5','1234','2020-03-31 21:17:52',123,'1'),
('7','900','2020-04-27 00:15:09',4,'0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
