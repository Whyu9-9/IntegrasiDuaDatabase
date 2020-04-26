/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 8.0.13 : Database - db_tokoo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_tokoo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `db_tokoo`;

/*Table structure for table `tb_barang` */

DROP TABLE IF EXISTS `tb_barang`;

CREATE TABLE `tb_barang` (
  `id_barang` bigint(20) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_barang` */

insert  into `tb_barang`(`id_barang`,`nama_barang`,`stok`,`harga`) values 
(1,'MSI',60,2000000);

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

/*Table structure for table `tb_pembeli` */

DROP TABLE IF EXISTS `tb_pembeli`;

CREATE TABLE `tb_pembeli` (
  `id_pembeli` bigint(20) NOT NULL,
  `nama_pembeli` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `no_telepon` varchar(15) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pembeli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_pembeli` */

insert  into `tb_pembeli`(`id_pembeli`,`nama_pembeli`,`email`,`no_telepon`,`alamat`) values 
(1,'Wahyu','Wahyu@gmail.com','0882361','Jalan Kenangan');

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
