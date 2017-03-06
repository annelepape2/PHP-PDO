-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Mar 05, 2017 at 11:59 PM
-- Server version: 5.5.41-log
-- PHP Version: 5.6.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `php_tp1`
--

-- --------------------------------------------------------

--
-- Table structure for table `ennemis`
--

CREATE TABLE IF NOT EXISTS `ennemis` (
`id` smallint(5) unsigned NOT NULL,
  `nom` varchar(50) NOT NULL,
  `degats` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `experience` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `niveau` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `nbCoups` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dateDernierCoup` date NOT NULL,
  `pv` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ennemis`
--

INSERT INTO `ennemis` (`id`, `nom`, `degats`, `experience`, `niveau`, `nbCoups`, `dateDernierCoup`, `pv`) VALUES
(1, 'ldd', 0, 0, 1, 0, '0000-00-00', NULL),
(2, 'tulip', 0, 0, 1, 0, '0000-00-00', NULL),
(3, 'mÃ©chant', 0, 0, 1, 0, '0000-00-00', NULL),
(4, 'lopez ', 0, 0, 1, 0, '0000-00-00', NULL),
(5, 'matuidicharo', 0, 0, 1, 0, '0000-00-00', NULL),
(6, 'janice', 0, 0, 1, 0, '0000-00-00', NULL),
(7, 'ji', 0, 0, 1, 0, '0000-00-00', NULL),
(8, 'test', 0, 0, 1, 0, '0000-00-00', NULL),
(9, 'bastien', 0, 0, 1, 0, '0000-00-00', NULL),
(10, 'fadela', 0, 0, 1, 0, '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hero`
--

CREATE TABLE IF NOT EXISTS `hero` (
`id` int(11) NOT NULL,
  `classe` varchar(45) DEFAULT NULL,
  `pv` int(11) DEFAULT NULL,
  `experience` tinyint(4) NOT NULL,
  `niveau` tinyint(4) NOT NULL,
  `pvitesse` int(11) DEFAULT NULL,
  `pdefense` int(11) DEFAULT NULL,
  `pattaque` int(11) DEFAULT NULL,
  `pmagie` int(11) DEFAULT NULL,
  `bourse` varchar(45) DEFAULT NULL,
  `joueur_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `hero`
--

INSERT INTO `hero` (`id`, `classe`, `pv`, `experience`, `niveau`, `pvitesse`, `pdefense`, `pattaque`, `pmagie`, `bourse`, `joueur_id`, `nom`) VALUES
(1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 0, ''),
(6, NULL, 0, 6, 1, NULL, NULL, NULL, NULL, NULL, 0, 'dragon'),
(19, NULL, 32, 28, 1, NULL, NULL, NULL, NULL, NULL, 0, 'janice'),
(23, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'fadela'),
(24, NULL, 100, 68, 1, NULL, NULL, NULL, NULL, NULL, 0, 'matuidicharo');

-- --------------------------------------------------------

--
-- Table structure for table `joueur`
--

CREATE TABLE IF NOT EXISTS `joueur` (
`id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `joueur`
--

INSERT INTO `joueur` (`id`, `nom`, `prenom`, `pseudo`, `password`, `email`) VALUES
(1, 'jack', 'jean', 'jack', 'bonjour', 'coucou@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `personnages`
--

CREATE TABLE IF NOT EXISTS `personnages` (
`id` smallint(5) unsigned NOT NULL,
  `nom` varchar(50) NOT NULL,
  `pv` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `experience` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `niveau` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `nbCoups` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dateDernierCoup` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `personnages`
--

INSERT INTO `personnages` (`id`, `nom`, `pv`, `experience`, `niveau`, `nbCoups`, `dateDernierCoup`) VALUES
(12, 'marcel', 15, 80, 2, 3, '2017-02-22'),
(14, 'mike', 59, 15, 1, 3, '2017-02-22');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL,
  `classe` varchar(45) DEFAULT NULL,
  `pv` int(11) DEFAULT NULL,
  `pvitesse` int(11) DEFAULT NULL,
  `pdefense` int(11) DEFAULT NULL,
  `pattaque` int(11) DEFAULT NULL,
  `pmagie` int(11) DEFAULT NULL,
  `bourse` varchar(45) DEFAULT NULL,
  `joueur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `username`, `password`) VALUES
(1, 'anne', 'coucou@g.com', 'annehelene', '355b1bbfc96725cdce8f4a2708fda310a80e6d13315aec4e5eed2a75fe8032ce'),
(2, 'anne', 'anne-helene.le_pape@devinci.fr', 'Anne', 'cb3ee52199de0ef333191a53756dee2f99e365f5183b7527f7a376515d3d898a'),
(3, 'test', 'annelepape2@gmail.com', 'bap2016', 'cb5b1d60fe45a0a8cf3d4d262dcd51277f1295063b20280ac249b75819d42900'),
(4, 'joue', 'ANNE@OGJEK.COM', 'abc', 'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad'),
(5, 'nou', 'nou@nou.nou', 'nou', 'd89d557fdf6330ffa41b722f7359660f988d541996df52bbdd8c3c6c2f8f3ce8'),
(6, 'testgit', 'testgit@vvv.com', 'testgit', 'a2542d8e36feac778a0f3b306c9a8ede1e15762a4e495959d9c19eeaa74fa7af'),
(7, 'annevv', 'amandine.le-pape@hotmail.fr', 'annevv', 'c6966ec32b1bec968ec0dad25ae75d3a8848c74ac56056e9940d15cc4b222f37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ennemis`
--
ALTER TABLE `ennemis`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nom` (`nom`);

--
-- Indexes for table `hero`
--
ALTER TABLE `hero`
 ADD PRIMARY KEY (`id`,`joueur_id`), ADD KEY `fk_hero_joueur1_idx` (`joueur_id`);

--
-- Indexes for table `joueur`
--
ALTER TABLE `joueur`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personnages`
--
ALTER TABLE `personnages`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nom` (`nom`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ennemis`
--
ALTER TABLE `ennemis`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `hero`
--
ALTER TABLE `hero`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `joueur`
--
ALTER TABLE `joueur`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `personnages`
--
ALTER TABLE `personnages`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
