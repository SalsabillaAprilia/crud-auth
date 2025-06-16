-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jun 2025 pada 15.52
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crud_auth`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `import_products`
--

CREATE TABLE `import_products` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `negara_asal` varchar(100) NOT NULL,
  `biaya_impor` decimal(10,2) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `import_products`
--

INSERT INTO `import_products` (`id`, `user_id`, `nama_produk`, `kategori`, `negara_asal`, `biaya_impor`, `harga`, `stok`, `created_at`) VALUES
(4, 3, 'Iphone XR', 'Elektronik', 'USA', 1000000.00, 6000000.00, 12, '0000-00-00 00:00:00'),
(6, 3, 'Some By Me', 'Skincare', 'Korea Selatan', 40000.00, 150000.00, 20, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `photo`) VALUES
(3, 'bula', 'bulbul@gmail.com', '$2b$10$YUn2F2v9e7PzFyUCxKnjBe5cZf6BeRHdDMASxcj.fo/Cm.6zGeIwG', '1748952112119.jpg'),
(4, 'salsa', 'salsa@gmail.com', '$2b$10$8OiS9C.4LW15oYv8zlqx5.oYeuhVeQJ8qGG23hdBsys196CPr5sFG', '1748952173663.jpg'),
(6, 'adul', 'adull@mail.com', '$2b$10$62ak6vpKAfOgxSiz9Oojw.WK2WBB6PNaih/OJeAVkK.Om6fcF5GvS', NULL),
(11, 'cimeng', 'cimeng@gmail.com', '$2b$10$uvoJ3jfA0sz704yR99wOcey2ZxqvTSpU.qDOvvcdihReWf3QsFZ82', '1748177163830.png'),
(12, 'cibul', 'cibul@gmail.com', '$2b$10$YNlyD3xIsd0DV5jXpzjm.ua71DfHcM9pTg2Kyb7lvF9HAn4.w5DTm', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `import_products`
--
ALTER TABLE `import_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `import_products`
--
ALTER TABLE `import_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `import_products`
--
ALTER TABLE `import_products`
  ADD CONSTRAINT `import_products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
