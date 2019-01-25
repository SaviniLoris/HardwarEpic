-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 25, 2019 alle 17:41
-- Versione del server: 10.1.37-MariaDB
-- Versione PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hardwareepic`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `acquista`
--

CREATE TABLE `acquista` (
  `ID` int(10) UNSIGNED NOT NULL,
  `ID_ordine` int(10) UNSIGNED NOT NULL,
  `data` date NOT NULL,
  `admin` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `brand`
--

CREATE TABLE `brand` (
  `ID` int(10) UNSIGNED NOT NULL,
  `nome` varchar(40) NOT NULL,
  `anno_fondazione` date NOT NULL,
  `descrizione` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `carrello`
--

CREATE TABLE `carrello` (
  `username` varchar(25) NOT NULL,
  `ID_prodotto` int(10) UNSIGNED NOT NULL,
  `quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `ID` int(10) UNSIGNED NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `corriere`
--

CREATE TABLE `corriere` (
  `ID` int(10) UNSIGNED NOT NULL,
  `nome` varchar(40) NOT NULL,
  `stato` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `coupon`
--

CREATE TABLE `coupon` (
  `ID_coupon` varchar(15) NOT NULL,
  `sconto` int(11) NOT NULL,
  `validita` date NOT NULL,
  `ID_prodotto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `creditcard`
--

CREATE TABLE `creditcard` (
  `ID` int(11) NOT NULL,
  `numero_carta` char(16) NOT NULL,
  `data_scadenza` date NOT NULL,
  `cvv` char(3) NOT NULL,
  `username` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `groups`
--

CREATE TABLE `groups` (
  `ID` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(25) NOT NULL,
  `descrizione` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `groups_service`
--

CREATE TABLE `groups_service` (
  `ID_groups` int(10) UNSIGNED NOT NULL,
  `ID_service` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `immagine`
--

CREATE TABLE `immagine` (
  `ID` int(10) UNSIGNED NOT NULL,
  `titolo` varchar(70) NOT NULL,
  `percorso` varchar(100) NOT NULL,
  `ID_prodotto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordine`
--

CREATE TABLE `ordine` (
  `ID` int(10) UNSIGNED NOT NULL,
  `username` varchar(25) NOT NULL,
  `data_ordine` date NOT NULL,
  `totale` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotto`
--

CREATE TABLE `prodotto` (
  `ID` int(10) UNSIGNED NOT NULL,
  `nome` int(45) NOT NULL,
  `descrizione` text NOT NULL,
  `ID_brand` int(10) UNSIGNED NOT NULL,
  `ID_categoria` int(10) UNSIGNED NOT NULL,
  `prezzo` decimal(10,0) NOT NULL,
  `disponibilita` int(11) NOT NULL,
  `annouscita` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotto_ordine`
--

CREATE TABLE `prodotto_ordine` (
  `ID_prodotto` int(10) UNSIGNED NOT NULL,
  `ID_ordine` int(10) UNSIGNED NOT NULL,
  `quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `service`
--

CREATE TABLE `service` (
  `ID` int(10) UNSIGNED NOT NULL,
  `script` varchar(50) NOT NULL,
  `attivo` char(1) NOT NULL,
  `filtering` char(1) NOT NULL,
  `descrizione` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `spedisce`
--

CREATE TABLE `spedisce` (
  `ID_prodotto` int(10) UNSIGNED NOT NULL,
  `ID_corriere` int(10) UNSIGNED NOT NULL,
  `tracking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `username` varchar(25) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nome` varchar(35) DEFAULT NULL,
  `cognome` varchar(35) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `stato` varchar(15) DEFAULT NULL,
  `città` varchar(30) DEFAULT NULL,
  `indirizzo` varchar(60) DEFAULT NULL,
  `cap` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente_groups`
--

CREATE TABLE `utente_groups` (
  `username` varchar(25) NOT NULL,
  `ID_groups` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `whislist`
--

CREATE TABLE `whislist` (
  `username` varchar(25) NOT NULL,
  `ID_prodotto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `acquista`
--
ALTER TABLE `acquista`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `acquisto_admin` (`admin`);

--
-- Indici per le tabelle `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `carrello`
--
ALTER TABLE `carrello`
  ADD PRIMARY KEY (`username`,`ID_prodotto`),
  ADD KEY `carrello_prodotto` (`ID_prodotto`);

--
-- Indici per le tabelle `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `corriere`
--
ALTER TABLE `corriere`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`ID_coupon`),
  ADD KEY `coupon_prodotto` (`ID_prodotto`);

--
-- Indici per le tabelle `creditcard`
--
ALTER TABLE `creditcard`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `creditcard_utente` (`username`);

--
-- Indici per le tabelle `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `groups_service`
--
ALTER TABLE `groups_service`
  ADD PRIMARY KEY (`ID_groups`,`ID_service`),
  ADD KEY `service-groups_service` (`ID_service`);

--
-- Indici per le tabelle `immagine`
--
ALTER TABLE `immagine`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `immagine_prodotto` (`ID_prodotto`);

--
-- Indici per le tabelle `ordine`
--
ALTER TABLE `ordine`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ordine_username` (`username`);

--
-- Indici per le tabelle `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `prodotto_brand` (`ID_brand`),
  ADD KEY `prodotto_categoria` (`ID_categoria`);

--
-- Indici per le tabelle `prodotto_ordine`
--
ALTER TABLE `prodotto_ordine`
  ADD PRIMARY KEY (`ID_prodotto`,`ID_ordine`),
  ADD KEY `ordine-prodotto_ordine` (`ID_ordine`);

--
-- Indici per le tabelle `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `spedisce`
--
ALTER TABLE `spedisce`
  ADD PRIMARY KEY (`ID_prodotto`,`ID_corriere`),
  ADD KEY `corriere_spedisce` (`ID_corriere`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`username`);

--
-- Indici per le tabelle `utente_groups`
--
ALTER TABLE `utente_groups`
  ADD PRIMARY KEY (`username`,`ID_groups`),
  ADD KEY `groups-utente_groups` (`ID_groups`);

--
-- Indici per le tabelle `whislist`
--
ALTER TABLE `whislist`
  ADD KEY `utente_whislist` (`username`),
  ADD KEY `prodotto_whislist` (`ID_prodotto`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `acquista`
--
ALTER TABLE `acquista`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `brand`
--
ALTER TABLE `brand`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `corriere`
--
ALTER TABLE `corriere`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `creditcard`
--
ALTER TABLE `creditcard`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `groups`
--
ALTER TABLE `groups`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `immagine`
--
ALTER TABLE `immagine`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ordine`
--
ALTER TABLE `ordine`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prodotto`
--
ALTER TABLE `prodotto`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `service`
--
ALTER TABLE `service`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `carrello`
--
ALTER TABLE `carrello`
  ADD CONSTRAINT `carrello_prodotto` FOREIGN KEY (`ID_prodotto`) REFERENCES `prodotto` (`ID`),
  ADD CONSTRAINT `carrello_utente` FOREIGN KEY (`username`) REFERENCES `utente` (`username`);

--
-- Limiti per la tabella `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `coupon_prodotto` FOREIGN KEY (`ID_prodotto`) REFERENCES `prodotto` (`ID`);

--
-- Limiti per la tabella `creditcard`
--
ALTER TABLE `creditcard`
  ADD CONSTRAINT `creditcard_utente` FOREIGN KEY (`username`) REFERENCES `utente` (`username`);

--
-- Limiti per la tabella `groups_service`
--
ALTER TABLE `groups_service`
  ADD CONSTRAINT `groups-groups_service` FOREIGN KEY (`ID_groups`) REFERENCES `groups` (`ID`),
  ADD CONSTRAINT `service-groups_service` FOREIGN KEY (`ID_service`) REFERENCES `service` (`ID`);

--
-- Limiti per la tabella `immagine`
--
ALTER TABLE `immagine`
  ADD CONSTRAINT `immagine_prodotto` FOREIGN KEY (`ID_prodotto`) REFERENCES `prodotto` (`ID`);

--
-- Limiti per la tabella `ordine`
--
ALTER TABLE `ordine`
  ADD CONSTRAINT `ordine_username` FOREIGN KEY (`username`) REFERENCES `utente` (`username`);

--
-- Limiti per la tabella `prodotto`
--
ALTER TABLE `prodotto`
  ADD CONSTRAINT `prodotto_brand` FOREIGN KEY (`ID_brand`) REFERENCES `brand` (`ID`),
  ADD CONSTRAINT `prodotto_categoria` FOREIGN KEY (`ID_categoria`) REFERENCES `categoria` (`ID`);

--
-- Limiti per la tabella `prodotto_ordine`
--
ALTER TABLE `prodotto_ordine`
  ADD CONSTRAINT `ordine-prodotto_ordine` FOREIGN KEY (`ID_ordine`) REFERENCES `ordine` (`ID`),
  ADD CONSTRAINT `prodotto-prodotto_ordine` FOREIGN KEY (`ID_prodotto`) REFERENCES `prodotto` (`ID`);

--
-- Limiti per la tabella `spedisce`
--
ALTER TABLE `spedisce`
  ADD CONSTRAINT `corriere_spedisce` FOREIGN KEY (`ID_corriere`) REFERENCES `corriere` (`ID`),
  ADD CONSTRAINT `prodotto_spedisce` FOREIGN KEY (`ID_prodotto`) REFERENCES `prodotto` (`ID`);

--
-- Limiti per la tabella `utente_groups`
--
ALTER TABLE `utente_groups`
  ADD CONSTRAINT `groups-utente_groups` FOREIGN KEY (`ID_groups`) REFERENCES `groups` (`ID`),
  ADD CONSTRAINT `utente-utente_groups` FOREIGN KEY (`username`) REFERENCES `utente` (`username`);

--
-- Limiti per la tabella `whislist`
--
ALTER TABLE `whislist`
  ADD CONSTRAINT `prodotto_whislist` FOREIGN KEY (`ID_prodotto`) REFERENCES `prodotto` (`ID`),
  ADD CONSTRAINT `utente_whislist` FOREIGN KEY (`username`) REFERENCES `utente` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
