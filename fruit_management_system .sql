-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2022 at 10:04 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fruit_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `transaction_id` varchar(15) NOT NULL,
  `delivery_id` varchar(15) NOT NULL,
  `transaction_method` varchar(10) NOT NULL,
  `transaction_amount` double NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`transaction_id`, `delivery_id`, `transaction_method`, `transaction_amount`, `transaction_date`, `transaction_desc`) VALUES
('tnx_1', 'deliv_1', 'cash', 240, '2022-09-21', 'delivery by delivery man');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(10) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `phone_number` int(12) NOT NULL,
  `address` varchar(60) NOT NULL,
  `email` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `product_id`, `product_name`, `first_name`, `last_name`, `phone_number`, `address`, `email`) VALUES
('cust_1', 'prod_1', 'Mango', 'Rezaul', 'Karim', 1987344387, 'Mohammadpur, Dhaka', 'rezaul.karim@gmail.com'),
('cust_2', 'prod_3', 'Mango', 'Fayjul ', 'Ahmed', 1846344149, 'Hazaribagh,Dhaka', NULL),
('cust_3', 'prod_1', 'Mango', 'Mizanur', 'Rahman', 1596349387, 'Rayer Bazar, Dhaka', 'mizanur.rahman@gmail.com'),
('cust_4', 'prod_5', 'Mango', 'Abdur', 'Ali', 1787344381, 'Hazaribagh,Dhaka', 'abdur.rahman@gamil.com'),
('cust_5', 'prod_3', 'Mango', 'Imran', 'Anis', 1982144387, 'Mohammadpur, Dhaka', NULL),
('cust_6', 'prod_3', 'Mango', 'Abir', 'Shykat', 182379823, 'hajhsdfuiqwj,japsiojdfiojq', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` varchar(15) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `delivery_date` date NOT NULL,
  `delivery_type` varchar(10) NOT NULL,
  `delivery_amount` double NOT NULL,
  `delivery_charge` int(5) NOT NULL,
  `total_pay` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `order_id`, `staff_id`, `delivery_date`, `delivery_type`, `delivery_amount`, `delivery_charge`, `total_pay`) VALUES
('deliv_1', 'ord_2', 'staff_1', '2022-09-21', 'courier', 200, 40, 240);

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `expense_id` varchar(11) NOT NULL,
  `staff_salary` int(11) DEFAULT NULL,
  `products_purchased` double DEFAULT NULL,
  `utility_bill` double DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`expense_id`, `staff_salary`, `products_purchased`, `utility_bill`, `description`, `date`) VALUES
('exp_1', NULL, 20000, NULL, '20 kg Mango purchased', '2022-09-06'),
('exp_2', 27000, NULL, NULL, 'staff salary', '2022-09-10');

-- --------------------------------------------------------

--
-- Table structure for table `order_info`
--

CREATE TABLE `order_info` (
  `order_id` varchar(20) NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  `order_date` date NOT NULL,
  `quantity` varchar(10) NOT NULL,
  `order_value` double NOT NULL,
  `discount` float NOT NULL,
  `order_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_info`
--

INSERT INTO `order_info` (`order_id`, `customer_id`, `order_date`, `quantity`, `order_value`, `discount`, `order_status`) VALUES
('ord_1', 'cust_1', '2022-09-01', '4 kg', 500, 0, 'not delivered'),
('ord_2', 'cust_1', '2022-09-06', '3 kg', 2000, 0, 'not delivered'),
('ord_3', 'cust_2', '2022-09-05', '6 kg', 1200, 10, 'not delivered'),
('ord_4', 'cust_4', '2022-09-06', '10', 3000, 15, 'delivered'),
('ord_5', 'cust_3', '2022-09-20', '2 kg', 700, 0, 'not delivered'),
('ord_6', 'cust_3', '2022-09-21', '5 kg', 8, 5, 'not delivered'),
('ord_7', 'cust_6', '2022-09-30', '2 kg', 500, 0, 'not delivered');

-- --------------------------------------------------------

--
-- Table structure for table `order_storage`
--

CREATE TABLE `order_storage` (
  `id` int(11) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `storage_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_storage`
--

INSERT INTO `order_storage` (`id`, `order_id`, `storage_id`) VALUES
(1, 'ord_1', 'stor_1'),
(2, 'ord_2', 'stor_1'),
(3, 'ord_3', 'stor_2'),
(4, 'ord_5', 'stor_2');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` varchar(10) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `product_category` varchar(20) NOT NULL,
  `price_per_KG` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_category`, `price_per_KG`) VALUES
('prod_1', 'Mango', 'Himshagor', 100),
('prod_2', 'Mango', 'Amrupali', 200),
('prod_3', 'Mango', 'Fazli', 250),
('prod_4', 'Mango', 'Ashwina', 400),
('prod_5', 'Mango', 'Baishakhi', 220),
('prod_6', 'Mango', 'Heivanga', 150),
('prod_7', 'Licchu', 'ABC', 150);

-- --------------------------------------------------------

--
-- Table structure for table `product_storage`
--

CREATE TABLE `product_storage` (
  `id` int(11) NOT NULL,
  `storage_id` varchar(10) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `total_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_storage`
--

INSERT INTO `product_storage` (`id`, `storage_id`, `product_id`, `total_price`) VALUES
(1, 'stor_1', 'prod_1', 10000),
(2, 'stor_1', 'prod_2', 15000),
(3, 'stor_2', 'prod_3', 20000),
(4, 'stor_2', 'prod_4', 15000),
(5, 'stor_3', 'prod_5', 65000),
(6, 'stor_3', 'prod_6', 40000);

-- --------------------------------------------------------

--
-- Table structure for table `proprietor`
--

CREATE TABLE `proprietor` (
  `Name` varchar(20) NOT NULL,
  `expense_id` varchar(11) DEFAULT NULL,
  `transaction_id` varchar(15) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proprietor`
--

INSERT INTO `proprietor` (`Name`, `expense_id`, `transaction_id`, `description`) VALUES
('Abir', 'exp_1', NULL, NULL),
('Harun chacha', NULL, 'tnx_1', 'sell'),
('Abir', 'exp_2', NULL, 'staff salary');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(20) NOT NULL,
  `staff_phone_number` varchar(20) NOT NULL,
  `staff_address` varchar(60) NOT NULL,
  `DOB` date NOT NULL,
  `staff_NID` int(17) NOT NULL,
  `staff_email` varchar(40) DEFAULT NULL,
  `designation` varchar(15) NOT NULL,
  `salary` int(11) NOT NULL,
  `join_date` date NOT NULL,
  `resignation_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `staff_phone_number`, `staff_address`, `DOB`, `staff_NID`, `staff_email`, `designation`, `salary`, `join_date`, `resignation_date`) VALUES
('staff_1', 'Zillur Rahman', '01783294853', 'Mirpur, Dhaka', '1980-05-16', 1413564657, 'zillur.rahman.deliv@gmail.com', 'Delivery man', 12000, '2016-05-13', NULL),
('staff_2', 'Rahim Ali Gazi', '01689347589', 'Kallanpur, Dhaka', '1989-05-13', 1413564656, 'ali.gazi.rahim@gmail.com', 'Manager', 27000, '2018-05-04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `storage_id` varchar(10) NOT NULL,
  `product_quantity` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `storage`
--

INSERT INTO `storage` (`storage_id`, `product_quantity`) VALUES
('stor_1', '50 kg'),
('stor_2', '80 kg'),
('stor_3', '120 kg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `delivery_id` (`delivery_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `expense_ibfk_1` (`staff_salary`),
  ADD KEY `products_purchased` (`products_purchased`);

--
-- Indexes for table `order_info`
--
ALTER TABLE `order_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_storage`
--
ALTER TABLE `order_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `storage_id` (`storage_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_storage`
--
ALTER TABLE `product_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `total_price` (`total_price`);

--
-- Indexes for table `proprietor`
--
ALTER TABLE `proprietor`
  ADD KEY `expense_id` (`expense_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `salary` (`salary`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`storage_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_storage`
--
ALTER TABLE `order_storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_storage`
--
ALTER TABLE `product_storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`delivery_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_info` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `expense_ibfk_1` FOREIGN KEY (`staff_salary`) REFERENCES `staff` (`salary`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expense_ibfk_2` FOREIGN KEY (`products_purchased`) REFERENCES `product_storage` (`total_price`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_info`
--
ALTER TABLE `order_info`
  ADD CONSTRAINT `order_info_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_storage`
--
ALTER TABLE `order_storage`
  ADD CONSTRAINT `order_storage_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_info` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_storage_ibfk_2` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`storage_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_storage`
--
ALTER TABLE `product_storage`
  ADD CONSTRAINT `product_storage_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_storage_ibfk_2` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`storage_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proprietor`
--
ALTER TABLE `proprietor`
  ADD CONSTRAINT `proprietor_ibfk_1` FOREIGN KEY (`expense_id`) REFERENCES `expense` (`expense_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proprietor_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `account` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
