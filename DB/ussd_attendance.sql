-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2025 at 04:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ussd_attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `status` enum('Present','Absent') NOT NULL DEFAULT 'Absent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `student_id`, `date`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, '2025-05-04', 'Present', '2025-05-04 11:52:12', '2025-05-04 11:52:12'),
(2, 3, '2025-05-04', 'Present', '2025-05-04 11:59:17', '2025-05-04 11:59:17');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_03_084351_create_students_table', 1),
(5, '2025_05_03_084352_create_attendances_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('APwHiSonxbgmd1Xfr5jHr2k6Zla88g1o6u3MdPEh', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibHJjQjdtdnc5a1lWa3hVNE1LMm14RmREZ3NPSEdWVmtmM2JyT1JDVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746365126),
('AzL5WsEAB2CgR5qfAcV8P9Elo81CSCndu8KUVqjF', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRlZxY2ZsM1dXQ1lhSFJ1MjNvZVcxUjQ3bFFoeEVlN3ZFRTBuZEhiaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746367157),
('dowV1ovyuDYwKhTezBxxtSUNZq2GGRJvFegI8Uh7', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTGpNRUxYTW1mN1ZrRnpkUGZudkxkOHNFOHk4bHJCYTAydzdRdE1WdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746366723),
('gGyD6OIoWuSwtFQOvPy9nUoika94MHmphheEzQsH', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSGdLdDFjNllTVmFPdkhyMEdkT2dFelZRNWNHUkRYNmEwRUZhWDRldyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746366658),
('GUwwp9KupHQG4X6t0h0wYijw4sEghjjLYwyTgSMa', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibVBnOWpIMUFnaXIxMWpiekdVOUE0TGl3cFRHMms3QURBWFZhMG5neSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746367117),
('GUzxpD8YCSWU1oNoxFg3SS3kZhlW8FCQMXrch15J', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiV3JxWGZaZkFyQjVyTlNuczJ1UmxkbFAxY0NIYkhuTW0xZzNqUElsRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746366729),
('i2DAIUd2Os8qVOiHir7Esi4dXWX2WaXTYb7hgNNh', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSDBaYk1hRHZ4Y2R2RmdLOGVsTVpsd0JhYWdxTVVwTDZBOHIwRUwzVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746366713),
('rdlmYKiVAKiUVFcoceWDK3S76FsvkWh0XTXnmqZ4', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSThLWkpyV0NRRHJqVmNiRlZGUHNtNzFZSEJhUnJwTk41aHRGYktXZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746367143),
('USViEi1qnr36ZZQ8UMOunLKrHO0dXqjOcAF6kMx0', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiN2plU1Azckg4cTA4S1pKVjNJNnNnQmpyQWk2ZDVBTjcyUUFWa1dENSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746366732),
('uU5V1i7xmE7Dsf8PuLIOtEG7qagyCAjLekd0jNgZ', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoia0cwbnIwR3UwdldlS2xwT1RvS01NN1I5WUJGdmlLMkN5NkVlWXpJWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746366871),
('VZi8LDaBmcJ60sC68JrRwSrM8TIhdLRjYqRGn5Tl', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUlNKYkRVak1FblUzNWxBSEh0bjBxQmlFNkU0a0xOdFVYUkQwUjY2YSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746366866),
('xKW6dKTNOKmrq1EBow1q0cKBacWmeGODS9RZ2bsV', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYlNRSVFadTdHRWVtQU1rMnNNS21FVkhkVmJOTld4UXh4bmNvOWU2MCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746365136);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `phone_number`, `created_at`, `updated_at`) VALUES
(1, 'GAKURU Pierre', '+250785145289', '2025-05-04 11:50:20', '2025-05-04 11:50:20'),
(2, 'UWASE Alice', '+250783456789', '2025-05-04 11:50:20', '2025-05-04 11:50:20'),
(3, 'MFITUMUKIZA Bliss', '+250791625007', '2025-05-04 11:50:20', '2025-05-04 11:50:20'),
(4, 'IRARUTA Prince', '+250787160872', '2025-05-04 11:50:20', '2025-05-04 11:50:20'),
(5, 'MUSABE Kizito', '+250789386400', '2025-05-04 11:50:20', '2025-05-04 11:50:20'),
(6, 'IGIRANEZA Celestin', '+250785962001', '2025-05-04 11:50:20', '2025-05-04 11:50:20'),
(7, 'NDAYISHIMIYE Theophile', '+250791749231', '2025-05-04 11:50:20', '2025-05-04 11:50:20'),
(8, 'NDUWIMANA John', '+250788123456', '2025-05-04 11:50:20', '2025-05-04 11:50:20'),
(9, 'IMANISHIMWE Jean Claude', '+250787770456', '2025-05-04 11:50:20', '2025-05-04 11:50:20'),
(10, 'IRAGUHA Emmanuel', '+250783801752', '2025-05-04 11:50:20', '2025-05-04 11:50:20'),
(11, 'HARAMBINEZA Protogène', '+250792389510', '2025-05-04 11:50:20', '2025-05-04 11:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_student_id_foreign` (`student_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_phone_number_unique` (`phone_number`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
