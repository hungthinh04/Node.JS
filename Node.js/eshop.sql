-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2024 at 06:11 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `Id` int(11) NOT NULL,
  `Username` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `Password` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `Phone` varchar(20) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FullName` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `IsAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `Avatar` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`Id`, `Username`, `Password`, `Email`, `Phone`, `Address`, `FullName`, `IsAdmin`, `Avatar`, `Status`) VALUES
(1, 'admin', 'admin', 'admin@Eshop.com', '01234567890', 'Tp.Hồ Chí Minh', 'Nguyễn Văn Ad Min', 1, 'admin.jpg', 1),
(2, 'john', '123456', 'john@gmail.com', '0905486957', 'Đà Nẵng', 'John Henry', 0, 'john.jpg', 1),
(3, 'dhphuoc', '123456', 'dhphuoc@gmail.com', '0904863125', 'Tp.Hồ Chí Minh', 'Dương Hữu Phước', 0, 'dhphuoc.jpg', 1),
(4, 'longvic', '123456', 'longvic@gmail.com', '0459123845', 'Nha Trang', 'Long Vic', 0, 'longvic.jpg', 1),
(5, 'customer', '123456', 'customer@gmail.com', '0987654321', 'Huế', 'Trần Thị B', 0, 'customer.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `Id` int(11) NOT NULL,
  `AccountId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`Id`, `AccountId`, `ProductId`, `Quantity`) VALUES
(1, 1, 1, 2),
(2, 2, 1, 4),
(3, 5, 2, 2),
(4, 5, 6, 1),
(5, 5, 9, 3),
(6, 5, 12, 5),
(7, 2, 5, 7),
(8, 2, 10, 2),
(9, 2, 11, 4),
(10, 4, 2, 1),
(11, 4, 3, 1),
(12, 4, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `invoicedetails`
--

CREATE TABLE `invoicedetails` (
  `Id` int(11) NOT NULL,
  `InvoiceId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `invoicedetails`
--

INSERT INTO `invoicedetails` (`Id`, `InvoiceId`, `ProductId`, `Quantity`, `UnitPrice`) VALUES
(1, 1, 1, 2, 45000),
(2, 1, 3, 5, 59000),
(3, 1, 4, 1, 53000),
(4, 1, 9, 3, 60000),
(5, 2, 7, 1, 40000),
(6, 2, 8, 1, 55000),
(7, 2, 12, 2, 36000),
(8, 3, 6, 10, 57000),
(9, 4, 10, 4, 50000),
(10, 4, 11, 7, 40000),
(11, 5, 2, 4, 50000),
(12, 5, 3, 3, 59000),
(13, 5, 7, 6, 57000),
(14, 5, 10, 2, 55000),
(15, 6, 5, 7, 52000),
(16, 6, 6, 2, 57000),
(17, 7, 6, 2, 36000),
(18, 7, 12, 10, 57000),
(19, 8, 4, 1, 53000),
(20, 8, 9, 3, 60000),
(21, 8, 10, 1, 56000),
(22, 8, 12, 1, 38000);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `Id` int(11) NOT NULL,
  `Code` varchar(12) COLLATE utf8_vietnamese_ci NOT NULL,
  `AccountId` int(11) NOT NULL,
  `IssuedDate` datetime NOT NULL,
  `ShippingAddress` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ShippingPhone` varchar(20) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `Total` int(11) NOT NULL DEFAULT 0,
  `Status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`Id`, `Code`, `AccountId`, `IssuedDate`, `ShippingAddress`, `ShippingPhone`, `Total`, `Status`) VALUES
(1, '299541176755', 5, '2020-01-15 15:06:12', 'Quận 3, Tp.HCM', '0987654321', 618000, 1),
(2, '527777447269', 2, '2020-01-16 10:30:19', 'Quận 1, Tp.HCM', '0983564782', 167000, 1),
(3, '228448970415', 2, '2020-01-18 18:02:07', 'Quận 5, Tp.HCM', '0983564782', 570000, 1),
(4, '827349270900', 2, '2020-01-20 20:35:53', 'Quận 1, Tp.HCM', '0983564782', 480000, 0),
(5, '127745305853', 3, '2020-01-24 08:20:17', 'Quận 7, Tp.HCM', '0905785346', 829000, 1),
(6, '074407650817', 4, '2020-01-24 09:00:52', 'Nha Trang', '0459123845', 478000, 0),
(7, '611108375524', 3, '2020-01-28 14:20:54', 'Quận 7, Tp.HCM', '0905785346', 642000, 1),
(8, '178291648473', 4, '2020-01-24 18:29:07', 'Nha Trang', '0459123845', 327000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Id` int(11) NOT NULL,
  `SKU` varchar(12) COLLATE utf8_vietnamese_ci NOT NULL,
  `Name` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `Description` varchar(200) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `ProductTypeId` int(11) DEFAULT NULL,
  `Image` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Id`, `SKU`, `Name`, `Description`, `Price`, `Stock`, `ProductTypeId`, `Image`, `Status`) VALUES
