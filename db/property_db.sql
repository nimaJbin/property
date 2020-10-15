-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2020 at 11:16 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `property_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `propertyId` int(11) NOT NULL,
  `house_name_number` varchar(128) NOT NULL,
  `postcode` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `propertyId`, `house_name_number`, `postcode`) VALUES
(6, 7, '', '1'),
(7, 8, '', '1'),
(8, 9, '', 'dsds'),
(9, 10, '', 'dsds'),
(10, 11, '', 'dsds'),
(11, 12, '', 'dsds'),
(12, 13, '55555', '1111'),
(14, 15, 'dsds dfd dssdsd', 'ewewewewew dsds'),
(15, 16, 'dsds dfd dssdsd', 'ewewewewew dsds'),
(16, 17, 'dsds dfd dssdsd', 'ewewewewew dsds'),
(17, 18, 'dsds dfd dssdsd', 'ewewewewew dsds'),
(18, 19, 'dsds dfd dssdsd', 'ewewewewew dsds'),
(19, 20, 'dsds dfd dssdsd', 'ewewewewew dsds'),
(20, 21, 'dsds dfd dssdsd', 'ewewewewew dsds'),
(21, 22, 'dsds dfd dssdsd  ', '     ewewewewew dsds'),
(22, 23, 'dsds dfd dssdsd  ', '     ewewewewew dsds'),
(23, 24, 'dsds dfd dssdsd  ', '     ewewewewew dsds'),
(24, 25, 'dsds dfd dssdsd', '     ewewewewew dsds'),
(25, 26, 'dsds dfd dssdsd', '     ewewewewew dsds'),
(26, 27, 'dsds dfd dssdsd', 'ewewewewew dsds'),
(27, 28, 'dsds dfd dssdsd', 'ewewewewew dsds'),
(28, 29, 'dsds dfd dssdsd', 'ewewewewew dsds'),
(29, 30, 'vcvccv', 't      vvcvcvc'),
(30, 31, 'vcvccv', 't      vvcvcvc'),
(31, 32, 'vcvccv', 't      vvcvcvc'),
(32, 33, 'vcvccv', 't      vvcvcvc');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `id` int(11) NOT NULL,
  `userId` int(128) NOT NULL,
  `propertyId` int(11) NOT NULL,
  `main_owner` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE `phone` (
  `id` int(11) NOT NULL,
  `userId` int(128) NOT NULL,
  `typeId` int(11) NOT NULL,
  `number` varchar(128) NOT NULL,
  `createdAt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `phonetype`
--

CREATE TABLE `phonetype` (
  `id` int(11) NOT NULL,
  `type` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `phonetype`
--

INSERT INTO `phonetype` (`id`, `type`) VALUES
(1, 'mobile'),
(2, 'home'),
(3, 'work');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `createdAt` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`id`, `createdAt`) VALUES
(7, 1602718665),
(8, 1602718737),
(9, 1602718744),
(10, 1602718772),
(11, 1602718783),
(12, 1602718844),
(13, 1602718959),
(15, 1602719036),
(16, 1602719038),
(17, 1602719039),
(18, 1602719040),
(19, 1602719745),
(20, 1602719751),
(21, 1602719789),
(22, 1602722904),
(23, 1602722905),
(24, 1602722906),
(25, 1602722935),
(26, 1602722942),
(27, 1602722958),
(28, 1602728137),
(29, 1602728409),
(30, 1602782383),
(31, 1602782459),
(32, 1602782493),
(33, 1602782502);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(128) NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `phones` int(11) DEFAULT NULL,
  `createdAt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `propertyId` (`propertyId`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`,`propertyId`),
  ADD KEY `propertyId` (`propertyId`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `typeId` (`typeId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `phonetype`
--
ALTER TABLE `phonetype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone`
--
ALTER TABLE `phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phonetype`
--
ALTER TABLE `phonetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`propertyId`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `owner`
--
ALTER TABLE `owner`
  ADD CONSTRAINT `owner_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `owner_ibfk_3` FOREIGN KEY (`propertyId`) REFERENCES `property` (`id`);

--
-- Constraints for table `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `phonetype` (`id`),
  ADD CONSTRAINT `phone_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
