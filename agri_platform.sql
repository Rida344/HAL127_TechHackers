-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2026 at 09:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agri_platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer_crop_interest`
--

CREATE TABLE `buyer_crop_interest` (
  `id` int(11) NOT NULL,
  `buyer_type` enum('middleman','company') NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `crop_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buyer_crop_interest`
--

INSERT INTO `buyer_crop_interest` (`id`, `buyer_type`, `buyer_id`, `crop_name`) VALUES
(1, 'middleman', 1, 'Paddy'),
(2, 'middleman', 1, 'Sugarcane'),
(3, 'middleman', 3, 'Cotton'),
(4, 'middleman', 4, 'Paddy'),
(5, 'middleman', 9, 'Cotton'),
(6, 'middleman', 10, 'Arecanut'),
(7, 'company', 1, 'Sugarcane'),
(8, 'company', 2, 'Cotton'),
(9, 'company', 3, 'Paddy'),
(10, 'company', 7, 'Coffee'),
(11, 'company', 8, 'Coconut'),
(12, 'company', 15, 'Maize');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `district_name` varchar(100) DEFAULT NULL,
  `contact_email` varchar(150) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `purchase_capacity_tonnes` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `district_name`, `contact_email`, `phone`, `purchase_capacity_tonnes`, `created_at`) VALUES
(1, 'Karnataka Sugar Mills', 'Mandya', 'procurement@ksm.com', '08012345678', 5000, '2026-02-21 20:31:30'),
(2, 'South India Cotton Exports', 'Kalaburagi', 'buy@cottonexp.com', '08023456789', 3000, '2026-02-21 20:31:30'),
(3, 'Mysuru Agro Foods', 'Mysuru', 'purchase@mysagro.com', '08212456789', 2000, '2026-02-21 20:31:30'),
(4, 'Belagavi Agro Industries', 'Belagavi', 'info@belagaviagro.com', '08312456789', 2500, '2026-02-21 20:31:30'),
(5, 'Raichur Rice Mills', 'Raichur', 'contact@raichurrice.com', '08532234567', 4000, '2026-02-21 20:31:30'),
(6, 'Tumakuru Grain Processing', 'Tumakuru', 'grain@tumakuru.com', '08162234567', 3500, '2026-02-21 20:31:30'),
(7, 'Chikmagalur Coffee Works', 'Chikkamagaluru', 'coffee@ckmworks.com', '08262234567', 1500, '2026-02-21 20:31:30'),
(8, 'Coastal Coconut Industries', 'Dakshina Kannada', 'info@coastalcoco.com', '08242345678', 2200, '2026-02-21 20:31:30'),
(9, 'Kolar Veg Exporters', 'Kolar', 'export@kolarveg.com', '08152234567', 1800, '2026-02-21 20:31:30'),
(10, 'Shivamogga Agro Pvt Ltd', 'Shivamogga', 'agro@shivamogga.com', '08182234567', 2100, '2026-02-21 20:31:30'),
(11, 'Bagalkot Sugar Refinery', 'Bagalkot', 'refinery@bagalkot.com', '08354234567', 4500, '2026-02-21 20:31:30'),
(12, 'Ballari Cotton Mills', 'Ballari', 'mills@ballari.com', '08392234567', 3000, '2026-02-21 20:31:30'),
(13, 'Bidar Agro Processing', 'Bidar', 'processing@bidar.com', '08482234567', 1700, '2026-02-21 20:31:30'),
(14, 'Chamarajanagar Food Industries', 'Chamarajanagar', 'food@cfi.com', '08226234567', 1600, '2026-02-21 20:31:30'),
(15, 'Davanagere Grain Exports', 'Davanagere', 'grain@dvgexports.com', '08192234567', 3200, '2026-02-21 20:31:30'),
(16, 'Hassan Agro Exporters', 'Hassan', 'export@hassanagro.com', '08172234567', 2000, '2026-02-21 20:31:30'),
(17, 'Koppal Cotton Industries', 'Koppal', 'cotton@koppal.com', '08539234567', 2800, '2026-02-21 20:31:30'),
(18, 'Udupi Agro Traders', 'Udupi', 'trade@udupiagro.com', '08202234567', 1900, '2026-02-21 20:31:30'),
(19, 'Vijayapura Oil Mills', 'Vijayapura', 'oil@vijayapura.com', '08352234567', 2400, '2026-02-21 20:31:30'),
(20, 'Yadgir Agro Foods', 'Yadgir', 'foods@yadgiragro.com', '08473234567', 1500, '2026-02-21 20:31:30');

-- --------------------------------------------------------

--
-- Table structure for table `middlemen`
--

CREATE TABLE `middlemen` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `district_name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `commission_percentage` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `middlemen`
--