(1, 'WT3WPGZ9BTWB', 'Tuổi trẻ đáng giá bao nhiêu', 'Rosie Nguyễn', 45000, 40, 5, '1.jpg', 1),
(2, '98IOWWXWYVQ4', 'Bứt phá điểm thi THPT Quốc gia môn Hóa học', 'Nguyễn Đức Dũng', 51000, 15, 2, '2.jpg', 1),
(3, '21RH48HRFXX8', 'Khéo ăn khéo nói sẽ có được thiên hạ', 'Trác Nhã', 59000, 29, 6, '3.jpg', 1),
(4, 'QOXYSDE605P5', 'Nhà giả kim', 'Paulo Coelho', 53000, 1, 3, '4.jpg', 1),
(5, '6YI6TZ3JPO1L', 'Để yên cho bác sĩ \"Hiền\"', 'BS. Ngô Đức Hùng', 52000, 36, 4, '5.jpg', 1),
(6, 'YHB5JTSVRF8E', 'Mình là cá, việc của mình là bơi ', 'Takeshi Furukawa', 57000, 9, 3, '6.jpg', 1),
(7, 'LXL64LZAR5M2', 'Đời ngắn đừng ngủ dài', 'Robin Sharma', 42000, 7, 3, '7.jpg', 1),
(8, 'C5V645HVP91W', 'Bứt phá điểm thi THPT Quốc gia môn Toán', 'ThS. Đỗ Đường Hiếu', 51000, 0, 2, '8.jpg', 1),
(9, '4KLYT2UF7VB9', 'Cà phê cùng Tony ', 'Tony Buổi Sáng', 62000, 18, 6, '9.jpg', 1),
(10, 'KBD67VI81M80', 'Em sẽ đến cùng cơn mưa', 'Ichikawa Takuji', 56000, 64, 5, '10.jpg', 1),
(11, '3RISEFVDWYVF', 'Quẳng gánh lo đi mà vui sống', 'Dale Carnegie', 45000, 120, 6, '11.jpg', 1),
(12, 'VIAZXR3Y24IY', 'Mình nói gì khi nói về hạnh phúc?', 'Rosie Nguyễn', 36000, 46, 5, '12.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `producttypes`
--

CREATE TABLE `producttypes` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `producttypes`
--

INSERT INTO `producttypes` (`Id`, `Name`, `Status`) VALUES
(1, 'Sách giáo khoa', 1),
(2, 'Sách tham khảo', 1),
(3, 'Sách nước ngoài', 1),
(4, 'Báo & Tạp chí', 1),
(5, 'Tiểu thuyết & Tự truyện', 1),
(6, 'Khác', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UC_Cart` (`AccountId`,`ProductId`),
  ADD KEY `ProductId` (`ProductId`);

--
-- Indexes for table `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UC_InvoiceDetail` (`InvoiceId`,`ProductId`),
  ADD KEY `ProductId` (`ProductId`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Code` (`Code`),
  ADD KEY `AccountId` (`AccountId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `SKU` (`SKU`),
  ADD KEY `ProductTypeId` (`ProductTypeId`);

--
-- Indexes for table `producttypes`
--
ALTER TABLE `producttypes`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `invoicedetails`
--
ALTER TABLE `invoicedetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `producttypes`
--
ALTER TABLE `producttypes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `products` (`Id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`AccountId`) REFERENCES `accounts` (`Id`);

--
-- Constraints for table `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD CONSTRAINT `invoicedetails_ibfk_1` FOREIGN KEY (`InvoiceId`) REFERENCES `invoices` (`Id`),
  ADD CONSTRAINT `invoicedetails_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `products` (`Id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`AccountId`) REFERENCES `accounts` (`Id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`ProductTypeId`) REFERENCES `producttypes` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
