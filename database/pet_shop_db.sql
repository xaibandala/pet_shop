-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2025 at 02:41 AM
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
-- Database: `pet_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(7, 3, 11, 300, 1, '2025-03-18 22:34:55'),
(8, 3, 10, 120, 2, '2025-03-18 22:35:14'),
(12, 4, 17, 300, 1, '2025-06-03 11:52:04'),
(18, 21, 15, 1200, 2, '2025-06-23 00:25:15'),
(19, 45, 26, 1500, 3, '2025-06-29 13:35:01'),
(20, 57, 26, 1500, 1, '2025-06-29 15:27:57'),
(43, 58, 43, 110, 2, '2025-07-24 16:38:21'),
(47, 60, 52, 280, 5, '2025-07-26 11:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Food', 'Sample Description', 1, '2021-06-21 10:17:41'),
(4, 'Accessories', '&lt;p&gt;Sample Category&lt;/p&gt;', 1, '2021-06-21 16:34:04'),
(5, 'Pet', '&lt;p&gt;Buy your pets now&lt;/p&gt;', 1, '2025-03-17 17:08:58');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `pending_email` varchar(250) DEFAULT NULL,
  `email_verification_token` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `barangay` varchar(100) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`, `pending_email`, `email_verification_token`, `region`, `province`, `city`, `barangay`, `street_address`) VALUES
