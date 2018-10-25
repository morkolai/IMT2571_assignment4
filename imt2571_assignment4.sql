-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25. Okt, 2018 13:50 PM
-- Tjener-versjon: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imt2571_assignment4`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `belongsto`
--

CREATE TABLE `belongsto` (
  `groupName` varchar(60) COLLATE utf8_danish_ci NOT NULL,
  `personName` varchar(60) COLLATE utf8_danish_ci NOT NULL,
  `dateOfJoining` date NOT NULL,
  `role` varchar(20) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `category`
--

CREATE TABLE `category` (
  `categoryId` int(10) UNSIGNED NOT NULL,
  `categoryName` varchar(30) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `city`
--

CREATE TABLE `city` (
  `cityName` varchar(20) COLLATE utf8_danish_ci NOT NULL,
  `cityCountyNo` char(2) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `county`
--

CREATE TABLE `county` (
  `countyNo` char(2) COLLATE utf8_danish_ci NOT NULL,
  `countyName` varchar(2) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `event_table`
--

CREATE TABLE `event_table` (
  `eventName` varchar(40) COLLATE utf8_danish_ci NOT NULL,
  `eventYear` year(4) NOT NULL,
  `priceAdult` decimal(6,2) NOT NULL,
  `priceChild` decimal(6,2) NOT NULL,
  `eventCatId` int(10) UNSIGNED NOT NULL,
  `eventOrgId` int(10) UNSIGNED NOT NULL,
  `evntVenName` varchar(40) COLLATE utf8_danish_ci NOT NULL,
  `eventBlockNo` int(10) UNSIGNED NOT NULL,
  `eventStreet` varchar(20) COLLATE utf8_danish_ci NOT NULL,
  `eventZipCode` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `givenby`
--

CREATE TABLE `givenby` (
  `givPerformerName` varchar(60) COLLATE utf8_danish_ci NOT NULL,
  `givPerformanceNo` int(10) UNSIGNED NOT NULL,
  `givEventName` varchar(40) COLLATE utf8_danish_ci NOT NULL,
  `givEventYear` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `group_table`
--

CREATE TABLE `group_table` (
  `groupName` varchar(60) COLLATE utf8_danish_ci NOT NULL,
  `formationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `organizer`
--

CREATE TABLE `organizer` (
  `organizerId` int(10) UNSIGNED NOT NULL,
  `organizerName` varchar(30) COLLATE utf8_danish_ci NOT NULL,
  `contactPerson` varchar(60) COLLATE utf8_danish_ci NOT NULL,
  `organizerPhoneNo` varchar(32) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `participant`
--

CREATE TABLE `participant` (
  `participantId` int(10) UNSIGNED NOT NULL,
  `firstName` varchar(20) COLLATE utf8_danish_ci NOT NULL,
  `middleName` varchar(20) COLLATE utf8_danish_ci NOT NULL,
  `lastName` varchar(20) COLLATE utf8_danish_ci NOT NULL,
  `participantEmail` varchar(250) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `performance`
--

CREATE TABLE `performance` (
  `performanceNo` int(10) UNSIGNED NOT NULL,
  `perfEventName` varchar(40) COLLATE utf8_danish_ci NOT NULL,
  `perfEventYear` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `performer`
--

CREATE TABLE `performer` (
  `performerName` varchar(60) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `person`
--

CREATE TABLE `person` (
  `personName` varchar(60) COLLATE utf8_danish_ci NOT NULL,
  `dayOfBirth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `phone`
--

CREATE TABLE `phone` (
  `phonePartId` int(10) UNSIGNED NOT NULL,
  `phoneNo` varchar(32) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `preference`
--

CREATE TABLE `preference` (
  `prefParticipantId` int(10) UNSIGNED NOT NULL,
  `prefPerformerName` varchar(60) COLLATE utf8_danish_ci NOT NULL,
  `prefVenueName` varchar(40) COLLATE utf8_danish_ci NOT NULL,
  `prefVenueBlockNo` int(10) UNSIGNED NOT NULL,
  `prefVenueStreet` varchar(20) COLLATE utf8_danish_ci NOT NULL,
  `prefVenueZipCode` int(9) NOT NULL,
  `notifyType` enum('sms','email') COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `registers`
--

CREATE TABLE `registers` (
  `regParticipantId` int(10) UNSIGNED NOT NULL,
  `regEventName` varchar(40) COLLATE utf8_danish_ci NOT NULL,
  `regEventYear` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `schedule_table`
--

CREATE TABLE `schedule_table` (
  `dateOfEvent` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `schEventName` varchar(40) COLLATE utf8_danish_ci NOT NULL,
  `schEventYear` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `venue`
--

CREATE TABLE `venue` (
  `venueName` varchar(40) COLLATE utf8_danish_ci NOT NULL,
  `blockNo` int(10) UNSIGNED NOT NULL,
  `street` varchar(20) COLLATE utf8_danish_ci NOT NULL,
  `zipCode` int(9) NOT NULL,
  `phone` varchar(32) COLLATE utf8_danish_ci NOT NULL,
  `venCityName` varchar(20) COLLATE utf8_danish_ci NOT NULL,
  `venCountyNo` char(2) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
