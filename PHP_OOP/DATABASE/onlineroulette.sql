-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2018 at 10:08 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineroulette`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `UserID` int(11) NOT NULL,
  `Salary` int(11) NOT NULL,
  `Position` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`UserID`, `Salary`, `Position`) VALUES
(1, 999999999, 'Owner');

-- --------------------------------------------------------

--
-- Table structure for table `bet`
--

CREATE TABLE `bet` (
  `UserID` int(11) NOT NULL,
  `RoundNo` int(11) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Choice` varchar(255) NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bettype`
--

CREATE TABLE `bettype` (
  `Name` varchar(255) NOT NULL,
  `Multiplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bettype`
--

INSERT INTO `bettype` (`Name`, `Multiplier`) VALUES
('Color', 6),
('Number', 3),
('OddEven', 9);

-- --------------------------------------------------------

--
-- Table structure for table `casino`
--

CREATE TABLE `casino` (
  `name` varchar(255) DEFAULT NULL,
  `maxtable` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `casino`
--

INSERT INTO `casino` (`name`, `maxtable`) VALUES
('SAD', 5);

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE `dealer` (
  `UserID` int(11) NOT NULL,
  `Salary` int(11) NOT NULL,
  `DealerStatus` enum('Assigned','Wait') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dealer`
--

INSERT INTO `dealer` (`UserID`, `Salary`, `DealerStatus`) VALUES
(2, 350000, 'Wait'),
(3, 350000, 'Wait');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `UserID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `CreditStatus` enum('Positive','Negative') NOT NULL,
  `PlayerStatus` enum('NotBan','Ban') NOT NULL,
  `Balance` int(11) NOT NULL,
  `WinCount` int(11) NOT NULL,
  `LoseCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`UserID`, `AccountID`, `CreditStatus`, `PlayerStatus`, `Balance`, `WinCount`, `LoseCount`) VALUES
(4, 1, 'Positive', 'NotBan', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `RoundNo` int(11) NOT NULL,
  `Number` int(11) NOT NULL,
  `Color` varchar(255) NOT NULL,
  `OddEven` enum('Odd','Even') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `round`
--

CREATE TABLE `round` (
  `RoundNo` int(11) NOT NULL,
  `TableNo` int(11) NOT NULL,
  `RoundStatus` enum('Playing','Finished') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `TableNo` int(11) NOT NULL,
  `MaxPlayer` int(11) NOT NULL,
  `BetLimit` int(11) NOT NULL,
  `TableStatus` enum('OPEN','CLOSE') NOT NULL,
  `StartTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`TableNo`, `MaxPlayer`, `BetLimit`, `TableStatus`, `StartTime`) VALUES
(1, 4, 50000, 'CLOSE', NULL),
(2, 4, 80000, 'CLOSE', NULL),
(3, 6, 100000, 'CLOSE', NULL),
(4, 8, 300000, 'CLOSE', NULL),
(5, 12, 600000, 'CLOSE', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `TYPE` enum('Admin','Dealer','Player') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `FirstName`, `LastName`, `UserName`, `Password`, `TYPE`) VALUES
(1, 'Apiwat', 'Thaiphakdee', 'Kenjitong', '101', 'Admin'),
(2, 'Ronnie', 'Carter', 'RonnieCarter', '201', 'Dealer'),
(3, 'Judd', 'Higgins', 'JuddHiggins', '202', 'Dealer'),
(4, 'Somchai', 'Kuki', 'SomchaiKuki', '301', 'Player');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `bet`
--
ALTER TABLE `bet`
  ADD KEY `UserID` (`UserID`),
  ADD KEY `RoundNo` (`RoundNo`),
  ADD KEY `Type` (`Type`);

--
-- Indexes for table `bettype`
--
ALTER TABLE `bettype`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`AccountID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`RoundNo`);

--
-- Indexes for table `round`
--
ALTER TABLE `round`
  ADD PRIMARY KEY (`RoundNo`),
  ADD KEY `TableNo` (`TableNo`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`TableNo`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `AccountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `round`
--
ALTER TABLE `round`
  MODIFY `RoundNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `TableNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `bet`
--
ALTER TABLE `bet`
  ADD CONSTRAINT `bet_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `bet_ibfk_2` FOREIGN KEY (`RoundNo`) REFERENCES `round` (`RoundNo`),
  ADD CONSTRAINT `bet_ibfk_3` FOREIGN KEY (`Type`) REFERENCES `bettype` (`Name`);

--
-- Constraints for table `dealer`
--
ALTER TABLE `dealer`
  ADD CONSTRAINT `dealer_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`RoundNo`) REFERENCES `round` (`RoundNo`);

--
-- Constraints for table `round`
--
ALTER TABLE `round`
  ADD CONSTRAINT `round_ibfk_1` FOREIGN KEY (`TableNo`) REFERENCES `tables` (`TableNo`);


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for table admin
--

--
-- Metadata for table bet
--

--
-- Metadata for table bettype
--

--
-- Metadata for table casino
--

--
-- Metadata for table dealer
--

--
-- Metadata for table player
--

--
-- Metadata for table result
--

--
-- Metadata for table round
--

--
-- Metadata for table tables
--

--
-- Metadata for table user
--

--
-- Metadata for database onlineroulette
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
