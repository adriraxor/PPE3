-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 12 nov. 2020 à 04:48
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ppe3_logicielbdd_off`
--
CREATE DATABASE IF NOT EXISTS `ppe3_logicielbdd_off` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ppe3_logicielbdd_off`;

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE IF NOT EXISTS `agent` (
  `idAgent` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `num_telephone` varchar(50) DEFAULT NULL,
  `idProfil` int(11) NOT NULL,
  PRIMARY KEY (`idAgent`),
  KEY `idProfil` (`idProfil`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `agent`
--

INSERT INTO `agent` (`idAgent`, `nom`, `prenom`, `num_telephone`, `idProfil`) VALUES
(1, 'FIGUERES', 'Adrien', '0638319676', 1),
(2, 'Lipie', 'Bernard', '0780689345', 2);

-- --------------------------------------------------------

--
-- Structure de la table `appartenir`
--

DROP TABLE IF EXISTS `appartenir`;
CREATE TABLE IF NOT EXISTS `appartenir` (
  `idProduit` int(11) NOT NULL,
  `Id_Categorie` int(11) NOT NULL,
  PRIMARY KEY (`idProduit`,`Id_Categorie`),
  KEY `Id_Categorie` (`Id_Categorie`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `appartenir`
--

INSERT INTO `appartenir` (`idProduit`, `Id_Categorie`) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2),
(6, 3);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `Id_Categorie` int(255) NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(50) DEFAULT NULL,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Categorie`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`Id_Categorie`, `nom_categorie`, `libelle`) VALUES
(1, 'Course', 'Jeux de course'),
(2, 'Sport', 'Jeux de sport'),
(3, 'Bac à Sable', 'Jeux Bac à Sable');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(255) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `num_telephone` int(11) DEFAULT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `nom`, `prenom`, `email`, `num_telephone`) VALUES
(1, 'Loupion', 'Bernard', 'l.bernard@gmail.com', 768684893),
(2, 'Hytami', 'Yusuka', 'h.yusuka45@outlook.com', 555777975);

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

DROP TABLE IF EXISTS `contenir`;
CREATE TABLE IF NOT EXISTS `contenir` (
  `idProduit` int(11) NOT NULL,
  `idVente` int(11) NOT NULL,
  `quantiter` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`idProduit`,`idVente`),
  KEY `idVente` (`idVente`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `contenir`
--

INSERT INTO `contenir` (`idProduit`, `idVente`, `quantiter`) VALUES
(5, 2, '3'),
(4, 1, '1');

-- --------------------------------------------------------

--
-- Structure de la table `creer`
--

DROP TABLE IF EXISTS `creer`;
CREATE TABLE IF NOT EXISTS `creer` (
  `idVente` int(11) NOT NULL,
  `Id_Facture` int(11) NOT NULL,
  PRIMARY KEY (`idVente`,`Id_Facture`),
  KEY `Id_Facture` (`Id_Facture`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `creer`
--

INSERT INTO `creer` (`idVente`, `Id_Facture`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `effectuer`
--

DROP TABLE IF EXISTS `effectuer`;
CREATE TABLE IF NOT EXISTS `effectuer` (
  `idClient` varchar(50) NOT NULL,
  `idVente` int(11) NOT NULL,
  PRIMARY KEY (`idClient`,`idVente`),
  KEY `idVente` (`idVente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `effectuer`
--

INSERT INTO `effectuer` (`idClient`, `idVente`) VALUES
('1', 2),
('2', 1);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `Id_Facture` int(11) NOT NULL AUTO_INCREMENT,
  `numero_facture` varchar(255) DEFAULT NULL,
  `montant_facture` int(255) NOT NULL,
  `facture_pdf` blob NOT NULL,
  PRIMARY KEY (`Id_Facture`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`Id_Facture`, `numero_facture`, `montant_facture`, `facture_pdf`) VALUES
(1, '4344f8c0-2205-458c-a78b-b7d6e7039a3e', 300, 0x433a505045332d66616374757265666163747572655f34333434663863302d323230352d343538632d613738622d6237643665373033396133652e706466),
(2, '5356a731-68eb-4ab4-be18-7e31e708e26b', 60, 0x433a505045332d66616374757265666163747572655f35333536613733312d363865622d346162342d626531382d3765333165373038653236622e706466);

-- --------------------------------------------------------

--
-- Structure de la table `generer`
--

DROP TABLE IF EXISTS `generer`;
CREATE TABLE IF NOT EXISTS `generer` (
  `idVente` int(11) NOT NULL,
  `idAgent` int(11) NOT NULL,
  PRIMARY KEY (`idVente`,`idAgent`),
  KEY `idPersonnel` (`idAgent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `generer`
--

INSERT INTO `generer` (`idVente`, `idAgent`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `idProduit` int(255) NOT NULL AUTO_INCREMENT,
  `nom_produit` varchar(50) DEFAULT NULL,
  `tarif_produit` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `libelle` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `popularite` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProduit`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idProduit`, `nom_produit`, `tarif_produit`, `stock`, `libelle`, `image`, `popularite`) VALUES
(1, 'Mario Kart 8 : Deluxe', 70, 74, 'Jeux de course', NULL, 18),
(2, 'Mario Tennis : Access', 70, 55, 'Jeux de sport', NULL, 26),
(3, 'Crash Bandicoot : N-Sane trilogy', 60, 70, 'Jeux de course', NULL, 15),
(4, 'Mario et Sonic : JO Tokyo 2020', 60, 67, 'Jeux de sport ', NULL, 18),
(5, 'Animal Crossing : New Horizons', 80, 171, 'Jeux Bac à Sable', NULL, 10);

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

DROP TABLE IF EXISTS `profil`;
CREATE TABLE IF NOT EXISTS `profil` (
  `idProfil` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `num_telephone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `permission` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idProfil`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `profil`
--

INSERT INTO `profil` (`idProfil`, `username`, `password`, `num_telephone`, `email`, `permission`) VALUES
(1, 'Agent', 'tnega', '0638319676', 'figueres.adrien@gmail.com', 0),
(2, 'Administrateur', 'toor', '062541655416', 'user@gmail.com', 1);

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `idVente` int(11) NOT NULL AUTO_INCREMENT,
  `numero_commande` varchar(1024) DEFAULT NULL,
  `date_vente` date DEFAULT NULL,
  PRIMARY KEY (`idVente`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`idVente`, `numero_commande`, `date_vente`) VALUES
(1, '4344f8c0-2205-458c-a78b-b7d6e7039a3e', '2020-11-09'),
(2, '5356a731-68eb-4ab4-be18-7e31e708e26b', '2020-11-09');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
