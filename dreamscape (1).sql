-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 19 jan 2024 om 10:42
-- Serverversie: 10.4.17-MariaDB
-- PHP-versie: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dream-scape`
--
CREATE DATABASE IF NOT EXISTS `dream-scape` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dream-scape`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bids`
--

CREATE TABLE `bids` (
  `Id` int(11) NOT NULL,
  `BidderId` int(11) NOT NULL,
  `ItemOfferingId` int(11) NOT NULL,
  `BidItemId` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `DeletedAt` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `itemofferings`
--

CREATE TABLE `itemofferings` (
  `Id` int(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `SellerUserId` int(11) NOT NULL,
  `SellerId` int(11) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `DeletedAt` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `items`
--

CREATE TABLE `items` (
  `Id` int(11) NOT NULL,
  `Name` longtext NOT NULL,
  `Description` longtext NOT NULL,
  `Type` int(11) NOT NULL,
  `Rarity` int(11) DEFAULT NULL,
  `Power` int(11) DEFAULT NULL,
  `Speed` int(11) DEFAULT NULL,
  `Durability` int(11) DEFAULT NULL,
  `Magic` int(11) DEFAULT NULL,
  `ImagePath` longtext DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `DeletedAt` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `items`
--

INSERT INTO `items` (`Id`, `Name`, `Description`, `Type`, `Rarity`, `Power`, `Speed`, `Durability`, `Magic`, `ImagePath`, `CreatedAt`, `UpdatedAt`, `DeletedAt`) VALUES
(1, 'Vlammenzwaard', 'Een zwaard doordrenkt met vlammende energie.', 0, 85, 90, 70, 80, 60, 'images/vlammenzwaard.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(2, 'Schaduwkap', 'Een mysterieuze kap die de drager in duisternis hult.', 1, 40, 20, 40, 90, 50, 'images/schaduwkap.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(3, 'Amulet van Genezing', 'Een amulet dat helende krachten bezit.', 2, 15, 10, 50, 70, 90, 'images/amulet_van_genezing.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(4, 'Bliksempistool', 'Een vuurwapen dat dodelijke bliksemprojectielen afvuurt.', 0, 80, 70, 90, 60, 30, 'images/bliksempistool.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(5, 'IJzeren Harnas', 'Een stevig harnas dat bescherming biedt tegen fysieke aanvallen.', 1, 30, 30, 20, 100, 0, 'images/ijzeren_harnas.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(6, 'Ring van Onzichtbaarheid', 'Een ring die de drager onzichtbaar maakt voor vijanden.', 2, 90, 0, 80, 50, 50, 'images/ring_van_onzichtbaarheid.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(7, 'Toverstaf van Verwarring', 'Een toverstaf die vijanden in verwarring brengt.', 0, 50, 60, 60, 50, 80, 'images/toverstaf_van_verwarring.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(8, 'Drakenschild', 'Een schild gemaakt van drakenschubben dat vuuraanvallen absorbeert.', 1, 85, 20, 30, 90, 40, 'images/drakenschild.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(9, 'Amulet van Levitatie', 'Een amulet waarmee de drager kan zweven.', 2, 60, 10, 70, 50, 70, 'images/amulet_van_levitatie.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(10, 'Zwaard van Licht', 'Een zwaard dat stralend licht uitstraalt en duistere wezens schade toebrengt.', 0, 95, 80, 50, 70, 40, 'images/zwaard_van_licht.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(11, 'Kristallen Pantser', 'Een pantser gemaakt van glinsterende kristallen dat magische aanvallen afweert.', 1, 80, 10, 40, 80, 70, 'images/kristallen_pantser.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(12, 'Amulet van Eeuwig Leven', 'Een amulet dat de drager onsterfelijkheid schenkt.', 2, 100, 0, 60, 50, 100, 'images/amulet_van_eeuwig_leven.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(13, 'Giftige Dolk', 'Een dolk bedekt met dodelijk gif.', 0, 70, 50, 90, 40, 30, 'images/giftige_dolk.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(14, 'Drakenhuiden', 'Een harnas gemaakt van drakenhuid dat vuuraanvallen weerkaatst.', 1, 85, 10, 20, 90, 20, 'images/drakenhuiden.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(15, 'Ring van Kracht', 'Een ring die de fysieke kracht van de drager vergroot.', 2, 80, 60, 30, 40, 10, 'images/ring_van_kracht.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(16, 'Boog van de Wind', 'Een boog die pijlen afvuurt met de kracht van de wind.', 0, 75, 40, 80, 50, 50, 'images/boog_van_de_wind.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(17, 'Schubbenharnas', 'Een harnas gemaakt van drakenschubben dat fysieke aanvallen vermindert.', 1, 70, 10, 10, 100, 0, 'images/schubbenharnas.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(18, 'Amulet van Wijsheid', 'Een amulet dat de wijsheid en kennis van de drager vergroot.', 2, 90, 0, 40, 60, 90, 'images/amulet_van_wijsheid.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(19, 'Vuurzwaard', 'Een zwaard dat brandende vuurprojectielen afvuurt.', 0, 50, 70, 50, 60, 30, 'images/vuurzwaard.png', '0001-01-01 00:00:00.000000', NULL, NULL),
(20, 'Betoverde Laarzen', 'Laarzen die de snelheid en behendigheid van de drager verhogen.', 1, 75, 20, 90, 60, 10, 'images/betoverde_laarzen.png', '0001-01-01 00:00:00.000000', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `useritems`
--

CREATE TABLE `useritems` (
  `UserId` int(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Username` longtext NOT NULL,
  `Email` longtext NOT NULL,
  `Password` longtext NOT NULL,
  `Role` tinyint(3) UNSIGNED NOT NULL,
  `ImagePath` longtext DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `DeletedAt` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`Id`, `Username`, `Email`, `Password`, `Role`, `ImagePath`, `CreatedAt`, `DeletedAt`) VALUES
