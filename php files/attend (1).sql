-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2024 at 08:12 PM
-- Server version: 8.0.37
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attend`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `fname` varchar(200) NOT NULL,
  `lname` varchar(200) DEFAULT NULL,
  `mname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `name` varchar(200) NOT NULL DEFAULT 'not',
  `ID` varchar(200) NOT NULL DEFAULT 'not',
  `IoT` varchar(200) NOT NULL DEFAULT 'not',
  `HCI` varchar(200) NOT NULL DEFAULT 'not',
  `Linux` varchar(200) NOT NULL DEFAULT 'not',
  `SAD` varchar(200) NOT NULL DEFAULT 'not',
  `Graphics` varchar(200) NOT NULL DEFAULT 'not',
  `SAD_date_2024_07_01_12` varchar(10) DEFAULT 'absent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`name`, `ID`, `IoT`, `HCI`, `Linux`, `SAD`, `Graphics`, `SAD_date_2024_07_01_12`) VALUES
('Bob Colimo', 'sboco2211', 'enrolled', 'enrolled', 'enrolled', 'enrolled', 'enrolled', 'absent'),
('Charlie Puth', 'schpu2211', 'enrolled', 'enrolled', 'enrolled', 'enrolled', 'enrolled', 'absent'),
('David Gutea', 'sdagu2211', 'enrolled', 'enrolled', 'enrolled', 'enrolled', 'enrolled', 'present'),
('Ivan Delvis', 'sdwva2111', 'not', 'not', 'enrolled', 'not', 'enrolled', 'absent'),
('Franklin Ochieng', 'sfroch2211', 'not', 'not', 'not', 'enrolled', 'enrolled', 'present'),
('Jeckonia Opiyo', 'sjecop2211', 'enrolled', 'enrolled', 'enrolled', 'enrolled', 'enrolled', 'absent'),
('Eva Max', 'smaev2211', 'enrolled', 'enrolled', 'enrolled', 'enrolled', 'enrolled', 'present'),
('Tamandani Mangochi', 'smata2111', 'enrolled', 'enrolled', 'enrolled', 'enrolled', 'enrolled', 'absent'),
('Hannah Montanah', 'smoha2211', 'enrolled', 'enrolled', 'not', 'not', 'enrolled', 'absent'),
('Grace Ramesh', 'srag2211', 'enrolled', 'enrolled', 'enrolled', 'not', 'not', 'absent'),
('Jack Ripper', 'srija2221', 'enrolled', 'not', 'enrolled', 'enrolled', 'not', 'absent');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