INSERT INTO `middlemen` (`id`, `name`, `district_name`, `phone`, `commission_percentage`, `created_at`) VALUES
(1, 'Shivappa Traders', 'Mandya', '9876543210', 5.50, '2026-02-21 20:30:39'),
(2, 'Lakshmi Agro Brokers', 'Mysuru', '9876501234', 4.80, '2026-02-21 20:30:39'),
(3, 'Belagavi Crop Links', 'Belagavi', '9880012345', 6.00, '2026-02-21 20:30:39'),
(4, 'Raichur Agri Connect', 'Raichur', '9845012345', 5.20, '2026-02-21 20:30:39'),
(5, 'Tumakuru Farm Agents', 'Tumakuru', '9900011223', 4.50, '2026-02-21 20:30:39'),
(6, 'Chikmagalur Plantation Agents', 'Chikkamagaluru', '9822233344', 6.50, '2026-02-21 20:30:39'),
(7, 'Coastal Agro Traders', 'Dakshina Kannada', '9845123456', 5.80, '2026-02-21 20:30:39'),
(8, 'Kolar Vegetable Brokers', 'Kolar', '9887766554', 4.90, '2026-02-21 20:30:39'),
(9, 'Kalaburagi Cotton Dealers', 'Kalaburagi', '9901122334', 5.70, '2026-02-21 20:30:39'),
(10, 'Shivamogga Farm Connect', 'Shivamogga', '9811122233', 4.60, '2026-02-21 20:30:39'),
(11, 'Bagalkot Agri Traders', 'Bagalkot', '9898989898', 5.00, '2026-02-21 20:30:39'),
(12, 'Ballari Crop Exchange', 'Ballari', '9877001122', 5.30, '2026-02-21 20:30:39'),
(13, 'Bidar Agro Agents', 'Bidar', '9866004455', 5.10, '2026-02-21 20:30:39'),
(14, 'Chamarajanagar Farm Brokers', 'Chamarajanagar', '9844005566', 4.70, '2026-02-21 20:30:39'),
(15, 'Davanagere Market Connect', 'Davanagere', '9819001122', 5.40, '2026-02-21 20:30:39'),
(16, 'Hassan Agro Services', 'Hassan', '9822003344', 4.90, '2026-02-21 20:30:39'),
(17, 'Koppal Crop Dealers', 'Koppal', '9833445566', 5.60, '2026-02-21 20:30:39'),
(18, 'Udupi Plantation Traders', 'Udupi', '9845332211', 6.20, '2026-02-21 20:30:39'),
(19, 'Vijayapura Agro Brokers', 'Vijayapura', '9876112233', 5.80, '2026-02-21 20:30:39'),
(20, 'Yadgir Farm Links', 'Yadgir', '9899112233', 5.00, '2026-02-21 20:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `district_name` varchar(100) NOT NULL,
  `soil_id` int(11) DEFAULT NULL,
  `avg_rainfall_mm` int(11) DEFAULT NULL,
  `avg_temperature_c` decimal(4,1) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `district_name`, `soil_id`, `avg_rainfall_mm`, `avg_temperature_c`, `latitude`, `longitude`) VALUES
