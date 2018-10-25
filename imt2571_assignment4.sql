-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25. Okt, 2018 18:08 PM
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
-- Database: `imt20000`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `belongsto`
--

CREATE TABLE `belongsto` (
  `belGroupName` varchar(60) COLLATE utf8_danish_ci NOT NULL,
  `belPersonName` varchar(60) COLLATE utf8_danish_ci NOT NULL,
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
  `eventVenName` varchar(40) COLLATE utf8_danish_ci NOT NULL,
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `belongsto`
--
ALTER TABLE `belongsto`
  ADD PRIMARY KEY (`belGroupName`,`belPersonName`),
  ADD KEY `belongsto_fk_person` (`belPersonName`),
  ADD KEY `belongsto_fk_group` (`belGroupName`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`cityName`,`cityCountyNo`),
  ADD KEY `city_fk` (`cityCountyNo`);

--
-- Indexes for table `county`
--
ALTER TABLE `county`
  ADD PRIMARY KEY (`countyNo`);

--
-- Indexes for table `event_table`
--
ALTER TABLE `event_table`
  ADD PRIMARY KEY (`eventName`,`eventYear`),
  ADD KEY `event_table_fk_category` (`eventCatId`),
  ADD KEY `event_table_fk_organizer` (`eventOrgId`),
  ADD KEY `event_table_fk_venue` (`eventVenName`,`eventBlockNo`,`eventStreet`,`eventZipCode`);

--
-- Indexes for table `givenby`
--
ALTER TABLE `givenby`
  ADD PRIMARY KEY (`givPerformerName`,`givPerformanceNo`),
  ADD UNIQUE KEY `givPerformanceNo` (`givPerformanceNo`),
  ADD KEY `givenby_fk_event` (`givEventName`,`givEventYear`),
  ADD KEY `givenby_fk_performer` (`givPerformerName`);

--
-- Indexes for table `group_table`
--
ALTER TABLE `group_table`
  ADD PRIMARY KEY (`groupName`),
  ADD KEY `group_table_fk` (`groupName`);

--
-- Indexes for table `organizer`
--
ALTER TABLE `organizer`
  ADD PRIMARY KEY (`organizerId`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`participantId`);

--
-- Indexes for table `performance`
--
ALTER TABLE `performance`
  ADD PRIMARY KEY (`performanceNo`);

--
-- Indexes for table `performer`
--
ALTER TABLE `performer`
  ADD PRIMARY KEY (`performerName`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`personName`),
  ADD KEY `person_fk` (`personName`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`phoneNo`),
  ADD KEY `phone_fk` (`phonePartId`);

--
-- Indexes for table `preference`
--
ALTER TABLE `preference`
  ADD PRIMARY KEY (`prefParticipantId`,`prefPerformerName`,`prefVenueName`,`prefVenueBlockNo`,`prefVenueStreet`,`prefVenueZipCode`),
  ADD KEY `preference_fk_performer` (`prefPerformerName`),
  ADD KEY `preference_fk_venue` (`prefVenueName`,`prefVenueBlockNo`,`prefVenueStreet`,`prefVenueZipCode`),
  ADD KEY `preference_fk_participant` (`prefParticipantId`);

--
-- Indexes for table `registers`
--
ALTER TABLE `registers`
  ADD PRIMARY KEY (`regParticipantId`,`regEventName`,`regEventYear`),
  ADD KEY `registers_fk_event` (`regEventName`,`regEventYear`),
  ADD KEY `registers_fk_participant` (`regParticipantId`);

--
-- Indexes for table `schedule_table`
--
ALTER TABLE `schedule_table`
  ADD PRIMARY KEY (`dateOfEvent`,`startTime`,`schEventName`,`schEventYear`),
  ADD KEY `schedule_table_fk` (`schEventName`,`schEventYear`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`venueName`,`blockNo`,`street`,`zipCode`),
  ADD KEY `venue_fk` (`venCityName`,`venCountyNo`);

--
-- Begrensninger for dumpede tabeller
--

--
-- Begrensninger for tabell `belongsto`
--
ALTER TABLE `belongsto`
  ADD CONSTRAINT `belongsto_fk_group` FOREIGN KEY (`belGroupName`) REFERENCES `group_table` (`groupName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `belongsto_fk_person` FOREIGN KEY (`belPersonName`) REFERENCES `person` (`personName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrensninger for tabell `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_fk` FOREIGN KEY (`cityCountyNo`) REFERENCES `county` (`countyNo`) ON UPDATE CASCADE;

--
-- Begrensninger for tabell `event_table`
--
ALTER TABLE `event_table`
  ADD CONSTRAINT `event_table_fk_category` FOREIGN KEY (`eventCatId`) REFERENCES `category` (`categoryId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `event_table_fk_organizer` FOREIGN KEY (`eventOrgId`) REFERENCES `organizer` (`organizerId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `event_table_fk_venue` FOREIGN KEY (`eventVenName`,`eventBlockNo`,`eventStreet`,`eventZipCode`) REFERENCES `venue` (`venueName`, `blockNo`, `street`, `zipCode`) ON UPDATE CASCADE;

--
-- Begrensninger for tabell `givenby`
--
ALTER TABLE `givenby`
  ADD CONSTRAINT `givenby_fk_event` FOREIGN KEY (`givEventName`,`givEventYear`) REFERENCES `event_table` (`eventName`, `eventYear`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `givenby_fk_performance` FOREIGN KEY (`givPerformanceNo`) REFERENCES `performance` (`performanceNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `givenby_fk_performer` FOREIGN KEY (`givPerformerName`) REFERENCES `performer` (`performerName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrensninger for tabell `group_table`
--
ALTER TABLE `group_table`
  ADD CONSTRAINT `group_table_fk` FOREIGN KEY (`groupName`) REFERENCES `performer` (`performerName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrensninger for tabell `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_fk` FOREIGN KEY (`personName`) REFERENCES `performer` (`performerName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrensninger for tabell `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `phone_fk` FOREIGN KEY (`phonePartId`) REFERENCES `participant` (`participantId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrensninger for tabell `preference`
--
ALTER TABLE `preference`
  ADD CONSTRAINT `preference_fk_participant` FOREIGN KEY (`prefParticipantId`) REFERENCES `participant` (`participantId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preference_fk_performer` FOREIGN KEY (`prefPerformerName`) REFERENCES `performer` (`performerName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preference_fk_venue` FOREIGN KEY (`prefVenueName`,`prefVenueBlockNo`,`prefVenueStreet`,`prefVenueZipCode`) REFERENCES `venue` (`venueName`, `blockNo`, `street`, `zipCode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrensninger for tabell `registers`
--
ALTER TABLE `registers`
  ADD CONSTRAINT `registers_fk_event` FOREIGN KEY (`regEventName`,`regEventYear`) REFERENCES `event_table` (`eventName`, `eventYear`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registers_fk_participant` FOREIGN KEY (`regParticipantId`) REFERENCES `participant` (`participantId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrensninger for tabell `schedule_table`
--
ALTER TABLE `schedule_table`
  ADD CONSTRAINT `schedule_table_fk` FOREIGN KEY (`schEventName`,`schEventYear`) REFERENCES `event_table` (`eventName`, `eventYear`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrensninger for tabell `venue`
--
ALTER TABLE `venue`
  ADD CONSTRAINT `venue_fk` FOREIGN KEY (`venCityName`,`venCountyNo`) REFERENCES `city` (`cityName`, `cityCountyNo`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
