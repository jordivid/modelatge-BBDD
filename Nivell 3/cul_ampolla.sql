-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Temps de generació: 16-02-2021 a les 17:41:05
-- Versió del servidor: 10.4.14-MariaDB
-- Versió de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `cul_ampolla`
--
DROP SCHEMA IF EXISTS cul_ampolla;
CREATE DATABASE IF NOT EXISTS cul_ampolla;
use cul_ampolla;

-- --------------------------------------------------------

--
-- Estructura de la taula `cap_venda`
--

CREATE TABLE `cap_venda` (
  `id` int(11) NOT NULL,
  `data_venda` date NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `cap_venda`
--

INSERT INTO `cap_venda` (`id`, `data_venda`, `client_id`) VALUES
(1, '2021-02-15', 3),
(2, '2021-02-17', 5),
(3, '2021-02-16', 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `tip_via` enum('Carrer','Avinguda','Passeig','Plaça') NOT NULL,
  `via` varchar(100) NOT NULL,
  `numero` smallint(6) NOT NULL,
  `pis` tinyint(4) DEFAULT NULL,
  `porta` tinyint(4) DEFAULT NULL,
  `ciutat` varchar(30) NOT NULL,
  `cpostal` varchar(10) NOT NULL,
  `pais` varchar(20) NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `recomanacio_id` int(11) DEFAULT NULL,
  `registrat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `clients`
--

INSERT INTO `clients` (`id`, `nom`, `tip_via`, `via`, `numero`, `pis`, `porta`, `ciutat`, `cpostal`, `pais`, `telefon`, `email`, `recomanacio_id`, `registrat`) VALUES
(1, 'Perico Garcia', 'Carrer', 'Muntanya', 67, 3, 3, 'Reus', '43201', 'Espanya', '+34860468546', NULL, NULL, '2021-02-01'),
(2, 'Marta Campins', 'Plaça', 'Diamant', 4, 2, NULL, 'Barcelona', '08123', 'Espanya', '+348745344', 'martacam@gmail.com', NULL, '2021-02-03'),
(3, 'Josephine Montesquieu', 'Passeig', 'Les pommières', 34, 1, 3, 'Pau', '1389', 'França', '+3365465676', 'jmontesquieu@yahoo.fr', NULL, '2021-02-06'),
(4, 'Joan Llopis', 'Carrer', 'Barcelona', 9, NULL, NULL, 'La Bisbal d\'Empordà', '17100', 'Espanya', '+3468712934', 'jllopis@gmail.com', 2, '2021-02-10'),
(5, 'Jordi Magnànim', 'Avinguda', 'Màxima', 59, 1, 4, 'Tarragona', '43003', 'Espanya', '+3454665465', 'jm@hotmail.com', 1, '2021-02-12');

-- --------------------------------------------------------

--
-- Estructura de la taula `det_venda`
--

CREATE TABLE `det_venda` (
  `venda_id` int(11) NOT NULL,
  `ulleres_id` int(11) NOT NULL,
  `quantitat` tinyint(4) NOT NULL,
  `empleat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `det_venda`
--

INSERT INTO `det_venda` (`venda_id`, `ulleres_id`, `quantitat`, `empleat_id`) VALUES
(1, 5, 1, 4),
(1, 7, 2, 3),
(2, 3, 1, 2),
(2, 8, 1, 2),
(3, 6, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de la taula `empleats`
--

CREATE TABLE `empleats` (
  `id` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `empleats`
--

INSERT INTO `empleats` (`id`, `nom`) VALUES
(1, 'Pepito Grillo'),
(2, 'Juan Sin Tierra'),
(3, 'José Feliciano'),
(4, 'Ana Pérez');

-- --------------------------------------------------------

--
-- Estructura de la taula `marques`
--

CREATE TABLE `marques` (
  `id` int(11) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `proveidor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `marques`
--

INSERT INTO `marques` (`id`, `marca`, `proveidor_id`) VALUES
(1, 'Indo', 1),
(2, 'Ray-Ban', 2),
(3, 'Guess', 1),
(4, 'Polaroid', 2),
(5, 'Burberry', 2),
(6, 'Arnette', 3),
(7, 'Persol', 4);

-- --------------------------------------------------------

--
-- Estructura de la taula `proveidors`
--

CREATE TABLE `proveidors` (
  `id` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `tip_via` enum('Carrer','Avinguda','Passeig','Plaça') NOT NULL,
  `via` varchar(100) NOT NULL,
  `numero` smallint(6) NOT NULL,
  `pis` tinyint(4) DEFAULT NULL,
  `porta` tinyint(4) DEFAULT NULL,
  `ciutat` varchar(30) NOT NULL,
  `cpostal` varchar(10) NOT NULL,
  `pais` varchar(20) NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `nif` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `proveidors`
--

INSERT INTO `proveidors` (`id`, `nom`, `tip_via`, `via`, `numero`, `pis`, `porta`, `ciutat`, `cpostal`, `pais`, `telefon`, `fax`, `nif`) VALUES
(1, 'La Vista Gorda', 'Avinguda', 'Països Catalans', 6, NULL, NULL, 'Barcelona', '', 'Espanya', '+34934538291', NULL, '3992343Z'),
(2, 'Best Glasses', 'Avinguda', 'Acacia', 69, 5, 3, 'Londres', '73945', 'Regne Unit', '+4439438765', '+4447943865', 'W3454545T'),
(3, 'Lunettes Marcel', 'Carrer', 'Madame de Pompadour', 45, 1, NULL, 'Perpinyà', '2324A', 'França', '+33657456', '+33657676', 'R453454385'),
(4, 'Gafas Pérez', 'Plaça', 'Fàbregas', 2, 1, 3, 'Òrrius', '08374', 'Espanya', '+349834534', '+349993456', '87893455R');

-- --------------------------------------------------------

--
-- Estructura de la taula `recomanacions`
--

CREATE TABLE `recomanacions` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `recomanador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `recomanacions`
--

INSERT INTO `recomanacions` (`id`, `client_id`, `recomanador_id`) VALUES
(2, 4, 3),
(1, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `ulleres`
--

CREATE TABLE `ulleres` (
  `id` int(11) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `tipus` enum('flotant','pasta','metal·lica') NOT NULL,
  `color_m` varchar(15) NOT NULL,
  `graduacio_d` decimal(4,2) NOT NULL,
  `graduacio_e` decimal(4,2) NOT NULL,
  `color_d` varchar(15) NOT NULL,
  `color_e` varchar(15) NOT NULL,
  `preu` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `ulleres`
--

INSERT INTO `ulleres` (`id`, `marca_id`, `tipus`, `color_m`, `graduacio_d`, `graduacio_e`, `color_d`, `color_e`, `preu`) VALUES
(1, 5, 'pasta', 'marró', '2.50', '1.70', 'gris', 'blau', '120.00'),
(2, 5, 'pasta', 'verd', '1.50', '1.60', 'blanc', 'blanc', '130.00'),
(3, 2, 'metal·lica', 'blau', '0.00', '0.00', 'marró', 'marró', '90.00'),
(4, 3, 'pasta', 'rosa', '3.90', '3.50', 'blanc', 'blanc', '70.00'),
(5, 1, 'flotant', 'verd', '1.20', '1.20', 'blanc', 'blanc', '100.00'),
(6, 3, 'metal·lica', 'blau', '2.20', '1.90', 'blanc', 'blanc', '85.99'),
(7, 6, 'pasta', 'marró', '8.00', '7.00', 'blanc', 'blanc', '66.00'),
(8, 2, 'metal·lica', 'negre', '0.50', '0.75', 'blau', 'blau', '125.00');

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `cap_venda`
--
ALTER TABLE `cap_venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Índexs per a la taula `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recomanacio_id` (`recomanacio_id`) USING BTREE;

--
-- Índexs per a la taula `det_venda`
--
ALTER TABLE `det_venda`
  ADD UNIQUE KEY `venda_id` (`venda_id`,`ulleres_id`),
  ADD KEY `empleat_id` (`empleat_id`),
  ADD KEY `campolla.det_venda.ulleres_id` (`ulleres_id`);

--
-- Índexs per a la taula `empleats`
--
ALTER TABLE `empleats`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `marques`
--
ALTER TABLE `marques`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marca` (`marca`),
  ADD KEY `proveidor_id` (`proveidor_id`);

--
-- Índexs per a la taula `proveidors`
--
ALTER TABLE `proveidors`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `recomanacions`
--
ALTER TABLE `recomanacions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_id` (`client_id`,`recomanador_id`) USING BTREE,
  ADD KEY `campolla.recomanacions.recomanador_id` (`recomanador_id`);

--
-- Índexs per a la taula `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marca_id` (`marca_id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `cap_venda`
--
ALTER TABLE `cap_venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la taula `empleats`
--
ALTER TABLE `empleats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la taula `marques`
--
ALTER TABLE `marques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la taula `proveidors`
--
ALTER TABLE `proveidors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la taula `recomanacions`
--
ALTER TABLE `recomanacions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la taula `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `cap_venda`
--
ALTER TABLE `cap_venda`
  ADD CONSTRAINT `campolla.cap_venda.client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Restriccions per a la taula `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `campolla.clients.recomanacio_id` FOREIGN KEY (`recomanacio_id`) REFERENCES `recomanacions` (`id`);

--
-- Restriccions per a la taula `det_venda`
--
ALTER TABLE `det_venda`
  ADD CONSTRAINT `campolla.det_venda.empleat_id` FOREIGN KEY (`empleat_id`) REFERENCES `empleats` (`id`),
  ADD CONSTRAINT `campolla.det_venda.ulleres_id` FOREIGN KEY (`ulleres_id`) REFERENCES `ulleres` (`id`),
  ADD CONSTRAINT `campolla.det_venda.venda_id` FOREIGN KEY (`venda_id`) REFERENCES `cap_venda` (`id`);

--
-- Restriccions per a la taula `marques`
--
ALTER TABLE `marques`
  ADD CONSTRAINT `campolla.marques.proveidor_id` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidors` (`id`);

--
-- Restriccions per a la taula `recomanacions`
--
ALTER TABLE `recomanacions`
  ADD CONSTRAINT `campolla.recomanacions.client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `campolla.recomanacions.recomanador_id` FOREIGN KEY (`recomanador_id`) REFERENCES `clients` (`id`);

--
-- Restriccions per a la taula `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `campolla.ulleres.marca_id` FOREIGN KEY (`marca_id`) REFERENCES `marques` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
