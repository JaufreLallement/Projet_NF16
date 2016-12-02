-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 02 Décembre 2016 à 20:01
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `projet_nf16`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE IF NOT EXISTS `auteur` (
  `numP` int(11) NOT NULL,
  `description` text NOT NULL,
  `mouvementLite` varchar(64) NOT NULL,
  PRIMARY KEY (`numP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `auteur`
--

INSERT INTO `auteur` (`numP`, `description`, `mouvementLite`) VALUES
(2, 'Né le 26 février 1802 à Besançon et mort le 22 mai 1885 à Paris', 'Classique'),
(3, 'Né le 3 janvier 1892 à Bloemfontein et mort le 2 septembre 1973 à Bournemouth', 'Fantastique'),
(4, 'Né à Paris le 9 avril 1821, il meurt dans la même ville le 31 août 1867', 'Symbolisme'),
(5, 'Né le 21 novembre 1694 à Paris, ville où il est mort le 30 mai 1778', 'Philosophie des Lumières'),
(6, 'Né à Tours le 20 mai 1799, et mort à Paris le 18 août 1850 ', 'Réalisme visionnaire'),
(7, 'Né le 11 décembre 1810 à Paris, où il meurt le 2 mai 1857', 'Romantisme'),
(8, 'Né le 20 octobre 1854 à Charleville et mort le 10 novembre 1891 à Marseille', 'Symbolisme');

-- --------------------------------------------------------

--
-- Structure de la table `bibliotheque`
--

CREATE TABLE IF NOT EXISTS `bibliotheque` (
  `numBibli` int(11) NOT NULL,
  `adresseBibli` varchar(128) NOT NULL,
  `horaireOuverture` time NOT NULL,
  `addrMail` varchar(128) NOT NULL,
  `horaireFermeture` time NOT NULL,
  PRIMARY KEY (`numBibli`)
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

CREATE TABLE IF NOT EXISTS `categorie_u` (
  `numCtg` int(11) NOT NULL,
  `libCtg` varchar(25) NOT NULL,
  `dureeEmp` tinyint(3) unsigned NOT NULL,
  `nbEmpTotal` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`numCtg`)
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

CREATE TABLE IF NOT EXISTS `editeur` (
  `cdeEdit` varchar(20) NOT NULL,
  `libEdit` varchar(20) NOT NULL,
  `adresseEdit` varchar(512) NOT NULL,
  `dateCreation` date NOT NULL,
  PRIMARY KEY (`cdeEdit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `editeur`
--

INSERT INTO `editeur` (`cdeEdit`, `libEdit`, `adresseEdit`, `dateCreation`) VALUES
('allun', 'Allen & Unwin', '1 allée de la Comté Midggard', '1914-01-01'),
('flam', 'Flammarion', '84 Quai Panhard et Levassor 75013 Paris', '1875-01-01'),
('gall', 'Gallimard', '15 boulevard Raspail Paris 75000', '1971-01-01'),
('hach', 'Hachette Livre', '58 rue Jean Bleuzen 92170 Vanves', '1826-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `emprunter`
--

CREATE TABLE IF NOT EXISTS `emprunter` (
  `numUsager` int(11) NOT NULL,
  `numOuvrage` int(11) NOT NULL,
  `dateEmp` date NOT NULL,
  PRIMARY KEY (`numUsager`,`numOuvrage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ouvrage`
--

CREATE TABLE IF NOT EXISTS `ouvrage` (
  `ISBN` varchar(13) NOT NULL,
  `titre` varchar(25) NOT NULL,
  `annee` year(4) NOT NULL,
  `numSujet` int(11) NOT NULL,
  `langue` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `typeDocumentation` varchar(64) NOT NULL,
  `categorie` varchar(64) NOT NULL,
  `quantiteDispo` smallint(5) unsigned NOT NULL,
  `cdeEdit` varchar(20) NOT NULL,
  `numAuteur` int(11) NOT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ouvrage`
--

INSERT INTO `ouvrage` (`ISBN`, `titre`, `annee`, `numSujet`, `langue`, `description`, `typeDocumentation`, `categorie`, `quantiteDispo`, `cdeEdit`, `numAuteur`) VALUES
('0261103253', 'Le Seigneur des Anneaux', 2005, 1, 'Français', 'un petit homme part se balader', 'Livre', 'Fantastique', 5, 'allun', 3),
('9781480221451', 'Les Chouans', 1974, 5, 'Français', 'Paysans Bretons', 'Roman', 'Etude des moeurs', 7, 'allun', 7),
('9781890650308', 'Une saison en enfer', 2008, 7, 'Français', 'Recueil de poème rédigé après une période de crise dans la vie d''Arthur Rimbaud', 'Recueil de poésie', 'Poésie', 3, 'hach', 8),
('9782070409228', 'Les Misérables', 1999, 2, 'français', 'Une pauvre enfant abandonée...', 'Livre', 'Romans et récits', 2, 'gall', 2),
('9782081217002', 'L''Ingénu', 1998, 4, 'Français', 'Aventures d''un Huron', 'Conte philosophique', 'Philosophie', 3, 'flam', 5),
('9782877141933', 'Lorenzaccio', 2001, 6, 'Français', 'Histoire d''un héros romantique', 'Pièce de théâtre', 'Drame romantique', 2, 'hach', 6),
('9783959281362', 'Les Fleurs du mal', 1987, 3, 'Français', 'Poèmes', 'Recueil de poésie', 'Poésie', 4, 'hach', 4);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `numP` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `dateNais` date NOT NULL,
  `nationalite` varchar(20) NOT NULL,
  PRIMARY KEY (`numP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`numP`, `nom`, `prenom`, `dateNais`, `nationalite`) VALUES
(0, 'Hamdi', 'Karim', '1995-01-13', 'Japonais'),
(1, 'Lallement', 'Jaufré', '1995-05-13', 'Français'),
(2, 'Hugo', 'Victor', '1802-02-26', 'Français'),
(3, 'Tolkien', 'John Ronald Reuel', '1892-01-03', 'Anglais'),
(4, 'Baudelaire', 'Charles', '1821-04-09', 'Français'),
(5, 'Voltaire', 'François-Marie Aroue', '1694-11-21', 'Français'),
(6, 'de Musset', 'Alfred', '1810-12-11', 'Français'),
(7, 'de Balzac', 'Honoré', '1850-08-18', 'Français'),
(8, 'Rimbaud', 'Arthur', '1854-10-20', 'Français');

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

CREATE TABLE IF NOT EXISTS `posseder` (
  `numBibli` int(11) NOT NULL,
  `numOuvrage` int(11) NOT NULL,
  `quantiteTotal` int(11) NOT NULL,
  PRIMARY KEY (`numBibli`,`numOuvrage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `proposer`
--

CREATE TABLE IF NOT EXISTS `proposer` (
  `numUsager` int(11) NOT NULL,
  `NumSgt` int(11) NOT NULL,
  `dateSgt` date NOT NULL,
  PRIMARY KEY (`numUsager`,`NumSgt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `suggestion`
--

CREATE TABLE IF NOT EXISTS `suggestion` (
  `numSgt` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(25) NOT NULL,
  `auteur` varchar(25) NOT NULL,
  `quantite` smallint(5) unsigned NOT NULL,
  `accepter` tinyint(1) NOT NULL DEFAULT '0',
  `commande` tinyint(1) NOT NULL DEFAULT '0',
  `numUsager` int(11) NOT NULL,
  `numBibli` int(11) NOT NULL,
  PRIMARY KEY (`numSgt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `traiter`
--

CREATE TABLE IF NOT EXISTS `traiter` (
  `numSgt` int(11) NOT NULL,
  `numBibli` int(11) NOT NULL,
  `dateCmd` date NOT NULL,
  `dateChoix` date NOT NULL,
  PRIMARY KEY (`numSgt`,`numBibli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `usager`
--

CREATE TABLE IF NOT EXISTS `usager` (
  `numP` int(11) NOT NULL,
  `filiere` varchar(20) NOT NULL,
  `nbEmpDispo` int(11) NOT NULL,
  `numCtg` int(11) NOT NULL,
  PRIMARY KEY (`numP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `usager`
--

INSERT INTO `usager` (`numP`, `filiere`, `nbEmpDispo`, `numCtg`) VALUES
(0, 'ISI01', 3, 1),
(1, 'SRT01', 5, 2);

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
