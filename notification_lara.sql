-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2026 at 05:54 AM
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
-- Database: `notification_lara`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-illuminate:queue:restart', 'i:1770650886;', 2086010886);

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
(4, '2026_02_04_174048_create_notifications_table', 1),
(5, '2026_02_04_175950_create_products_table', 1),
(6, '2026_02_05_005628_add_role_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('1d714487-462b-4545-b539-b892d5a95fc3', 'App\\Notifications\\ProductActivityNotification', 'App\\Models\\User', 1, '{\"product_id\":null,\"user_name\":\"Safikur Rahman\",\"message\":\"created a new product: hhhh4444\"}', NULL, '2026-02-09 12:04:40', '2026-02-09 12:04:40'),
('26ec3dc9-49c1-4deb-8ddc-6a3a9ccf63c2', 'App\\Notifications\\ProductActivityNotification', 'App\\Models\\User', 2, '{\"product_id\":\"92\",\"user_name\":\"Safikur Rahman\",\"message\":\"created a new product: hhhh4444\"}', NULL, '2026-02-09 12:06:09', '2026-02-09 12:06:09'),
('322ee2dd-6e54-492c-a8ff-9e8d4342bb42', 'App\\Notifications\\ProductActivityNotification', 'App\\Models\\User', 1, '{\"product_id\":null,\"user_name\":\"Safikur Rahman\",\"message\":\"created a new product: kkk\"}', '2026-02-09 11:56:38', '2026-02-09 11:56:33', '2026-02-09 11:56:38'),
('90df3ddd-18e9-4fb5-a2e5-cf3c8cffe8b6', 'App\\Notifications\\ProductActivityNotification', 'App\\Models\\User', 1, '{\"product_id\":null,\"user_name\":\"Safikur Rahman\",\"message\":\"created a new product: hhhh4444\"}', '2026-02-09 12:06:33', '2026-02-09 12:06:08', '2026-02-09 12:06:33'),
('97e68f37-3173-4b0f-9295-d424f75a195c', 'App\\Notifications\\ProductActivityNotification', 'App\\Models\\User', 2, '{\"product_id\":\"93\",\"user_name\":\"Safikur Rahman\",\"message\":\"created a new product: llll\"}', NULL, '2026-02-09 12:10:47', '2026-02-09 12:10:47'),
('9fc2c71a-29ac-456c-8520-ac041fae9ca4', 'App\\Notifications\\ProductActivityNotification', 'App\\Models\\User', 2, '{\"product_id\":null,\"user_name\":\"Safikur Rahman\",\"message\":\"created a new product: hhhh4444\"}', NULL, '2026-02-09 12:06:09', '2026-02-09 12:06:09'),
('a969da6a-2662-4b2c-8308-5ce023d0139c', 'App\\Notifications\\ProductActivityNotification', 'App\\Models\\User', 2, '{\"product_id\":null,\"user_name\":\"Safikur Rahman\",\"message\":\"created a new product: llll\"}', NULL, '2026-02-09 12:10:47', '2026-02-09 12:10:47'),
('bb3cfc93-13bb-436e-ae3e-e8d2213197f0', 'App\\Notifications\\ProductActivityNotification', 'App\\Models\\User', 2, '{\"product_id\":\"90\",\"user_name\":\"Safikur Rahman\",\"message\":\"created a new product: kkk\"}', NULL, '2026-02-09 11:56:33', '2026-02-09 11:56:33'),
('bbda2cfc-c667-4b46-9d9f-00136802826c', 'App\\Notifications\\ProductActivityNotification', 'App\\Models\\User', 1, '{\"product_id\":null,\"user_name\":\"Safikur Rahman\",\"message\":\"created a new product: llll\"}', NULL, '2026-02-09 12:10:47', '2026-02-09 12:10:47'),
('e9b2cbcc-f96b-43ef-bc24-e7767cf20907', 'App\\Notifications\\ProductActivityNotification', 'App\\Models\\User', 2, '{\"product_id\":null,\"user_name\":\"Safikur Rahman\",\"message\":\"created a new product: kkk\"}', NULL, '2026-02-09 11:56:33', '2026-02-09 11:56:33');

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Rose Seed', 100.00, 1, '2026-02-09 04:11:41', '2026-02-09 04:11:41'),
(2, 'Flower seed', 200.00, 1, '2026-02-09 04:23:39', '2026-02-09 04:23:39'),
(3, 'kh', 100.00, 1, '2026-02-09 04:33:39', '2026-02-09 04:33:39'),
(4, 'mhkl', 200.00, 1, '2026-02-09 04:38:40', '2026-02-09 04:38:40'),
(5, 'hfk', 120.00, 1, '2026-02-09 04:45:45', '2026-02-09 04:45:45'),
(6, 'jfg', 100.00, 1, '2026-02-09 05:03:01', '2026-02-09 05:03:01'),
(7, 'Cherry', 200.00, 1, '2026-02-09 05:13:49', '2026-02-09 05:13:49'),
(8, 'hjgj', 300.00, 1, '2026-02-09 05:19:07', '2026-02-09 05:19:07'),
(9, 'gjhfj', 252.00, 1, '2026-02-09 05:23:42', '2026-02-09 05:23:42'),
(10, 'Barger', 200.00, 1, '2026-02-09 05:26:47', '2026-02-09 05:26:47'),
(11, 'Cherry', 200.00, 1, '2026-02-09 05:32:40', '2026-02-09 05:32:40'),
(12, 'Barger', 100.00, 1, '2026-02-09 05:37:03', '2026-02-09 05:37:03'),
(13, 'Rose Seeds', 200.00, 1, '2026-02-09 05:41:57', '2026-02-09 05:41:57'),
(14, 'jjg', 30.00, 1, '2026-02-09 05:44:47', '2026-02-09 05:44:47'),
(15, 'kknk', 60.00, 1, '2026-02-09 05:47:10', '2026-02-09 05:47:10'),
(16, 'kknk', 60.00, 1, '2026-02-09 05:52:48', '2026-02-09 05:52:48'),
(17, 'kknk', 60.00, 1, '2026-02-09 05:52:54', '2026-02-09 05:52:54'),
(18, 'kknk', 60.00, 1, '2026-02-09 05:53:16', '2026-02-09 05:53:16'),
(19, 'kknk', 60.00, 1, '2026-02-09 05:55:49', '2026-02-09 05:55:49'),
(20, 'kknk', 60.00, 1, '2026-02-09 05:55:52', '2026-02-09 05:55:52'),
(21, 'kknk', 60.00, 1, '2026-02-09 05:55:53', '2026-02-09 05:55:53'),
(22, 'nb,b.m', 20.00, 1, '2026-02-09 05:56:45', '2026-02-09 05:56:45'),
(23, 'nb,b.m', 20.00, 1, '2026-02-09 06:01:28', '2026-02-09 06:01:28'),
(24, 'h', 10.00, 1, '2026-02-09 06:03:46', '2026-02-09 06:03:46'),
(25, 'h', 10.00, 1, '2026-02-09 06:04:28', '2026-02-09 06:04:28'),
(26, 'h', 10.00, 1, '2026-02-09 06:07:18', '2026-02-09 06:07:18'),
(27, 'Barger', 300.00, 1, '2026-02-09 06:07:32', '2026-02-09 06:07:32'),
(28, 'Barger', 300.00, 1, '2026-02-09 06:11:29', '2026-02-09 06:11:29'),
(29, 'bjl', 10.00, 1, '2026-02-09 06:11:43', '2026-02-09 06:11:43'),
(30, 'bjl', 10.00, 1, '2026-02-09 06:14:13', '2026-02-09 06:14:13'),
(31, 'Restaurant Sale', 20.00, 1, '2026-02-09 06:14:27', '2026-02-09 06:14:27'),
(32, 'Cherry', 200.00, 1, '2026-02-09 06:16:37', '2026-02-09 06:16:37'),
(33, 'lk;n', 20.00, 1, '2026-02-09 06:18:56', '2026-02-09 06:18:56'),
(34, 'lk;n', 20.00, 1, '2026-02-09 06:40:30', '2026-02-09 06:40:30'),
(35, 'lk;n', 20.00, 1, '2026-02-09 06:40:34', '2026-02-09 06:40:34'),
(36, 'klj', 200.00, 1, '2026-02-09 06:40:48', '2026-02-09 06:40:48'),
(37, 'klj', 200.00, 1, '2026-02-09 06:41:34', '2026-02-09 06:41:34'),
(38, 'hnlkjhn', 2220.00, 1, '2026-02-09 06:42:04', '2026-02-09 06:42:04'),
(39, 'Barger', 100.00, 1, '2026-02-09 06:43:24', '2026-02-09 06:43:24'),
(40, 'Restaurant Sale', 10.00, 1, '2026-02-09 06:47:12', '2026-02-09 06:47:12'),
(41, '.k\\\'lk,', 30.00, 1, '2026-02-09 06:51:47', '2026-02-09 06:51:47'),
(42, 'hfdh', 10.00, 1, '2026-02-09 06:53:27', '2026-02-09 06:53:27'),
(43, 'hgjk', 20.00, 1, '2026-02-09 06:56:26', '2026-02-09 06:56:26'),
(44, 'hgjk', 20.00, 1, '2026-02-09 06:57:08', '2026-02-09 06:57:08'),
(45, 'hgjk', 20.00, 1, '2026-02-09 06:57:43', '2026-02-09 06:57:43'),
(46, 'hgjk', 20.00, 1, '2026-02-09 06:58:02', '2026-02-09 06:58:02'),
(47, 'gd', 20.00, 1, '2026-02-09 06:58:51', '2026-02-09 06:58:51'),
(48, 'mhlk', 20.00, 1, '2026-02-09 06:59:57', '2026-02-09 06:59:57'),
(49, 'mhlk', 20.00, 1, '2026-02-09 07:00:17', '2026-02-09 07:00:17'),
(50, 'Barger', 200.00, 1, '2026-02-09 07:11:23', '2026-02-09 07:11:23'),
(51, 'k;ljkj', 20.00, 1, '2026-02-09 07:21:02', '2026-02-09 07:21:02'),
(52, 'Redika', 20.00, 1, '2026-02-09 07:24:08', '2026-02-09 07:24:08'),
(53, 'hdgj', 123.00, 1, '2026-02-09 07:33:14', '2026-02-09 07:33:14'),
(54, 'chfxj', 10.00, 1, '2026-02-09 07:48:52', '2026-02-09 07:48:52'),
(55, 'gjfgj', 100.00, 1, '2026-02-09 07:59:52', '2026-02-09 07:59:52'),
(56, 'cjyk', 100.00, 1, '2026-02-09 08:02:38', '2026-02-09 08:02:38'),
(57, 'jkhk;', 200.00, 1, '2026-02-09 08:08:12', '2026-02-09 08:08:12'),
(58, 'bj;b;', 100.00, 1, '2026-02-09 08:12:31', '2026-02-09 08:12:31'),
(59, 'Barger', 200.00, 1, '2026-02-09 08:19:50', '2026-02-09 08:19:50'),
(60, 'ewe', 122.00, 1, '2026-02-09 08:55:25', '2026-02-09 08:55:25'),
(61, 'tiiii', 3000.00, 1, '2026-02-09 08:59:29', '2026-02-09 08:59:29'),
(62, 'gook', 20.00, 1, '2026-02-09 09:03:23', '2026-02-09 09:03:23'),
(63, 'asfasd', 12.00, 1, '2026-02-09 09:07:04', '2026-02-09 09:07:04'),
(64, 'asfasd', 12.00, 1, '2026-02-09 09:10:31', '2026-02-09 09:10:31'),
(65, 'asfasd', 12.00, 1, '2026-02-09 09:10:58', '2026-02-09 09:10:58'),
(66, 'asfasd', 12.00, 1, '2026-02-09 09:11:16', '2026-02-09 09:11:16'),
(67, 'Barger', 200.00, 1, '2026-02-09 09:30:39', '2026-02-09 09:30:39'),
(68, 'Barger', 200.00, 1, '2026-02-09 09:31:23', '2026-02-09 09:31:23'),
(69, 'Bag', 100.00, 1, '2026-02-09 09:47:30', '2026-02-09 09:47:30'),
(70, 'Birld', 200.00, 1, '2026-02-09 09:58:18', '2026-02-09 09:58:18'),
(71, 'cvhn', 100.00, 1, '2026-02-09 10:00:55', '2026-02-09 10:00:55'),
(72, 'j,hjkn', 300.00, 1, '2026-02-09 10:05:50', '2026-02-09 10:05:50'),
(73, ';jm;,;', 3011.00, 1, '2026-02-09 10:06:50', '2026-02-09 10:06:50'),
(74, 'fcgiikh', 20.00, 1, '2026-02-09 10:13:31', '2026-02-09 10:13:31'),
(75, 'kjjjj', 88.00, 1, '2026-02-09 10:17:26', '2026-02-09 10:17:26'),
(76, ',nkl;n', 5.00, 1, '2026-02-09 10:18:31', '2026-02-09 10:18:31'),
(77, 'jjjjj', 9.00, 1, '2026-02-09 10:18:52', '2026-02-09 10:18:52'),
(78, 'hhh', 50.00, 1, '2026-02-09 10:21:36', '2026-02-09 10:21:36'),
(79, 'gg', 2.00, 1, '2026-02-09 10:34:35', '2026-02-09 10:34:35'),
(80, 'uuu', 20.00, 1, '2026-02-09 10:38:46', '2026-02-09 10:38:46'),
(81, 'fff', 50.00, 1, '2026-02-09 10:42:09', '2026-02-09 10:42:09'),
(82, 'hvkg', 20.00, 1, '2026-02-09 10:50:18', '2026-02-09 10:50:18'),
(83, 'yyyy', 10.00, 1, '2026-02-09 10:53:16', '2026-02-09 10:53:16'),
(84, 'hhh', 30.00, 1, '2026-02-09 10:55:04', '2026-02-09 10:55:04'),
(85, 'ttt', 80.00, 1, '2026-02-09 11:03:58', '2026-02-09 11:03:58'),
(86, 'kk', 2.00, 1, '2026-02-09 11:32:33', '2026-02-09 11:32:33'),
(87, 'ee', 10.00, 1, '2026-02-09 11:33:46', '2026-02-09 11:33:46'),
(88, 'bb', 66.00, 1, '2026-02-09 11:38:48', '2026-02-09 11:38:48'),
(89, 'hhhhh', 60.00, 1, '2026-02-09 11:46:43', '2026-02-09 11:46:43'),
(90, 'kkk', 30.00, 1, '2026-02-09 11:56:32', '2026-02-09 11:56:32'),
(91, 'hhhh4444', 1111.00, 1, '2026-02-09 12:04:40', '2026-02-09 12:04:40'),
(92, 'hhhh4444', 1111.00, 1, '2026-02-09 12:06:08', '2026-02-09 12:06:08'),
(93, 'llll', 122.00, 1, '2026-02-09 12:10:46', '2026-02-09 12:10:46');

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
('bGVnzPWarfZlalq4HBwwehwxOCs4yh4nnTAez9FQ', 1, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZnNzcW1GemtHTVFFckRQZzg4bFRxd3dQbHF6V3pVa1NzaG9GWnhCVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9kYXNoYm9hcmQiO3M6NToicm91dGUiO3M6MTU6ImFkbWluLmRhc2hib2FyZCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1770653154),
('i7uixxlM9qKaI9e1gwdUoBpZeAL2VHzaD0OPzaHf', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWtud3FObHA1anpVNENrZ1ZpdUZZNjVkTUF4RlZvYUs5b1pMcFk2dSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9fQ==', 1770653898),
('TAL2N8ZiE2YBBMYuiFZZ2SAUe3lNs0ZoxK3poIjh', 1, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36 Edg/144.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoieTE4NklmQkxWa1BMN0FZNnFobHFpa3ZVRVFTSkRFdldXdzlxSkJmMyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vZGFzaGJvYXJkIjtzOjU6InJvdXRlIjtzOjE1OiJhZG1pbi5kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1770660651);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Safikur Rahman', 'safikur@gmail.com', 'admin', NULL, '$2y$12$HKMaayntmThLI8CHhB5EUOT/OtHmOWv0TxN3fvxKdVEWAoFxX2wDa', NULL, '2026-02-09 04:08:06', '2026-02-09 04:08:06'),
(2, 'Shohel Rana', 'shohel@gmail.com', 'manager', NULL, '$2y$12$ZovkmXw2HtT/wGSP7hlhGO1kh4u/GPwzDUmMxJsMLLN4ZVRTYDXHu', NULL, '2026-02-09 04:08:48', '2026-02-09 04:08:48'),
(3, 'Asraful Islam Rahat', 'ai@gmail.com', 'user', NULL, '$2y$12$dXIa.ivl0giKKPzdRv8T7OqENtLCh7MPu5M3SsjTNj9s4D6Q/EXku', NULL, '2026-02-09 04:09:45', '2026-02-09 04:09:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
