-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Jeu 16 Mars 2017 à 00:35
-- Version du serveur :  5.6.33
-- Version de PHP :  7.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `php_tp1`
--

-- --------------------------------------------------------

--
-- Structure de la table `ennemis`
--

CREATE TABLE `ennemis` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL,
  `degats` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `experience` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `niveau` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `nbCoups` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `dateDernierCoup` date NOT NULL,
  `pv` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ennemis`
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
-- Structure de la table `hero`
--

CREATE TABLE `hero` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `hero`
--

INSERT INTO `hero` (`id`, `classe`, `pv`, `experience`, `niveau`, `pvitesse`, `pdefense`, `pattaque`, `pmagie`, `bourse`, `joueur_id`, `nom`) VALUES
(1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 0, ''),
(6, NULL, 0, 6, 1, NULL, NULL, NULL, NULL, NULL, 0, 'dragon'),
(19, NULL, 32, 28, 1, NULL, NULL, NULL, NULL, NULL, 0, 'janice'),
(23, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 'fadela'),
(24, NULL, 100, 68, 1, NULL, NULL, NULL, NULL, NULL, 0, 'matuidicharo');

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE `joueur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `joueur`
--

INSERT INTO `joueur` (`id`, `nom`, `prenom`, `pseudo`, `password`, `email`) VALUES
(1, 'jack', 'jean', 'jack', 'bonjour', 'coucou@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `personnages`
--

CREATE TABLE `personnages` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL,
  `pv` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `experience` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `niveau` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `nbCoups` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `dateDernierCoup` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `personnages`
--

INSERT INTO `personnages` (`id`, `nom`, `pv`, `experience`, `niveau`, `nbCoups`, `dateDernierCoup`) VALUES
(12, 'marcel', 15, 80, 2, 3, '2017-02-22'),
(14, 'mike', 59, 15, 1, 3, '2017-02-22');

-- --------------------------------------------------------

--
-- Structure de la table `personnages_v2`
--

CREATE TABLE `personnages_v2` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nom` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `degats` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `timeEndormi` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` enum('magicien','guerrier') COLLATE latin1_general_ci NOT NULL,
  `atout` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `pv` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `experience` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `argent` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `personnages_v2`
--

INSERT INTO `personnages_v2` (`id`, `nom`, `degats`, `timeEndormi`, `type`, `atout`, `pv`, `experience`, `argent`) VALUES
(15, 'sorey', 0, 0, '', 0, 100, 0, 0),
(18, 'gai', 0, 0, 'magicien', 0, 25, 0, 4),
(17, 'matuiidicharo', 0, 0, 'magicien', 0, 65, 0, 1),
(19, 'hfh', 0, 0, 'guerrier', 0, 101, 0, 8),
(20, 'kit', 0, 0, 'guerrier', 0, 103, 0, 7),
(21, 'jo', 0, 0, 'magicien', 0, 100, 0, 0),
(22, 'ju', 0, 0, 'magicien', 0, 100, 0, 0),
(23, 'kijim', 0, 0, 'guerrier', 0, 90, 0, 2),
(24, 'dragon', 0, 0, 'magicien', 0, 100, 0, 0),
(25, 'paladin', 0, 0, 'magicien', 0, 100, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

CREATE TABLE `test` (
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
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `username`, `password`) VALUES
(1, 'anne', 'coucou@g.com', 'annehelene', '355b1bbfc96725cdce8f4a2708fda310a80e6d13315aec4e5eed2a75fe8032ce'),
(2, 'anne', 'anne-helene.le_pape@devinci.fr', 'Anne', 'cb3ee52199de0ef333191a53756dee2f99e365f5183b7527f7a376515d3d898a'),
(3, 'test', 'annelepape2@gmail.com', 'bap2016', 'cb5b1d60fe45a0a8cf3d4d262dcd51277f1295063b20280ac249b75819d42900'),
(4, 'joue', 'ANNE@OGJEK.COM', 'abc', 'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad'),
(5, 'nou', 'nou@nou.nou', 'nou', 'd89d557fdf6330ffa41b722f7359660f988d541996df52bbdd8c3c6c2f8f3ce8'),
(6, 'testgit', 'testgit@vvv.com', 'testgit', 'a2542d8e36feac778a0f3b306c9a8ede1e15762a4e495959d9c19eeaa74fa7af'),
(7, 'annevv', 'amandine.le-pape@hotmail.fr', 'annevv', 'c6966ec32b1bec968ec0dad25ae75d3a8848c74ac56056e9940d15cc4b222f37'),
(8, 'iim', 'iim@app.com', 'iim', '0a4a13d5ba1e2366bc77541bb1e7950237fe88034bf0f98eb4a71b873e7fb481'),
(9, 'janice', 'janice@gmail.com', 'janice', '3db331ef614507e4cfff401fddf554cd8d34c9c931612962613be4aa9a82beb8');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `ennemis`
--
ALTER TABLE `ennemis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `hero`
--
ALTER TABLE `hero`
  ADD PRIMARY KEY (`id`,`joueur_id`),
  ADD KEY `fk_hero_joueur1_idx` (`joueur_id`);

--
-- Index pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personnages`
--
ALTER TABLE `personnages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `personnages_v2`
--
ALTER TABLE `personnages_v2`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `ennemis`
--
ALTER TABLE `ennemis`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `hero`
--
ALTER TABLE `hero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT pour la table `joueur`
--
ALTER TABLE `joueur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `personnages`
--
ALTER TABLE `personnages`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `personnages_v2`
--
ALTER TABLE `personnages_v2`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;