

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_sum` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `carts` (`id`, `cart_sum`, `user_id`, `created_at`, `updated_at`) VALUES
(24, 2, 23, '2025-04-15 12:44:41', '2025-04-15 12:44:43'),
(26, 1, 32, '2025-05-09 01:11:29', '2025-05-09 01:11:29');

CREATE TABLE `cart_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cartdetails_checkbox` tinyint(1) NOT NULL DEFAULT 0,
  `cartdetails_quantity` bigint(20) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`id`, `cartDetails_checkbox`, `cartDetails_quantity`, `product_id`, `cart_id`, `created_at`, `updated_at`) VALUES
(39, 0, 1, 2, 24, '2025-04-15 12:44:41', '2025-04-16 20:40:30'),
(40, 0, 1, 3, 24, '2025-04-15 12:44:43', '2025-04-16 20:40:30'),
(45, 1, 1, 1, 26, '2025-05-09 01:11:29', '2025-05-09 01:11:37');


CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `receiver_phone` varchar(20) DEFAULT NULL,
  `receiver_address` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(100) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `pay` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `orders` (`id`, `user_id`, `address_id`, `total_price`, `order_status`, `created_at`, `updated_at`, `receiver_phone`, `receiver_address`, `receiver_name`, `payment_method`, `pay`) VALUES
(29, 23, NULL, 100000.00, 'shipping', '2025-03-19 15:56:19', '2025-03-19 20:44:37', '0123456', '123 dak mar dak ha kon tum', 'hoang tan dung', 'MOMO', 1),
(30, 23, NULL, 40000.00, 'pending', '2025-03-20 15:33:20', '2025-03-20 15:34:32', '0123456', '123 dak mar dak ha kon tum', 'hoang tan dung', 'MOMO', 1),
(31, 23, NULL, 120000.00, 'pending', '2025-03-20 16:19:09', '2025-03-20 16:19:36', '0123456', '123 dak mar dak ha kon tum', 'hoang tan dung', 'MOMO', 1),
(32, 23, NULL, 90000.00, 'pending', '2025-03-23 12:53:17', '2025-03-23 12:54:02', '0123456', '123 dak mar dak ha kon tum', 'hoang tan dung', 'MOMO', 1),
(33, 23, NULL, 120000.00, 'pending', '2025-03-23 14:49:34', '2025-03-23 14:50:08', '0123456', '123 dak mar dak ha kon tum', 'hoang tan dung', 'MOMO', 1),
(34, 23, NULL, 470000.00, 'cancel', '2025-04-14 02:07:04', '2025-04-14 02:08:30', '0123456', '123 dak mar dak ha kon tum', 'hoang tan dung', 'MOMO', 1),
(35, 32, NULL, 340000.00, 'pending', '2025-05-09 01:09:37', '2025-05-09 01:09:37', '0123456789', '351A Lạc Long Quân phường 5 Quận 11', 'Đoàn Quang Thiệu', 'COD', 0),
(36, 31, NULL, 120000.00, 'complete', '2025-01-01 03:00:00', '2025-01-01 03:00:00', '0123456789', '123 Nguyễn Thị Minh Khai, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(37, 31, NULL, 150000.00, 'complete', '2025-01-02 04:00:00', '2025-01-02 04:00:00', '0123456789', '456 Lê Lợi, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(38, 31, NULL, 200000.00, 'complete', '2025-01-03 05:00:00', '2025-01-03 05:00:00', '0123456789', '789 Nguyễn Huệ, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(39, 31, NULL, 130000.00, 'complete', '2025-01-04 06:00:00', '2025-01-04 06:00:00', '0123456789', '321 Trần Hưng Đạo, Quận 5, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(40, 31, NULL, 110000.00, 'cancel', '2025-01-05 07:00:00', '2025-01-05 07:00:00', '0123456789', '654 Võ Văn Tần, Quận 3, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(41, 31, NULL, 180000.00, 'complete', '2025-01-06 08:00:00', '2025-01-06 08:00:00', '0123456789', '987 Phạm Ngọc Thạch, Quận 3, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(42, 31, NULL, 160000.00, 'complete', '2025-01-07 09:00:00', '2025-01-07 09:00:00', '0123456789', '654 Hoàng Sa, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(43, 31, NULL, 140000.00, 'complete', '2025-01-08 10:00:00', '2025-01-08 10:00:00', '0123456789', '543 Bà Triệu, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(44, 31, NULL, 125000.00, 'complete', '2025-01-09 11:00:00', '2025-01-09 11:00:00', '0123456789', '432 Nguyễn Trãi, Quận 5, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(45, 31, NULL, 170000.00, 'cancel', '2025-01-10 12:00:00', '2025-01-10 12:00:00', '0123456789', '876 Lý Chính Thắng, Quận 3, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(46, 31, NULL, 110000.00, 'complete', '2025-01-11 13:00:00', '2025-01-11 13:00:00', '0123456789', '765 Hùng Vương, Quận 5, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(47, 31, NULL, 160000.00, 'complete', '2025-01-12 14:00:00', '2025-01-12 14:00:00', '0123456789', '654 Trần Đình Xu, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(48, 31, NULL, 180000.00, 'complete', '2025-01-13 15:00:00', '2025-01-13 15:00:00', '0123456789', '987 Cao Thắng, Quận 10, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(49, 31, NULL, 140000.00, 'cancel', '2025-01-14 16:00:00', '2025-01-14 16:00:00', '0123456789', '123 Nguyễn Thị Minh Khai, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(50, 31, NULL, 160000.00, 'complete', '2025-01-15 03:30:00', '2025-01-15 03:30:00', '0123456789', '321 Lê Hồng Phong, Quận 10, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(51, 31, NULL, 170000.00, 'complete', '2025-01-16 04:00:00', '2025-01-16 04:00:00', '0123456789', '432 Nguyễn Tri Phương, Quận 10, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(52, 31, NULL, 150000.00, 'complete', '2025-01-17 05:00:00', '2025-01-17 05:00:00', '0123456789', '543 Lê Lợi, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(53, 31, NULL, 130000.00, 'cancel', '2025-01-18 06:00:00', '2025-01-18 06:00:00', '0123456789', '654 Võ Thị Sáu, Quận 3, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(54, 31, NULL, 120000.00, 'complete', '2025-01-19 07:00:00', '2025-01-19 07:00:00', '0123456789', '987 Lý Tự Trọng, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(55, 31, NULL, 180000.00, 'complete', '2025-01-20 08:00:00', '2025-01-20 08:00:00', '0123456789', '876 Phan Đình Phùng, Quận Phú Nhuận, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(56, 31, NULL, 160000.00, 'complete', '2025-01-21 09:00:00', '2025-01-21 09:00:00', '0123456789', '654 Nguyễn Tri Phương, Quận 10, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(57, 31, NULL, 140000.00, 'cancel', '2025-01-22 10:00:00', '2025-01-22 10:00:00', '0123456789', '543 Nguyễn Văn Cừ, Quận 5, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(58, 31, NULL, 150000.00, 'complete', '2025-01-23 11:00:00', '2025-01-23 11:00:00', '0123456789', '432 Trần Hưng Đạo, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(59, 31, NULL, 130000.00, 'complete', '2025-01-24 12:00:00', '2025-01-24 12:00:00', '0123456789', '321 Trần Quang Khải, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(60, 31, NULL, 120000.00, 'complete', '2025-01-25 13:00:00', '2025-01-25 13:00:00', '0123456789', '543 Bùi Viện, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(61, 31, NULL, 110000.00, 'complete', '2025-01-26 14:00:00', '2025-01-26 14:00:00', '0123456789', '654 Nguyễn Văn Cừ, Quận 5, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(62, 31, NULL, 160000.00, 'complete', '2025-01-27 15:00:00', '2025-01-27 15:00:00', '0123456789', '987 Hòa Hưng, Quận 10, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(63, 31, NULL, 180000.00, 'complete', '2025-01-28 16:00:00', '2025-01-28 16:00:00', '0123456789', '876 Lê Hồng Phong, Quận 10, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(64, 31, NULL, 150000.00, 'complete', '2025-01-29 03:30:00', '2025-01-29 03:30:00', '0123456789', '123 Nguyễn Trãi, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(65, 31, NULL, 140000.00, 'complete', '2025-01-30 04:00:00', '2025-01-30 04:00:00', '0123456789', '456 Lê Văn Sỹ, Quận 3, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(66, 31, NULL, 160000.00, 'complete', '2025-01-31 05:00:00', '2025-01-31 05:00:00', '0123456789', '789 Phan Xích Long, Quận Phú Nhuận, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(67, 31, NULL, 170000.00, 'cancel', '2025-01-31 06:00:00', '2025-01-31 06:00:00', '0123456789', '321 Trần Bình Trọng, Quận 5, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(68, 31, NULL, 180000.00, 'complete', '2025-01-31 07:00:00', '2025-01-31 07:00:00', '0123456789', '543 Nguyễn Trãi, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(69, 31, NULL, 200000.00, 'complete', '2025-01-31 08:00:00', '2025-01-31 08:00:00', '0123456789', '654 Bùi Viện, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(70, 31, NULL, 210000.00, 'complete', '2025-01-31 09:00:00', '2025-01-31 09:00:00', '0123456789', '987 Cách Mạng Tháng Tám, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(71, 31, NULL, 220000.00, 'complete', '2025-01-31 10:00:00', '2025-01-31 10:00:00', '0123456789', '876 Lê Thị Riêng, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(72, 31, NULL, 230000.00, 'cancel', '2025-01-31 11:00:00', '2025-01-31 11:00:00', '0123456789', '765 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(73, 31, NULL, 240000.00, 'complete', '2025-01-31 12:00:00', '2025-01-31 12:00:00', '0123456789', '654 Đoàn Văn Bơ, Quận 4, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(74, 31, NULL, 250000.00, 'complete', '2025-01-31 13:00:00', '2025-01-31 13:00:00', '0123456789', '543 Trần Quang Khải, Quận 1, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(75, 31, NULL, 260000.00, 'complete', '2025-01-31 14:00:00', '2025-01-31 14:00:00', '0123456789', '432 Hồng Bàng, Quận 5, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(76, 31, NULL, 270000.00, 'complete', '2025-01-31 15:00:00', '2025-01-31 15:00:00', '0123456789', '321 Cộng Hòa, Quận Tân Bình, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(77, 31, NULL, 280000.00, 'cancel', '2025-01-31 16:00:00', '2025-01-31 16:00:00', '0123456789', '765 Bình Thới, Quận 11, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(78, 31, NULL, 290000.00, 'complete', '2025-01-31 16:30:00', '2025-01-31 16:30:00', '0123456789', '987 Tô Hiến Thành, Quận 10, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(79, 31, NULL, 300000.00, 'complete', '2025-01-31 16:59:00', '2025-01-31 16:59:00', '0123456789', '876 Phạm Hùng, Quận 8, TP.HCM', 'hoang tan dung', 'MOMO', 1),
(80, 32, NULL, 150000.00, 'complete', '2025-02-01 03:00:00', '2025-02-01 03:00:00', '0123456789', '123 Nguyễn Trãi, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(81, 32, NULL, 140000.00, 'complete', '2025-02-02 04:00:00', '2025-02-02 04:00:00', '0123456789', '456 Lê Văn Sỹ, Quận 3, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(82, 32, NULL, 160000.00, 'complete', '2025-02-03 05:00:00', '2025-02-03 05:00:00', '0123456789', '789 Phan Xích Long, Quận Phú Nhuận, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(83, 32, NULL, 170000.00, 'cancel', '2025-02-04 06:00:00', '2025-02-04 06:00:00', '0123456789', '321 Trần Bình Trọng, Quận 5, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(84, 32, NULL, 180000.00, 'complete', '2025-02-05 07:00:00', '2025-02-05 07:00:00', '0123456789', '543 Nguyễn Trãi, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(85, 32, NULL, 200000.00, 'complete', '2025-02-06 08:00:00', '2025-02-06 08:00:00', '0123456789', '654 Bùi Viện, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(86, 32, NULL, 210000.00, 'complete', '2025-02-07 09:00:00', '2025-02-07 09:00:00', '0123456789', '987 Cách Mạng Tháng Tám, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(87, 32, NULL, 220000.00, 'complete', '2025-02-08 10:00:00', '2025-02-08 10:00:00', '0123456789', '876 Lê Thị Riêng, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(88, 32, NULL, 230000.00, 'cancel', '2025-02-09 11:00:00', '2025-02-09 11:00:00', '0123456789', '765 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(89, 32, NULL, 240000.00, 'complete', '2025-02-10 12:00:00', '2025-02-10 12:00:00', '0123456789', '654 Đoàn Văn Bơ, Quận 4, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(90, 32, NULL, 250000.00, 'complete', '2025-02-11 13:00:00', '2025-02-11 13:00:00', '0123456789', '543 Trần Quang Khải, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(91, 32, NULL, 260000.00, 'complete', '2025-02-12 14:00:00', '2025-02-12 14:00:00', '0123456789', '432 Hồng Bàng, Quận 5, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(92, 32, NULL, 270000.00, 'complete', '2025-02-13 15:00:00', '2025-02-13 15:00:00', '0123456789', '321 Cộng Hòa, Quận Tân Bình, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(93, 32, NULL, 280000.00, 'cancel', '2025-02-14 16:00:00', '2025-02-14 16:00:00', '0123456789', '765 Bình Thới, Quận 11, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(94, 32, NULL, 290000.00, 'complete', '2025-02-15 16:30:00', '2025-02-15 16:30:00', '0123456789', '987 Tô Hiến Thành, Quận 10, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(95, 32, NULL, 300000.00, 'complete', '2025-02-16 16:59:00', '2025-02-16 16:59:00', '0123456789', '876 Phạm Hùng, Quận 8, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(96, 32, NULL, 150000.00, 'complete', '2025-02-17 03:00:00', '2025-02-17 03:00:00', '0123456789', '123 Nguyễn Trãi, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(97, 32, NULL, 140000.00, 'complete', '2025-02-18 04:00:00', '2025-02-18 04:00:00', '0123456789', '456 Lê Văn Sỹ, Quận 3, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(98, 32, NULL, 160000.00, 'complete', '2025-02-19 05:00:00', '2025-02-19 05:00:00', '0123456789', '789 Phan Xích Long, Quận Phú Nhuận, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(99, 32, NULL, 170000.00, 'cancel', '2025-02-20 06:00:00', '2025-02-20 06:00:00', '0123456789', '321 Trần Bình Trọng, Quận 5, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(100, 32, NULL, 180000.00, 'complete', '2025-02-21 07:00:00', '2025-02-21 07:00:00', '0123456789', '543 Nguyễn Trãi, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(101, 32, NULL, 200000.00, 'complete', '2025-02-22 08:00:00', '2025-02-22 08:00:00', '0123456789', '654 Bùi Viện, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(102, 32, NULL, 210000.00, 'complete', '2025-02-23 09:00:00', '2025-02-23 09:00:00', '0123456789', '987 Cách Mạng Tháng Tám, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(103, 32, NULL, 220000.00, 'complete', '2025-02-24 10:00:00', '2025-02-24 10:00:00', '0123456789', '876 Lê Thị Riêng, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(104, 32, NULL, 240000.00, 'complete', '2025-02-25 11:00:00', '2025-02-25 11:00:00', '0123456789', '765 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(105, 32, NULL, 250000.00, 'complete', '2025-02-26 12:00:00', '2025-02-26 12:00:00', '0123456789', '654 Đoàn Văn Bơ, Quận 4, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(106, 32, NULL, 260000.00, 'complete', '2025-02-27 13:00:00', '2025-02-27 13:00:00', '0123456789', '543 Trần Quang Khải, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(107, 32, NULL, 270000.00, 'cancel', '2025-02-28 14:00:00', '2025-02-28 14:00:00', '0123456789', '432 Hồng Bàng, Quận 5, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(108, 32, NULL, 280000.00, 'complete', '2025-02-28 15:00:00', '2025-02-28 15:00:00', '0123456789', '321 Cộng Hòa, Quận Tân Bình, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(109, 32, NULL, 290000.00, 'complete', '2025-02-28 16:00:00', '2025-02-28 16:00:00', '0123456789', '765 Bình Thới, Quận 11, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(110, 32, NULL, 300000.00, 'complete', '2025-02-28 16:30:00', '2025-02-28 16:30:00', '0123456789', '987 Tô Hiến Thành, Quận 10, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(111, 32, NULL, 310000.00, 'complete', '2025-02-28 16:59:00', '2025-02-28 16:59:00', '0123456789', '876 Phạm Hùng, Quận 8, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(112, 32, NULL, 320000.00, 'complete', '2025-02-28 16:59:30', '2025-02-28 16:59:30', '0123456789', '123 Nguyễn Trãi, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(113, 32, NULL, 330000.00, 'complete', '2025-02-28 16:59:59', '2025-02-28 16:59:59', '0123456789', '456 Lê Văn Sỹ, Quận 3, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(114, 32, NULL, 340000.00, 'complete', '2025-02-28 16:59:59', '2025-02-28 16:59:59', '0123456789', '789 Phan Xích Long, Quận Phú Nhuận, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(115, 32, NULL, 350000.00, 'cancel', '2025-02-28 16:59:59', '2025-02-28 16:59:59', '0123456789', '321 Trần Bình Trọng, Quận 5, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(116, 32, NULL, 360000.00, 'complete', '2025-02-28 16:59:59', '2025-02-28 16:59:59', '0123456789', '543 Nguyễn Trãi, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(117, 32, NULL, 370000.00, 'complete', '2025-02-28 16:59:59', '2025-02-28 16:59:59', '0123456789', '654 Bùi Viện, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(118, 32, NULL, 380000.00, 'complete', '2025-02-28 16:59:59', '2025-02-28 16:59:59', '0123456789', '987 Cách Mạng Tháng Tám, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(119, 32, NULL, 390000.00, 'complete', '2025-02-28 16:59:59', '2025-02-28 16:59:59', '0123456789', '876 Lê Thị Riêng, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(120, 32, NULL, 250000.00, 'complete', '2025-03-01 03:00:00', '2025-03-01 03:00:00', '0123456789', '123 Lê Văn Sỹ, Quận 3, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(121, 32, NULL, 260000.00, 'complete', '2025-03-01 04:00:00', '2025-03-01 04:00:00', '0123456789', '456 Cộng Hòa, Quận Tân Bình, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(122, 32, NULL, 270000.00, 'complete', '2025-03-01 05:00:00', '2025-03-01 05:00:00', '0123456789', '789 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(123, 32, NULL, 280000.00, 'cancel', '2025-03-01 06:00:00', '2025-03-01 06:00:00', '0123456789', '987 Trần Phú, Quận 5, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(124, 32, NULL, 290000.00, 'complete', '2025-03-01 07:00:00', '2025-03-01 07:00:00', '0123456789', '543 Lý Thường Kiệt, Quận 10, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(125, 32, NULL, 300000.00, 'complete', '2025-03-01 08:00:00', '2025-03-01 08:00:00', '0123456789', '654 Phan Xích Long, Quận Phú Nhuận, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(126, 32, NULL, 310000.00, 'complete', '2025-03-01 09:00:00', '2025-03-01 09:00:00', '0123456789', '765 Nguyễn Tri Phương, Quận 10, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(127, 32, NULL, 320000.00, 'complete', '2025-03-01 10:00:00', '2025-03-01 10:00:00', '0123456789', '876 Nguyễn Trãi, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(128, 32, NULL, 330000.00, 'complete', '2025-03-01 11:00:00', '2025-03-01 11:00:00', '0123456789', '987 Cách Mạng Tháng Tám, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(129, 32, NULL, 340000.00, 'complete', '2025-03-01 12:00:00', '2025-03-01 12:00:00', '0123456789', '543 Bùi Viện, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(130, 32, NULL, 350000.00, 'complete', '2025-03-01 13:00:00', '2025-03-01 13:00:00', '0123456789', '654 Phan Huy Ích, Quận Gò Vấp, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(131, 32, NULL, 360000.00, 'cancel', '2025-03-01 14:00:00', '2025-03-01 14:00:00', '0123456789', '765 Nguyễn Chí Thanh, Quận 5, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(132, 32, NULL, 370000.00, 'complete', '2025-03-02 03:00:00', '2025-03-02 03:00:00', '0123456789', '543 Trần Quang Khải, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(133, 32, NULL, 380000.00, 'complete', '2025-03-02 04:00:00', '2025-03-02 04:00:00', '0123456789', '654 Tô Hiến Thành, Quận 10, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(134, 32, NULL, 390000.00, 'complete', '2025-03-02 05:00:00', '2025-03-02 05:00:00', '0123456789', '765 Hùng Vương, Quận 5, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(135, 32, NULL, 400000.00, 'complete', '2025-03-02 06:00:00', '2025-03-02 06:00:00', '0123456789', '987 Nguyễn Lâm, Quận 2, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(136, 32, NULL, 410000.00, 'complete', '2025-03-02 07:00:00', '2025-03-02 07:00:00', '0123456789', '543 Cao Thắng, Quận 10, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(137, 32, NULL, 420000.00, 'complete', '2025-03-02 08:00:00', '2025-03-02 08:00:00', '0123456789', '654 Lê Duẩn, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(138, 32, NULL, 430000.00, 'complete', '2025-03-02 09:00:00', '2025-03-02 09:00:00', '0123456789', '765 Nguyễn Thị Minh Khai, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(139, 32, NULL, 440000.00, 'complete', '2025-03-02 10:00:00', '2025-03-02 10:00:00', '0123456789', '987 Phan Đình Phùng, Quận Phú Nhuận, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(140, 32, NULL, 450000.00, 'complete', '2025-03-02 11:00:00', '2025-03-02 11:00:00', '0123456789', '543 Lê Văn Lương, Quận 7, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(141, 32, NULL, 460000.00, 'complete', '2025-03-02 12:00:00', '2025-03-02 12:00:00', '0123456789', '654 Lê Quang Định, Quận Bình Thạnh, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(142, 32, NULL, 470000.00, 'complete', '2025-03-02 13:00:00', '2025-03-02 13:00:00', '0123456789', '765 Hoàng Sa, Quận Tân Bình, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(143, 32, NULL, 480000.00, 'complete', '2025-03-02 14:00:00', '2025-03-02 14:00:00', '0123456789', '987 Nguyễn Hữu Cảnh, Quận Bình Thạnh, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(144, 32, NULL, 490000.00, 'complete', '2025-03-03 03:00:00', '2025-03-03 03:00:00', '0123456789', '543 Võ Văn Kiệt, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(145, 32, NULL, 500000.00, 'complete', '2025-03-03 04:00:00', '2025-03-03 04:00:00', '0123456789', '654 Nguyễn Đình Chiểu, Quận 3, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(146, 32, NULL, 510000.00, 'complete', '2025-03-03 05:00:00', '2025-03-03 05:00:00', '0123456789', '765 Trần Quang Khải, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(147, 32, NULL, 520000.00, 'cancel', '2025-03-03 06:00:00', '2025-03-03 06:00:00', '0123456789', '987 Cộng Hòa, Quận Tân Bình, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(148, 32, NULL, 530000.00, 'complete', '2025-03-03 07:00:00', '2025-03-03 07:00:00', '0123456789', '543 Lý Thường Kiệt, Quận 10, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(149, 32, NULL, 540000.00, 'complete', '2025-03-03 08:00:00', '2025-03-03 08:00:00', '0123456789', '654 Phan Đình Phùng, Quận Phú Nhuận, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(150, 32, NULL, 550000.00, 'complete', '2025-03-03 09:00:00', '2025-03-03 09:00:00', '0123456789', '765 Nguyễn Huệ, Quận 1, TP.HCM', 'Doan Quang Thieu', 'MOMO', 1),
(151, 31, NULL, 560000.00, 'complete', '2025-04-01 03:00:00', '2025-04-01 03:00:00', '0123456789', '123 Nguyễn Thị Minh Khai, Quận 1, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(152, 31, NULL, 570000.00, 'complete', '2025-04-01 04:00:00', '2025-04-01 04:00:00', '0123456789', '234 Lê Lợi, Quận 3, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(153, 31, NULL, 580000.00, 'complete', '2025-04-01 05:00:00', '2025-04-01 05:00:00', '0123456789', '345 Trần Phú, Quận 5, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(154, 31, NULL, 590000.00, 'complete', '2025-04-01 06:00:00', '2025-04-01 06:00:00', '0123456789', '456 Nguyễn Văn Cừ, Quận 3, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(155, 31, NULL, 600000.00, 'complete', '2025-04-01 07:00:00', '2025-04-01 07:00:00', '0123456789', '567 Phan Văn Trị, Quận Gò Vấp, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(156, 31, NULL, 610000.00, 'complete', '2025-04-01 08:00:00', '2025-04-01 08:00:00', '0123456789', '678 Võ Văn Ngân, Quận Thủ Đức, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(157, 31, NULL, 620000.00, 'cancel', '2025-04-01 09:00:00', '2025-04-01 09:00:00', '0123456789', '789 Lê Quang Định, Quận Bình Thạnh, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(158, 31, NULL, 630000.00, 'complete', '2025-04-01 10:00:00', '2025-04-01 10:00:00', '0123456789', '890 Trường Chinh, Quận Tân Bình, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(159, 31, NULL, 640000.00, 'complete', '2025-04-01 11:00:00', '2025-04-01 11:00:00', '0123456789', '901 Đoàn Văn Bơ, Quận 4, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(160, 31, NULL, 650000.00, 'complete', '2025-04-01 12:00:00', '2025-04-01 12:00:00', '0123456789', '012 Nguyễn Hữu Cảnh, Quận Bình Thạnh, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(161, 31, NULL, 660000.00, 'complete', '2025-04-02 03:00:00', '2025-04-02 03:00:00', '0123456789', '101 Cách Mạng Tháng Tám, Quận 10, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(162, 31, NULL, 670000.00, 'complete', '2025-04-02 04:00:00', '2025-04-02 04:00:00', '0123456789', '112 Bến Vân Đồn, Quận 4, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(163, 31, NULL, 680000.00, 'complete', '2025-04-02 05:00:00', '2025-04-02 05:00:00', '0123456789', '123 Nguyễn Trãi, Quận 5, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(164, 31, NULL, 690000.00, 'complete', '2025-04-02 06:00:00', '2025-04-02 06:00:00', '0123456789', '234 Lý Thường Kiệt, Quận 11, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(165, 31, NULL, 700000.00, 'cancel', '2025-04-02 07:00:00', '2025-04-02 07:00:00', '0123456789', '345 Lê Lợi, Quận 1, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(166, 31, NULL, 710000.00, 'complete', '2025-04-02 08:00:00', '2025-04-02 08:00:00', '0123456789', '456 Nguyễn Du, Quận 1, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(167, 31, NULL, 720000.00, 'complete', '2025-04-02 09:00:00', '2025-04-02 09:00:00', '0123456789', '567 Hoàng Văn Thụ, Quận Tân Bình, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(168, 31, NULL, 730000.00, 'complete', '2025-04-02 10:00:00', '2025-04-02 10:00:00', '0123456789', '678 Phan Đình Phùng, Quận Phú Nhuận, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(169, 31, NULL, 740000.00, 'complete', '2025-04-02 11:00:00', '2025-04-02 11:00:00', '0123456789', '789 Võ Thị Sáu, Quận 3, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(170, 31, NULL, 750000.00, 'complete', '2025-04-02 12:00:00', '2025-04-02 12:00:00', '0123456789', '890 Điện Biên Phủ, Quận Bình Thạnh, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(171, 31, NULL, 760000.00, 'complete', '2025-04-03 03:00:00', '2025-04-03 03:00:00', '0123456789', '901 Xô Viết Nghệ Tĩnh, Quận Bình Thạnh, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(172, 31, NULL, 770000.00, 'complete', '2025-04-03 04:00:00', '2025-04-03 04:00:00', '0123456789', '123 Nguyễn Huệ, Quận 1, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(173, 31, NULL, 780000.00, 'complete', '2025-04-03 05:00:00', '2025-04-03 05:00:00', '0123456789', '234 Đinh Tiên Hoàng, Quận 1, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(174, 31, NULL, 790000.00, 'complete', '2025-04-03 06:00:00', '2025-04-03 06:00:00', '0123456789', '345 Nguyễn Lâm, Quận 5, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(175, 31, NULL, 800000.00, 'cancel', '2025-04-03 07:00:00', '2025-04-03 07:00:00', '0123456789', '456 Trường Sa, Quận 3, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(176, 31, NULL, 810000.00, 'complete', '2025-04-03 08:00:00', '2025-04-03 08:00:00', '0123456789', '567 Hùng Vương, Quận 6, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(177, 31, NULL, 820000.00, 'complete', '2025-04-03 09:00:00', '2025-04-03 09:00:00', '0123456789', '678 Đại Lộ Đông Tây, Quận Bình Tân, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(178, 31, NULL, 830000.00, 'complete', '2025-04-03 10:00:00', '2025-04-03 10:00:00', '0123456789', '789 Trần Bình Trọng, Quận 5, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(179, 31, NULL, 840000.00, 'complete', '2025-04-03 11:00:00', '2025-04-03 11:00:00', '0123456789', '890 Lê Quang Định, Quận Gò Vấp, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(180, 31, NULL, 150000.00, 'complete', '2025-04-03 12:00:00', '2025-04-03 12:00:00', '0123456789', '101 Lê Thị Riêng, Quận 1, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(181, 31, NULL, 160000.00, 'complete', '2025-04-03 13:00:00', '2025-04-03 13:00:00', '0123456789', '112 Trần Hưng Đạo, Quận 5, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(182, 31, NULL, 170000.00, 'complete', '2025-04-03 14:00:00', '2025-04-03 14:00:00', '0123456789', '123 Võ Văn Kiệt, Quận 6, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(183, 31, NULL, 180000.00, 'complete', '2025-04-04 03:00:00', '2025-04-04 03:00:00', '0123456789', '234 Phan Văn Trị, Quận Gò Vấp, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(184, 31, NULL, 190000.00, 'complete', '2025-04-04 04:00:00', '2025-04-04 04:00:00', '0123456789', '345 Lê Đức Thọ, Quận Gò Vấp, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(185, 31, NULL, 200000.00, 'complete', '2025-04-04 05:00:00', '2025-04-04 05:00:00', '0123456789', '456 Nguyễn Văn Cừ, Quận 5, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(186, 31, NULL, 210000.00, 'complete', '2025-04-04 06:00:00', '2025-04-04 06:00:00', '0123456789', '567 Tân Hòa Đông, Quận Tân Phú, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(187, 31, NULL, 220000.00, 'complete', '2025-04-04 07:00:00', '2025-04-04 07:00:00', '0123456789', '678 Đoàn Văn Bơ, Quận 4, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(188, 31, NULL, 230000.00, 'complete', '2025-04-04 08:00:00', '2025-04-04 08:00:00', '0123456789', '789 Cộng Hòa, Quận Tân Bình, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(189, 31, NULL, 240000.00, 'cancel', '2025-04-04 09:00:00', '2025-04-04 09:00:00', '0123456789', '890 Nguyễn Thị Minh Khai, Quận 3, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(190, 31, NULL, 250000.00, 'complete', '2025-04-04 10:00:00', '2025-04-04 10:00:00', '0123456789', '101 Mai Chí Thọ, Quận 2, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(191, 31, NULL, 260000.00, 'complete', '2025-04-04 11:00:00', '2025-04-04 11:00:00', '0123456789', '112 Bùi Hữu Nghĩa, Quận Bình Thạnh, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(192, 31, NULL, 270000.00, 'complete', '2025-04-04 12:00:00', '2025-04-04 12:00:00', '0123456789', '123 Nguyễn Lâm, Quận 5, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(193, 31, NULL, 280000.00, 'cancel', '2025-04-04 13:00:00', '2025-04-04 13:00:00', '0123456789', '234 Đường 3/2, Quận 10, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(194, 31, NULL, 290000.00, 'complete', '2025-04-04 14:00:00', '2025-04-04 14:00:00', '0123456789', '345 Nguyễn Thị Minh Khai, Quận 1, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(195, 31, NULL, 300000.00, 'complete', '2025-04-05 03:00:00', '2025-04-05 03:00:00', '0123456789', '456 Đinh Tiên Hoàng, Quận 1, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(196, 31, NULL, 310000.00, 'complete', '2025-04-05 04:00:00', '2025-04-05 04:00:00', '0123456789', '567 Trần Quang Khải, Quận 1, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(197, 31, NULL, 320000.00, 'complete', '2025-04-05 05:00:00', '2025-04-05 05:00:00', '0123456789', '678 Phạm Ngọc Thạch, Quận 3, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(198, 31, NULL, 330000.00, 'complete', '2025-04-05 06:00:00', '2025-04-05 06:00:00', '0123456789', '789 Bà Triệu, Quận 5, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(199, 31, NULL, 150000.00, 'complete', '2025-05-01 03:00:00', '2025-05-01 03:00:00', '0123456789', '101 Lê Hồng Phong, Quận 10, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(200, 31, NULL, 160000.00, 'complete', '2025-05-01 04:00:00', '2025-05-01 04:00:00', '0123456789', '112 Trường Chinh, Quận Tân Bình, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(201, 31, NULL, 170000.00, 'complete', '2025-05-01 05:00:00', '2025-05-01 05:00:00', '0123456789', '123 Lê Đức Thọ, Quận Gò Vấp, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(202, 31, NULL, 180000.00, 'complete', '2025-05-01 06:00:00', '2025-05-01 06:00:00', '0123456789', '234 Nguyễn Trãi, Quận 5, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(203, 31, NULL, 190000.00, 'complete', '2025-05-01 07:00:00', '2025-05-01 07:00:00', '0123456789', '345 Cộng Hòa, Quận Tân Bình, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(204, 31, NULL, 200000.00, 'cancel', '2025-05-01 08:00:00', '2025-05-01 08:00:00', '0123456789', '456 Trần Quang Khải, Quận 1, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(205, 31, NULL, 210000.00, 'complete', '2025-05-01 09:00:00', '2025-05-01 09:00:00', '0123456789', '567 Mai Chí Thọ, Quận 2, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(206, 31, NULL, 220000.00, 'complete', '2025-05-01 10:00:00', '2025-05-01 10:00:00', '0123456789', '678 Bùi Hữu Nghĩa, Quận Bình Thạnh, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(207, 31, NULL, 230000.00, 'complete', '2025-05-01 11:00:00', '2025-05-01 11:00:00', '0123456789', '789 Nguyễn Thị Minh Khai, Quận 1, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(208, 31, NULL, 240000.00, 'complete', '2025-05-01 12:00:00', '2025-05-01 12:00:00', '0123456789', '890 Phan Văn Trị, Quận Gò Vấp, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(209, 31, NULL, 250000.00, 'cancel', '2025-05-01 13:00:00', '2025-05-01 13:00:00', '0123456789', '101 Nguyễn Văn Linh, Quận 7, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(210, 31, NULL, 260000.00, 'complete', '2025-05-02 03:00:00', '2025-05-02 03:00:00', '0123456789', '112 Bà Triệu, Quận 5, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(211, 31, NULL, 270000.00, 'complete', '2025-05-02 04:00:00', '2025-05-02 04:00:00', '0123456789', '123 Lý Thái Tổ, Quận 1, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(212, 31, NULL, 280000.00, 'complete', '2025-05-02 05:00:00', '2025-05-02 05:00:00', '0123456789', '234 Hồ Tùng Mậu, Quận 1, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(213, 31, NULL, 290000.00, 'complete', '2025-05-02 06:00:00', '2025-05-02 06:00:00', '0123456789', '345 Trần Hưng Đạo, Quận 5, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1),
(214, 31, NULL, 300000.00, 'complete', '2025-05-02 07:00:00', '2025-05-02 07:00:00', '0123456789', '456 Nguyễn Tri Phương, Quận 10, TP.HCM', 'Hoang Tan Dung', 'MOMO', 1);

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `payment_method`, `price`, `created_at`, `updated_at`) VALUES
(27, 29, 1, 1, 'MOMO', 100000.00, '2025-03-19 15:56:19', '2025-03-19 15:56:19'),
(28, 30, 7, 1, 'MOMO', 40000.00, '2025-03-20 15:33:20', '2025-03-20 15:33:20'),
(29, 31, 2, 1, 'MOMO', 120000.00, '2025-03-20 16:19:09', '2025-03-20 16:19:09'),
(30, 32, 6, 1, 'MOMO', 90000.00, '2025-03-23 12:53:17', '2025-03-23 12:53:17'),
(31, 33, 2, 1, 'MOMO', 120000.00, '2025-03-23 14:49:34', '2025-03-23 14:49:34'),
(32, 34, 20, 1, 'MOMO', 120000.00, '2025-04-14 02:07:04', '2025-04-14 02:07:04'),
(33, 34, 24, 1, 'MOMO', 70000.00, '2025-04-14 02:07:04', '2025-04-14 02:07:04'),
(34, 34, 22, 1, 'MOMO', 280000.00, '2025-04-14 02:07:04', '2025-04-14 02:07:04'),
(35, 35, 1, 1, 'COD', 100000.00, '2025-05-09 01:09:37', '2025-05-09 01:09:37'),
(36, 35, 2, 1, 'COD', 120000.00, '2025-05-09 01:09:37', '2025-05-09 01:09:37'),
(37, 35, 3, 1, 'COD', 70000.00, '2025-05-09 01:09:37', '2025-05-09 01:09:37'),
(38, 35, 4, 1, 'COD', 50000.00, '2025-05-09 01:09:37', '2025-05-09 01:09:37');

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_detailDesc` text DEFAULT NULL,
  `product_shortDesc` text DEFAULT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_factory` text DEFAULT NULL,
  `product_target` text DEFAULT NULL,
  `product_type` text DEFAULT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_image_url` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `star` int(11) DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`id`, `product_name`, `product_detailDesc`, `product_shortDesc`, `product_price`, `product_factory`, `product_target`, `product_type`, `product_quantity`, `product_image_url`, `created_at`, `updated_at`, `star`) VALUES
