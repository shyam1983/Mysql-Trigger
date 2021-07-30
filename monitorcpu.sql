-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2021 at 11:35 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monitorcpu`
--

-- --------------------------------------------------------

--
-- Table structure for table `cpu`
--

CREATE TABLE `cpu` (
  `id` int(11) NOT NULL,
  `processor` int(11) NOT NULL,
  `ram` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `totalcost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cpu`
--

INSERT INTO `cpu` (`id`, `processor`, `ram`, `cost`, `totalcost`) VALUES
(1, 3, 4, 2000, 0),
(2, 7, 8, 3000, 0),
(3, 3, 8, 2500, 0),
(4, 7, 6, 2800, 0),
(6, 5, 8, 4000, 0),
(0, 0, 0, 0, 0),
(7, 8, 8, 4000, 0),
(0, 0, 0, 0, 0);

--
-- Triggers `cpu`
--
DELIMITER $$
CREATE TRIGGER `calculate_separate2` BEFORE INSERT ON `cpu` FOR EACH ROW SET NEW.totalcost := (SELECT NEW.cost * monitor.cost
                           FROM monitor
                           WHERE monitor.id = NEW.id)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `monitor`
--

CREATE TABLE `monitor` (
  `id` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `pixel` int(11) NOT NULL,
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `monitor`
--

INSERT INTO `monitor` (`id`, `size`, `pixel`, `cost`) VALUES
(1, 8, 600, 2000),
(2, 10, 1240, 2500),
(3, 15, 950, 2900),
(4, 15, 1920, 3000),
(5, 16, 1920, 4000),
(5, 16, 1920, 4000),
(5, 16, 1920, 4000),
(5, 16, 1920, 4000),
(5, 16, 1920, 4000),
(5, 16, 1920, 4000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `monitor`
--
ALTER TABLE `monitor`
  ADD KEY `id` (`size`,`pixel`,`cost`) USING BTREE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
