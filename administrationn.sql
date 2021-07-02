-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2021 at 03:47 PM
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
-- Database: `administrationn`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorization`
--

CREATE TABLE `authorization` (
  `id` int(11) NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'ongoing',
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `matricule` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authorization`
--

INSERT INTO `authorization` (`id`, `from`, `to`, `description`, `status`, `date`, `matricule`) VALUES
(1, '15:00:00', '17:00:00', 'emergency at home.', 'rejected', '2021-05-29 16:42:38', '1800'),
(2, '10:00:00', '12:00:00', 'meeting.', 'accepted', '2021-05-26 20:17:34', '1803'),
(4, '10:00:00', '12:00:00', 'doctor\'s appointement.', 'ongoing', '2021-05-29 16:52:19', '1803');

-- --------------------------------------------------------

--
-- Table structure for table `balances`
--

CREATE TABLE `balances` (
  `leavebalance` int(11) NOT NULL DEFAULT 26,
  `authorizationbalance` int(11) NOT NULL DEFAULT 2,
  `matricule` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `id_holiday` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `matricule` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `holiday`
--

INSERT INTO `holiday` (`id_holiday`, `name`, `date`, `matricule`) VALUES
(5, 'Independance day', '2021-03-20', '1803'),
(6, 'Eid Fitr', '2021-05-13', '1803');

-- --------------------------------------------------------

--
-- Table structure for table `leavee`
--

CREATE TABLE `leavee` (
  `id` int(11) NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'ongoing' COMMENT 'accepté= accepted refusé= rejected ',
  `justification` varchar(256) DEFAULT NULL,
  `year` year(4) NOT NULL DEFAULT current_timestamp(),
  `matricule` varchar(20) NOT NULL,
  `id_type_leave` int(11) NOT NULL,
  `date_request` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leavee`
--

INSERT INTO `leavee` (`id`, `from`, `to`, `description`, `status`, `justification`, `year`, `matricule`, `id_type_leave`, `date_request`) VALUES
(1, '2021-05-06', '2021-11-06', 'My brother is getting married.', 'rejected', NULL, 2021, '1800', 1, '2021-06-03 11:44:45'),
(4, '2021-06-04', '2021-06-04', 'sqdqsd', 'accepted', '1622301395211044987160b25ad3d81a2.jpg', 2021, '1803', 3, '2021-06-03 11:44:45'),
(5, '2021-05-30', '2021-06-02', 'I am sick.', 'accepted', '16223109514522598960b280276ccbc.png', 2021, '1810', 2, '2021-06-03 11:44:45'),
(6, '2021-06-01', '2021-06-03', 'I am sick. ', 'accepted', '1622460888170919922960b4c9d85d092.jpg', 2021, '1800', 2, '2021-06-03 11:44:45'),
(7, '2021-07-09', '2021-07-11', 'sick.', 'accepted', '162258622535474651660b6b371f3b45.png', 2021, '1803', 2, '2021-06-03 11:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service`) VALUES
('centremedical'),
('informatique'),
('ressourceshumaines');

-- --------------------------------------------------------

--
-- Table structure for table `type_leave`
--

CREATE TABLE `type_leave` (
  `type` varchar(20) NOT NULL,
  `max_nbr_day` int(11) NOT NULL,
  `id_type_leave` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type_leave`
--

INSERT INTO `type_leave` (`type`, `max_nbr_day`, `id_type_leave`) VALUES
('Annual', 26, 1),
('Medical leave', 5, 2),
('Breavement leave sis', 2, 3),
('Breavement leave par', 3, 4),
('Maternity leave', 60, 5),
('Paternity leave', 1, 6),
('Marriage leave', 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `matricule` varchar(20) NOT NULL,
  `cin` varchar(20) NOT NULL,
  `email` varchar(155) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 0,
  `cnsscnpsnum` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `birthdate` date NOT NULL,
  `entrydate` date NOT NULL DEFAULT current_timestamp(),
  `position` varchar(20) NOT NULL,
  `employment` varchar(20) NOT NULL,
  `corps` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `direction` varchar(20) NOT NULL,
  `entity` varchar(20) NOT NULL,
  `place` varchar(20) NOT NULL,
  `service` varchar(20) NOT NULL,
  `affiliate` varchar(20) NOT NULL,
  `leavebalance` int(11) NOT NULL DEFAULT 26,
  `authorizationbalance` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`matricule`, `cin`, `email`, `password`, `name`, `lastname`, `role`, `cnsscnpsnum`, `gender`, `birthdate`, `entrydate`, `position`, `employment`, `corps`, `status`, `direction`, `entity`, `place`, `service`, `affiliate`, `leavebalance`, `authorizationbalance`) VALUES
('1789', '08030255', 'mouhamedtl@hotmail.com', 'pfe2021', 'Mouhamed', 'Tlili', 2, '1482397755', 'male', '1984-07-19', '2013-03-29', 'active', 'director', 'pss', 'ca', 'central', 'sol', 'tunis', 'ressourceshumaines', 'Tunisair-Express', 20, 5),
('1800', '15036699', 'bouchoucha20@gmail.com', 'tunisair2021', 'Aziz', 'Bouchoucha', 0, '1408997755', 'male', '1980-05-06', '2021-05-06', 'active', 'employee', 'pss', 'ca', 'central', 'sol', 'sfax', 'informatique', 'Tunisair-Express', 26, 2),
('1803', '15037269', 'salmach@gmail.com', 'tunisair123', 'Salma', 'Chaouch', 1, '1408897555', 'female', '1977-07-03', '2014-05-20', 'active', 'director', 'pss', 'ca', 'central', 'sol', 'tunis', 'informatique', 'Tunisair-Express', 26, 2),
('1807', '15036699', 'siwarselmi@hotmail.com', 'tunisair123', 'Siwar', 'Selmi', 2, '1037259977', 'female', '1983-03-28', '2011-11-28', 'active', 'director', 'pss', 'ca', 'central', 'sol', 'siege', 'informatique', 'Tunisair-Catering', 26, 2),
('1810', '06014434', 'fatmataboubi@gmail.com', 'tunisairpfe', 'Fatma', 'Taboubi', 3, '1037252277', 'female', '1990-08-18', '2015-10-29', 'active', 'employee', 'pss', 'ca', 'central', 'sol', 'tunis', 'ressourceshumaines', 'Tunisair-Express', 26, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorization`
--
ALTER TABLE `authorization`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matricule` (`matricule`);

--
-- Indexes for table `balances`
--
ALTER TABLE `balances`
  ADD KEY `matricule` (`matricule`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`id_holiday`),
  ADD KEY `matricule` (`matricule`);

--
-- Indexes for table `leavee`
--
ALTER TABLE `leavee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matricule` (`matricule`),
  ADD KEY `id_type_leave` (`id_type_leave`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service`);

--
-- Indexes for table `type_leave`
--
ALTER TABLE `type_leave`
  ADD PRIMARY KEY (`id_type_leave`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`matricule`),
  ADD KEY `service` (`service`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorization`
--
ALTER TABLE `authorization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `id_holiday` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `leavee`
--
ALTER TABLE `leavee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `type_leave`
--
ALTER TABLE `type_leave`
  MODIFY `id_type_leave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorization`
--
ALTER TABLE `authorization`
  ADD CONSTRAINT `authorization_ibfk_1` FOREIGN KEY (`matricule`) REFERENCES `user` (`matricule`);

--
-- Constraints for table `balances`
--
ALTER TABLE `balances`
  ADD CONSTRAINT `balances_ibfk_1` FOREIGN KEY (`matricule`) REFERENCES `user` (`matricule`);

--
-- Constraints for table `holiday`
--
ALTER TABLE `holiday`
  ADD CONSTRAINT `holiday_ibfk_1` FOREIGN KEY (`matricule`) REFERENCES `user` (`matricule`);

--
-- Constraints for table `leavee`
--
ALTER TABLE `leavee`
  ADD CONSTRAINT `leavee_ibfk_1` FOREIGN KEY (`matricule`) REFERENCES `user` (`matricule`),
  ADD CONSTRAINT `leavee_ibfk_2` FOREIGN KEY (`id_type_leave`) REFERENCES `type_leave` (`id_type_leave`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`service`) REFERENCES `service` (`service`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