(1, 'Quả sầu riêng', 'Sầu riêng Thái, cơm vàng đậm, mùi thơm nồng, hạt lép.', 'Sầu riêng Thái.', 100000.00, 'FoodMap', 'Ăn tươi - làm bánh', 'Trái cây tươi', 100, '1.jpg', NULL, NULL, 5),
(2, 'Táo đỏ Mỹ', 'Táo nhập khẩu Mỹ, quả to, vị ngọt, giòn, giàu dinh dưỡng.', 'Táo Mỹ giòn, ngọt.', 120000.00, 'Vinfruits', 'Ăn tươi', 'Trái cây nhập khẩu', 80, '2.jpg', NULL, NULL, 5),
(3, 'Cam sành Việt Nam', 'Cam sành nhiều nước, vị ngọt thanh, chứa nhiều vitamin C.', 'Cam sành mọng nước.', 70000.00, 'Nông trại Việt', 'Ăn tươi - vắt nước', 'Trái cây nội địa', 90, '3.jpg', NULL, NULL, 5),
(4, 'Chuối Laba', 'Chuối đặc sản Lâm Đồng, quả to, thơm ngon, ngọt đậm.', 'Chuối Laba ngọt.', 50000.00, 'Nông trại Đà Lạt', 'Ăn tươi - làm bánh', 'Trái cây nội địa', 120, '4.jpg', NULL, NULL, 5),
(5, 'Xoài cát Hòa Lộc', 'Xoài Hòa Lộc ngọt đậm, thịt dẻo, hương thơm đặc trưng.', 'Xoài Hòa Lộc ngọt.', 140000.00, 'VietGAP', 'Ăn tươi - sinh tố', 'Trái cây nội địa', 60, '5.jpg', NULL, NULL, 5),
(6, 'Bưởi da xanh', 'Bưởi da xanh múi to, không hạt, vị ngọt thanh mát.', 'Bưởi da xanh ngon.', 90000.00, 'Bến Tre Fruits', 'Ăn tươi - làm salad', 'Trái cây nội địa', 75, '6.jpg', NULL, NULL, 5),
(7, 'Dưa hấu ruột đỏ', 'Dưa hấu ruột đỏ, vỏ mỏng, ngọt mát, trồng theo tiêu chuẩn sạch.', 'Dưa hấu đỏ, ngọt.', 40000.00, 'Farm Fresh', 'Ăn tươi - ép nước', 'Trái cây nội địa', 110, '7.jpg', NULL, NULL, 5),
(8, 'Lê Hàn Quốc', 'Lê nhập khẩu Hàn Quốc, quả to, vị ngọt mát, nhiều nước.', 'Lê Hàn Quốc ngọt.', 150000.00, 'KoreaFruit', 'Ăn tươi', 'Trái cây nhập khẩu', 50, '8.jpg', NULL, NULL, 5),
(9, 'Nho Mỹ không hạt', 'Nho Mỹ quả to, vỏ mỏng, vị ngọt đậm, giàu dinh dưỡng.', 'Nho Mỹ không hạt.', 200000.00, 'USA Fruit', 'Ăn tươi - làm bánh', 'Trái cây nhập khẩu', 40, '9.jpg', NULL, NULL, 5),
(10, 'Mít Thái', 'Mít Thái siêu ngọt, múi to, vàng óng, giàu vitamin.', 'Mít Thái thơm, ngọt.', 60000.00, 'Nông sản Việt', 'Ăn tươi', 'Trái cây nội địa', 95, '10.jpg', NULL, NULL, 5),
(11, 'Dâu tây Đà Lạt', 'Dâu tây đỏ mọng, vị chua ngọt tự nhiên, trồng công nghệ cao.', 'Dâu Đà Lạt đỏ mọng.', 250000.00, 'FreshFarm', 'Ăn tươi - làm bánh', 'Trái cây nội địa', 35, '11.jpg', NULL, NULL, 5),
(12, 'Sầu riêng Ri6', 'Sầu riêng Ri6, cơm vàng đậm, hạt lép, vị béo ngọt.', 'Sầu riêng Ri6 béo.', 300000.00, 'Bến Tre Fruits', 'Ăn tươi - làm bánh', 'Trái cây nội địa', 25, '12.jpg', NULL, NULL, 5),
(13, 'Ổi lê Đài Loan', 'Ổi lê Đài Loan, vỏ xanh, ruột trắng, giòn ngọt, ít hạt.', 'Ổi lê Đài Loan giòn.', 50000.00, 'Nông sản Việt', 'Ăn tươi', 'Trái cây nội địa', 85, '13.jpg', NULL, NULL, 5),
(14, 'Chôm chôm nhãn', 'Chôm chôm nhãn vỏ mỏng, thịt trắng dày, vị ngọt.', 'Chôm chôm nhãn ngọt.', 80000.00, 'Miền Tây Fruits', 'Ăn tươi', 'Trái cây nội địa', 70, '14.jpg', NULL, NULL, 5),
(15, 'Thanh long ruột đỏ', 'Thanh long ruột đỏ ngọt dịu, nhiều nước, tốt cho sức khỏe.', 'Thanh long ruột đỏ.', 70000.00, 'Bình Thuận Fruits', 'Ăn tươi - làm sinh tố', 'Trái cây nội địa', 90, '15.jpg', NULL, NULL, 5),
(16, 'Dưa lưới Nhật', 'Dưa lưới Nhật Bản, vị ngọt thanh, thịt giòn, thơm nhẹ.', 'Dưa lưới Nhật.', 180000.00, 'Japan Fruits', 'Ăn tươi - ép nước', 'Trái cây nhập khẩu', 30, '16.jpg', NULL, NULL, 5),
(17, 'Lựu đỏ Ấn Độ', 'Lựu đỏ nhập khẩu Ấn Độ, hạt mọng nước, vị ngọt thanh.', 'Lựu đỏ Ấn Độ.', 130000.00, 'Indian Fruits', 'Ăn tươi', 'Trái cây nhập khẩu', 55, '17.jpg', NULL, NULL, 5),
(18, 'Mận hậu Sơn La', 'Mận hậu Sơn La, vỏ đỏ, vị chua nhẹ, ngọt thanh, giòn.', 'Mận hậu Sơn La.', 60000.00, 'Nông sản Việt', 'Ăn tươi', 'Trái cây nội địa', 100, '18.jpg', NULL, NULL, 5),
(19, 'Bơ 034', 'Bơ 034 Lâm Đồng, vỏ xanh, cơm dẻo, vị béo ngậy, ít xơ.', 'Bơ 034 béo.', 80000.00, 'Đà Lạt Fruits', 'Ăn tươi - làm sinh tố', 'Trái cây nội địa', 85, '19.jpg', NULL, NULL, 5),
(20, 'Măng cụt Thái', 'Măng cụt Thái, vỏ mỏng, ruột trắng, vị ngọt thanh.', 'Măng cụt Thái.', 120000.00, 'Thai Fruits', 'Ăn tươi', 'Trái cây nhập khẩu', 60, '20.jpg', NULL, NULL, 5),
(21, 'Dứa (Thơm) Queen', 'Dứa Queen, ruột vàng, thơm ngọt, ít xơ, giàu vitamin C.', 'Dứa Queen thơm.', 40000.00, 'Nông sản Việt', 'Ăn tươi - làm nước ép', 'Trái cây nội địa', 95, '21.jpg', NULL, NULL, 5),
(22, 'Việt quất Mỹ', 'Việt quất nhập Mỹ, quả nhỏ, giàu chất chống oxy hóa.', 'Việt quất Mỹ.', 280000.00, 'USA Fruits', 'Ăn tươi - làm bánh', 'Trái cây nhập khẩu', 45, '22.jpg', NULL, NULL, 5),
(23, 'Mơ vàng', 'Mơ vàng, vị chua nhẹ, giòn, dùng làm ô mai, nước giải khát.', 'Mơ vàng giòn.', 50000.00, 'Nông sản Việt', 'Ăn tươi - làm ô mai', 'Trái cây nội địa', 90, '23.jpg', NULL, NULL, 5),
(24, 'Hồng giòn Đà Lạt', 'Hồng giòn Đà Lạt, vỏ mỏng, thịt giòn, vị ngọt tự nhiên.', 'Hồng giòn Đà Lạt.', 70000.00, 'Đà Lạt Fruits', 'Ăn tươi', 'Trái cây nội địa', 75, '24.jpg', NULL, NULL, 5),
(25, 'Mít tố nữ', 'Mít tố nữ, múi nhỏ, vị ngọt đậm, thơm đặc trưng.', 'Mít tố nữ thơm.', 60000.00, 'Miền Tây Fruits', 'Ăn tươi', 'Trái cây nội địa', 80, '25.jpg', NULL, NULL, 5);