(1, 'John', 'Smith', 'Male', '09123456789', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'Sample Address', '2021-06-21 16:00:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'rhey', 'labao', 'Female', '09107135234', 'rheymarlabao@gmail.com', 'ca9808a0ab128b08d9f5b94c00067edc', 'bangkal wakandabaw city', '2025-03-18 22:34:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'Rhey Mar', 'Labao', 'Male', '09810841358', 'xaiglennbandala@gmail.com', '$2y$10$YcYKMEHWQWb1FNz63s8wPOyafkexZne20z5hX0NOMRBL/Mr0wX3qK', 'Sardonyx Street Alzate Compound', '2025-06-30 10:39:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_otps`
--

CREATE TABLE `email_otps` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(10) NOT NULL,
  `type` enum('verification','reset','password_change') NOT NULL DEFAULT 'verification',
  `expiry` datetime NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_otps`
--

INSERT INTO `email_otps` (`id`, `email`, `otp`, `type`, `expiry`, `used`, `created_at`) VALUES
(11, 'testuser6540@example.com', '524550', 'verification', '2025-06-29 08:42:54', 0, '2025-06-29 06:32:54'),
(12, 'testuser3438@example.com', '977780', 'verification', '2025-06-29 08:43:09', 1, '2025-06-29 06:33:09'),
(13, 'testuser2877@example.com', '394486', 'verification', '2025-06-29 08:43:23', 1, '2025-06-29 06:33:23'),
(24, 'rheylabao@gmail.com', '632941', 'verification', '2025-06-30 04:49:13', 1, '2025-06-30 02:39:13'),
(25, 'xaiglennbandala@gmail.com', '518281', '', '2025-07-02 05:38:58', 0, '2025-07-02 03:28:58'),
(26, 'xaiglennbandala@gmail.com', '025390', '', '2025-07-02 05:41:32', 0, '2025-07-02 03:31:32'),
(27, 'xaiglennbandala@gmail.com', '226936', '', '2025-07-02 05:41:57', 0, '2025-07-02 03:31:57'),
(28, 'xaiglennbandala@gmail.com', '849365', '', '2025-07-02 05:43:17', 0, '2025-07-02 03:33:17'),
(29, 'xaiglennbandala@gmail.com', '881564', 'password_change', '2025-07-02 05:46:17', 1, '2025-07-02 03:36:17'),
(30, 'bxaiglenn@gmail.com', '155465', 'password_change', '2025-07-02 05:51:07', 0, '2025-07-02 03:41:07'),
(31, 'xaiglennbandala@gmail.com', '279134', 'verification', '2025-07-24 10:53:55', 0, '2025-07-24 08:43:55'),
(32, 'bxaiglenn@gmail.com', '192672', 'verification', '2025-07-24 11:29:17', 0, '2025-07-24 09:19:17');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `size` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `unit`, `price`, `size`, `date_created`, `date_updated`) VALUES
(1, 1, 50, 'pcs', 250, 'M', '2021-06-21 13:01:30', '2021-06-21 13:05:23'),
(2, 1, 20, 'Sample', 300, 'L', '2021-06-21 13:07:00', NULL),
(3, 4, 150, 'pcs', 500, 'M', '2021-06-21 16:50:37', NULL),
(4, 3, 50, 'pack', 150, 'M', '2021-06-21 16:51:12', NULL),
(5, 5, 30, 'pcs', 50, 'M', '2021-06-21 16:51:35', NULL),
(6, 4, 10, 'pcs', 550, 'L', '2021-06-21 16:51:54', NULL),
(7, 6, 100, 'pcs', 150, 'S', '2021-06-22 15:50:47', NULL),
(8, 6, 150, 'pcs', 180, 'M', '2021-06-22 15:51:13', NULL),
(9, 7, 3, 'kg', 1000, 'M', '2025-03-17 16:44:20', NULL),
(10, 8, 0, 'pcs', 120, 'NONE', '2025-03-17 16:45:12', '2025-07-01 22:59:58'),
(11, 9, -2, 'kg', 300, 'M', '2025-03-17 17:04:57', '2025-06-30 01:30:07'),
(12, 10, 2, 'pcs', 800, 'M', '2025-03-17 17:06:39', '2025-06-04 11:45:32'),
(13, 11, 93, 'pcs', 90, 'S', '2025-03-17 17:07:47', '2025-06-30 01:30:07'),
(15, 13, 1, 'kg', 1200, 'L', '2025-03-17 17:12:42', '2025-06-23 00:25:15'),
(16, 14, 1, 'pcs', 100, 'S', '2025-03-17 17:14:15', '2025-06-12 00:00:41'),
(17, 15, 73, 'pcs', 300, 'NONE', '2025-03-17 17:15:14', '2025-06-30 00:21:26'),
(18, 16, 104, 'pcs', 600, 'NONE', '2025-03-17 17:16:20', '2025-07-24 16:55:08'),
(19, 9, 4, 'kg', 500, 'L', '2025-03-18 22:39:24', NULL),
(21, 18, 193, '', 6800, '', '2025-06-11 23:34:05', '2025-07-01 23:08:03'),
(22, 19, 96, '', 1900, '', '2025-06-22 17:31:45', '2025-06-30 09:53:08'),
(23, 20, 100, '', 100, '', '2025-06-23 22:29:44', NULL),
(25, 22, 110, '', 1500, '', '2025-06-23 22:59:33', NULL),
(26, 23, 89, '', 1500, '', '2025-06-27 10:27:29', '2025-06-30 09:53:50'),
(27, 24, 980, '', 10, '', '2025-06-30 00:31:46', '2025-06-30 01:33:31'),
(28, 25, 110, '', 65, '', '2025-06-30 16:38:03', NULL),
(29, 26, 110, '', 65, '', '2025-06-30 16:40:29', NULL),
(30, 27, 110, '', 450, '', '2025-06-30 16:42:23', NULL),
(31, 28, 106, '', 250, '', '2025-06-30 16:57:49', '2025-06-30 20:25:44'),
(32, 29, 110, '', 160, '', '2025-06-30 17:03:25', NULL),
(33, 30, 110, '', 135, '', '2025-06-30 17:06:15', NULL),
(34, 31, 110, '', 350, '', '2025-06-30 17:17:42', NULL),
(35, 32, 110, '', 250, '', '2025-07-01 23:11:35', NULL),
(36, 33, 110, '', 1500, '', '2025-07-01 23:14:33', NULL),
(37, 34, 110, '', 100, '', '2025-07-01 23:18:18', NULL),
(38, 35, 110, '', 650, '', '2025-07-01 23:23:13', NULL),
(39, 36, 110, '', 2000, '', '2025-07-01 23:45:08', NULL),
(40, 37, 900, '', 25, '', '2025-07-01 23:47:47', '2025-07-02 12:52:00'),
(41, 38, 110, '', 350, '', '2025-07-01 23:53:50', NULL),
(42, 39, 110, '', 1400, '', '2025-07-01 23:56:48', NULL),
(43, 40, 98, '', 110, '', '2025-07-02 00:01:19', '2025-07-24 16:38:21'),
(44, 41, 110, '', 70, '', '2025-07-02 00:02:57', NULL),
(45, 42, 110, '', 160, '', '2025-07-02 00:08:17', NULL),
(46, 43, 110, '', 250, '', '2025-07-02 00:09:46', NULL),
(47, 44, 110, '', 599, '', '2025-07-02 00:15:54', NULL),
(48, 45, 110, '', 350, '', '2025-07-02 00:17:18', NULL),
(49, 46, 110, '', 250, '', '2025-07-02 00:19:12', NULL),
(50, 47, 110, '', 450, '', '2025-07-02 00:20:39', NULL),
(51, 48, 110, '', 350, '', '2025-07-02 00:21:46', NULL),
(52, 49, 108, '', 280, '', '2025-07-02 00:22:58', '2025-07-26 11:40:18'),
(53, 50, 110, '', 499, '', '2025-07-02 00:27:54', NULL),
(54, 51, 110, '', 355, '', '2025-07-02 00:28:51', NULL),
(55, 52, 110, '', 102, '', '2025-07-02 00:30:08', '2025-07-02 00:30:28'),
(56, 53, 110, '', 1000, '', '2025-07-02 00:38:13', NULL),
(57, 54, 110, '', 135, '', '2025-07-02 00:42:49', NULL),
(58, 55, 110, '', 335, '', '2025-07-02 00:47:56', NULL),
(59, 56, 110, '', 355, '', '2025-07-02 00:51:57', NULL),
(60, 57, 110, '', 300, '', '2025-07-02 00:56:37', NULL),
(61, 58, 104, '', 400, '', '2025-07-02 01:02:49', '2025-07-02 12:19:32'),
(62, 59, 100, '', 1200, '', '2025-07-27 10:06:33', NULL),
(63, 60, 100, '', 100, '', '2025-07-27 18:56:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(1, 1, 'Sample Address', 'Online Payment', 1100, 2, 1, '2021-06-22 13:48:54', '2021-06-22 14:49:15'),
(2, 1, 'Sample Address', 'cod', 750, 3, 1, '2021-06-22 15:26:07', '2021-06-22 15:32:55'),
(4, 2, 'lacson ', 'cod', 2000, 3, 1, '2025-03-17 17:00:34', '2025-03-17 17:01:09'),
(5, 4, 'Sardonyx Street Alzate Compound', 'cod', 1200, 2, 0, '2025-06-03 11:06:34', '2025-06-03 11:07:15'),
(6, 4, 'Sardonyx Street Alzate Compound', 'cod', 300, 0, 0, '2025-06-03 11:43:13', NULL),
(7, 6, 'bot ', 'cod', 1100, 0, 0, '2025-06-04 11:45:32', NULL),
(8, 6, 'bot ', 'cod', 0, 0, 0, '2025-06-04 11:52:37', NULL),
(9, 6, 'bot ', 'cod', 0, 0, 0, '2025-06-04 11:52:38', NULL),
(10, 6, 'bot ', 'cod', 0, 0, 0, '2025-06-04 11:52:38', NULL),
(11, 6, 'bot ', 'cod', 0, 0, 0, '2025-06-04 11:52:39', NULL),
(12, 31, 'Penano street', 'cod', 900, 0, 0, '2025-06-23 20:03:30', NULL),
(13, 58, 'davao', 'cod', 200, 4, 0, '2025-06-30 01:09:36', '2025-06-30 01:09:55'),
(14, 58, 'davao', 'cod', 6960, 4, 0, '2025-06-30 01:30:07', '2025-06-30 01:31:57'),
(15, 58, 'davao', 'cod', 640, 4, 0, '2025-06-30 01:30:39', '2025-06-30 01:32:04'),
(16, 58, 'davao', 'cod', 100, 3, 1, '2025-06-30 01:33:31', '2025-06-30 01:34:00'),
(17, 58, 'davao', 'cod', 8100, 3, 1, '2025-06-30 01:53:58', '2025-06-30 01:54:22'),
(18, 59, 'Sardonyx Street Alzate Compound', 'cod', 1900, 4, 0, '2025-06-30 09:53:08', '2025-06-30 09:58:36'),
(19, 58, 'davao', 'cod', 500, 3, 1, '2025-06-30 20:25:44', '2025-06-30 20:26:07'),
(20, 58, 'calinan davao city', 'cod', 1200, 3, 1, '2025-07-02 12:19:32', '2025-07-02 12:19:55'),
(21, 58, 'calinan davao city', 'cod', 1250, 3, 1, '2025-07-02 12:52:00', '2025-07-02 12:52:56'),
(22, 58, 'calinan davao city', 'cod', 550, 3, 1, '2025-07-02 12:59:08', '2025-07-02 12:59:57');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `size` varchar(20) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `size`, `unit`, `quantity`, `price`, `total`) VALUES
(1, 1, 4, 'L', 'pcs', 2, 550, 1100),
(2, 2, 3, 'M', 'pack', 5, 150, 750),
(5, 4, 7, 'M', 'kg', 2, 1000, 2000),
(6, 5, 13, 'L', 'kg', 1, 1200, 1200),
(7, 6, 15, 'NONE', 'pcs', 1, 300, 300),
(8, 7, 9, 'M', 'kg', 1, 300, 300),
(9, 7, 10, 'M', 'pcs', 1, 800, 800),
(10, 12, 15, 'NONE', 'pcs', 3, 300, 900),
(11, 13, 18, '', '', 2, 100, 200),
(12, 14, 11, 'S', 'pcs', 5, 90, 450),
(13, 14, 9, 'M', 'kg', 2, 300, 600),
(14, 14, 24, '', '', 21, 10, 210),
(15, 14, 19, '', '', 3, 1900, 5700),
(16, 15, 24, '', '', 64, 10, 640),
(17, 16, 24, '', '', 10, 10, 100),
(18, 17, 23, '', '', 5, 1500, 7500),
(19, 17, 16, 'NONE', 'pcs', 1, 600, 600),
(20, 18, 19, '', '', 1, 1900, 1900),
(21, 19, 28, '', '', 2, 250, 500),
(22, 20, 58, '', '', 3, 400, 1200),
(23, 21, 37, '', '', 50, 25, 1250),
(24, 22, 40, '', '', 5, 110, 550);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `product_name`, `description`, `status`, `date_created`) VALUES
(7, 1, 1, 'Nutri Chunks 10kg', '&lt;p&gt;Nutri Chunks 10kg dog food provides complete and balanced nutrition for dogs, with specific variants available for puppies and adult dogs. Key features often include the &quot;Activboost Formula&quot; for optimum energy levels, an ideal blend of proteins, fats, and carbohydrates, and the inclusion of prebiotics for enhanced digestion and improved immune system health. Many formulations also contain Omega 3 and 6 fatty acids to promote a healthy and shiny coat, as well as Yucca Extract to help reduce stool odor and improve stool quality. Nutri Chunks aims to provide all the necessary nutrients without artificial colors, ensuring a wholesome meal for dogs of all breeds. Common flavors for adult formulations include Beef, Lamb, and Salmon (for &quot;Coat Shine&quot; variants), while puppy formulas often feature Lamb, Chicken Liver, and Milk.&lt;/p&gt;', 1, '2025-03-17 16:28:00'),
(8, 4, 5, 'Leash', '&lt;p&gt;A leash for cats and dogs is a common pet accessory designed to provide control and safety during walks or outdoor excursions. Typically made from materials like nylon, leather, or rope, leashes attach to a collar or harness worn by the pet. Their primary function is to allow owners to guide their animals, prevent them from running off, and keep them safe from hazards such as traffic or other animals.&amp;nbsp;&lt;span style=&quot;font-size: 1rem;&quot;&gt;For dogs, leashes come in various lengths and strengths, accommodating different breeds, sizes, and training needs, from short traffic leashes to longer training leads. For cats, leashes are often lighter and sometimes paired with harnesses that distribute pressure more evenly across the body, as cats can be more prone to slipping out of collars. Regardless of the pet, a well-chosen leash is an essential tool for responsible pet ownership, enabling controlled exercise and exploration while ensuring the animal&#039;s security.&lt;/span&gt;&lt;/p&gt;', 1, '2025-03-17 16:30:04'),
(10, 4, 5, 'Pet Cage', '&lt;p&gt;A &lt;strong&gt;pet cage&lt;/strong&gt; is an enclosure designed to house and secure pets safely. It provides a comfortable space for animals like birds, rabbits, hamsters, and small dogs. Available in various sizes and materials, pet cages often include ventilation, feeding areas, and bedding for the pet&rsquo;s well-being.&lt;/p&gt;', 1, '2025-03-17 17:06:18'),
(11, 4, 4, 'V-gard shampoo', '&lt;p&gt;V-Gard Pet Grooming Shampoo is formulated for general pet hygiene and coat care, designed to leave the pet&#039;s hair smooth, shiny, soft, and easy to comb, often with a long-lasting fragrance such as &quot;powder scent.&quot; Some variations, like the &quot;3 in 1 Plus,&quot; might also offer additional benefits such as deodorizing properties and shed control, while still being gentle enough for all skin types. These shampoos are typically recommended by veterinary grooming stores for both professional and home use.&lt;/p&gt;', 1, '2025-03-17 17:07:25'),
(13, 1, 1, 'Top Breed 20kg', '&lt;p&gt;Top Breed Dog Meal Puppy is a dry dog food specifically formulated to meet the nutritional needs of growing puppies. It is crafted to provide a complete and balanced diet, supporting healthy development during their crucial early stages. This puppy formula typically includes essential nutrients for strong bones and teeth, a healthy immune system, and optimal energy for play and growth. Key ingredients often include high-quality protein sources for muscle development, along with vitamins and minerals crucial for overall well-being. It is designed to be easily digestible for young dogs and helps ensure they get a good start in life.&lt;/p&gt;', 1, '2025-03-17 17:12:21'),
(14, 4, 6, 'Methylene Blue 150ml', '&lt;p&gt;The &lt;strong data-start=&quot;99&quot; data-end=&quot;124&quot;&gt;Methylene Blue 150 ml&lt;/strong&gt; solution is a versatile and reliable aquarium treatment suitable for both freshwater and marine environments. It is primarily used as an &lt;strong data-start=&quot;262&quot; data-end=&quot;300&quot;&gt;antifungal and antiparasitic agent&lt;/strong&gt;, effective in treating conditions such as ich (white spot disease), velvet disease, and fungal infections on fish and fish eggs. It also serves as an &lt;strong data-start=&quot;451&quot; data-end=&quot;473&quot;&gt;oxygen transporter&lt;/strong&gt;, helping reduce the effects of nitrite or cyanide poisoning in fish. Methylene Blue is gentle enough to be used during egg incubation and on newly hatched fry, but should be used with caution in tanks with live plants, as higher concentrations may cause damage. During treatment, it is recommended to remove activated carbon from the filtration system, maintain proper aeration, and perform a partial water change after the treatment period. This product is a staple in fishkeeping for both disease treatment and prevention.&lt;/p&gt;', 1, '2025-03-17 17:13:53'),
(15, 5, 8, 'Kohaku Koi', '&lt;div _ngcontent-ng-c57678444=&quot;&quot; class=&quot;markdown markdown-main-panel stronger enable-updated-hr-color&quot; id=&quot;model-response-message-contentr_d0343fbd9de36e57&quot; dir=&quot;ltr&quot; style=&quot;--animation-duration: 600ms; --fade-animation-function: linear; animation: 0s ease 0s 1 normal none running none; appearance: none; background: none 0% 0% / auto repeat scroll padding-box border-box rgba(0, 0, 0, 0); border: 0px none rgb(27, 28, 29); inset: auto; clear: none; clip: auto; columns: auto; contain: none; container: none; content: normal; cursor: auto; cx: 0px; cy: 0px; d: none; direction: ltr; fill: rgb(0, 0, 0); filter: none; flex: 0 1 auto; float: none; gap: normal; hyphens: manual; interactivity: auto; isolation: auto; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; marker: none; mask: none; offset: normal; opacity: 1; order: 0; outline: rgb(27, 28, 29) none 0px; overlay: none; padding: 0px; page: auto; perspective: none; position: static; quotes: auto; r: 0px; resize: none; rotate: none; rx: auto; ry: auto; scale: none; speak: normal; stroke: none; transform: none; transition: all; translate: none; visibility: visible; x: 0px; y: 0px; zoom: 1; margin-top: 0px !important; font-family: &amp;quot;Google Sans Text&amp;quot;, sans-serif !important; line-height: 1.15 !important;&quot;&gt;&lt;p style=&quot;animation: 0s ease 0s 1 normal none running none; appearance: none; background: none 0% 0% / auto repeat scroll padding-box border-box rgba(0, 0, 0, 0); border: 0px none rgb(27, 28, 29); inset: auto; clear: none; clip: auto; columns: auto; contain: none; container: none; content: normal; cursor: auto; cx: 0px; cy: 0px; d: none; direction: ltr; fill: rgb(0, 0, 0); filter: none; flex: 0 1 auto; float: none; gap: normal; hyphens: manual; interactivity: auto; isolation: auto; margin-right: 0px; margin-bottom: 16px; margin-left: 0px; marker: none; mask: none; offset: normal; opacity: 1; order: 0; outline: rgb(27, 28, 29) none 0px; overlay: none; padding: 0px; page: auto; perspective: none; position: static; quotes: auto; r: 0px; resize: none; rotate: none; rx: auto; ry: auto; scale: none; speak: normal; stroke: none; transform: none; transition: all; translate: none; visibility: visible; x: 0px; y: 0px; zoom: 1; line-height: 1.15 !important;&quot;&gt;The Kohaku is one of the most recognizable and popular varieties of Koi, distinguished by its pristine white body adorned with striking red (hi) patterns. These patterns can vary greatly, from large, continuous patches to smaller, more fragmented designs, but a good Kohaku is judged on the purity of its white, the intensity and evenness of its red, and the balanced distribution of the colors on its body.&lt;/p&gt;&lt;/div&gt;', 1, '2025-03-17 17:14:54'),
(16, 4, 6, 'Seabillion Pump', '&lt;p&gt;The Seabillion HY-307 is a high-performance submersible water pump designed for efficient and quiet operation in aquariums, hydroponic systems, fountains, and small ponds. Powered by a 20-watt motor, it delivers a strong flow rate of up to 3,500 liters per hour with a maximum lift height of 3.0 meters, making it ideal for both horizontal and vertical water circulation. Built with durable ABS housing and a ceramic shaft, the pump ensures long-lasting, rust-resistant performance. Its brushless motor design provides ultra-quiet operation, while strong suction cups allow easy and stable mounting on tank surfaces. Fully waterproof and safe for continuous underwater use, the HY-307 is a reliable choice for maintaining clean and healthy water environments in both freshwater and saltwater setups.&lt;/p&gt;', 1, '2025-03-17 17:15:55'),
(18, 5, 8, 'Special Arowanas', '&lt;div dir=&quot;auto&quot; style=&quot;font-family: &amp;quot;Segoe UI Historic&amp;quot;, &amp;quot;Segoe UI&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve;&quot;&gt;- Super Red Arowana &lt;/div&gt;&lt;div dir=&quot;auto&quot; style=&quot;font-family: &amp;quot;Segoe UI Historic&amp;quot;, &amp;quot;Segoe UI&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve;&quot;&gt;- Bluebase Golden Arowana &lt;/div&gt;&lt;div dir=&quot;auto&quot; style=&quot;font-family: &amp;quot;Segoe UI Historic&amp;quot;, &amp;quot;Segoe UI&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve;&quot;&gt;- Albino Banana Yellow Arowana &lt;/div&gt;&lt;div dir=&quot;auto&quot; style=&quot;font-family: &amp;quot;Segoe UI Historic&amp;quot;, &amp;quot;Segoe UI&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve;&quot;&gt;- &lt;span class=&quot;html-span xdj266r x14z9mp xat24cr x1lziwak xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs&quot; style=&quot;margin: 0px; text-align: inherit; padding: 0px; overflow-wrap: break-word; font-family: inherit;&quot;&gt;&lt;a tabindex=&quot;-1&quot; class=&quot;html-a xdj266r x14z9mp xat24cr x1lziwak xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs&quot; style=&quot;cursor: pointer; margin: 0px; text-align: inherit; padding: 0px; overflow-wrap: break-word; font-family: inherit;&quot;&gt;&lt;/a&gt;&lt;/span&gt;Silver Arowana &lt;/div&gt;&lt;div dir=&quot;auto&quot; style=&quot;font-family: &amp;quot;Segoe UI Historic&amp;quot;, &amp;quot;Segoe UI&amp;quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve;&quot;&gt;- Silver Arowana&lt;/div&gt;', 1, '2025-06-11 23:32:29'),
(19, 5, 8, 'fighting fish', '&lt;p&gt;Imported Betta from Thailand&lt;/p&gt;', 1, '2025-06-11 23:36:00'),
(25, 4, 6, 'Danios Anti-Parasite 100ml', 'Danios Anti-Parasite is an &quot;improved German formula&quot; specifically designed to effectively treat a wide range of ectoparasitic diseases in aquarium fish. These external parasites can cause various issues, and this medication targets common afflictions such as velvet disease, costiasis, gill flukes, skin flukes, leeches, anchor worms, and tapeworms. It is a popular choice among aquarists for its effectiveness in addressing these common external parasitic infections. The bottle shown in the image is the 110ml size.', 1, '2025-06-30 16:35:59'),
(26, 4, 6, 'Danios Anti-Ich 110ml', '&lt;p&gt;Danios Anti-Ich is a concentrated medication specifically formulated to combat &quot;white spot disease,&quot; commonly known as Ich, in both freshwater and saltwater aquariums. This parasitic infection, caused by Ichthyophthirius in freshwater environments and Cryptocarion in marine settings, manifests through symptoms such as distinct white spots on the fish&#039;s body and fins, increased scratching against tank decor, diminished appetite, reduced movement, and a darkening of the fish&#039;s natural coloration.&lt;/p&gt;', 1, '2025-06-30 16:39:41'),
(27, 4, 6, 'Fish tank 12x8x12', '&lt;p&gt;Fish tank 12x8x12&lt;/p&gt;', 1, '2025-06-30 16:42:09'),
(28, 4, 6, 'Porpoise Safe Start 2‑in‑1 Water Conditioner 500ml', '&lt;p&gt;The Porpoise Safe Start 2‑in‑1 Water Conditioner is a multipurpose aquarium additive designed to help fish transition smoothly into new or changed environments. Its formula combines the removal of chlorine, chloramine, and heavy metals with a restorative aloe-enriched slime coat booster that helps reduce stress and supports fish immunity. Recommended dosage is approximately 10 ml per 100 L (26 gallons) of water, and it should be diluted before adding to the tank. This product is available in a 500 ml bottle, suitable for both freshwater and marine aquariums.&lt;/p&gt;', 1, '2025-06-30 16:57:30'),
(29, 4, 6, 'SISO Metronidazole for Fish (50 Tablets)', '&lt;p data-start=&quot;125&quot; data-end=&quot;772&quot;&gt;&lt;strong data-start=&quot;125&quot; data-end=&quot;155&quot;&gt;SISO Metronidazole Tablets&lt;/strong&gt; are specially formulated to treat a wide range of internal and external parasitic infections in freshwater and marine fish. Each bottle contains &lt;strong data-start=&quot;301&quot; data-end=&quot;315&quot;&gt;50 tablets&lt;/strong&gt; and is effective for treating up to &lt;strong data-start=&quot;352&quot; data-end=&quot;384&quot;&gt;5,000 liters (1,320 gallons)&lt;/strong&gt; of aquarium water. Metronidazole is widely used to treat conditions such as &lt;strong data-start=&quot;461&quot; data-end=&quot;500&quot;&gt;Hexamita (Hole-in-the-Head disease)&lt;/strong&gt;, &lt;strong data-start=&quot;502&quot; data-end=&quot;528&quot;&gt;intestinal flagellates&lt;/strong&gt;, &lt;strong data-start=&quot;530&quot; data-end=&quot;556&quot;&gt;bacterial gill disease&lt;/strong&gt;, and other anaerobic bacterial infections. These fast-dissolving tablets are safe and easy to use&mdash;simply add the recommended dose directly to the tank after removing any activated carbon from your filtration system.&amp;nbsp;&lt;span style=&quot;font-size: 1rem;&quot;&gt;This product is ideal for treating large aquariums, quarantine setups, and arowana or stingray tanks, as featured on the label. It&rsquo;s suitable for both &lt;/span&gt;&lt;strong data-start=&quot;925&quot; data-end=&quot;961&quot; style=&quot;font-size: 1rem;&quot;&gt;freshwater and saltwater species&lt;/strong&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;, and can be used in combination with water changes and elevated temperatures to enhance its effectiveness. For best results, use for &lt;/span&gt;&lt;strong data-start=&quot;1095&quot; data-end=&quot;1107&quot; style=&quot;font-size: 1rem;&quot;&gt;3&ndash;5 days&lt;/strong&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt; with water changes in between doses. Always monitor water quality during treatment and avoid overuse to prevent bacterial resistance.&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Compact and efficient, the SISO Metronidazole bottle is approximately &lt;/span&gt;&lt;strong data-start=&quot;1313&quot; data-end=&quot;1326&quot; style=&quot;font-size: 1rem;&quot;&gt;9 cm tall&lt;/strong&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt; and &lt;/span&gt;&lt;strong data-start=&quot;1331&quot; data-end=&quot;1353&quot; style=&quot;font-size: 1rem;&quot;&gt;4.5 cm in diameter&lt;/strong&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;, making it convenient for storage and use in home and professional aquariums alike.&lt;/span&gt;&lt;/p&gt;', 1, '2025-06-30 17:02:54'),
(30, 4, 6, 'Betta Tank 12x8x10', '&lt;p&gt;A tank of this size offers only limited swimming space and makes it difficult to maintain stable water temperature and cleanliness. For a healthier and more active Betta, a tank that measures at least &lt;strong data-start=&quot;568&quot; data-end=&quot;619&quot;&gt;16 inches long x 8 inches wide x 10 inches high&lt;/strong&gt; (around &lt;strong data-start=&quot;628&quot; data-end=&quot;641&quot;&gt;5 gallons&lt;/strong&gt;) is highly recommended.&lt;/p&gt;', 1, '2025-06-30 17:05:55'),
(31, 4, 6, 'Seachem Flourish Trace 250ml', '&lt;p&gt;Seachem Flourish Trace is a comprehensive supplement designed to provide a broad range of essential trace elements for thriving planted aquariums. Unlike a complete fertilizer, Flourish Trace specifically replenishes the trace elements that are typically depleted by plant uptake, oxidation, and precipitation. These elements, such as iron, manganese, zinc, copper, and others, are crucial for various enzymatic reactions, chlorophyll synthesis, and overall healthy plant growth. It&#039;s formulated to be safe for invertebrates and is free of nitrates and phosphates, preventing unwanted algae growth.&amp;nbsp;&lt;/p&gt;', 1, '2025-06-30 17:17:25'),
(32, 5, 8, 'Jesada Ranchu goldfish', '&lt;p&gt;Jesada Ranchu goldfish from Thailand&lt;/p&gt;', 1, '2025-07-01 23:10:42'),
(33, 5, 8, 'Trico Panda Short Body Short Tail Oranda Goldfish', '&lt;p data-start=&quot;42&quot; data-end=&quot;79&quot;&gt;&lt;span class=&quot;relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out&quot;&gt;The &lt;strong data-start=&quot;4&quot; data-end=&quot;48&quot;&gt;Trico Panda Short Body Short Tail Oranda&lt;/strong&gt; (a tricolor panda-patterned oranda) is a compact and striking variety of fancy goldfish. Ideal for aquarists who favor dwarf breeds.&lt;/span&gt;&lt;/p&gt;', 1, '2025-07-01 23:13:57'),
(34, 5, 8, 'Philippine Balloon Molly', '&lt;p&gt;&lt;strong data-start=&quot;0&quot; data-end=&quot;19&quot; data-is-only-node=&quot;&quot;&gt;Balloon Mollies&lt;/strong&gt; are small, peaceful freshwater fish known for their rounded, balloon-like bellies and vibrant colors. Popular in community tanks, they come in various shades like black, gold, marble, and platinum. Easy to care for and active swimmers, they thrive in warm, well-filtered aquariums and do best in groups. Ideal for both beginners and experienced aquarists.&lt;/p&gt;', 1, '2025-07-01 23:17:54'),
(35, 5, 8, ' long-tail Calico Oranda', '&lt;p&gt;The &lt;strong data-start=&quot;140&quot; data-end=&quot;167&quot;&gt;Long-tail Calico Oranda&lt;/strong&gt; is a striking variety of fancy goldfish known for its &lt;strong data-start=&quot;222&quot; data-end=&quot;247&quot;&gt;flowing, elegant tail&lt;/strong&gt; and &lt;strong data-start=&quot;252&quot; data-end=&quot;281&quot;&gt;vibrant calico coloration&lt;/strong&gt;. Its body is rounded and compact, topped with the signature &lt;strong data-start=&quot;342&quot; data-end=&quot;349&quot;&gt;wen&lt;/strong&gt; (a fleshy hood) on its head. The calico pattern displays a beautiful mix of &lt;strong data-start=&quot;426&quot; data-end=&quot;465&quot;&gt;white, black, red, orange, and blue&lt;/strong&gt; in random, patchy distributions, giving it a unique, marbled look.&lt;/p&gt;', 1, '2025-07-01 23:22:29'),
(36, 5, 8, 'Butterfly Koi', '&lt;p data-start=&quot;40&quot; data-end=&quot;396&quot;&gt;&lt;strong data-start=&quot;40&quot; data-end=&quot;57&quot;&gt;Butterfly Koi&lt;/strong&gt;, also known as &lt;strong data-start=&quot;73&quot; data-end=&quot;88&quot;&gt;Longfin Koi&lt;/strong&gt; or &lt;strong data-start=&quot;92&quot; data-end=&quot;107&quot;&gt;Dragon Carp&lt;/strong&gt;, are a beautiful variety of koi fish prized for their &lt;strong data-start=&quot;162&quot; data-end=&quot;193&quot;&gt;long, flowing fins and tail&lt;/strong&gt; that resemble a butterfly&rsquo;s wings when they swim. These koi are a hybrid between traditional Japanese koi and Indonesian longfin river carp, bred to combine the koi&#039;s colors with elegant fin extensions.&lt;/p&gt;', 1, '2025-07-01 23:44:23'),
(37, 5, 8, 'Glo Tetra', '&lt;p&gt;&lt;strong data-start=&quot;36&quot; data-end=&quot;49&quot;&gt;Glo Tetra&lt;/strong&gt; is a genetically enhanced version of the &lt;strong data-start=&quot;91&quot; data-end=&quot;137&quot;&gt;Black Skirt Tetra (Gymnocorymbus ternetzi)&lt;/strong&gt; that glows in vivid neon-like colors. These tetras are part of the &lt;strong data-start=&quot;205&quot; data-end=&quot;222&quot;&gt;GloFish&reg; line&lt;/strong&gt;, developed to fluoresce under blue LED or blacklight, making them &lt;strong data-start=&quot;289&quot; data-end=&quot;332&quot;&gt;popular in colorful or themed aquariums&lt;/strong&gt;.&lt;/p&gt;', 1, '2025-07-01 23:46:55'),
(38, 4, 5, 'Cat Litter', '&lt;p&gt;&lt;strong data-start=&quot;153&quot; data-end=&quot;167&quot;&gt;Cat litter&lt;/strong&gt; is a material placed in a litter box to absorb urine and cover feces, helping cats relieve themselves indoors while keeping the space clean and odor-free.&lt;/p&gt;', 1, '2025-07-01 23:53:26'),
(39, 4, 5, 'Cute Cat Cage', '&lt;p&gt;Cute Cat Cage with cute design&lt;/p&gt;', 1, '2025-07-01 23:56:38'),
(40, 4, 5, ' Cute Cat-Shaped Pet Bowl', '&lt;p&gt;&lt;span data-start=&quot;199&quot; data-end=&quot;227&quot;&gt;Cute Cat-Shaped Pet Bowl&lt;/span&gt;&lt;/p&gt;', 1, '2025-07-02 00:00:32'),
(41, 4, 4, 'Cute Dog Bowl', '&lt;p&gt;Cute Dog Bowl&lt;/p&gt;', 1, '2025-07-02 00:02:43'),
(42, 4, 4, 'Papi Cologne Spray for Pets 100ml', '&lt;p&gt;&lt;strong data-start=&quot;207&quot; data-end=&quot;229&quot;&gt;Papi Cologne Spray&lt;/strong&gt; is a gentle, pet-safe cologne formulated for &lt;strong data-start=&quot;275&quot; data-end=&quot;292&quot;&gt;dogs and cats&lt;/strong&gt;. It leaves your furry friend smelling fresh and clean while also helping to &lt;strong data-start=&quot;369&quot; data-end=&quot;387&quot;&gt;calm and relax&lt;/strong&gt; them. With its &lt;strong data-start=&quot;403&quot; data-end=&quot;433&quot;&gt;mild, non-irritating scent&lt;/strong&gt; and &lt;strong data-start=&quot;438&quot; data-end=&quot;466&quot;&gt;easy-to-use spray bottle&lt;/strong&gt;, it&#039;s perfect for everyday grooming between baths.&lt;/p&gt;', 1, '2025-07-02 00:07:58'),
(43, 4, 4, 'Abe Pet Retractable Leash – 3M (Up to 15kg)', '&lt;p&gt;The &lt;strong data-start=&quot;165&quot; data-end=&quot;194&quot;&gt;Abe Pet Retractable Leash&lt;/strong&gt; is a compact, durable leash designed for small to medium-sized pets. With a length of &lt;strong data-start=&quot;281&quot; data-end=&quot;293&quot;&gt;3 meters&lt;/strong&gt;, it allows your dog or cat to explore freely while still giving you full control. It features a &lt;strong data-start=&quot;390&quot; data-end=&quot;420&quot;&gt;comfortable anti-slip grip&lt;/strong&gt;, &lt;strong data-start=&quot;422&quot; data-end=&quot;453&quot;&gt;smooth retracting mechanism&lt;/strong&gt;, and a locking button for safety during walks.&lt;/p&gt;', 1, '2025-07-02 00:09:37'),
(44, 4, 4, 'Pet Lover Shampoos (Bubblegum, Watermelon, Lavender with Madre de Cacao Extract) 1gallon', '&lt;div _ngcontent-ng-c57678444=&quot;&quot; class=&quot;markdown markdown-main-panel stronger enable-updated-hr-color&quot; id=&quot;model-response-message-contentr_5845f53d1c8b3f70&quot; dir=&quot;ltr&quot; style=&quot;--animation-duration: 600ms; --fade-animation-function: linear; animation: 0s ease 0s 1 normal none running none; appearance: none; background: none 0% 0% / auto repeat scroll padding-box border-box rgba(0, 0, 0, 0); border: 0px none rgb(27, 28, 29); inset: auto; clear: none; clip: auto; columns: auto; contain: none; container: none; content: normal; cursor: auto; cx: 0px; cy: 0px; d: none; direction: ltr; fill: rgb(0, 0, 0); filter: none; flex: 0 1 auto; float: none; gap: normal; hyphens: manual; interactivity: auto; isolation: auto; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; marker: none; mask: none; offset: normal; opacity: 1; order: 0; outline: rgb(27, 28, 29) none 0px; overlay: none; padding: 0px; page: auto; perspective: none; position: static; quotes: auto; r: 0px; resize: none; rotate: none; rx: auto; ry: auto; scale: none; speak: normal; stroke: none; transform: none; transition: all; translate: none; visibility: visible; x: 0px; y: 0px; zoom: 1; margin-top: 0px !important; font-family: &amp;quot;Google Sans Text&amp;quot;, sans-serif !important; line-height: 1.15 !important;&quot;&gt;&lt;p style=&quot;animation: 0s ease 0s 1 normal none running none; appearance: none; background: none 0% 0% / auto repeat scroll padding-box border-box rgba(0, 0, 0, 0); border: 0px none rgb(27, 28, 29); inset: auto; clear: none; clip: auto; columns: auto; contain: none; container: none; content: normal; cursor: auto; cx: 0px; cy: 0px; d: none; direction: ltr; fill: rgb(0, 0, 0); filter: none; flex: 0 1 auto; float: none; gap: normal; hyphens: manual; interactivity: auto; isolation: auto; margin-right: 0px; margin-bottom: 16px; margin-left: 0px; marker: none; mask: none; offset: normal; opacity: 1; order: 0; outline: rgb(27, 28, 29) none 0px; overlay: none; padding: 0px; page: auto; perspective: none; position: static; quotes: auto; r: 0px; resize: none; rotate: none; rx: auto; ry: auto; scale: none; speak: normal; stroke: none; transform: none; transition: all; translate: none; visibility: visible; x: 0px; y: 0px; zoom: 1; line-height: 1.15 !important;&quot;&gt;For pet owners in Davao City, the &quot;Pet Lover&quot; brand offers a range of shampoos in gallon sizes, including delightful scents like Bubblegum, Watermelon, and Lavender with Madre de Cacao Extract, alongside the practical Soft Gentle Silicone Bristles Pet Paw Cleaner. The Bubblegum shampoo provides a gentle yet effective clean, leaving coats soft and shiny with a sweet aroma, often formulated to be free from harsh chemicals and pH balanced. The Watermelon variant frequently acts as a 2-in-1 shampoo and conditioner, cleansing, moisturizing, and detangling for easier grooming while imparting a fresh, fruity scent. The Lavender with Madre de Cacao Extract option harnesses natural antiparasitic properties to help repel fleas, ticks, and mites, while also addressing skin irritations and promoting fur regrowth, all with the calming essence of lavender. While specific &quot;Pet Lover&quot; brand gallon shampoo prices can vary, similar products in the Philippines typically range from &lt;b style=&quot;animation: 0s ease 0s 1 normal none running none; appearance: none; background: none 0% 0% / auto repeat scroll padding-box border-box rgba(0, 0, 0, 0); border: 0px none rgb(27, 28, 29); inset: auto; clear: none; clip: auto; columns: auto; contain: none; container: none; content: normal; cursor: auto; cx: 0px; cy: 0px; d: none; direction: ltr; display: inline; fill: rgb(0, 0, 0); filter: none; flex: 0 1 auto; float: none; gap: normal; hyphens: manual; interactivity: auto; isolation: auto; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; marker: none; mask: none; offset: normal; opacity: 1; order: 0; outline: rgb(27, 28, 29) none 0px; overlay: none; padding: 0px; page: auto; perspective: none; position: static; quotes: auto; r: 0px; resize: none; rotate: none; rx: auto; ry: auto; scale: none; speak: normal; stroke: none; transform: none; transition: all; translate: none; visibility: visible; x: 0px; y: 0px; zoom: 1; margin-top: 0px !important; line-height: 1.15 !important;&quot;&gt;₱100 to ₱300&lt;/b&gt; for a gallon, and the Silicone Bristles Pet Paw Cleaner generally falls between &lt;b style=&quot;animation: 0s ease 0s 1 normal none running none; appearance: none; background: none 0% 0% / auto repeat scroll padding-box border-box rgba(0, 0, 0, 0); border: 0px none rgb(27, 28, 29); inset: auto; clear: none; clip: auto; columns: auto; contain: none; container: none; content: normal; cursor: auto; cx: 0px; cy: 0px; d: none; direction: ltr; display: inline; fill: rgb(0, 0, 0); filter: none; flex: 0 1 auto; float: none; gap: normal; hyphens: manual; interactivity: auto; isolation: auto; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; marker: none; mask: none; offset: normal; opacity: 1; order: 0; outline: rgb(27, 28, 29) none 0px; overlay: none; padding: 0px; page: auto; perspective: none; position: static; quotes: auto; r: 0px; resize: none; rotate: none; rx: auto; ry: auto; scale: none; speak: normal; stroke: none; transform: none; transition: all; translate: none; visibility: visible; x: 0px; y: 0px; zoom: 1; margin-top: 0px !important; line-height: 1.15 !important;&quot;&gt;₱300 to ₱3,500&lt;/b&gt;, depending on features and brand.&lt;/p&gt;&lt;/div&gt;', 1, '2025-07-02 00:15:40'),
(45, 4, 4, 'Soft Gentle Silicone Bristles Pet Paw Cleaner', '&lt;p&gt;This is a portable paw cleaner designed to quickly and easily remove mud, dirt, and debris from your dog&#039;s paws after outdoor activities. It typically features soft silicone bristles inside a cup-like container. You add a little water (and optionally pet soap), insert the paw, and rotate it to clean. It&#039;s designed to be gentle on paws and helps keep your home clean.&lt;/p&gt;', 1, '2025-07-02 00:17:01'),
(46, 4, 4, 'Nutrichunks Multi-V Yum (Multivitamins + Minerals + Amino Acid Oral Syrup) 120ml', '&lt;p&gt;This is an oral syrup multivitamin, mineral, and amino acid supplement specifically formulated for veterinary use. It&#039;s designed to support the overall health, growth, and vitality of pets, helping to prevent nutritional deficiencies and boost their immune system. It&#039;s manufactured by Progressive Laboratories for San Miguel Foods, Inc.&lt;/p&gt;', 1, '2025-07-02 00:18:57'),
(47, 4, 4, 'Livotine Syrup (Amino Acids + Vitamins + Vitex Negundo + Liver Extract) 120ml', '&lt;p&gt;This is an oral syrup multivitamin, mineral, and amino acid supplement specifically formulated for veterinary use. It&#039;s designed to support the overall health, growth, and vitality of pets, helping to prevent nutritional deficiencies and boost their immune system. It&#039;s manufactured by Progressive Laboratories for San Miguel Foods, Inc.&lt;/p&gt;', 1, '2025-07-02 00:20:23'),
(48, 4, 4, 'Nacalvit-C Syrup (Ascorbic Acid - Sweet Orange Flavor) 120ml', '&lt;p&gt;Nacalvit-C is a vitamin C (Ascorbic Acid) syrup specifically for veterinary use, flavored with sweet orange to make it palatable for pets. Vitamin C is an essential antioxidant that supports the immune system, promotes collagen formation for healthy skin and joints, and aids in overall pet well-being. It is manufactured by Vetmate Farma Corp.&lt;/p&gt;', 1, '2025-07-02 00:21:28'),
(49, 4, 4, 'Iron + B-Complex Hematinic Syrup 120ml', '&lt;p&gt;This is a hematinic syrup containing Iron and B-Complex vitamins, specifically formulated for veterinary use. It&#039;s primarily used to prevent and treat anemia in pets, support red blood cell formation, and boost energy levels. B-vitamins also play crucial roles in metabolism and nerve function. This product is from &quot;Pets Aid.&quot;&lt;/p&gt;', 1, '2025-07-02 00:22:38'),
(50, 4, 4, 'Olive Essence Natural Olive Oil Essence Nourishing Hair Skin / Pet Shampoo (Anti-dandruff) 450g', '&lt;p&gt;This is a pet shampoo formulated with natural olive oil essence, designed for both dogs and cats. It targets nourishing the hair and skin, with an emphasis on being an anti-dandruff shampoo. Olive oil is known for its moisturizing properties, which can help soothe dry, flaky skin and promote a healthy, shiny coat.&lt;/p&gt;', 1, '2025-07-02 00:27:33'),
(51, 4, 4, 'Venoma Herbal Spray - All Natural (Anti-Parasitic, Anti-Fungal, Hypoallergenic, Insect Repellent) 120ml', '&lt;p&gt;Venoma is an all-natural herbal spray for pets, boasting a multi-functional formula that is anti-parasitic, anti-fungal, hypoallergenic, and an insect repellent. It is designed to be superior against mites, mange, ticks, fleas, and stubborn parasites, all while having a pet-friendly smell. This spray offers a natural alternative for pest control and skin health for pets.&lt;/p&gt;', 1, '2025-07-02 00:28:32'),
(52, 4, 4, 'Feeding Kit', '&lt;p&gt;This &quot;Feeding Kit&quot; is an ideal aid for supplemental feeding of dogs, cats, and other animals. It can also be used for feeding young animals that have not yet begun to eat on their own, or for administering liquid food, water, or medications. It&#039;s an easy-to-use aid, made of tough polyethylene, and is washable and reusable, containing 2 teats that may be sterilized.&lt;/p&gt;', 1, '2025-07-02 00:29:54'),
(53, 1, 1, 'NutriChunks AlphaPro Adult Dog Food (Beef Flavor, 5 kg)', '&lt;p&gt;NutriChunks AlphaPro Adult is a dry dog food formulated for adult dogs of all breeds. The &quot;Beef Flavor&quot; offers a palatable option for dogs. Key features often include &quot;Regular Bites&quot; for easy consumption, Omega 3 &amp;amp; 6 for healthy skin and coat, Natural Prebiotic Fiber for digestive health, Yucca Extract to help reduce stool odor, and Palatability Enhancers to ensure dogs enjoy their meal. It&#039;s a 100% complete and balanced nutrition source.&lt;/p&gt;', 1, '2025-07-02 00:37:44'),
(54, 1, 7, 'Koiking Growth (454g)', '&lt;p&gt;This formula is specifically designed to promote rapid and healthy growth in Koi fish. It typically contains a higher protein content to support muscle development and overall size increase. Ingredients often include fish meal, spirulina, and various vitamins and minerals to ensure a balanced diet that optimizes growth without compromising water quality. This size is ideal for hobbyists or those with a smaller number of Koi.&lt;/p&gt;', 1, '2025-07-02 00:42:27'),
(55, 1, 7, 'Koiking Balanced (1kg)', '&lt;p&gt;Koiking Balanced food provides a complete and well-rounded diet for daily feeding of Koi fish. This formulation ensures that your Koi receive all the necessary nutrients, including proteins, fats, carbohydrates, vitamins, and minerals, for their overall health, immune system support, and general well-being. It&#039;s designed for maintenance and is suitable for all Koi sizes, supporting their long-term health without over-emphasizing specific traits like growth or color. The 1kg size is a good option for regular use by most Koi keepers.&lt;/p&gt;', 1, '2025-07-02 00:47:27'),
(56, 1, 7, 'Koiking Color Enhancing (454g)', '&lt;p&gt;Koiking Color Enhancing food is specially formulated to intensify the vibrant colors of Koi fish. It contains natural color enhancers such as spirulina, astaxanthin, and other carotenoids that bring out the reds, whites, and blacks in Koi. While enhancing color, it also provides balanced nutrition to maintain the overall health and vigor of your fish. This 454g size is convenient for regular feeding without storing large quantities.&lt;/p&gt;', 1, '2025-07-02 00:51:37'),
(57, 1, 3, 'Whiskas Dry Cat Food (1.2kg bag)', '&lt;p&gt;Whiskas is a widely recognized global brand that offers a comprehensive range of wet and dry cat food formulated for various life stages (kitten, adult, senior) and common needs. They are known for their palatable flavors (e.g., tuna, ocean fish, chicken) and come in different textures like gravy, jelly, and crunchy kibble. Whiskas focuses on providing complete and balanced nutrition.&lt;/p&gt;', 1, '2025-07-02 00:56:25'),
(58, 1, 3, 'SmartHeart Dry Cat Food (1.2kg bag)', '&lt;p&gt;SmartHeart offers a more affordable option for cat owners while still aiming to provide essential nutrients. They have various dry cat food formulations with common flavors like chicken and tuna, seafood, and salmon. It&#039;s a popular choice for those looking for budget-friendly yet reputable cat food.&lt;/p&gt;', 1, '2025-07-02 01:02:25'),
(59, 1, 1, 'knibbles bit', '&lt;p&gt;sample test&lt;/p&gt;', 1, '2025-07-27 10:06:18'),
(60, 1, 1, 'test 100', '&lt;p&gt;test&lt;/p&gt;', 1, '2025-07-27 18:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 1, 1100, '2021-06-22 13:48:54'),
(2, 2, 750, '2021-06-22 15:26:07'),
(4, 4, 2000, '2025-03-17 17:00:34'),
(5, 5, 1200, '2025-06-03 11:06:34'),
(6, 6, 300, '2025-06-03 11:43:13'),
(7, 7, 1100, '2025-06-04 11:45:32'),
(8, 12, 900, '2025-06-23 20:03:30'),
(9, 13, 200, '2025-06-30 01:09:36'),
(10, 14, 6960, '2025-06-30 01:30:07'),
(11, 15, 640, '2025-06-30 01:30:39'),
(12, 16, 100, '2025-06-30 01:33:31'),
(13, 17, 8100, '2025-06-30 01:53:58'),
(14, 18, 1900, '2025-06-30 09:53:08'),
(15, 19, 500, '2025-06-30 20:25:44'),
(16, 20, 1200, '2025-07-02 12:19:32'),
(17, 21, 1250, '2025-07-02 12:52:00'),
(18, 22, 550, '2025-07-02 12:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(30) NOT NULL,
  `size` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`) VALUES
