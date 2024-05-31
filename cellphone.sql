-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 31, 2024 at 03:07 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cellphone`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `img` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `img`) VALUES
(1, 'phone', 'Tặng bảo hành Premium', 'image-1711800307713.webp'),
(2, 'laptop', '', ''),
(7, 'Phụ kiện', 'Danh mục cho phụ kiện', 'image-1711809137226.jpg'),
(9, 'phụ kiện 1', 'phụ kiện', 'image-1712565159705.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories_brand`
--

CREATE TABLE `categories_brand` (
  `id` int NOT NULL,
  `categoryId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `categories_brand`
--

INSERT INTO `categories_brand` (`id`, `categoryId`, `name`, `img`, `description`) VALUES
(1, 1, 'iphone', 'iphone.webp', 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng'),
(2, 1, 'samsung', 'image-1711810092973.webp', 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng 11'),
(3, 1, 'xiaomi', 'image-1712304994734.jpg', 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng'),
(4, 1, 'oppo', 'image-1712313149802.webp', 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng'),
(5, 1, 'realme', 'realme.webp', 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng'),
(6, 1, 'asus', 'asus.webp', 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng'),
(7, 1, 'vivo', 'visvo_.webp', 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `id` int NOT NULL,
  `idOrder` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` int NOT NULL,
  `total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `idUserBuy` int NOT NULL,
  `receiverName` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `receiverPhone` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `receiverAddress` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `total` int NOT NULL,
  `receiverEmail` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `idUserBuy`, `receiverName`, `receiverPhone`, `receiverAddress`, `status`, `createdAt`, `total`, `receiverEmail`) VALUES
(661759, 2, 'Khắc Duy', '0348378112', 'Bến Tre', 0, '2024-04-06 15:35:46', 77970000, 'catchy@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `categories` int DEFAULT NULL,
  `brandId` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `priceOld` int NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `priceNew` int DEFAULT NULL,
  `producthot` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `categories`, `brandId`, `quantity`, `img`, `priceOld`, `description`, `priceNew`, `producthot`) VALUES
(1, 'iPhone 15', 1, 1, 100, 'image-1711883578147.webp', 32490000, 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng', 12000000, NULL),
(2, 'iPhone 15 128GB | Chính hãng VN/A', 1, 1, 10, 'iphone-15-plus_1__1.webp', 22990000, 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng', 25990000, NULL),
(3, 'iPhone 14 Pro Max 128GB | Chính hãng VN/A', 1, 1, 10, 'iphone-14-pro_2__5.webp', 29990000, 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng', 25990000, 1),
(4, 'iPhone 13 128GB | Chính hãng VN/A', 1, 1, 10, 'iphone-13_2_.webp', 18990000, 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng', 25990000, NULL),
(5, 'iPhone 15 Pro 128GB | Chính hãng VN/A', 1, 1, 10, 'iphone-15-pro-max_4.webp', 28990000, 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng', 25990000, 1),
(6, 'iPhone 13 Pro Max 128GB | Chính hãng VN/A', 1, 1, 10, 'iphone-13-pro-max.webp', 28990000, 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng', 22990000, NULL),
(7, 'iPhone 14 128GB | Chính hãng VN/A', 1, 1, 10, 'iphone-14_1.webp', 22990000, 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng', 18590000, 1),
(8, 'iPhone 11 64GB | Chính hãng VN/A', 1, 1, 10, 'iphone-11.webp', 11990000, 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng', 9990000, NULL),
(9, 'iPhone 14 Plus 128GB | Chính hãng VN/A', 1, 1, 10, 'iphone-14-plus_1_.webp', 24990000, 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng', 20990000, NULL),
(10, 'iPhone 12 128GB | Chính hãng VN/A', 1, 1, 10, 'iphone-12-128gb_2.webp', 17990000, 'Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng', 14290000, NULL),
(11, 'Samsung Galaxy S23 Ultra 256GB', 1, 1, 10, 'samsung-galaxy-s23-ultra.webp', 31990000, 'Trả góp 0% lãi, 0 trả trước, 0 phụ phí qua Samsung Finance+', 23190000, NULL),
(12, 'Samsung Galaxy Z Flip5 512GB', 1, 2, 10, 'samsung-galaxy-z-flip-5-256gb_1_5.webp', 29990000, 'Trả góp 0% lãi, 0 trả trước, 0 phụ phí qua Samsung Finance+', 20590000, 1),
(13, 'Samsung Galaxy Z Fold5 12GB 256GB', 1, 2, 10, 'samsung-galaxy-z-fold-5-256gb_1.webp', 40990000, 'Trả góp 0% lãi, 0 trả trước, 0 phụ phí qua Samsung Finance+', 33690000, NULL),
(14, 'Samsung Galaxy S22 Ultra (12GB - 256GB) - Chỉ có tại CellphoneS', 1, 2, 10, 'samsung-galaxy-s22-ultra-12gb-256gb.webp', 33990000, 'Trả góp 0% lãi, 0 trả trước, 0 phụ phí qua Samsung Finance+', 17550000, 1),
(15, 'Samsung Galaxy M14 5G 4GB 128GB', 1, 2, 10, 'samsung-galaxy-m14.webp', 5290000, 'Trả góp 0% lãi, 0 trả trước, 0 phụ phí qua Samsung Finance+', 3650000, NULL),
(16, 'Samsung Galaxy A05S 4GB 128GB', 1, 2, 10, 'samsung-galaxy-a05sl.webp', 3990000, 'Trả góp 0% lãi, 0 trả trước, 0 phụ phí qua Samsung Finance+', 3690000, NULL),
(17, 'Samsung Galaxy S21 FE 8GB 128GB', 1, 2, 10, 'sm-g990_s21fe_backfront_lv.webp', 16990000, 'Trả góp 0% lãi, 0 trả trước, 0 phụ phí qua Samsung Finance+', 9590000, NULL),
(18, 'Samsung Galaxy A23 5G', 1, 2, 10, '15_20.webp', 5990000, 'Trả góp 0% lãi, 0 trả trước, 0 phụ phí qua Samsung Finance+', 4650000, NULL),
(19, 'Samsung Galaxy A25 5G 6GB 128GB', 1, 2, 10, 'sm-g990_s21fe_backfront_lv.webp', 8490000, 'Trả góp 0% lãi, 0 trả trước, 0 phụ phí qua Samsung Finance+', 7090000, NULL),
(20, 'Samsung Galaxy Z Flip4 256GB', 1, 2, 10, 'samsung-galaxy-z-flip-4_1.webp', 44990000, 'Trả góp 0% lãi, 0 trả trước, 0 phụ phí qua Samsung Finance+', 35990000, NULL),
(21, 'Samsung Galaxy S20 FE 256GB', 1, 3, 10, 'samsung-galaxy-20-fe_4_.webp', 12490000, 'Trả góp 0% lãi, 0 trả trước, 0 phụ phí qua Samsung Finance+', 7200000, NULL),
(22, 'Xiaomi Redmi Note 13 6GB 128GB', 1, 3, 10, 'xiaomi-redmi-note-13_1__1_1.webp', 4890000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 4590000, NULL),
(23, 'Xiaomi Redmi Note 13 Pro Plus 5G 8GB 256GB', 1, 3, 10, 'xiaomi-redmi-note-13_1__1_1.webp', 10990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 10690000, NULL),
(25, 'Xiaomi 13T Pro 5G (12GB - 512GB) - Chỉ có tại CellphoneS', 1, 3, 10, 'xiaomi-13-pro-thumb-xanh-la9.webp', 16990000, 'Tặng bảo hành Premium và 1 km khác', 15490000, NULL),
(26, 'Xiaomi Redmi Note 12 Pro 5G', 1, 3, 10, 'xiaomi-redmi-note-12-pro-5g.webp', 9490000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 7990000, 1),
(27, 'Xiaomi 13T 12GB 256GB', 1, 3, 10, 'xiaomi-13t_1__1_2.webp', 12990000, 'Tặng bảo hành Premium', 11990000, NULL),
(28, 'Xiaomi Redmi 13C 6GB 128GB', 1, 3, 10, 'xiaomi-redmi-13c_21__1.webp', 3490000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 3290000, NULL),
(29, 'Xiaomi 13 8GB 256GB', 1, 3, 10, 'xiaomi-13.webp', 22990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 18090000, NULL),
(30, 'Xiaomi 13 Lite', 1, 3, 10, 'xiaomi-13-lite.webp', 11490000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 8990000, NULL),
(31, 'Xiaomi POCO X5 5G 8GB 256GB', 1, 3, 10, 'poco-x5-256gb_1.webp', 7490000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 6050000, NULL),
(32, 'OPPO Reno10 5G 8GB 256GB1111', 1, 4, 10, 'reno10_5g_-_combo_product_-_blue.webp', 10990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 9990000, NULL),
(33, 'OPPO Reno8 T 4G 256GB', 1, 4, 10, 'oppo-reno-8t-4g-256gb.webp', 8490000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 6690000, NULL),
(34, 'OPPO Find N2 Flip', 1, 4, 10, '', 19990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 16990000, NULL),
(35, 'OPPO A77s', 1, 4, 10, 'oppo-a55_1_.webp', 6290000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 5190000, NULL),
(36, 'OPPO A17K', 1, 4, 10, 'oppo-a17k.webp', 3290000, 'Thu cũ điện thoại 2G ... giảm thêm 200K', 2990000, NULL),
(37, 'OPPO Reno7 5G (8GB 256GB)', 1, 4, 10, 'oppo-reno-7_1.webp', 12990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 7590000, NULL),
(38, 'Điện thoại OPPO A55 (4GB - 64GB)', 1, 4, 10, 'oppo-a55_1_1.webp', 3690000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 3490000, NULL),
(39, 'OPPO Reno8 Z', 1, 4, 10, 'photo_2022-08-05_09-40-15.webp', 10490000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 7890000, NULL),
(40, 'OPPO Reno8 Z', 1, 4, 10, 'photo_2022-08-05_09-40-15.webp', 10490000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 7890000, NULL),
(41, 'realme 11', 1, 5, 10, 'realme-11.webp', 7390000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 6490000, NULL),
(42, 'realme C55 (6GB - 128GB)', 1, 5, 10, 'rgrgrtyt6.webp', 4990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 4190000, NULL),
(43, 'realme 11 Pro (8GB - 256GB)', 1, 5, 10, 'realme-11-pro.webp', 11990000, 'Quyền lợi bảo hành Vip 12 tháng 1 đổi 1 tại CellphoneS', 10990000, NULL),
(44, 'realme C51 4GB 128GB', 1, 5, 10, 'realme-11-pro.webp', 3490000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 3290000, NULL),
(45, 'realme 10 8GB 256GB', 1, 5, 10, 'white-7e6a0f537b', 7190000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 4990000, NULL),
(46, 'realme 9 Pro', 1, 5, 10, 'real_me_pro_002.webp', 7990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 4590000, NULL),
(47, 'realme C30s 4GB 64GB', 1, 5, 10, 'realme-c30s-den-glr--009_3.webp', 3190000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 2590000, NULL),
(48, 'realme C30s 2GB 32GB', 1, 5, 10, 'realme-c30s-den-glr--009.webp', 2490000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 1990000, NULL),
(49, 'realme C35 4GB 64GB', 1, 5, 10, 'frame3935-640x640.webp', 4290000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 2990000, NULL),
(50, 'realme C51 6GB 256GB', 1, 5, 10, 'realme-c51_2_1.webp', 7190000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 4990000, NULL),
(51, 'ASUS ROG Phone 7 16GB 512GB', 1, 6, 10, 'asus-rog-phone-7.webp', 24990000, 'Tặng miếng dán màn hình ROG Phone 6/7', 20290000, NULL),
(52, 'ASUS ROG Phone 6 12GB 256GB', 1, 6, 10, 'asus-rog-phone-6-12gb-256gb_1_1.webp', 18990000, 'Tặng miếng dán màn hình ROG Phone 6/7', 13990000, NULL),
(53, 'ASUS ROG Phone 6 16GB 512GB - Chỉ có tại CellphoneS', 1, 6, 10, 'rog6-doc-qq.webp', 18990000, 'Tặng miếng dán màn hình ROG Phone 6/7', 13990000, NULL),
(54, 'ASUS ROG Phone 7 Ultimate 16GB 512GB', 1, 6, 10, '1_365-doc-quyuen.webp', 29990000, 'Tặng miếng dán màn hình ROG Phone 6/7', 26190000, NULL),
(55, 'ASUS ROG Phone 5 chính hãng', 1, 6, 10, '1_365-doc-quyuen.webp', 22990000, 'Tặng miếng dán màn hình ROG Phone 6/7', 18990000, NULL),
(56, 'ASUS ROG Phone 5S 16GB 256GB', 1, 6, 10, 'asus-rog-phone-5_0002_gsmarena_001_3_1.webp', 20990000, 'Tặng miếng dán màn hình ROG Phone 6/7', 17690000, 1),
(57, 'ASUS ROG Phone 6 Diablo 16GB 512GB', 1, 6, 10, 'asus-rog-phone-6-diablo.webp', 27990000, 'Tặng miếng dán màn hình ROG Phone 6/7', 17990000, NULL),
(58, 'vivo V29E 8GB 256GB', 1, 7, 10, 'vivo-v29e_3__1_2.webp', 8990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 8690000, NULL),
(59, 'vivo V25 Pro 8GB 128GB', 1, 7, 10, 'vivo-v25-pro.webp', 13990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 7990000, NULL),
(60, 'Vivo Y36 8GB 128GB', 1, 7, 10, 'vivo-y36.webp', 5990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 5190000, NULL),
(61, 'Vivo Y36 8GB 128GB', 1, 7, 10, 'vivo-y36.webp', 5990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 5190000, NULL),
(62, 'vivo Y16 4GB 128GB', 1, 7, 10, 'vivo-y16.webp', 4490000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 3790000, NULL),
(63, 'vivo Y17s 4GB 128GB', 1, 7, 10, 'vivo-y17s_2_3.webp', 3990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 3790000, NULL),
(64, 'Vivo V27e 8GB 256GB', 1, 7, 10, 'vivo-v27e.webp', 8990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 7990000, NULL),
(65, 'vivo V25 5G 8GB 128GB', 1, 7, 10, 'vivo-v25.webp', 10490000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 6990000, NULL),
(66, 'vivo Y22S 8GB 128GB', 1, 7, 10, 'vivo-y22s.webp', 5990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 4790000, NULL),
(67, 'Dell XPS 13 9310', 2, 2, 10, 'dell-xps-13-9310.webp', 23990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 21990000, NULL),
(68, 'HP Spectre x360 13t', 2, 3, 10, 'hp-spectre-x360-13t.webp', 22990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 20990000, NULL),
(69, 'Lenovo ThinkPad X1 Carbon Gen 9', 2, 4, 10, 'lenovo-thinkpad-x1-carbon-gen-9.webp', 32990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 29990000, NULL),
(70, 'Dell XPS 13 (9310)', 2, 4, 10, 'dell-xps-13-9310.webp', 35990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 32990000, NULL),
(71, 'Dell Inspiron 15 3000', 2, 4, 10, 'dell-inspiron-15-3000.webp', 14990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 12990000, NULL),
(72, 'Dell Latitude 14 5000 (5420)', 2, 4, 10, 'dell-latitude-14-5000-5420.webp', 27990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 23990000, NULL),
(73, 'Dell Precision 15 7000 (7560)', 2, 4, 10, 'dell-precision-15-7000-7560.webp', 33990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 29990000, NULL),
(74, 'Dell Vostro 14 3000', 2, 4, 10, 'dell-vostro-14-3000.webp', 18990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 15990000, NULL),
(75, 'Alienware x15', 2, 4, 10, 'alienware-x15.webp', 41990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 37990000, NULL),
(76, 'ASUS ZenBook 14 UX425EA', 2, 1, 10, 'asus-zenbook-14-ux425ea.webp', 16990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 14990000, NULL),
(101, 'ASUS ZenBook 14 UX425EA', 1, 1, 10, 'image-1715069853109.png', 16990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 14990000, NULL),
(102, 'Dell XPS 13 9310', 2, 2, 10, 'dell-xps-13-9310.webp', 23990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 21990000, NULL),
(103, 'HP Spectre x360 13t', 2, 3, 10, 'hp-spectre-x360-13t.webp', 22990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 20990000, NULL),
(104, 'Lenovo ThinkPad X1 Carbon Gen 9', 2, 4, 10, 'lenovo-thinkpad-x1-carbon-gen-9.webp', 32990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 29990000, 1),
(105, 'Dell XPS 13 (9310)', 2, 4, 10, 'dell-xps-13-9310.webp', 35990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 32990000, NULL),
(106, 'Dell Inspiron 15 3000', 2, 4, 10, 'dell-inspiron-15-3000.webp', 14990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 12990000, 1),
(107, 'Dell Latitude 14 5000 (5420)', 2, 4, 10, 'dell-latitude-14-5000-5420.webp', 27990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 23990000, NULL),
(108, 'Dell Precision 15 7000 (7560)', 2, 4, 10, 'dell-precision-15-7000-7560.webp', 33990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 29990000, NULL),
(109, 'Dell Vostro 14 3000', 2, 4, 10, 'dell-vostro-14-3000.webp', 18990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 15990000, NULL),
(110, 'Alienware x15', 2, 4, 10, 'alienware-x15.webp', 41990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 37990000, NULL),
(118, 'Alienware x15', 2, 4, 10, 'alienware-x15.webp', 41990000, 'Trả góp 0% lãi suất, không trả trước, không phụ phí qua Shinhan Finance', 37990000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_versions`
--

CREATE TABLE `product_versions` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `storage` int NOT NULL,
  `ram` int NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `product_versions`
--

INSERT INTO `product_versions` (`id`, `product_id`, `color`, `storage`, `ram`, `price`) VALUES
(1, 1, 'black', 128, 8, 34990000),
(2, 2, 'black', 128, 8, 21690000),
(3, 2, 'white', 128, 8, 21690000),
(4, 3, 'black', 128, 8, 26990000),
(5, 3, 'silver', 128, 8, 26990000),
(6, 4, 'blue', 128, 8, 15850000),
(7, 4, 'red', 128, 8, 15850000),
(8, 5, 'black', 128, 8, 27690000),
(9, 5, 'white', 128, 8, 27690000),
(10, 11, 'black', 256, 12, 23190000),
(11, 11, 'blue', 256, 12, 23190000),
(12, 11, 'blue', 512, 16, 25990000),
(13, 12, 'white', 512, 8, 20590000),
(14, 12, 'white', 256, 8, 18590000),
(15, 13, 'black', 256, 12, 33690000),
(16, 13, 'silver', 256, 12, 33690000),
(17, 13, 'silver', 512, 16, 36990000),
(18, 14, 'green', 256, 12, 17550000),
(19, 15, 'black', 128, 4, 3650000),
(20, 15, 'blue', 128, 4, 3650000),
(21, 15, 'blue', 256, 6, 4250000),
(22, 16, 'black', 128, 4, 3690000),
(23, 16, 'blue', 128, 4, 3690000),
(24, 17, 'green', 128, 8, 9590000),
(25, 20, 'purple', 256, 8, 35990000),
(26, 20, 'gold', 256, 8, 35990000),
(27, 21, 'black', 256, 8, 7200000),
(28, 21, 'white', 256, 8, 7200000),
(29, 22, 'blue', 128, 6, 4590000),
(30, 22, 'gray', 128, 6, 4590000),
(31, 23, 'black', 256, 8, 10690000),
(32, 23, 'blue', 256, 8, 10690000),
(33, 25, 'black', 512, 12, 15490000),
(34, 26, 'blue', 128, 8, 7990000),
(35, 26, 'blue', 256, 8, 9490000),
(36, 27, 'silver', 256, 12, 11990000),
(37, 28, 'gray', 128, 6, 3290000),
(38, 29, 'black', 256, 8, 18090000),
(39, 30, 'white', 128, 6, 8990000),
(40, 30, 'white', 256, 8, 11490000),
(41, 31, 'black', 256, 8, 6050000),
(42, 32, 'blue', 256, 8, 9990000),
(43, 33, 'gray', 256, 4, 6690000),
(44, 37, 'black', 256, 8, 7590000),
(45, 38, 'black', 64, 4, 3490000),
(46, 39, 'blue', 256, 8, 7890000),
(47, 40, 'silver', 128, 6, 7890000),
(48, 40, 'silver', 256, 8, 10490000),
(49, 41, 'gold', 128, 8, 6490000),
(50, 41, 'blue', 128, 6, 4190000),
(51, 41, 'silver', 128, 6, 7890000),
(52, 41, 'silver', 256, 8, 10490000),
(53, 41, 'black', 128, 4, 3290000),
(54, 42, 'black', 128, 6, 4190000),
(55, 42, 'black', 256, 8, 5290000),
(56, 42, 'blue', 128, 6, 4290000),
(57, 42, 'blue', 256, 8, 5390000),
(58, 43, 'black', 128, 6, 4190000),
(59, 44, 'silver', 32, 2, 1990000),
(60, 45, 'silver', 256, 8, 10490000),
(61, 46, 'black', 128, 6, 4190000),
(62, 47, 'blue', 256, 8, 5390000),
(63, 48, 'silver', 32, 2, 1990000),
(64, 49, 'black', 64, 4, 2990000),
(65, 50, 'blue', 256, 6, 4990000),
(66, 51, 'black', 512, 16, 20290000),
(67, 52, 'black', 256, 12, 13990000),
(68, 53, 'black', 512, 16, 13990000),
(69, 54, 'silver', 512, 16, 26190000),
(70, 56, 'black', 256, 16, 17690000),
(71, 57, 'red', 512, 16, 17990000),
(72, 58, 'blue', 256, 8, 8690000),
(73, 58, 'white', 256, 12, 8990000),
(74, 60, 'gold', 128, 8, 5190000),
(75, 60, 'rose gold', 128, 8, 5290000),
(76, 61, 'black', 128, 8, 5190000),
(77, 61, 'white', 128, 8, 5190000),
(78, 62, 'blue', 128, 4, 3790000),
(79, 62, 'black', 128, 4, 3790000),
(80, 63, 'blue', 128, 4, 3790000),
(81, 64, 'blue', 256, 8, 7990000),
(82, 101, 'Silver', 512, 8, 14990000),
(83, 101, 'Silver', 1024, 16, 18990000),
(84, 102, 'Black', 512, 8, 21990000),
(85, 102, 'Black', 1024, 16, 26990000),
(86, 103, 'Dark Ash Silver', 512, 8, 20990000),
(87, 103, 'Dark Ash Silver', 1024, 16, 24990000),
(88, 104, 'Black', 512, 8, 29990000),
(89, 104, 'Black', 1024, 16, 34990000),
(90, 105, 'Platinum Silver with Black carbon fiber palmrest', 256, 8, 32990000),
(91, 105, 'Platinum Silver with Black carbon fiber palmrest', 512, 16, 36990000),
(92, 106, 'Black', 256, 4, 12990000),
(93, 106, 'Black', 512, 8, 15990000),
(94, 107, 'Carbon Fiber', 256, 8, 23990000),
(95, 107, 'Carbon Fiber', 512, 16, 27990000),
(96, 108, 'Black', 512, 16, 29990000),
(97, 108, 'Black', 1024, 32, 33990000),
(98, 109, 'Black', 256, 4, 15990000),
(99, 109, 'Black', 512, 8, 18990000),
(100, 110, 'Dark Side of the Moon', 512, 16, 37990000),
(101, 110, 'Dark Side of the Moon', 1024, 32, 41990000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `role` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `phone`, `address`, `password`, `role`) VALUES
(1, 'admin@gmail.com', 'Admin', '0348378112', 'Ấp chợ xếp xã Tân Thành Bình Huyện Mỏ Cày Bắc tỉnh Bến Tre', '123', 1),
(2, 'cline@gmail.com', 'cline', '0348378112', 'Ấp chợ xếp xã Tân Thành Bình Huyện Mỏ Cày Bắc tỉnh Bến Tre', '123', 0),
(3, 'duy@gamil.com', 'duy', '9304949234', '', '123', 0),
(4, 'duy@gmail.com', 'Duy', '09734283', '', '123', 0),
(8, 'catchy@gamil.com', 'Duy', '0348378112', '', '123', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories_brand`
--
ALTER TABLE `categories_brand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_id` (`product_id`),
  ADD KEY `fk_idOrder` (`idOrder`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idUserBuy` (`idUserBuy`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories` (`categories`),
  ADD KEY `brandId` (`brandId`);

--
-- Indexes for table `product_versions`
--
ALTER TABLE `product_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories_brand`
--
ALTER TABLE `categories_brand`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=661765;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `product_versions`
--
ALTER TABLE `product_versions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories_brand`
--
ALTER TABLE `categories_brand`
  ADD CONSTRAINT `categories_brand_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`);

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `fk_idOrder` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_idUserBuy` FOREIGN KEY (`idUserBuy`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categories`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `categories_brand` (`id`);

--
-- Constraints for table `product_versions`
--
ALTER TABLE `product_versions`
  ADD CONSTRAINT `product_versions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
