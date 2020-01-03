-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2019 at 01:10 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpusku_gc`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `npm` int(11) NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jk` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `user_id`, `npm`, `nama`, `tempat_lahir`, `tgl_lahir`, `jk`, `prodi`, `created_at`, `updated_at`) VALUES
(3, 3, 2222, 'Farid123', 'jakarta', '2019-02-03', 'L', 'SI', '2019-09-04 21:02:53', '2019-09-04 21:02:53'),
(4, 4, 1, 'lingga', 'bogor', '2019-11-13', 'L', 'TI', '2019-11-12 00:26:47', '2019-11-12 00:26:47'),
(5, 5, 1233, 'mahindra', 'jkt', '2019-12-02', 'L', 'TI', '2019-11-12 21:40:29', '2019-11-12 21:40:29'),
(6, 6, 23, 'aksara123', 'bogor', '2019-12-10', 'L', 'TI', '2019-12-10 19:19:02', '2019-12-10 19:19:02');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isbn` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pengarang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penerbit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tahun_terbit` int(11) DEFAULT NULL,
  `jumlah_buku` int(11) NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `lokasi` enum('rak1','rak2','rak3') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul`, `isbn`, `pengarang`, `penerbit`, `tahun_terbit`, `jumlah_buku`, `deskripsi`, `lokasi`, `cover`, `created_at`, `updated_at`) VALUES
(1, 'Belajar Pemrograman Java', '8962895000136365017', 'Abdul Kadir', 'PT. Restu Ibu', 2018, 5, 'Buku Pertama Belajar Pemrograman Java Utk Pemula', 'rak1', NULL, '2019-09-04 12:27:24', '2019-11-13 01:51:19'),
(2, 'Pemrograman Android', '9920395559', 'Muhammad Nurhidayat', 'PT. Restu Guru', 2018, 13, 'Jurus Rahasia Menguasai Pemrograman Android', 'rak2', 'jurus_rahasia.jpg', '2019-09-04 12:27:24', '2019-11-13 00:57:04'),
(3, 'Android Application', '9789791758659', 'Dina Aulia', 'PT. Restu Ayah', 2018, 3, 'Buku Pertama Belajar Pemrograman Java Utk Pemula', 'rak2', NULL, '2019-09-04 12:27:24', '2019-11-13 01:30:09'),
(4, 'farid mahindra', '6950266583769', 'frd', 'tkj', 2019, 6, 'bagus untuk dewasa', 'rak3', NULL, '2019-11-12 21:42:44', '2019-11-13 00:58:54'),
(5, 'udud', '8991906101019', 'cocot', 'sampoerna', 2019, 11, 'nikmat menthol', 'rak2', NULL, '2019-11-13 00:01:05', '2019-11-13 01:24:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2018_06_17_070037_create_anggotas_table', 1),
(3, '2018_06_17_130244_create_bukus_table', 1),
(4, '2018_06_18_014155_create_transaksis_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `anggota_nama` varchar(50) NOT NULL,
  `buku_judul` varchar(50) NOT NULL,
  `buku_isbn` varchar(25) NOT NULL,
  `buku_lokasi` varchar(20) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `status` enum('pinjam','kembali') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `kode_transaksi`, `anggota_nama`, `buku_judul`, `buku_isbn`, `buku_lokasi`, `tgl_pinjam`, `tgl_kembali`, `status`, `ket`, `created_at`, `updated_at`) VALUES
(1, 'TR00004', '4', '', '8962895000136365017', '', '2019-11-12', '2019-11-17', 'kembali', 'eraaa', '2019-11-12 02:52:20', '2019-11-12 20:54:34'),
(4, 'TR00002', '4', '', '9789791758659', '', '2019-11-12', '2019-11-17', 'kembali', 'hhh', '2019-11-12 02:58:00', '2019-11-12 20:47:59'),
(5, 'TR00005', '4', '', '9920395559', '', '2019-11-12', '2019-11-17', 'kembali', 'wew', '2019-11-12 02:58:51', '2019-11-12 21:39:10'),
(6, 'TR00006', '4', '', '8962895000136365017', '', '2019-11-12', '2019-11-17', 'pinjam', 'rer', '2019-11-12 02:59:35', '2019-11-12 02:59:35'),
(7, 'TR00007', '4', '', '8962895000136365017', '', '2019-11-13', '2019-11-18', 'pinjam', 'kedua', '2019-11-12 19:25:25', '2019-11-12 19:25:25'),
(8, 'TR00008', 'lingga', '', '8962895000136365017', '', '2019-11-13', '2019-11-18', 'kembali', 'ffff', '2019-11-12 19:50:49', '2019-11-12 21:04:50'),
(9, 'TR00009', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', '', '2019-11-13', '2019-11-18', 'kembali', 'hhhh', '2019-11-12 20:04:58', '2019-11-12 21:04:34'),
(10, 'TR00010', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', '', '2019-11-13', '2019-11-18', 'kembali', 'anjig', '2019-11-12 20:38:55', '2019-11-12 20:41:57'),
(11, 'TR00011', 'lingga', 'Android Application', '9789791758659', '', '2019-11-13', '2019-11-18', 'kembali', 'ygy7g', '2019-11-12 21:13:31', '2019-11-12 21:29:14'),
(12, 'TR00012', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', '', '2019-11-13', '2019-11-18', 'kembali', 'ygyugu', '2019-11-12 21:21:36', '2019-11-12 21:29:30'),
(13, 'TR00013', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', '', '2019-11-13', '2019-11-18', 'pinjam', 'blala', '2019-11-12 21:30:34', '2019-11-12 21:30:34'),
(14, 'TR00014', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', '', '2019-11-13', '2019-11-18', 'pinjam', '8962895000136365017', '2019-11-13 00:13:23', '2019-11-13 00:13:23'),
(15, 'TR00015', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', 'rak1', '2019-11-13', '2019-11-18', 'pinjam', 'hoh', '2019-11-13 00:52:02', '2019-11-13 00:52:02'),
(16, 'TR00016', 'lingga', 'Pemrograman Android', '9920395559', 'rak2', '2019-11-13', '2019-11-18', 'pinjam', 'hjh', '2019-11-13 00:57:04', '2019-11-13 00:57:04'),
(17, 'TR00017', 'lingga', 'farid mahindra', '6950266583769', 'rak3', '2019-11-13', '2019-11-18', 'pinjam', 'uii', '2019-11-13 00:58:54', '2019-11-13 00:58:54'),
(18, 'TR00018', 'lingga', 'udud', '8991906101019', 'rak2', '2019-11-13', '2019-11-18', 'pinjam', 'giu', '2019-11-13 01:24:58', '2019-11-13 01:24:58'),
(19, 'TR00019', 'lingga', 'Android Application', '9789791758659', 'rak2', '2019-11-13', '2019-11-18', 'pinjam', 'j9hu', '2019-11-13 01:30:09', '2019-11-13 01:30:09'),
(20, 'TR00020', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', 'rak1', '2019-11-13', '2019-11-18', 'pinjam', 'dasdada', '2019-11-13 01:39:24', '2019-11-13 01:39:24'),
(21, 'TR00020', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', 'rak1', '2019-11-13', '2019-11-18', 'pinjam', 'dasdada', '2019-11-13 01:39:28', '2019-11-13 01:39:28'),
(22, 'TR00022', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', 'rak1', '2019-11-13', '2019-11-18', 'pinjam', 'jgjgjgjgg', '2019-11-13 01:40:49', '2019-11-13 01:40:49'),
(23, 'TR00023', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', 'rak1', '2019-11-13', '2019-11-18', 'pinjam', 'oyoy', '2019-11-13 01:43:46', '2019-11-13 01:43:46'),
(24, 'TR00024', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', 'rak1', '2019-11-13', '2019-11-18', 'pinjam', 'mahindra', '2019-11-13 01:47:55', '2019-11-13 01:47:55'),
(25, 'TR00024', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', 'rak1', '2019-11-13', '2019-11-18', 'pinjam', 'mahindra', '2019-11-13 01:48:27', '2019-11-13 01:48:27'),
(26, 'TR00024', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', 'rak1', '2019-11-13', '2019-11-18', 'pinjam', 'mahindra', '2019-11-13 01:49:21', '2019-11-13 01:49:21'),
(27, 'TR00024', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', 'rak1', '2019-11-13', '2019-11-18', 'pinjam', 'mahindra', '2019-11-13 01:49:54', '2019-11-13 01:49:54'),
(28, 'TR00024', 'lingga', 'Belajar Pemrograman Java', '8962895000136365017', 'rak1', '2019-11-13', '2019-11-18', 'pinjam', 'mahindra', '2019-11-13 01:51:19', '2019-11-13 01:51:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `gambar`, `level`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Farid', 'admin123', '123456@gilacoding.com', '$2y$10$GVe44IvQeHbaPqQp94cNuedJgLM82UmfsvoTFPvQwS6yJlyt6RY4C', NULL, 'admin', 'XXmVCL4ky3XAyot5uZWTQnHwGTnBBMglQRKozI0B0JtUwi6MKWXC0Kkqj1pm', '2019-09-04 12:27:24', '2019-09-04 12:37:18'),
(3, 'FaridMahindra', 'Farid123', 'faridmahindra@gmail.com', '$2y$10$qfxi2hvCLpij/es/WVEFYuHw2seEhmkaRBWRmK2ie3yolmQD8ReEe', '19749-2019-09-04-19-54-26.jpg', 'user', '4NiR7JTCAh6FK7LxNCIbG2CLmE8ueuhhof8CyAnowl1Shpa5VtDKYQbSNO7G', '2019-09-04 12:54:26', '2019-09-04 20:48:46'),
(4, 'lingga', 'lingga', 'lingga@gmail.com', '$2y$10$BM6ju6axEDj3tiDxl5BAeu.TBrOmJPjMWoN9SuEiv5uGlFWZQoKNi', NULL, 'user', 'RCwIaA6A3qJnuSLjE29fgR52OtOgigEIxWE3Js7cfFWmsK8pILd0OhSRaKv2', '2019-09-04 12:59:43', '2019-09-04 12:59:43'),
(5, 'farid321', 'farid321', 'faridmahindra321@gmail.com', '$2y$10$Tc9pHA7IvLmbmLr/GNFV3u4tMarpG7agP7zutTdHQPCLPWET0/8Rq', '97940-2019-11-11-21-59-47.jpg', 'admin', '7HW2rLG2NV2LGatLFTNjeMIvJYvwF2HPuvbmZB1nhaUZMuzJmos3IzmBYqSm', '2019-11-11 14:59:47', '2019-11-11 14:59:47'),
(6, 'aksara', 'aksara', 'aksara@gmail.com', '$2y$10$8ygnp/KAd.DmhwgIzITeS.HPqfZx/fFpdhw5jvoCexsZW51UvNIzu', NULL, 'user', 'i5fLUgw4EJHoLNdwuu8pOkBPL88CydnsfLjrhGYMcCkcN9myosupfpPsCy8t', '2019-12-10 19:17:43', '2019-12-10 19:17:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anggota_user_id_foreign` (`user_id`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