(1, 'xs'),
(2, 's'),
(3, 'm'),
(4, 'l'),
(5, 'xl'),
(6, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Dog Food', '&lt;p&gt;Sample only&lt;/p&gt;', 1, '2021-06-21 10:58:32'),
(3, 1, 'Cat Food', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:34:59'),
(4, 4, 'Dog Needs', '&lt;p&gt;Sample&amp;nbsp;&lt;/p&gt;', 1, '2021-06-21 16:35:26'),
(5, 4, 'Cat Needs', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:35:36'),
(6, 4, 'Fish Needs', '', 1, '2025-03-17 16:49:25'),
(7, 1, 'Fish Food', '', 1, '2025-03-17 16:49:37'),
(8, 5, 'Fish', '&lt;p&gt;Fish&amp;nbsp;&lt;/p&gt;', 1, '2025-03-17 17:10:20'),
(9, 6, 'Dog Items', '&lt;p&gt;Dog Items&lt;/p&gt;', 1, '2025-06-29 00:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(16, 'name', 'OYEEEEE'),
(17, 'short_name', 'Oyeee&apos;s Pet Shop'),
(18, 'logo', 'uploads/1751381880_1749041520_logo2.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(7, 'admin', '1', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1750941960_IMG_4878.JPG', NULL, 0, '2025-06-25 12:05:24', '2025-06-26 20:46:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_otps`
--
ALTER TABLE `email_otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_type_index` (`email`,`type`),
  ADD KEY `expiry_index` (`expiry`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `email_otps`
--
ALTER TABLE `email_otps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
