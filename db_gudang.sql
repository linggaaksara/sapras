-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Bulan Mei 2020 pada 06.02
-- Versi server: 10.1.33-MariaDB
-- Versi PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gudang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `no_card` int(20) NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jk` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id`, `user_id`, `no_card`, `nama`, `tempat_lahir`, `tgl_lahir`, `jk`, `jabatan`, `created_at`, `updated_at`) VALUES
(3, 3, 2222, 'Farid123', 'jakarta', '2019-02-03', 'L', 'SI', '2019-09-04 21:02:53', '2019-09-04 21:02:53'),
(4, 4, 1, 'lingga', 'bogor', '2019-11-13', 'L', 'TI', '2019-11-12 00:26:47', '2019-11-12 00:26:47'),
(5, 5, 1233, 'mahindra', 'jkt', '2019-12-02', 'L', 'TI', '2019-11-12 21:40:29', '2019-11-12 21:40:29'),
(6, 6, 23, 'aksara123', 'bogor', '2019-12-10', 'L', 'TI', '2019-12-10 19:19:02', '2019-12-10 19:19:02'),
(7, 7, 7777, 'mamang', 'Google', '2019-12-01', 'L', 'KM', '2019-12-11 00:43:39', '2019-12-11 00:43:39'),
(8, 8, 97485, 'sule123', 'bogor', '1986-12-31', 'L', 'SC', '2020-01-30 20:18:13', '2020-01-30 20:18:13'),
(10, 9, 9346, 'jaja', 'fehwoug', '2018-11-29', 'P', 'KY', '2020-04-06 00:34:35', '2020-04-06 00:34:35'),
(11, 10, 2142, 'PIPI', 'Google', '2016-09-28', 'P', 'PM', '2020-04-06 01:21:03', '2020-04-06 01:21:03'),
(12, 11, 1243237, 'jiji', 'Bogor', '2012-10-29', 'L', 'KY', '2020-04-06 01:24:16', '2020-04-06 01:24:16'),
(13, 12, 743986, 'adminn', 'bandung', '1995-05-02', 'P', 'PM', '2020-04-08 23:20:41', '2020-04-08 23:20:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2018_06_17_070037_create_anggotas_table', 1),
(3, '2018_06_17_130244_create_bukus_table', 1),
(4, '2018_06_18_014155_create_transaksis_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peralatan`
--

CREATE TABLE `peralatan` (
  `id` int(10) UNSIGNED NOT NULL,
  `alat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_alat` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merek` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_alat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tahun_beli` int(11) DEFAULT NULL,
  `jumlah_alat` int(11) NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `lokasi` enum('baris1','baris2','baris3') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `peralatan`
--

INSERT INTO `peralatan` (`id`, `alat`, `kode_alat`, `merek`, `jenis_alat`, `tahun_beli`, `jumlah_alat`, `deskripsi`, `lokasi`, `cover`, `created_at`, `updated_at`) VALUES
(7, 'konci 12', NULL, 'krisbow', 'peralatan', 2016, 23, 'baru', 'baris3', NULL, '2020-01-31 00:02:26', '2020-01-31 00:42:12'),
(8, 'kunci inggris', NULL, 'krisbow', 'peralatan', 2018, 25, 'bekas', 'baris2', NULL, '2020-01-31 00:07:58', '2020-01-31 00:07:58'),
(9, 'kunci pas', NULL, 'krisbow', 'peralatan', 2019, 18, 'baru', 'baris3', NULL, '2020-01-31 00:09:17', '2020-01-31 00:09:17'),
(10, 'obeng', '123', 'krisbow1', 'peralatan1', 201911, 9, '11111111', 'baris1', NULL, '2020-01-31 00:09:44', '2020-04-10 03:27:07'),
(11, 'kunci LL', '026', 'krisboww', 'kuncii', 2011, 11, 'punya sekolahh', 'baris3', NULL, '2020-03-26 07:58:25', '2020-03-26 07:59:06'),
(13, '396', '6666', 'hkjfa', 'fiheof', 2010, 10, 'sgio', 'baris2', NULL, '2020-04-08 21:47:27', '2020-04-08 21:47:27'),
(14, 'hhh', '6666', 'hhhh', 'hhh', 2010, 10, 'hh', 'baris3', NULL, '2020-04-08 21:47:48', '2020-04-08 21:47:48'),
(15, 'hhh', '6287', 'hhh', 'hhh', 2010, 19, 'hhh', 'baris2', NULL, '2020-04-08 22:05:54', '2020-04-08 22:05:54'),
(16, 'igtu', '5875', 'iohgyf', 'oyfiuio', 2020, 49, 'iorewhguwog', 'baris2', NULL, '2020-04-10 04:57:20', '2020-04-10 04:57:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `anggota_nama` varchar(50) NOT NULL,
  `alat` varchar(50) NOT NULL,
  `kode_alat` varchar(25) NOT NULL,
  `lokasi` varchar(20) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `status` enum('pinjam','kembali') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `kode_transaksi`, `anggota_nama`, `alat`, `kode_alat`, `lokasi`, `tgl_pinjam`, `tgl_kembali`, `status`, `ket`, `created_at`, `updated_at`) VALUES
(1, 'TR00001', 'sule123', 'obeng', '123', 'baris1', '2020-04-06', '2020-04-11', 'kembali', 'udud', '2020-04-06 00:12:18', '2020-04-06 00:15:43'),
(2, 'TR00001', 'sule123', 'obeng', '123', 'baris1', '2020-04-06', '2020-04-11', 'kembali', 'udud', '2020-04-06 00:15:16', '2020-04-06 00:38:06'),
(3, 'TR00003', 'mamang', 'obeng', '123', 'baris1', '2020-04-06', '2020-04-11', 'pinjam', 'cobaan', '2020-04-06 00:16:08', '2020-04-06 00:16:08'),
(4, 'TR00004', 'mahindra', 'obeng', '123', 'baris1', '2020-04-06', '2020-04-11', 'pinjam', 'asuu', '2020-04-06 01:09:14', '2020-04-06 01:09:14'),
(5, 'TR00005', 'lingga', 'h', '7986', 'baris1', '2020-04-06', '2020-04-11', 'kembali', 'cobaan', '2020-04-06 01:09:47', '2020-04-06 01:09:57'),
(6, 'TR00006', 'jiji', 'h', '7986', 'baris1', '2020-04-06', '2020-04-11', 'pinjam', 'mumung', '2020-04-06 01:25:10', '2020-04-06 01:25:10'),
(7, 'TR00007', 'jiji', 'obeng', '123', 'baris1', '2020-04-10', '2020-04-15', 'pinjam', 'sggew', '2020-04-10 03:27:07', '2020-04-10 03:27:07'),
(8, 'TR00008', 'aksara123', 'igtu', '5875', 'baris2', '2020-04-10', '2020-04-15', 'pinjam', 'asdfghjkl', '2020-04-10 04:57:48', '2020-04-10 04:57:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
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
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `gambar`, `level`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'FaridMahindra', 'Farid123', 'faridmahindra@gmail.com', '$2y$10$qfxi2hvCLpij/es/WVEFYuHw2seEhmkaRBWRmK2ie3yolmQD8ReEe', '19749-2019-09-04-19-54-26.jpg', 'user', '4NiR7JTCAh6FK7LxNCIbG2CLmE8ueuhhof8CyAnowl1Shpa5VtDKYQbSNO7G', '2019-09-04 12:54:26', '2019-09-04 20:48:46'),
(4, 'lingga', 'lingga', 'lingga@gmail.com', '$2y$10$BM6ju6axEDj3tiDxl5BAeu.TBrOmJPjMWoN9SuEiv5uGlFWZQoKNi', NULL, 'user', 'IwgRv7acOJrmvkO4Gvd3TOmk482vmnrd1w1k7eQdrhtSlcZYcrrOQ9CvFAal', '2019-09-04 12:59:43', '2019-09-04 12:59:43'),
(5, 'farid321', 'farid321', 'faridmahindra321@gmail.com', '$2y$10$Tc9pHA7IvLmbmLr/GNFV3u4tMarpG7agP7zutTdHQPCLPWET0/8Rq', '97940-2019-11-11-21-59-47.jpg', 'admin', 'gICjBa1Gg0jfeYS7rHYh1JnWlgo4g1thJhgFPjwg8HBhKaUXAXjsZHYqJSvk', '2019-11-11 14:59:47', '2019-11-11 14:59:47'),
(6, 'aksara', 'aksara', 'aksara@gmail.com', '$2y$10$8ygnp/KAd.DmhwgIzITeS.HPqfZx/fFpdhw5jvoCexsZW51UvNIzu', NULL, 'user', 'fiM8gH3fsFUtiHI47JrvC4eCLbW1EvQuxxv2o8MOWMPKE70MA4UiGVjUsnpW', '2019-12-10 19:17:43', '2019-12-10 19:17:43'),
(7, 'mamang', 'mamang', 'mamang@gmail.com', '$2y$10$QxToY7MiTSe86Z9jmf6mLOWntvyTvC2zA9lkWb3sYytt71Qvq5BSG', NULL, 'user', 'tyRjufZk3Nnera5gOw7Iq2JqOtCt8LmwJnnzaKQAQP6xPhoiqnQEq68OGdp1', '2019-12-11 00:43:10', '2019-12-11 00:43:10'),
(8, 'sule', 'sule123', 'sule@gmail.com', '$2y$10$10K2t9DM0fDINf4vxeVN/uA/SySJ9pLX.49.E4HRNm5AcHRPJWCx2', NULL, 'admin', 'sjbwNff9YCeEODVaBjVMEQ8yFMgLP92kXsAWsRLWMXdjOwJFN7sbzKWANjGw', '2020-01-29 23:07:13', '2020-01-29 23:07:13'),
(9, 'opik', 'opik', 'opik@gmail.com', '$2y$10$xasf5ryxmOWCmwvq3QOENuwkeNZHKbdRTejUAL/iGS/UwPOG64Kiy', NULL, 'user', 'aCFvBg9TUbAIY93mNfE3kZs1m0wTWucqSvYe5RHcpVZpTzpwWTejaA5bI6Yu', '2020-04-06 00:18:13', '2020-04-06 00:18:13'),
(10, 'pipi', 'pipi', 'pipi@GMAIL.COM', '$2y$10$5gCQBkieAQoejQAF11lu1u7FrzG3.1knMVOQ1XxNUVaNIzxsTQxZG', NULL, 'admin', NULL, '2020-04-06 01:20:35', '2020-04-06 01:20:35'),
(11, 'jiji', 'jiji', 'jiji@gmail.com', '$2y$10$RJgCWRbr3agh7oAO6N.Nt.HWD3Iztow.j5j52QQjYgnlYFn/9hDBS', NULL, 'user', 'ZDs2lF5vxCQsh9IELby4K4HqP43VMdkEgVYjNZAo1x2axLbXigLmKAyBiR98', '2020-04-06 01:23:51', '2020-04-06 01:23:51'),
(12, 'admin', 'adminn', 'adminn@gmail.com', '$2y$10$GZuHDnW7YrKpHEr4vxvm2OFXDvOeU7btfLG1VbZpQOXZ4Agnn5FHW', NULL, 'admin', 'S8wNhq1soqGjtMcpEg8h8QjlWX9tttDUs2HiSTDqiadWcEEtYg3QAZAx9DJs', '2020-04-08 23:20:02', '2020-04-10 04:59:40');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anggota_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `peralatan`
--
ALTER TABLE `peralatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `peralatan`
--
ALTER TABLE `peralatan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