CREATE TABLE `product_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `discount_percent` decimal(10,2) NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `product_discounts` (`id`, `product_id`, `discount_percent`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 30.00, '2025-04-16 10:00:00', '2025-05-16 10:00:00', 0, '2025-04-15 03:04:50', '2025-04-15 04:50:31'),
(2, 2, 10.00, '2025-04-16 10:00:00', '2025-05-09 10:00:00', 1, '2025-04-15 04:45:01', '2025-04-15 04:45:01'),
(3, 9, 25.00, '2025-04-16 10:00:00', '2025-06-04 10:00:00', 1, '2025-04-15 04:45:20', '2025-04-15 04:45:20'),
(4, 17, 20.00, '2025-04-17 10:00:00', '2025-05-09 10:00:00', 1, '2025-04-15 04:45:42', '2025-04-15 04:45:42'),
(5, 19, 20.00, '2025-04-15 10:00:00', '2025-05-15 10:00:00', 1, '2025-04-15 04:45:59', '2025-04-15 04:45:59'),
(6, 18, 20.00, '2025-04-15 10:00:00', '2025-05-15 10:00:00', 1, '2025-04-15 04:46:25', '2025-04-15 04:46:25'),
(7, 20, 20.00, '2025-04-15 10:00:00', '2025-05-15 10:00:00', 1, '2025-04-15 04:46:46', '2025-04-15 04:46:46'),
(8, 22, 20.00, '2025-04-15 10:00:00', '2025-05-15 10:00:00', 1, '2025-04-15 04:47:04', '2025-04-15 04:47:04');

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(2, 23, 2, 5, 'táo nhìn ngon quá đi thôi', '2025-04-14 13:36:07', '2025-04-14 13:36:07'),
(10, 23, 2, 5, 'hoàng tấn dũng', '2025-04-14 19:11:15', '2025-04-14 19:11:15');

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `role_description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` (`id`, `role_name`, `role_description`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', 'Quản trị viên hệ thống', NULL, NULL),
(2, 'SHIPPER', 'Người vận chuyển đơn hàng', NULL, NULL),
(3, 'USER', 'Người dùng thông thường', NULL, NULL);

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `address_id` char(36) NOT NULL,
  `shipping_method` varchar(50) NOT NULL,
  `shipping_status` varchar(50) NOT NULL DEFAULT 'Đang chuẩn bị',
  `estimated_delivery_date` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_avatar` text DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `provider` varchar(50) DEFAULT NULL,
  `provider_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `user_name`, `user_email`, `user_password`, `user_phone`, `user_avatar`, `role_id`, `created_at`, `updated_at`, `user_address`, `provider`, `provider_id`) VALUES
(1, 'Admin Account', 'admin@gmail.com', '$2y$10$0QX0lZXtx/i6Td.qRZB8DusIw1jcqWt8ETTgM8gWR/5RThWK.04vC', '0123456789', 'default-google.png', 1, NULL, NULL, 'TP HCM', NULL, NULL),
(2, 'Shipper Account', 'shipper@gmail.com', '$2y$10$0QX0lZXtx/i6Td.qRZB8DusIw1jcqWt8ETTgM8gWR/5RThWK.04vC', '0987654321', 'default-google.png', 2, NULL, NULL, 'TP HCM', NULL, NULL),
(3, 'User Account', 'user@gmail.com', '$2y$10$0QX0lZXtx/i6Td.qRZB8DusIw1jcqWt8ETTgM8gWR/5RThWK.04vC', '0345678912', 'default-google.png', 3, NULL, NULL, 'TP HCM', NULL, NULL),
(23, 'Hoang Tan dung', 'test@gmail.com', '$2y$10$QOMnxMd77O8fFwCznwGOU.WduNZzflmQ.yjEUmzm4KO8NscIbkE2m', '0123456789', 'M90i6FdoVaJXoWSBhqsdIKDm16cwpTXz9NxUNN0q.png', 3, '2025-03-18 12:06:39', '2025-04-16 20:12:27', 'HA NOI', NULL, NULL),
(31, 'HOÀNG TẤN DŨNG', 'dungakaishi900@gmail.com', '$2y$10$lfMMzZDYJjW2/IiF3WAih.jxV4acRB1bPqD3TfroCrztGjDu9Nuh6', NULL, '2bYEheZx5h74kFilqAR0.jpg', 3, '2025-04-15 13:57:47', '2025-04-15 13:57:47', NULL, 'GOOGLE', '115133837947112457243'),
(32, 'Thiệu Đoàn', 'doanquangthieu9c@gmail.com', '$2y$10$0Tu1afnbvTJEdUkt/IRBk.msPSfv20KgrkkL551sdqMu.rJOBa7vK', NULL, 'm8PnTpdYxZhnHrljmNZQlEI2HYo8vfTiKt83fUBB.jpg', 3, '2025-05-09 01:08:44', '2025-05-09 01:09:06', NULL, 'GOOGLE', '108632092929886611113');

CREATE TABLE `user_addresses` (
  `address_id` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `address_type` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_user_id_foreign` (`user_id`);

ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_details_product_id_foreign` (`product_id`),
  ADD KEY `cart_details_cart_id_foreign` (`cart_id`);

ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `product_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_discounts_product_id_foreign` (`product_id`);

ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shippings_order_id_unique` (`order_id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_email_unique` (`user_email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `user_addresses_user_id_foreign` (`user_id`);

ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

ALTER TABLE `cart_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

ALTER TABLE `product_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

ALTER TABLE `carts`
  ADD CONSTRAINT `cart_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `cart_details`
  ADD CONSTRAINT `cart_details_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `cart_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `product_discounts`
  ADD CONSTRAINT `product_discounts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;
