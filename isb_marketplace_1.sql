-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 16 Jan 2026 pada 11.34
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `isb_marketplace_1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int NOT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `foto_profil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `alamat_user`
--

CREATE TABLE `alamat_user` (
  `id_alamat` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `nama_penerima` varchar(100) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat_lengkap` text,
  `kecamatan` varchar(50) DEFAULT NULL,
  `desa` varchar(100) DEFAULT NULL,
  `kabupaten` varchar(50) DEFAULT NULL,
  `provinsi` varchar(50) DEFAULT NULL,
  `kode_pos` varchar(10) DEFAULT NULL,
  `catatan` text,
  `alamat_utama` tinyint(1) DEFAULT '0' COMMENT '1 = alamat utama, 0 = bukan alamat utama',
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `alamat_user`
--

INSERT INTO `alamat_user` (`id_alamat`, `id_user`, `nama_penerima`, `no_hp`, `alamat_lengkap`, `kecamatan`, `desa`, `kabupaten`, `provinsi`, `kode_pos`, `catatan`, `alamat_utama`, `latitude`, `longitude`) VALUES
(1, 1, 'Sandi', '085758020943', 'jl. bukit kuang.', 'Kelapa', 'Desa Kelapa', 'Kabupaten Bangka Barat', 'Bangka Belitung', '33364', 'Tolong di depan rumah ya', 1, -1.88833319, 105.69463160),
(2, 2, 'Budi Santoso', '081234567890', 'Jl. Gatot Subroto No. 88, Gedung Plaza', 'Kuningan', NULL, 'Jakarta Selatan', 'DKI Jakarta', '12950', 'Ambil di lobby gedung', 1, NULL, NULL),
(3, 3, 'Hafizh', '081278827024', 'JLN, Bangka Barat', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(4, 1, 'Sandi', '085758020943', 'Kec. Taman Sari\r\nKota Pangkal Pinang, Kepulauan Bangka Belitung', 'Taman Sari', 'Semabung Lama', 'Kota Pangkal Pinang', 'Bangka Belitung', '33364', 'Tolong di depan rumah ya', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id_detail` int NOT NULL,
  `id_pesan` int DEFAULT NULL,
  `id_produk` int DEFAULT NULL,
  `id_varian` int DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `harga` int DEFAULT NULL,
  `subtotal` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id_detail`, `id_pesan`, `id_produk`, `id_varian`, `jumlah`, `harga`, `subtotal`, `created_at`) VALUES
(19, 19, 23, 3, 2, 15100000, 30200000, '2026-01-11 16:57:58'),
(20, 20, 23, 4, 2, 15120000, 30240000, '2026-01-11 17:05:54'),
(21, 21, 20, 5, 1, 10000, 10000, '2026-01-11 20:22:49'),
(22, 21, 20, 6, 1, 10000, 10000, '2026-01-11 20:22:49'),
(23, 22, 20, 5, 1, 10000, 10000, '2026-01-11 21:18:08'),
(24, 22, 20, 6, 1, 10000, 10000, '2026-01-11 21:18:08'),
(25, 22, 24, NULL, 1, 2500000, 2500000, '2026-01-11 21:18:08'),
(26, 22, 23, 3, 1, 15100000, 15100000, '2026-01-11 21:18:08'),
(27, 23, 20, 5, 2, 10000, 20000, '2026-01-12 00:39:55'),
(28, 23, 20, 6, 2, 10000, 20000, '2026-01-12 00:39:55'),
(29, 24, 20, 5, 2, 10000, 20000, '2026-01-12 00:59:05'),
(30, 24, 20, 6, 2, 10000, 20000, '2026-01-12 00:59:05'),
(31, 25, 20, 5, 2, 10000, 20000, '2026-01-12 01:01:03'),
(32, 25, 20, 6, 3, 10000, 30000, '2026-01-12 01:01:03'),
(33, 26, 23, 3, 2, 15100000, 30200000, '2026-01-12 01:04:27'),
(34, 27, 20, 5, 1, 10000, 10000, '2026-01-12 12:35:43'),
(35, 28, 23, 3, 1, 15100000, 15100000, '2026-01-12 21:37:44'),
(36, 29, 21, NULL, 2, 12999000, 25998000, '2026-01-12 21:56:14'),
(37, 30, 23, 3, 1, 15100000, 15100000, '2026-01-12 21:56:47'),
(38, 31, 26, 7, 1, 55000, 55000, '2026-01-13 10:51:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL,
  `nama_kategori` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi_kategori` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `icon_kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('aktif','tidak_aktif') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'aktif',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `deskripsi_kategori`, `icon_kategori`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Makanan', 'Kategori Makanan menyediakan berbagai pilihan kuliner yang praktis, lezat, dan sesuai dengan kebutuhan mahasiswa maupun masyarakat kampus. Produk dalam kategori ini mencakup makanan siap saji, camilan, hingga minuman yang mendukung aktivitas sehari-hari.\r\n🔹 Isi Kategori\r\n- Makanan Siap Saji: nasi kotak, mie instan, roti, dan lauk praktis.\r\n- Camilan & Snack: keripik, biskuit, cokelat, permen, dan jajanan ringan.\r\n- Minuman: kopi, teh, susu, minuman energi, dan minuman kemasan.\r\n- Makanan Tradisional: jajanan khas daerah yang bisa dinikmati di lingkungan kampus.\r\n🔹 Tujuan Kategori\r\n- Memudahkan pelanggan menemukan kebutuhan makanan sehari-hari dengan cepat.\r\n- Menyediakan pilihan kuliner yang sesuai dengan gaya hidup mahasiswa yang aktif.\r\n- Mendukung suasana kampus dengan makanan yang terjangkau, praktis, dan bervariasi.\r\n', 'uploads/kategori/1767201352_8c6d7383ecfa76b1e30a.png', 'aktif', '2025-12-17 05:44:58', '2025-12-31 17:15:52'),
(2, 'Elektronik', 'Kategori Elektronik berisi berbagai produk teknologi modern yang mendukung aktivitas sehari-hari, belajar, bekerja, maupun hiburan. Di dalamnya tersedia perangkat dengan kualitas terbaik dan fitur terbaru untuk memenuhi kebutuhan mahasiswa, dosen, maupun masyarakat kampus.\r\n🔹 Isi Kategori\r\n- Laptop & Komputer: perangkat untuk produktivitas, desain, coding, dan gaming.\r\n- Smartphone & Tablet: komunikasi, akses informasi, dan aplikasi mobile.\r\n- Aksesoris Elektronik: headphone, smartwatch, charger, dan perangkat pendukung lainnya.\r\n- Perangkat Hiburan: speaker, konsol game, dan gadget multimedia.\r\n🔹 Tujuan Kategori\r\n- Menyediakan produk elektronik yang relevan dengan kebutuhan kampus.\r\n- Memudahkan pelanggan menemukan perangkat teknologi dalam satu kategori khusus.\r\n- Mendukung gaya hidup digital yang praktis, efisien, dan terhubung\r\n', 'uploads/kategori/1767201329_e2da904c91cf439874a6.png', 'aktif', '2025-12-17 10:06:45', '2025-12-31 17:15:29'),
(3, 'Minuman', 'Minuman', 'uploads/kategori/1767209967_0390184fb34743c288e9.png', 'aktif', '2025-12-31 19:39:27', '2025-12-31 19:39:27'),
(4, 'Fashion', 'Fashion/Busana', 'uploads/kategori/1767210100_792c45caa9047ac0eef2.png', 'aktif', '2025-12-31 19:41:40', '2025-12-31 19:41:40'),
(5, 'Buku', 'Buku', 'uploads/kategori/1767210134_cad8f02b7333201e8332.png', 'aktif', '2025-12-31 19:42:14', '2025-12-31 19:42:14'),
(6, 'Aplikasi & Jasa', 'Jasa Buat Apk atau Web, editing, Aplikasi premium.', 'uploads/kategori/1767210287_8c3f4be8ed94f355f0b4.png', 'aktif', '2025-12-31 19:44:47', '2025-12-31 19:44:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `id_produk` int DEFAULT NULL,
  `id_varian` int DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `harga_saat_itu` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`id_keranjang`, `id_user`, `id_produk`, `id_varian`, `jumlah`, `harga_saat_itu`) VALUES
(73, 1, 23, 3, 2, 10600000),
(74, 1, 23, 4, 2, 10620000),
(75, 2, 21, NULL, 2, 9099300);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int NOT NULL,
  `id_kategori` int NOT NULL,
  `nama_menu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi_menu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` enum('aktif','tidak_aktif') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'aktif',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `id_kategori`, `nama_menu`, `deskripsi_menu`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Makanan Saji', 'Makanan Siap Saji: nasi kotak, mie instan, roti, dan lauk praktis.\r\n', 'aktif', '2025-12-17 05:46:07', '2025-12-17 18:56:58'),
(3, 2, 'Smartphone', 'komunikasi, akses informasi, dan aplikasi mobile.', 'aktif', '2025-12-17 10:07:23', '2025-12-17 18:56:02'),
(4, 2, 'Laptop', 'Laptop', 'aktif', '2025-12-31 19:48:29', '2025-12-31 19:48:29'),
(5, 2, 'Tablet', 'Tablet', 'aktif', '2025-12-31 19:48:54', '2025-12-31 19:48:54'),
(6, 2, 'Kamera', 'Kamera', 'aktif', '2025-12-31 19:49:28', '2025-12-31 19:49:28'),
(7, 2, 'Smartwatch ', 'Smartwatch ', 'aktif', '2025-12-31 19:50:00', '2025-12-31 19:50:00'),
(8, 4, 'Pakaian', 'Pakaian', 'aktif', '2025-12-31 19:52:41', '2025-12-31 19:52:41'),
(9, 4, 'Tas', 'Tas', 'aktif', '2025-12-31 19:52:52', '2025-12-31 19:52:52'),
(10, 4, 'Sepatu', 'Sepatu', 'aktif', '2025-12-31 19:53:03', '2025-12-31 19:53:03'),
(11, 4, 'Jam Tangan', 'Jam Tangan', 'aktif', '2025-12-31 19:53:27', '2025-12-31 19:53:27'),
(12, 4, 'Kacamata', 'Kacamata', 'aktif', '2025-12-31 19:53:49', '2025-12-31 19:53:49'),
(13, 5, 'Buku Teknik', 'Buku Teknik', 'aktif', '2025-12-31 19:54:39', '2025-12-31 19:54:39'),
(14, 5, 'Buku Akademik', 'Buku Akademik', 'aktif', '2025-12-31 19:54:54', '2025-12-31 19:54:54'),
(15, 5, 'Novel', 'Novel', 'aktif', '2025-12-31 19:55:08', '2025-12-31 19:55:08'),
(16, 5, 'Buku Biografi', 'Buku Biografi', 'aktif', '2025-12-31 19:55:50', '2025-12-31 19:55:50'),
(17, 5, 'Komik', 'Komik', 'aktif', '2025-12-31 19:56:30', '2025-12-31 19:56:30'),
(18, 6, 'Aplikasi', 'Aplikasi', 'aktif', '2025-12-31 19:57:04', '2026-01-13 03:44:52'),
(19, 6, 'Web Development ', 'Web Development ', 'aktif', '2025-12-31 19:57:50', '2025-12-31 19:57:50'),
(20, 6, 'Desain', 'Desain', 'aktif', '2025-12-31 19:58:07', '2025-12-31 19:58:07'),
(21, 6, 'Marketing', 'Marketing', 'aktif', '2025-12-31 19:58:41', '2025-12-31 19:58:41'),
(22, 6, 'Editor', 'Editor', 'aktif', '2025-12-31 19:59:20', '2025-12-31 19:59:20'),
(23, 1, 'Makanan Berat', 'Makanan Berat', 'aktif', '2025-12-31 20:00:12', '2025-12-31 20:00:12'),
(24, 1, 'Makanan Ringan', 'Makanan Ringan', 'aktif', '2025-12-31 20:00:26', '2025-12-31 20:00:26'),
(25, 1, 'Kue', 'Kue', 'aktif', '2025-12-31 20:00:43', '2025-12-31 20:00:43'),
(26, 1, 'Buah', 'Buah', 'aktif', '2025-12-31 20:00:56', '2025-12-31 20:00:56'),
(27, 1, 'Sayuran', 'Sayuran', 'aktif', '2025-12-31 20:01:11', '2025-12-31 20:01:11'),
(28, 3, 'Coffee ', 'Coffee ', 'aktif', '2025-12-31 20:02:32', '2025-12-31 20:02:32'),
(29, 3, 'Tea', 'Tea', 'aktif', '2025-12-31 20:02:46', '2025-12-31 20:02:46'),
(30, 3, 'Juice', 'Juice', 'aktif', '2025-12-31 20:03:20', '2025-12-31 20:03:20'),
(31, 3, 'Minuman Saji', 'Minuman Saji', 'aktif', '2025-12-31 20:03:53', '2025-12-31 20:03:53'),
(32, 3, 'Minuman Tradisional', 'Minuman Tradisional', 'aktif', '2025-12-31 20:04:53', '2025-12-31 20:04:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_payment` int NOT NULL,
  `id_pesan` int DEFAULT NULL,
  `metode` varchar(50) DEFAULT NULL,
  `total_bayar` int DEFAULT NULL,
  `bukti_transfer` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_payment`, `id_pesan`, `metode`, `total_bayar`, `bukti_transfer`, `status`) VALUES
(1, 6, 'kartu-kredit-debit', 19616300, NULL, 'pending'),
(2, 7, 'transfer-bank', 10510000, NULL, 'pending'),
(3, 8, 'kartu-kredit-debit', 14750, NULL, 'pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjual`
--

CREATE TABLE `penjual` (
  `id_penjual` int NOT NULL,
  `nama_toko` varchar(100) DEFAULT NULL,
  `deskripsi` text,
  `foto_toko` varchar(255) DEFAULT NULL,
  `rekening_bank` varchar(50) DEFAULT NULL,
  `id_user` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesan` int NOT NULL,
  `no_pesanan` varchar(50) DEFAULT NULL COMMENT 'Nomor pesanan unik (ORD-001)',
  `id_user` int DEFAULT NULL,
  `id_alamat` int DEFAULT NULL,
  `tanggal_pesan` datetime DEFAULT NULL,
  `tanggal_kirim` datetime DEFAULT NULL COMMENT 'Tanggal pengiriman',
  `tanggal_selesai` datetime DEFAULT NULL COMMENT 'Tanggal selesai',
  `metode_pengiriman` varchar(50) DEFAULT NULL,
  `metode_pembayaran` varchar(50) DEFAULT NULL COMMENT 'Metode pembayaran yang dipilih user',
  `no_resi` varchar(100) DEFAULT NULL COMMENT 'Nomor resi pengiriman',
  `ongkir` int DEFAULT NULL,
  `total_harga` int DEFAULT NULL,
  `total_bayar` int DEFAULT NULL,
  `id_voucher` int DEFAULT NULL,
  `status_pesanan` enum('Diproses','Dikirim','Selesai','Dibatalkan','Sedang diBayar') DEFAULT 'Diproses',
  `catatan_admin` text COMMENT 'Catatan admin untuk pesanan',
  `pesan_penjual` text COMMENT 'Pesan untuk penjual dari user',
  `is_direct_order` tinyint(1) DEFAULT '0' COMMENT '1 = direct order from product page, 0 = from cart',
  `produk_id` int DEFAULT NULL COMMENT 'Product ID if direct order',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_pesan`, `no_pesanan`, `id_user`, `id_alamat`, `tanggal_pesan`, `tanggal_kirim`, `tanggal_selesai`, `metode_pengiriman`, `metode_pembayaran`, `no_resi`, `ongkir`, `total_harga`, `total_bayar`, `id_voucher`, `status_pesanan`, `catatan_admin`, `pesan_penjual`, `is_direct_order`, `produk_id`, `created_at`, `updated_at`) VALUES
(25, 'ORD-20260111-007', 1, 1, '2026-01-11 18:01:03', NULL, '2026-01-12 05:36:07', 'antar', 'cod', NULL, 15000, 50000, 51000, NULL, 'Dibatalkan', NULL, 'Pastikan barang aman ya kak!', 0, NULL, '2026-01-11 18:01:03', '2026-01-12 12:33:07'),
(26, 'ORD-20260111-008', 1, 1, '2026-01-11 18:04:27', '2026-01-12 05:36:14', '2026-01-12 12:33:26', 'antar', 'cod', NULL, 15000, 30200000, 21156000, NULL, 'Selesai', NULL, NULL, 0, NULL, '2026-01-11 18:04:27', '2026-01-12 12:33:26'),
(27, 'ORD-20260112-001', 1, 1, '2026-01-12 05:35:42', NULL, '2026-01-12 12:33:31', 'antar', 'cod', NULL, 15000, 10000, 23000, NULL, 'Selesai', NULL, NULL, 0, NULL, '2026-01-12 05:35:43', '2026-01-12 12:33:31'),
(28, 'ORD-20260112-002', 1, 1, '2026-01-12 14:37:44', NULL, NULL, 'antar', 'kartu', NULL, 15000, 15100000, 10586000, NULL, 'Diproses', NULL, NULL, 0, NULL, '2026-01-12 14:37:44', '2026-01-12 14:37:44'),
(29, 'ORD-20260112-003', 2, 2, '2026-01-12 14:56:14', NULL, NULL, 'antar', 'kartu', NULL, 15000, 25998000, 18214600, NULL, 'Diproses', NULL, NULL, 0, NULL, '2026-01-12 14:56:14', '2026-01-12 14:56:14'),
(30, 'ORD-20260112-004', 2, 2, '2026-01-12 14:56:47', NULL, NULL, 'antar', 'kartu', NULL, 15000, 15100000, 10586000, NULL, 'Diproses', NULL, NULL, 0, NULL, '2026-01-12 14:56:47', '2026-01-12 14:56:47'),
(31, 'ORD-20260113-001', 1, 1, '2026-01-13 03:51:09', NULL, '2026-01-13 03:52:19', 'antar', 'kartu', NULL, 15000, 55000, 54500, NULL, 'Selesai', NULL, 'antar', 0, NULL, '2026-01-13 03:51:09', '2026-01-13 03:52:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan_status_log`
--

CREATE TABLE `pesanan_status_log` (
  `id_log` int NOT NULL,
  `id_pesan` int NOT NULL,
  `status_sebelumnya` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_baru` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dibuat_oleh` int DEFAULT NULL COMMENT 'ID admin yang mengubah status',
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'Keterangan perubahan status',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int NOT NULL,
  `id_toko` int DEFAULT NULL,
  `nama_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi_produk` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `gambar_produk` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'JSON array of image paths: ["path1.jpg", "path2.jpg"]',
  `id_kategori` int DEFAULT NULL,
  `id_menu` int DEFAULT NULL,
  `merek` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `harga_awal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `harga_diskon` decimal(15,2) DEFAULT '0.00',
  `tipe_diskon` enum('persentase','nominal') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'persentase',
  `id_promo` int DEFAULT NULL,
  `harga_setelah_diskon` decimal(15,2) DEFAULT '0.00',
  `stok` int NOT NULL DEFAULT '0',
  `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `berat` int DEFAULT '0' COMMENT 'Berat dalam gram',
  `status_produk` enum('aktif','tidak_aktif','draft') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'draft',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_toko`, `nama_produk`, `deskripsi_produk`, `gambar_produk`, `id_kategori`, `id_menu`, `merek`, `harga_awal`, `harga_diskon`, `tipe_diskon`, `id_promo`, `harga_setelah_diskon`, `stok`, `sku`, `berat`, `status_produk`, `created_at`, `updated_at`) VALUES
(20, 1, 'Indomie pack', 'selerakuu', '[\"uploads\\/produk\\/1765969793_788a7469deb3da6ee246.jpg\"]', 1, 1, 'Indofood', 5000.00, 5.00, 'persentase', NULL, 4750.00, 9, 'SKU-001', 5, 'aktif', '2025-12-17 11:09:53', '2026-01-04 05:32:37'),
(21, 1, 'Xiaomi 15 Pro', '📱 Xiaomi 15 Pro\r\nDeskripsi Produk: Xiaomi 15 Pro hadir dengan desain premium dan performa kelas flagship. Dilengkapi layar AMOLED beresolusi tinggi dengan refresh rate 120Hz, memberikan pengalaman visual yang jernih dan mulus. Didukung prosesor terbaru Snapdragon, RAM besar, serta kapasitas penyimpanan luas, membuat multitasking dan gaming berjalan tanpa hambatan. Kamera AI canggih dengan sensor utama resolusi tinggi menghasilkan foto tajam dan detail, bahkan dalam kondisi minim cahaya. Baterai tahan lama dengan fast charging memastikan aktivitas harian tetap lancar. Cocok untuk mahasiswa, profesional, maupun pecinta teknologi yang menginginkan smartphone modern dengan fitur lengkap\r\n', 'uploads/produk/1765998169_dd18dc014ecfef42e5c1.jpg', 2, 3, 'Xiaomi', 12999000.00, 30.00, 'persentase', 1, 9099300.00, 9, 'Hp-001', 300, 'aktif', '2025-12-17 19:02:49', '2026-01-03 19:01:46'),
(23, 1, 'ASUS ZENBOOK 14 OLED', 'ASUS Zenbook 14 OLED\r\nThe Lightest 14” AI OLED Laptop with All-Day Battery Life\r\nTingkatkan pengalaman Anda dengan Zenbook 14 OLED ultraportable yang tipis dan canggih. Desainnya yang tipis dan ringan menampung kekuatan prosesor AMD Ryzen™ 8040 Series terbaru berkemampuan AI, yang membuat peralatan AI terbang, bersama dengan grafis AMD Radeon™. Baterai yang tahan lama memastikan daya sepanjang hari, dan terdapat port I/O lengkap untuk konektivitas yang ditingkatkan. Engsel 180°-nya memungkinkan berbagi dengan mudah, dan Anda dapat menyelami dunia kenikmatan indra dengan layar ASUS Lumina OLED1 yang dinamis dan speaker super-linear mutakhir, sekaligus menggunakan desain ramah lingkungan yang memancarkan keanggunan ramah lingkungan.', '[\"uploads\\/produk\\/1768558298_0596123722427cfb6595.png\",\"uploads\\/produk\\/1766327165_3c7c8ed3b21c652038d8.svg\",\"uploads\\/produk\\/1766327165_4093463d676ea47ce882.svg\",\"uploads\\/produk\\/1766327165_2fa1d57138e07a57db07.svg\"]', 2, 4, 'ASUS', 15000000.00, 30.00, 'persentase', 1, 10500000.00, 11, 'LP-001', 600, 'aktif', '2025-12-21 14:26:05', '2026-01-16 10:11:38'),
(24, 1, 'Sepatu Adizero EVO SL', 'Warna: Grey Five/Core Black/Lime Burst\r\nMaterial Atas: Textile\r\nMaterial Bagian Dalam: Textile\r\nMaterial Sol: Rubber', '[\"uploads\\/produk\\/1768558527_c5685fbb0d5525d1f463.png\",\"uploads\\/produk\\/1768062616_35b5ca53d617eceaa86c.webp\"]', 4, 10, 'ADIDAS', 2500000.00, 30.00, 'persentase', 1, 1750000.00, 10, 'SKU-004', 689, 'aktif', '2025-12-23 01:04:25', '2026-01-16 10:15:27'),
(26, 1, 'Sukarno: Biografi Lengkap Negarawan Sejati', 'Buku ini merangkum perjalanan hidup Sukarno mulai sejak masih kecil hingga wafat dan berupaya menetapkan Sukarno sebagai manusia yang lengkap. Selain itu, buku ini ditulis dengan bahasa yang mudah dipahami dan cara cerita yang menarik. Dramatisasinya membuat pembaca terbawa untuk menyelami kehidupan Sukarno yang berliku-liku.\r\n\r\nUntuk para warga negara Indonesia, mulai dari generasi muda hingga generasi veteran pasti sudah tidak asing lagi dengan Ir. Soekarno, Pahlawan Nasional Indonesia yang merupakan presiden pertama Republik Indonesia. Perjuangan dan jasanya untuk bangsa Indonesia tidak terhitung jumlah, bahkan kehebatannya tidak hanya terkenal di dalam negeri, namun terkenal sampai kancah internasional. Buku ini berisikan rangkuman perjalanan hidup dari sang presiden pertama Republik Indonesia, yang juga adalah pahlawan yang berperan penting dalam kemerdekaan Indonesia. Buku yang satu ini dapat menjadi salah satu media untuk kamu mengenal lebih jauh mengenai Ir. Soekarno. Buku-buku ini berisi kisah-kisah inspiratif yang menjadi jejak keteladanan dari sang presiden pertama NKRI yang dapat kamu simak, bahkan kamu jadikan teladan dalam kehidupan sehari-hari kamu. Dengan bahasa yang ringan dan mudah dipahami, tentunya tidak akan membuat kamu bosan membaca kisah perjalanan hidup Ir. Soekarno ini. Gaya bercerita yang dibumbui dengan dramatisasi, dapat membuat kamu terbawa suasana dan menyelam kehidupan dari presiden pertama Indonesia yang berliku-liku.', '[\"uploads\\/produk\\/1768472250_36ef94f62b8c0559d859.png\"]', 5, 16, 'C-Klik Media', 67500.00, 30.00, 'persentase', 1, 47250.00, 10, 'SKU-005', 100, 'aktif', '2026-01-13 03:48:20', '2026-01-15 10:17:30'),
(27, 1, 'Jam Tangan Pria Casio', 'Brand : Casio Edifice\r\nModel No : EFR-526L-7AVUDF\r\nGender : Pria\r\nCase Back : Screw Down Case Back\r\nCase Material : Stainless Steel\r\nClasp : Buckle\r\nWarna Produk : Coklat, Hitam, Putih, Silver\r\nDial : Analog\r\nDiameter : 43.8 mm\r\nThickness : 11.6 mm\r\nFeature : Chronograph, Sport Watch\r\nGlass Material : Mineral crystal\r\nLuminous : Yes\r\nMovement : Quartz/Battery\r\nStrap Material : Leather/Kulit\r\nStyle : Sport\r\nGaransi : Garansi Machtwatch 2 Tahun\r\nWater Resistant : 100 Meters/10 ATM/10 BAR\r\nBerat : 500\r\nApprox. battery life :2 years on SR920SW, Regular timekeeping :Analog: 3 hands (hour, minute, second), , 3 dials (stopwatch 1/10 seconds, stopwatch minutes, stopwatch seconds), Stopwatch :1/10-second stopwatch , Measuring capacity: 59\'59.9\'\' , Measuring modes: Elapsed time, split time, 1st-2nd place times, Accuracy :+-20 seconds per month, Weight :74g, Weight after packing :approx. 700g, Inside Box :1x Casio Edifice EFR-526L-7AVUDF Chronograph Panda Men White Dial Brown Leather Strap , 1x Manual Book , 1x Warranty Card , 1x Casio Box,', '[\"uploads\\/produk\\/1768471945_9392eb1e8f7afc083fbe.png\",\"uploads\\/produk\\/1768471945_67eaa7a93f6a81d38e1f.png\"]', 4, 11, 'Casio', 1200000.00, 30.00, 'persentase', 1, 840000.00, 10, 'SKU-006', 100, 'aktif', '2026-01-13 16:29:23', '2026-01-15 10:12:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_varian`
--

CREATE TABLE `produk_varian` (
  `id_varian` int NOT NULL,
  `id_produk` int NOT NULL,
  `nama_varian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nama varian (contoh: Warna, Ukuran)',
  `nilai_varian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nilai varian (contoh: Merah, XL)',
  `harga_tambahan` decimal(15,2) DEFAULT '0.00' COMMENT 'Harga tambahan untuk varian ini',
  `stok_varian` int DEFAULT '0' COMMENT 'Stok untuk varian ini',
  `sku_varian` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SKU khusus untuk varian',
  `gambar_varian` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'JSON array of image paths for this variant: ["path1.jpg", "path2.jpg"]',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk_varian`
--

INSERT INTO `produk_varian` (`id_varian`, `id_produk`, `nama_varian`, `nilai_varian`, `harga_tambahan`, `stok_varian`, `sku_varian`, `gambar_varian`, `created_at`, `updated_at`) VALUES
(3, 23, '16 GB RAM / 512 GB SSD', 'Hitam', 100000.00, 5, NULL, '[\"uploads\\/produk\\/1766327165_229c3e276e011c0aad9a.png\"]', '2025-12-21 14:26:05', '2026-01-16 10:11:38'),
(4, 23, '32 GB RAM / 1 TB SSD', 'Putih', 120000.00, 6, NULL, '[\"uploads\\/produk\\/1766327165_4cf353a0dca31b7a751a.jpg\"]', '2025-12-21 14:26:05', '2026-01-16 10:11:38'),
(5, 20, 'Mie Rasa Dendeng Balado', '1 Bungkus', 5000.00, 10, NULL, '[\"uploads\\/produk\\/1766330229_08a512fc7a29414a7fa4.webp\"]', '2025-12-21 15:17:09', '2025-12-21 15:17:09'),
(6, 20, 'Mie Rasa Soto Lamongan', '1 Bungkus', 5000.00, 10, NULL, '[\"uploads\\/produk\\/1766330229_2b8ee4fd41ac87787bd7.webp\"]', '2025-12-21 15:17:09', '2025-12-21 15:17:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `promo`
--

CREATE TABLE `promo` (
  `id_promo` int NOT NULL,
  `id_toko` int DEFAULT NULL,
  `nama_promo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tipe_promo` enum('flash_sale','diskon_bundling','voucher') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'flash_sale',
  `tipe_diskon` enum('persentase','nominal') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'persentase',
  `target_tipe` enum('produk','kategori','menu') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'produk' COMMENT 'Tipe target promo',
  `target_kategori` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'JSON array of kategori IDs',
  `target_menu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'JSON array of menu IDs',
  `nilai_diskon` decimal(10,2) NOT NULL,
  `tanggal_mulai` datetime NOT NULL,
  `tanggal_berakhir` datetime NOT NULL,
  `target_produk` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'JSON array of product IDs',
  `deskripsi_promo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'Deskripsi dan syarat ketentuan promo',
  `limit_stok` int DEFAULT NULL COMMENT 'Limitasi stok promo (NULL = tidak ada limit)',
  `stok_terpakai` int DEFAULT '0' COMMENT 'Stok promo yang sudah terpakai',
  `total_penjualan` decimal(15,2) DEFAULT '0.00' COMMENT 'Total penjualan dari promo',
  `total_pesanan` int DEFAULT '0' COMMENT 'Total pesanan dari promo',
  `kode_voucher` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Kode voucher untuk tipe voucher',
  `status` enum('aktif','tidak_aktif','selesai') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'aktif',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `promo`
--

INSERT INTO `promo` (`id_promo`, `id_toko`, `nama_promo`, `tipe_promo`, `tipe_diskon`, `target_tipe`, `target_kategori`, `target_menu`, `nilai_diskon`, `tanggal_mulai`, `tanggal_berakhir`, `target_produk`, `deskripsi_promo`, `limit_stok`, `stok_terpakai`, `total_penjualan`, `total_pesanan`, `kode_voucher`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Flash Sale New Year', 'flash_sale', 'persentase', NULL, NULL, NULL, 30.00, '2026-01-10 00:00:00', '2026-01-18 00:00:00', NULL, 'Diskon hingga 30% untuk menu produk pilihan', NULL, 0, 0.00, 0, '', 'aktif', '2025-12-17 18:45:50', '2026-01-13 03:57:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `promo_riwayat`
--

CREATE TABLE `promo_riwayat` (
  `id_riwayat` int NOT NULL,
  `id_promo` int NOT NULL,
  `tanggal` date NOT NULL,
  `total_penjualan` decimal(15,2) DEFAULT '0.00',
  `total_pesanan` int DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `toko`
--

CREATE TABLE `toko` (
  `id_toko` int NOT NULL,
  `nama_toko` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status_toko` enum('verified_seller','official_store') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'verified_seller',
  `logo_toko` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner_toko` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deskripsi_toko` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `nomor_rekening` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Nomor rekening toko/admin',
  `nama_bank` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Nama bank',
  `nama_pemilik_rekening` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Nama pemilik rekening',
  `alamat_toko` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `kota` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `provinsi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kode_pos` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `negara` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Indonesia',
  `email_cs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `whatsapp_cs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jam_operasional_buka` time DEFAULT NULL,
  `jam_operasional_tutup` time DEFAULT NULL,
  `nama_admin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username_admin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_admin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telepon_admin` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rating` decimal(3,1) DEFAULT '0.0',
  `total_ulasan` int DEFAULT '0',
  `total_produk` int DEFAULT '0',
  `total_pengikut` int DEFAULT '0',
  `total_penjualan` int DEFAULT '0',
  `pendapatan` decimal(15,2) DEFAULT '0.00',
  `email_verified` tinyint(1) DEFAULT '0',
  `telepon_verified` tinyint(1) DEFAULT '0',
  `identitas_verified` tinyint(1) DEFAULT '0',
  `tanggal_bergabung` date DEFAULT NULL,
  `login_terakhir` datetime DEFAULT NULL,
  `status_akun` enum('aktif','nonaktif') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'aktif',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `toko`
--

INSERT INTO `toko` (`id_toko`, `nama_toko`, `status_toko`, `logo_toko`, `banner_toko`, `deskripsi_toko`, `nomor_rekening`, `nama_bank`, `nama_pemilik_rekening`, `alamat_toko`, `kota`, `provinsi`, `kode_pos`, `negara`, `email_cs`, `whatsapp_cs`, `jam_operasional_buka`, `jam_operasional_tutup`, `nama_admin`, `username_admin`, `email_admin`, `telepon_admin`, `rating`, `total_ulasan`, `total_produk`, `total_pengikut`, `total_penjualan`, `pendapatan`, `email_verified`, `telepon_verified`, `identitas_verified`, `tanggal_bergabung`, `login_terakhir`, `status_akun`, `created_at`, `updated_at`) VALUES
(1, 'HIMAGICELL', 'verified_seller', 'uploads/toko/1766321162_d17760452190e1be7c10.png', 'uploads/toko/1767465048_e22093c3efc48aa1896c.png', 'ISBCOMMERCE adalah marketplace terpercaya yang menyediakan berbagai produk elektronik, fashion, dan kebutuhan sehari-hari dengan kualitas terbaik dan harga terjangkau. Kami berkomitmen memberikan pelayanan terbaik untuk kepuasan pelanggan.', '1690004020282', 'Mandiri', 'Sandik', 'Jl. Jenderal Sudirman No. 123, Jakarta Pusat, DKI Jakarta 10220', 'Jakarta Pusat', 'DKI Jakarta', '10220', 'Indonesia', 'cs@isbcommerce.com', '+6281234567890', '09:00:00', '17:00:00', 'Muhammad IskandarD', '@admin_isb', 'admin@isbcommerce.com', '+62 812-3456-7890', 0.0, 0, 0, 0, 0, 0.00, 0, 0, 0, '2025-12-16', NULL, 'aktif', '2025-12-16 16:42:59', '2026-01-05 18:45:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulasan_produk`
--

CREATE TABLE `ulasan_produk` (
  `id_ulasan` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `id_produk` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `komentar` text,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `ulasan_produk`
--

INSERT INTO `ulasan_produk` (`id_ulasan`, `id_user`, `id_produk`, `rating`, `komentar`, `tanggal`) VALUES
(3, 1, 23, 4, 'Bagus', '2026-01-12'),
(4, 1, 26, 4, 'bagus', '2026-01-13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `nama_user` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(20) DEFAULT NULL,
  `nim` varchar(50) DEFAULT NULL,
  `program_studi` varchar(100) DEFAULT NULL,
  `foto_user` varchar(255) DEFAULT NULL,
  `google_id` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `email`, `password`, `no_telepon`, `nim`, `program_studi`, `foto_user`, `google_id`) VALUES
(1, 'Sandi Kurniawan', 'Sandi', 'Sandi@gmail.com', '$2y$10$2rY.xDqFuPYJ2028PrT.8uACHE7X4cATmjEXnkev0Kj53kmuUVLVe', '08575802094', '2411500014', 'Sistem Informasi', 'uploads/profiles/1768228420_7e9a1c043e31f74cbeec.jpg', '0'),
(2, 'Budi Santoso', 'budisantoso', 'budi.santoso@email.com', 'password123', '081234567890', '2411500016', 'Sistem Informasi', 'uploads/profiles/1768228777_2c25e0388a519f654ca3.webp', '0'),
(3, 'Hafizh R.i', 'hafizhr.i', '2411500014@mahasiswa.atmaluhur.ac.id', '$2y$12$gxYb5nE9mHEq4b4l7lr.MOe2oXY7qxARylvx6QgSPzo7Ui/g0BRbG', '081278827024', NULL, NULL, NULL, '0'),
(4, 'Akbar', 'akbar', '2411500039@mahasiswa.atmaluhur.ac.id', '$2y$12$3SwMRx3yDkN3J1Cd57ZL2unacsicq5MYpfvi2S17dhDxHMbgfMec.', '081234567123', NULL, NULL, NULL, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_settings`
--

CREATE TABLE `user_settings` (
  `id_setting` int NOT NULL,
  `id_user` int NOT NULL,
  `notifikasi_aktif` tinyint(1) DEFAULT '1',
  `password_changed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `user_settings`
--

INSERT INTO `user_settings` (`id_setting`, `id_user`, `notifikasi_aktif`, `password_changed_at`) VALUES
(1, 1, 1, '2026-01-03 15:39:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `voucher`
--

CREATE TABLE `voucher` (
  `id_voucher` int NOT NULL,
  `kode` varchar(20) DEFAULT NULL,
  `persentase` int DEFAULT NULL,
  `max_potongan` int DEFAULT NULL,
  `min_belanja` int DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `wishlist`
--

CREATE TABLE `wishlist` (
  `id_wishlist` int NOT NULL,
  `id_user` int NOT NULL,
  `id_produk` int NOT NULL,
  `id_varian` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `wishlist`
--

INSERT INTO `wishlist` (`id_wishlist`, `id_user`, `id_produk`, `id_varian`, `created_at`) VALUES
(22, 1, 24, NULL, '2026-01-10 18:11:08'),
(23, 1, 21, NULL, '2026-01-10 18:11:15'),
(28, 1, 20, 5, '2026-01-12 05:36:46'),
(31, 1, 23, 4, '2026-01-12 05:37:43'),
(32, 2, 23, NULL, '2026-01-12 14:56:28');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `alamat_user`
--
ALTER TABLE `alamat_user`
  ADD PRIMARY KEY (`id_alamat`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `idx_pesan` (`id_pesan`),
  ADD KEY `idx_produk` (`id_produk`),
  ADD KEY `idx_varian` (`id_varian`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `idx_status` (`status`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `idx_varian` (`id_varian`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `idx_kategori` (`id_kategori`),
  ADD KEY `idx_status` (`status`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `id_pesan` (`id_pesan`);

--
-- Indeks untuk tabel `penjual`
--
ALTER TABLE `penjual`
  ADD PRIMARY KEY (`id_penjual`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_alamat` (`id_alamat`),
  ADD KEY `id_voucher` (`id_voucher`),
  ADD KEY `idx_status` (`status_pesanan`),
  ADD KEY `idx_no_pesanan` (`no_pesanan`),
  ADD KEY `idx_tanggal` (`tanggal_pesan`),
  ADD KEY `idx_produk_id` (`produk_id`);

--
-- Indeks untuk tabel `pesanan_status_log`
--
ALTER TABLE `pesanan_status_log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `idx_pesan` (`id_pesan`),
  ADD KEY `idx_tanggal` (`created_at`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `idx_kategori` (`id_kategori`),
  ADD KEY `idx_menu` (`id_menu`),
  ADD KEY `idx_toko` (`id_toko`),
  ADD KEY `idx_status` (`status_produk`),
  ADD KEY `idx_sku` (`sku`);

--
-- Indeks untuk tabel `produk_varian`
--
ALTER TABLE `produk_varian`
  ADD PRIMARY KEY (`id_varian`),
  ADD KEY `idx_produk` (`id_produk`);

--
-- Indeks untuk tabel `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`id_promo`),
  ADD KEY `idx_toko` (`id_toko`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_tanggal` (`tanggal_mulai`,`tanggal_berakhir`),
  ADD KEY `idx_tipe_promo` (`tipe_promo`),
  ADD KEY `idx_status_promo` (`status`),
  ADD KEY `idx_tanggal_promo` (`tanggal_mulai`,`tanggal_berakhir`);

--
-- Indeks untuk tabel `promo_riwayat`
--
ALTER TABLE `promo_riwayat`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `idx_promo` (`id_promo`),
  ADD KEY `idx_tanggal` (`tanggal`);

--
-- Indeks untuk tabel `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id_toko`);

--
-- Indeks untuk tabel `ulasan_produk`
--
ALTER TABLE `ulasan_produk`
  ADD PRIMARY KEY (`id_ulasan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`id_setting`),
  ADD UNIQUE KEY `unique_user` (`id_user`);

--
-- Indeks untuk tabel `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id_voucher`);

--
-- Indeks untuk tabel `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id_wishlist`),
  ADD UNIQUE KEY `unique_user_product` (`id_user`,`id_produk`),
  ADD KEY `idx_user` (`id_user`),
  ADD KEY `idx_produk` (`id_produk`),
  ADD KEY `idx_varian` (`id_varian`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `alamat_user`
--
ALTER TABLE `alamat_user`
  MODIFY `id_alamat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `id_detail` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_payment` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `penjual`
--
ALTER TABLE `penjual`
  MODIFY `id_penjual` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `pesanan_status_log`
--
ALTER TABLE `pesanan_status_log`
  MODIFY `id_log` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `produk_varian`
--
ALTER TABLE `produk_varian`
  MODIFY `id_varian` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `promo`
--
ALTER TABLE `promo`
  MODIFY `id_promo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `promo_riwayat`
--
ALTER TABLE `promo_riwayat`
  MODIFY `id_riwayat` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `toko`
--
ALTER TABLE `toko`
  MODIFY `id_toko` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ulasan_produk`
--
ALTER TABLE `ulasan_produk`
  MODIFY `id_ulasan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `id_setting` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id_voucher` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id_wishlist` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `alamat_user`
--
ALTER TABLE `alamat_user`
  ADD CONSTRAINT `alamat_user_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `detail_pesanan_ibfk_1` FOREIGN KEY (`id_pesan`) REFERENCES `pesanan` (`id_pesan`),
  ADD CONSTRAINT `detail_pesanan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Ketidakleluasaan untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `keranjang_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Ketidakleluasaan untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_pesan`) REFERENCES `pesanan` (`id_pesan`);

--
-- Ketidakleluasaan untuk tabel `penjual`
--
ALTER TABLE `penjual`
  ADD CONSTRAINT `penjual_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`id_alamat`) REFERENCES `alamat_user` (`id_alamat`),
  ADD CONSTRAINT `pesanan_ibfk_3` FOREIGN KEY (`id_voucher`) REFERENCES `voucher` (`id_voucher`);

--
-- Ketidakleluasaan untuk tabel `pesanan_status_log`
--
ALTER TABLE `pesanan_status_log`
  ADD CONSTRAINT `fk_log_pesanan` FOREIGN KEY (`id_pesan`) REFERENCES `pesanan` (`id_pesan`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk_varian`
--
ALTER TABLE `produk_varian`
  ADD CONSTRAINT `fk_produk_varian_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `promo_riwayat`
--
ALTER TABLE `promo_riwayat`
  ADD CONSTRAINT `fk_riwayat_promo` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ulasan_produk`
--
ALTER TABLE `ulasan_produk`
  ADD CONSTRAINT `ulasan_produk_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `ulasan_produk_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