(1, 'Bagalkot', 1, 600, 28.5, 16.18670000, 75.69670000),
(2, 'Ballari', 2, 550, 30.0, 15.13940000, 76.92140000),
(3, 'Belagavi', 1, 850, 26.0, 15.84970000, 74.49770000),
(4, 'Bengaluru Rural', 5, 800, 25.5, 13.27700000, 77.56300000),
(5, 'Bengaluru Urban', 5, 900, 25.0, 12.97160000, 77.59460000),
(6, 'Bidar', 1, 900, 27.0, 17.91330000, 77.53010000),
(7, 'Chamarajanagar', 5, 750, 26.5, 11.92310000, 76.93950000),
(8, 'Chikkaballapur', 2, 700, 27.5, 13.43500000, 77.73150000),
(9, 'Chikkamagaluru', 6, 1800, 24.0, 13.31530000, 75.77540000),
(10, 'Chitradurga', 2, 650, 28.0, 14.23060000, 76.39800000),
(11, 'Dakshina Kannada', 3, 3000, 28.0, 12.91410000, 74.85600000),
(12, 'Davanagere', 1, 700, 27.5, 14.46440000, 75.92180000),
(13, 'Dharwad', 1, 800, 26.0, 15.45890000, 75.00780000),
(14, 'Gadag', 1, 650, 28.0, 15.42970000, 75.62990000),
(15, 'Hassan', 5, 1100, 25.5, 13.00720000, 76.09630000),
(16, 'Haveri', 1, 750, 27.0, 14.79370000, 75.39910000),
(17, 'Kalaburagi', 1, 750, 29.0, 17.32970000, 76.83430000),
(18, 'Kodagu', 6, 2500, 22.5, 12.33750000, 75.80690000),
(19, 'Kolar', 2, 700, 27.5, 13.13670000, 78.12900000),
(20, 'Koppal', 1, 600, 29.0, 15.35000000, 76.15000000),
(21, 'Mandya', 1, 700, 27.5, 12.52390000, 76.89700000),
(22, 'Mysuru', 5, 800, 26.5, 12.29580000, 76.63940000),
(23, 'Raichur', 2, 600, 29.5, 16.21200000, 77.34390000),
(24, 'Ramanagara', 5, 750, 26.0, 12.72000000, 77.28000000),
(25, 'Shivamogga', 6, 2000, 25.0, 13.92990000, 75.56810000),
(26, 'Tumakuru', 2, 700, 27.5, 13.34090000, 77.10100000),
(27, 'Udupi', 3, 3000, 27.0, 13.34090000, 74.74210000),
(28, 'Uttara Kannada', 3, 2500, 26.0, 14.80760000, 74.13060000),
(29, 'Vijayapura', 1, 600, 28.5, 16.83020000, 75.71000000),
(30, 'Yadgir', 2, 650, 29.0, 16.77000000, 77.13000000);

-- --------------------------------------------------------

--
-- Table structure for table `seed_bank`
--

