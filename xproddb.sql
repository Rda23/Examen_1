-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 22 août 2024 à 11:23
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `xproddb`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `ID_Commande` int(11) NOT NULL,
  `Date_Commande` date DEFAULT NULL,
  `Frais` decimal(10,2) DEFAULT NULL,
  `ID_Fournisseur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `ID_Fournisseur` int(11) NOT NULL,
  `Adresse` text DEFAULT NULL,
  `Raison_Sociale` varchar(100) DEFAULT NULL,
  `Telephone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `ID_Produit` int(11) NOT NULL,
  `Libellé` varchar(100) DEFAULT NULL,
  `Descriptif` text DEFAULT NULL,
  `Prix_Vente_HT` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit_approvisionne`
--

CREATE TABLE `produit_approvisionne` (
  `ID_Produit_Approvisionne` int(11) NOT NULL,
  `ID_Produit` int(11) DEFAULT NULL,
  `Prix_Moyen` decimal(10,2) DEFAULT NULL,
  `Designation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit_commande`
--

CREATE TABLE `produit_commande` (
  `ID_Produit_Commande` int(11) NOT NULL,
  `ID_Produit` int(11) DEFAULT NULL,
  `ID_Commande` int(11) DEFAULT NULL,
  `Quantite` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Prix_Negocie` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit_fabrique`
--

CREATE TABLE `produit_fabrique` (
  `ID_Produit_Fabrique` int(11) NOT NULL,
  `ID_Produit` int(11) DEFAULT NULL,
  `Heures_Totale` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`ID_Commande`),
  ADD KEY `ID_Fournisseur` (`ID_Fournisseur`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`ID_Fournisseur`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`ID_Produit`);

--
-- Index pour la table `produit_approvisionne`
--
ALTER TABLE `produit_approvisionne`
  ADD PRIMARY KEY (`ID_Produit_Approvisionne`),
  ADD KEY `ID_Produit` (`ID_Produit`);

--
-- Index pour la table `produit_commande`
--
ALTER TABLE `produit_commande`
  ADD PRIMARY KEY (`ID_Produit_Commande`),
  ADD KEY `ID_Produit` (`ID_Produit`),
  ADD KEY `ID_Commande` (`ID_Commande`);

--
-- Index pour la table `produit_fabrique`
--
ALTER TABLE `produit_fabrique`
  ADD PRIMARY KEY (`ID_Produit_Fabrique`),
  ADD KEY `ID_Produit` (`ID_Produit`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `ID_Commande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `ID_Fournisseur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `ID_Produit` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit_approvisionne`
--
ALTER TABLE `produit_approvisionne`
  MODIFY `ID_Produit_Approvisionne` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit_commande`
--
ALTER TABLE `produit_commande`
  MODIFY `ID_Produit_Commande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit_fabrique`
--
ALTER TABLE `produit_fabrique`
  MODIFY `ID_Produit_Fabrique` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`ID_Fournisseur`) REFERENCES `fournisseur` (`ID_Fournisseur`);

--
-- Contraintes pour la table `produit_approvisionne`
--
ALTER TABLE `produit_approvisionne`
  ADD CONSTRAINT `produit_approvisionne_ibfk_1` FOREIGN KEY (`ID_Produit`) REFERENCES `produits` (`ID_Produit`);

--
-- Contraintes pour la table `produit_commande`
--
ALTER TABLE `produit_commande`
  ADD CONSTRAINT `produit_commande_ibfk_1` FOREIGN KEY (`ID_Produit`) REFERENCES `produits` (`ID_Produit`),
  ADD CONSTRAINT `produit_commande_ibfk_2` FOREIGN KEY (`ID_Commande`) REFERENCES `commande` (`ID_Commande`);

--
-- Contraintes pour la table `produit_fabrique`
--
ALTER TABLE `produit_fabrique`
  ADD CONSTRAINT `produit_fabrique_ibfk_1` FOREIGN KEY (`ID_Produit`) REFERENCES `produits` (`ID_Produit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
