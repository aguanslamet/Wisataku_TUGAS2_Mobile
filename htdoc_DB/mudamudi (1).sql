-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 15 Apr 2020 pada 21.54
-- Versi Server: 10.1.10-MariaDB
-- PHP Version: 5.5.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mudamudi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `id` int(11) NOT NULL,
  `nohp` text NOT NULL,
  `password` text NOT NULL,
  `level` int(11) NOT NULL,
  `username` text NOT NULL,
  `status` int(11) NOT NULL,
  `createData` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`id`, `nohp`, `password`, `level`, `username`, `status`, `createData`) VALUES
(64, '081234567890', '900150983cd24fb0d6963f7d28e17f72', 1, 'Admin', 1, '0000-00-00 00:00:00'),
(65, '081234567890', '900150983cd24fb0d6963f7d28e17f72', 1, 'Admin', 1, '0000-00-00 00:00:00'),
(66, '081234567890', '900150983cd24fb0d6963f7d28e17f72', 1, 'Admin', 1, '0000-00-00 00:00:00'),
(67, '081234567890', '900150983cd24fb0d6963f7d28e17f72', 1, 'Admin', 1, '0000-00-00 00:00:00'),
(68, '081234567890', '900150983cd24fb0d6963f7d28e17f72', 1, 'Admin', 1, '0000-00-00 00:00:00'),
(69, '123', '12cfaf7fd98f33be8038b3d56c18f061', 1, 'abc', 1, '0000-00-00 00:00:00'),
(70, '081234345656', '900150983cd24fb0d6963f7d28e17f72', 1, 'Aguan Slamet', 1, '0000-00-00 00:00:00'),
(71, '1234', '900150983cd24fb0d6963f7d28e17f72', 1, 'abc', 1, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