CREATE TABLE `seed_bank` (
  `id` int(11) NOT NULL,
  `district_name` varchar(100) NOT NULL,
  `crop_name` varchar(100) NOT NULL,
  `total_quantity_kg` int(11) NOT NULL,
  `booked_quantity_kg` int(11) DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seed_bank`
--

INSERT INTO `seed_bank` (`id`, `district_name`, `crop_name`, `total_quantity_kg`, `booked_quantity_kg`, `last_updated`) VALUES
(1, 'Mandya', 'Paddy', 10000, 6500, '2026-02-21 20:01:19'),
(2, 'Mandya', 'Ragi', 8000, 2500, '2026-02-21 20:01:19'),
(3, 'Mandya', 'Sugarcane', 12000, 7000, '2026-02-21 20:01:19'),
(4, 'Mandya', 'Maize', 9000, 3000, '2026-02-21 20:01:19'),
(5, 'Mandya', 'Groundnut', 6000, 2000, '2026-02-21 20:01:19'),
(6, 'Mysuru', 'Paddy', 9000, 5000, '2026-02-21 20:01:19'),
(7, 'Mysuru', 'Ragi', 7000, 4000, '2026-02-21 20:01:19'),
(8, 'Mysuru', 'Sugarcane', 11000, 6000, '2026-02-21 20:01:19'),
(9, 'Mysuru', 'Tur', 5000, 2000, '2026-02-21 20:01:19'),
(10, 'Mysuru', 'Maize', 8000, 3000, '2026-02-21 20:01:19'),
(11, 'Belagavi', 'Cotton', 15000, 9000, '2026-02-21 20:01:19'),
(12, 'Belagavi', 'Jowar', 10000, 4000, '2026-02-21 20:01:19'),
(13, 'Belagavi', 'Sugarcane', 14000, 8000, '2026-02-21 20:01:19'),
(14, 'Belagavi', 'Groundnut', 7000, 2000, '2026-02-21 20:01:19'),
(15, 'Belagavi', 'Tur', 6000, 3500, '2026-02-21 20:01:19'),
(16, 'Raichur', 'Cotton', 12000, 8000, '2026-02-21 20:01:19'),
(17, 'Raichur', 'Paddy', 10000, 7000, '2026-02-21 20:01:19'),
(18, 'Raichur', 'Maize', 9000, 3000, '2026-02-21 20:01:19'),
(19, 'Raichur', 'Sunflower', 6000, 2000, '2026-02-21 20:01:19'),
(20, 'Raichur', 'Groundnut', 7000, 4500, '2026-02-21 20:01:19'),
(21, 'Tumakuru', 'Ragi', 10000, 5500, '2026-02-21 20:01:19'),
(22, 'Tumakuru', 'Maize', 9000, 4000, '2026-02-21 20:01:19'),
(23, 'Tumakuru', 'Groundnut', 8000, 3000, '2026-02-21 20:01:19'),
(24, 'Tumakuru', 'Tur', 6000, 2000, '2026-02-21 20:01:19'),
(25, 'Tumakuru', 'Sunflower', 7000, 4500, '2026-02-21 20:01:19'),
(26, 'Chikkamagaluru', 'Coffee', 8000, 5000, '2026-02-21 20:01:19'),
(27, 'Chikkamagaluru', 'Pepper', 6000, 3000, '2026-02-21 20:01:19'),
(28, 'Chikkamagaluru', 'Cardamom', 5000, 2500, '2026-02-21 20:01:19'),
(29, 'Chikkamagaluru', 'Maize', 7000, 2000, '2026-02-21 20:01:19'),
(30, 'Chikkamagaluru', 'Ragi', 6000, 1500, '2026-02-21 20:01:19'),
(31, 'Dakshina Kannada', 'Coconut', 12000, 7000, '2026-02-21 20:01:19'),
(32, 'Dakshina Kannada', 'Arecanut', 10000, 6000, '2026-02-21 20:01:19'),
(33, 'Dakshina Kannada', 'Cashew', 8000, 3000, '2026-02-21 20:01:19'),
(34, 'Dakshina Kannada', 'Banana', 9000, 4500, '2026-02-21 20:01:19'),
(35, 'Dakshina Kannada', 'Paddy', 7000, 4000, '2026-02-21 20:01:19'),
(36, 'Kolar', 'Tomato', 9000, 6000, '2026-02-21 20:01:19'),
(37, 'Kolar', 'Mango', 8000, 3000, '2026-02-21 20:01:19'),
(38, 'Kolar', 'Ragi', 7000, 3500, '2026-02-21 20:01:19'),
(39, 'Kolar', 'Groundnut', 6000, 2000, '2026-02-21 20:01:19'),
(40, 'Kolar', 'Maize', 7500, 5000, '2026-02-21 20:01:19'),
(41, 'Kalaburagi', 'Jowar', 11000, 8000, '2026-02-21 20:01:19'),
(42, 'Kalaburagi', 'Tur', 9000, 6000, '2026-02-21 20:01:19'),
(43, 'Kalaburagi', 'Cotton', 13000, 9000, '2026-02-21 20:01:19'),
(44, 'Kalaburagi', 'Sunflower', 8000, 4000, '2026-02-21 20:01:19'),
(45, 'Kalaburagi', 'Maize', 7000, 2500, '2026-02-21 20:01:19'),
(46, 'Shivamogga', 'Paddy', 10000, 6000, '2026-02-21 20:01:19'),
(47, 'Shivamogga', 'Arecanut', 9000, 5000, '2026-02-21 20:01:19'),
(48, 'Shivamogga', 'Maize', 8000, 3000, '2026-02-21 20:01:19'),
(49, 'Shivamogga', 'Ragi', 7000, 2000, '2026-02-21 20:01:19'),
(50, 'Shivamogga', 'Groundnut', 6000, 1500, '2026-02-21 20:01:19');

-- --------------------------------------------------------

--
-- Table structure for table `soil_types`
--

CREATE TABLE `soil_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soil_types`
--

INSERT INTO `soil_types` (`id`, `name`) VALUES
(4, 'Alluvial Soil'),
(1, 'Black Cotton Soil'),
(6, 'Forest Loamy Soil'),
(3, 'Laterite Soil'),
(5, 'Red Loamy Soil'),
(2, 'Red Soil');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyer_crop_interest`
--
ALTER TABLE `buyer_crop_interest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `middlemen`
--
ALTER TABLE `middlemen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `district_name` (`district_name`),
  ADD KEY `soil_id` (`soil_id`);

--
-- Indexes for table `seed_bank`
--
ALTER TABLE `seed_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soil_types`
--
ALTER TABLE `soil_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buyer_crop_interest`
--
ALTER TABLE `buyer_crop_interest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `middlemen`
--
ALTER TABLE `middlemen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `seed_bank`
--
ALTER TABLE `seed_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `soil_types`
--
ALTER TABLE `soil_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_ibfk_1` FOREIGN KEY (`soil_id`) REFERENCES `soil_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