(1, 'admin', 'admin', '$2y$10$iYqEwXhP6.jjYaLazEPKr.UUwlnba2EnoeqQ9hZZJU3q2/HWM5686', 0, NULL, '2023-06-25 18:12:22.000000', NULL),
(3, 'user', 'user', '$2y$10$.Ajcsi6bVAdTKvjJ/0JAGeiwfsc2yvBfaBb8dQbpzb0WkTPiS9ih2', 1, NULL, '2023-06-25 18:13:51.000000', NULL);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Bids_BidderId` (`BidderId`),
  ADD KEY `IX_Bids_BidItemId` (`BidItemId`),
  ADD KEY `IX_Bids_ItemOfferingId` (`ItemOfferingId`);

--
-- Indexen voor tabel `itemofferings`
--
ALTER TABLE `itemofferings`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_ItemOfferings_ItemId` (`ItemId`),
  ADD KEY `IX_ItemOfferings_SellerId` (`SellerId`);

--
-- Indexen voor tabel `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`Id`);

--
-- Indexen voor tabel `useritems`
--
ALTER TABLE `useritems`
  ADD PRIMARY KEY (`UserId`,`ItemId`),
  ADD KEY `IX_UserItems_ItemId` (`ItemId`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `bids`
--
ALTER TABLE `bids`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `itemofferings`
--
ALTER TABLE `itemofferings`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `items`
--
ALTER TABLE `items`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `FK_Bids_ItemOfferings_ItemOfferingId` FOREIGN KEY (`ItemOfferingId`) REFERENCES `itemofferings` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Bids_Items_BidItemId` FOREIGN KEY (`BidItemId`) REFERENCES `items` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Bids_Users_BidderId` FOREIGN KEY (`BidderId`) REFERENCES `users` (`Id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `itemofferings`
--
ALTER TABLE `itemofferings`
  ADD CONSTRAINT `FK_ItemOfferings_Items_ItemId` FOREIGN KEY (`ItemId`) REFERENCES `items` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_ItemOfferings_Users_SellerId` FOREIGN KEY (`SellerId`) REFERENCES `users` (`Id`);

--
-- Beperkingen voor tabel `useritems`
--
ALTER TABLE `useritems`
  ADD CONSTRAINT `FK_UserItems_Items_ItemId` FOREIGN KEY (`ItemId`) REFERENCES `items` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_UserItems_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
