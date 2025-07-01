-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 01, 2025 at 03:20 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lelang`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

DROP TABLE IF EXISTS `tb_barang`;
CREATE TABLE IF NOT EXISTS `tb_barang` (
  `id_barang` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(25) NOT NULL,
  `tgl` date NOT NULL,
  `harga_awal` int NOT NULL,
  `deskripsi_barang` varchar(100) NOT NULL,
  `id_pemilik` int NOT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `tgl`, `harga_awal`, `deskripsi_barang`, `id_pemilik`) VALUES
(4, 'Kulkas Sharp 2 Pintu', '2025-04-21', 1000000, 'Kulkas 2 pintu ex display', 0),
(6, 'Laptop Lenovo Gaming', '2025-06-24', 3000000, 'Laptop gaming ex kantor cabang bogor', 1),
(8, 'Handphone Iphone 14 Pro', '2025-06-30', 12000000, 'Fullset Ex iBox', 4),
(9, 'Botol Minum Merek Omo', '2025-07-01', 100000, 'Botol barang ex kantor', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_history_lelang`
--

DROP TABLE IF EXISTS `tb_history_lelang`;
CREATE TABLE IF NOT EXISTS `tb_history_lelang` (
  `id_history` int NOT NULL AUTO_INCREMENT,
  `id_lelang` int NOT NULL,
  `id_barang` int NOT NULL,
  `id_user` int NOT NULL,
  `penawaran_harga` int NOT NULL,
  PRIMARY KEY (`id_history`),
  KEY `id_lelang` (`id_lelang`,`id_barang`,`id_user`),
  KEY `id_barang` (`id_barang`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_history_lelang`
--

INSERT INTO `tb_history_lelang` (`id_history`, `id_lelang`, `id_barang`, `id_user`, `penawaran_harga`) VALUES
(5, 6, 4, 1, 2000000),
(6, 7, 6, 6, 4000000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_lelang`
--

DROP TABLE IF EXISTS `tb_lelang`;
CREATE TABLE IF NOT EXISTS `tb_lelang` (
  `id_lelang` int NOT NULL AUTO_INCREMENT,
  `id_barang` int NOT NULL,
  `tgl_lelang` date NOT NULL,
  `harga_akhir` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `id_petugas` int NOT NULL,
  `status` enum('dibuka','ditutup') NOT NULL,
  PRIMARY KEY (`id_lelang`),
  KEY `id_barang` (`id_barang`),
  KEY `id_user` (`id_user`,`id_petugas`),
  KEY `id_petugas` (`id_petugas`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_lelang`
--

INSERT INTO `tb_lelang` (`id_lelang`, `id_barang`, `tgl_lelang`, `harga_akhir`, `id_user`, `id_petugas`, `status`) VALUES
(6, 4, '2025-06-25', 2000000, 1, 2, 'ditutup'),
(7, 6, '2025-07-01', 4000000, 6, 2, 'ditutup');

-- --------------------------------------------------------

--
-- Table structure for table `tb_level`
--

DROP TABLE IF EXISTS `tb_level`;
CREATE TABLE IF NOT EXISTS `tb_level` (
  `id_level` int NOT NULL AUTO_INCREMENT,
  `level` enum('administrator','petugas') NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_level`
--

INSERT INTO `tb_level` (`id_level`, `level`) VALUES
(1, 'administrator'),
(2, 'petugas');

-- --------------------------------------------------------

--
-- Table structure for table `tb_masyarakat`
--

DROP TABLE IF EXISTS `tb_masyarakat`;
CREATE TABLE IF NOT EXISTS `tb_masyarakat` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `telp` varchar(25) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_masyarakat`
--

INSERT INTO `tb_masyarakat` (`id_user`, `nama_lengkap`, `username`, `password`, `telp`) VALUES
(1, 'John Travolta', 'john', 'aa65989e6e147809f34f559958ecf804', '081281271212'),
(3, 'Ridho Anggoro Naibaho', 'ridho', '090ca396d96f7a9dad53ff3f7a2a6b70', '087876700975'),
(4, 'Masyarakat 1', 'user1', 'aa65989e6e147809f34f559958ecf804', '08111234567'),
(5, 'Rudi S', 'rudis', 'aa65989e6e147809f34f559958ecf804', '0878767627321'),
(6, 'Masyarakat 1', 'masyarakat1', 'aa65989e6e147809f34f559958ecf804', '08118237732');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pemilik`
--

DROP TABLE IF EXISTS `tb_pemilik`;
CREATE TABLE IF NOT EXISTS `tb_pemilik` (
  `id_pemilik` int NOT NULL AUTO_INCREMENT,
  `nama_pemilik` varchar(50) NOT NULL,
  `telp` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `tipe` enum('Perorangan','Corporate/Perusahaan','Lain-lain','') NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_pemilik`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_pemilik`
--

INSERT INTO `tb_pemilik` (`id_pemilik`, `nama_pemilik`, `telp`, `alamat`, `tipe`, `status`) VALUES
(1, 'PT Global Jaya Makmur', '021-002999328', '', 'Corporate/Perusahaan', 1),
(2, 'Dinas Sosial Provinsi DKI Jakarta', '(021) 4265115', 'Jl. Gunung Sahari II No.6, RT.13/RW.7, Gn. Sahari Sel., Kec. Kemayoran, \nKota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10610', 'Corporate/Perusahaan', 0),
(4, 'Malih Tong Tong, S.Kom', '0811882777382', 'Apartment Kuningan Park Lt 62', 'Perorangan', 1),
(5, 'Malih Tong Tong, S.Kom', '0811882777382', 'Apartment Kuningan Park Lt 62', 'Perorangan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_petugas`
--

DROP TABLE IF EXISTS `tb_petugas`;
CREATE TABLE IF NOT EXISTS `tb_petugas` (
  `id_petugas` int NOT NULL AUTO_INCREMENT,
  `nama_petugas` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_level` int NOT NULL,
  PRIMARY KEY (`id_petugas`),
  UNIQUE KEY `username` (`username`),
  KEY `id_level` (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_petugas`
--

INSERT INTO `tb_petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `id_level`) VALUES
(1, 'Super Admin', 'admin', 'aa65989e6e147809f34f559958ecf804', 1),
(2, 'Petugas 1', 'petugas', 'aa65989e6e147809f34f559958ecf804', 2),
(3, 'Kasir 1', 'kasir', 'kasir', 2),
(4, 'saya', 'saya', 'batagorenak', 2),
(5, 'Robi', 'robi', '1', 2),
(6, 'Petugas 2', 'petugas2', 'batagorenak', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_history_lelang`
--
ALTER TABLE `tb_history_lelang`
  ADD CONSTRAINT `tb_history_lelang_ibfk_1` FOREIGN KEY (`id_lelang`) REFERENCES `tb_lelang` (`id_lelang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_history_lelang_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_history_lelang_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `tb_masyarakat` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_lelang`
--
ALTER TABLE `tb_lelang`
  ADD CONSTRAINT `tb_lelang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_lelang_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_masyarakat` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_lelang_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `tb_petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD CONSTRAINT `tb_petugas_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `tb_level` (`id_level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
