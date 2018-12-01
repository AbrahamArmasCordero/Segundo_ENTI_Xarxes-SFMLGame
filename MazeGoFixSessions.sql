-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2018 at 03:17 PM
-- Server version: 5.7.24-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MazeGo`
--

-- --------------------------------------------------------

--
-- Table structure for table `Maps_Data`
--

CREATE TABLE `Maps_Data` (
  `MapID` int(11) NOT NULL,
  `MapName` varchar(10) NOT NULL,
  `MapInfo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Maps_Data`
--

INSERT INTO `Maps_Data` (`MapID`, `MapName`, `MapInfo`) VALUES
(1, 'Rock', 'Hola este es tu tutorial'),
(2, 'Fire', 'Hola,Soy otro Tutorial'),
(3, 'Frost', 'Te va a dejar Helado *');

-- --------------------------------------------------------

--
-- Table structure for table `Players_Data`
--

CREATE TABLE `Players_Data` (
  `PlayerID` int(11) NOT NULL,
  `PlayerUser` varchar(21) NOT NULL,
  `PlayerPass` varchar(21) NOT NULL,
  `Gold` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Players_Data`
--

INSERT INTO `Players_Data` (`PlayerID`, `PlayerUser`, `PlayerPass`, `Gold`) VALUES
(41, 'abraham', '123', 500),
(42, 'David', '456', 0),
(43, 'Mauri', '6969', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Pokemon_Data`
--

CREATE TABLE `Pokemon_Data` (
  `PokemonID` int(11) NOT NULL,
  `Name` varchar(21) NOT NULL,
  `Description` text NOT NULL,
  `Type` varchar(21) NOT NULL,
  `GoldForHour` int(11) NOT NULL,
  `SpawnPercentage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Pokemon_Data`
--

INSERT INTO `Pokemon_Data` (`PokemonID`, `Name`, `Description`, `Type`, `GoldForHour`, `SpawnPercentage`) VALUES
(5, 'Pikachu', '', 'Electrico', 30, 100),
(6, 'Bulbasur', '', 'Planta', 5, 100),
(7, 'Charizard', '', 'Fuego', 50, 30);

-- --------------------------------------------------------

--
-- Table structure for table `Pokemon_List`
--

CREATE TABLE `Pokemon_List` (
  `ListID` int(11) NOT NULL,
  `PlayerID_FK` int(11) NOT NULL,
  `PokemonID_FK` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Pokemon_List`
--

INSERT INTO `Pokemon_List` (`ListID`, `PlayerID_FK`, `PokemonID_FK`, `Quantity`) VALUES
(4, 41, 7, 10),
(5, 41, 5, 1),
(6, 42, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Sessions`
--

CREATE TABLE `Sessions` (
  `SesionID` int(11) NOT NULL,
  `PlayerID_FK` int(11) NOT NULL,
  `MapaID_FK` int(11) NOT NULL,
  `ConectionDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DesconectionDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Sessions`
--

INSERT INTO `Sessions` (`SesionID`, `PlayerID_FK`, `MapaID_FK`, `ConectionDate`, `DesconectionDate`) VALUES
(9, 43, 1, '2018-12-01 13:54:43', '2018-12-01 13:54:52'),
(10, 43, 1, '2018-12-01 13:55:12', '2018-12-01 13:55:42'),
(11, 43, 2, '2018-12-01 13:55:56', '2018-12-01 13:56:05'),
(12, 43, 2, '2018-12-01 13:56:08', '2018-12-01 13:56:17'),
(13, 43, 3, '2018-12-01 13:56:19', '2018-12-01 13:56:30'),
(14, 43, 3, '2018-12-01 13:56:34', '2018-12-01 13:57:04'),
(16, 42, 3, '2018-12-01 14:12:48', '2018-12-01 14:12:52'),
(17, 42, 1, '2018-12-01 14:12:56', '2018-12-01 14:12:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Maps_Data`
--
ALTER TABLE `Maps_Data`
  ADD PRIMARY KEY (`MapID`);

--
-- Indexes for table `Players_Data`
--
ALTER TABLE `Players_Data`
  ADD PRIMARY KEY (`PlayerID`),
  ADD UNIQUE KEY `PlayerUser` (`PlayerUser`);

--
-- Indexes for table `Pokemon_Data`
--
ALTER TABLE `Pokemon_Data`
  ADD PRIMARY KEY (`PokemonID`);

--
-- Indexes for table `Pokemon_List`
--
ALTER TABLE `Pokemon_List`
  ADD PRIMARY KEY (`ListID`),
  ADD KEY `pokemonDataRelation` (`PokemonID_FK`),
  ADD KEY `playerID` (`PlayerID_FK`);

--
-- Indexes for table `Sessions`
--
ALTER TABLE `Sessions`
  ADD PRIMARY KEY (`SesionID`),
  ADD KEY `playerSession` (`PlayerID_FK`),
  ADD KEY `sessionsRelation` (`MapaID_FK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Maps_Data`
--
ALTER TABLE `Maps_Data`
  MODIFY `MapID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Players_Data`
--
ALTER TABLE `Players_Data`
  MODIFY `PlayerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `Pokemon_Data`
--
ALTER TABLE `Pokemon_Data`
  MODIFY `PokemonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `Pokemon_List`
--
ALTER TABLE `Pokemon_List`
  MODIFY `ListID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Sessions`
--
ALTER TABLE `Sessions`
  MODIFY `SesionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Pokemon_List`
--
ALTER TABLE `Pokemon_List`
  ADD CONSTRAINT `playerID` FOREIGN KEY (`PlayerID_FK`) REFERENCES `Players_Data` (`PlayerID`),
  ADD CONSTRAINT `pokemonDataRelation` FOREIGN KEY (`PokemonID_FK`) REFERENCES `Pokemon_Data` (`PokemonID`);

--
-- Constraints for table `Sessions`
--
ALTER TABLE `Sessions`
  ADD CONSTRAINT `playerSession` FOREIGN KEY (`PlayerID_FK`) REFERENCES `Players_Data` (`PlayerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sessionsRelation` FOREIGN KEY (`MapaID_FK`) REFERENCES `Maps_Data` (`MapID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
