-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 02 Décembre 2016 à 17:31
-- Version du serveur :  10.1.16-MariaDB
-- Version de PHP :  5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `numP` int(11) NOT NULL,
  `description` text NOT NULL,
  `mouvementLite` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `auteur`
--

INSERT INTO `auteur` (`numP`, `description`, `mouvementLite`) VALUES
(2, 'Victor Hugo ....', 'Classique'),
(3, 'Meilleur', 'Fantastique');

-- --------------------------------------------------------

--
-- Structure de la table `bibliotheque`
--

CREATE TABLE `bibliotheque` (
  `numBibli` int(11) NOT NULL,
  `adresseBibli` varchar(128) NOT NULL,
  `horaireOuverture` time NOT NULL,
  `addrMail` varchar(128) NOT NULL,
  `horaireFermeture` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `bibliotheque`
--

INSERT INTO `bibliotheque` (`numBibli`, `adresseBibli`, `horaireOuverture`, `addrMail`, `horaireFermeture`) VALUES
(1, '1 rue du Paradis Troyes 1000', '08:30:00', 'scd@utt.fr', '21:30:00'),
(2, '12 rue Voltaire Troyes 10000', '08:00:00', 'bibliotheque@troyes.fr', '20:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_u`
--

CREATE TABLE `categorie_u` (
  `numCtg` int(11) NOT NULL,
  `libCtg` varchar(25) NOT NULL,
  `dureeEmp` tinyint(3) UNSIGNED NOT NULL,
  `nbEmpTotal` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorie_u`
--

INSERT INTO `categorie_u` (`numCtg`, `libCtg`, `dureeEmp`, `nbEmpTotal`) VALUES
(1, 'Categorie 1', 10, 3),
(2, 'Categorie 2', 15, 5),
(3, 'Categorie 3', 20, 6);

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

CREATE TABLE `editeur` (
  `cdeEdit` varchar(20) NOT NULL,
  `libEdit` varchar(20) NOT NULL,
  `adresseEdit` varchar(512) NOT NULL,
  `dateCreation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `editeur`
--

INSERT INTO `editeur` (`cdeEdit`, `libEdit`, `adresseEdit`, `dateCreation`) VALUES
('allun', 'Allen & Unwin', '1 allée de la Comté Midggard', '1914-01-01'),
('gall', 'Gallimard', '15 boulevard Raspail Paris 75000', '1971-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `emprunter`
--

CREATE TABLE `emprunter` (
  `numUsager` int(11) NOT NULL,
  `numOuvrage` int(11) NOT NULL,
  `dateEmp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ouvrage`
--

CREATE TABLE `ouvrage` (
  `ISBN` varchar(13) NOT NULL,
  `titre` varchar(25) NOT NULL,
  `annee` year(4) NOT NULL,
  `numSujet` int(11) NOT NULL,
  `langue` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `typeDocumentation` varchar(64) NOT NULL,
  `categorie` varchar(64) NOT NULL,
  `quantiteDispo` smallint(5) UNSIGNED NOT NULL,
  `cdeEdit` varchar(20) NOT NULL,
  `numAuteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ouvrage`
--

INSERT INTO `ouvrage` (`ISBN`, `titre`, `annee`, `numSujet`, `langue`, `description`, `typeDocumentation`, `categorie`, `quantiteDispo`, `cdeEdit`, `numAuteur`) VALUES
('0261103253', 'Le Seigneur des Anneaux', 2005, 1, 'Français', 'un petit homme part se balader', 'Livre', 'Fantastique', 5, 'allun', 3),
('9782070409228', 'Les Misérables', 1999, 2, 'français', 'Une pauvre enfant abandonée...', 'Livre', 'Romans et récits', 2, 'gall', 2);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `numP` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `dateNais` date NOT NULL,
  `nationalite` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`numP`, `nom`, `prenom`, `dateNais`, `nationalite`) VALUES
(0, 'Hamdi', 'Karim', '1995-01-13', 'Japonais'),
(1, 'Lalement', 'Jaufre', '2016-12-02', 'Français'),
(2, 'Hugo', 'Victor', '1802-02-26', 'Français'),
(3, 'Tolkien', 'John Ronald Reuel', '1892-01-03', 'Anglais');

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

CREATE TABLE `posseder` (
  `numBibli` int(11) NOT NULL,
  `numOuvrage` int(11) NOT NULL,
  `quantiteTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `proposer`
--

CREATE TABLE `proposer` (
  `numUsager` int(11) NOT NULL,
  `NumSgt` int(11) NOT NULL,
  `dateSgt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `suggestion`
--

CREATE TABLE `suggestion` (
  `numSgt` int(11) NOT NULL,
  `titre` varchar(25) NOT NULL,
  `auteur` varchar(25) NOT NULL,
  `quantite` smallint(5) UNSIGNED NOT NULL,
  `accepter` tinyint(1) NOT NULL DEFAULT '0',
  `commande` tinyint(1) NOT NULL DEFAULT '0',
  `numUsager` int(11) NOT NULL,
  `numBibli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `traiter`
--

CREATE TABLE `traiter` (
  `numSgt` int(11) NOT NULL,
  `numBibli` int(11) NOT NULL,
  `dateCmd` date NOT NULL,
  `dateChoix` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `usager`
--

CREATE TABLE `usager` (
  `numP` int(11) NOT NULL,
  `filiere` varchar(20) NOT NULL,
  `nbEmpDispo` int(11) NOT NULL,
  `numCtg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `usager`
--

INSERT INTO `usager` (`numP`, `filiere`, `nbEmpDispo`, `numCtg`) VALUES
(0, 'ISI01', 3, 1),
(1, 'ISI02', 5, 2);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`numP`);

--
-- Index pour la table `bibliotheque`
--
ALTER TABLE `bibliotheque`
  ADD PRIMARY KEY (`numBibli`);

--
-- Index pour la table `categorie_u`
--
ALTER TABLE `categorie_u`
  ADD PRIMARY KEY (`numCtg`);

--
-- Index pour la table `editeur`
--
ALTER TABLE `editeur`
  ADD PRIMARY KEY (`cdeEdit`);

--
-- Index pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD PRIMARY KEY (`numUsager`,`numOuvrage`);

--
-- Index pour la table `ouvrage`
--
ALTER TABLE `ouvrage`
  ADD PRIMARY KEY (`ISBN`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`numP`);

--
-- Index pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD PRIMARY KEY (`numBibli`,`numOuvrage`);

--
-- Index pour la table `proposer`
--
ALTER TABLE `proposer`
  ADD PRIMARY KEY (`numUsager`,`NumSgt`);

--
-- Index pour la table `suggestion`
--
ALTER TABLE `suggestion`
  ADD PRIMARY KEY (`numSgt`);

--
-- Index pour la table `traiter`
--
ALTER TABLE `traiter`
  ADD PRIMARY KEY (`numSgt`,`numBibli`);

--
-- Index pour la table `usager`
--
ALTER TABLE `usager`
  ADD PRIMARY KEY (`numP`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `suggestion`
--
ALTER TABLE `suggestion`
  MODIFY `numSgt` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD CONSTRAINT `auteur_ibfk_1` FOREIGN KEY (`numP`) REFERENCES `personne` (`numP`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
