-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 23 fév. 2024 à 15:53
-- Version du serveur : 5.7.39
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Recettes`
--

-- --------------------------------------------------------

--
-- Structure de la table `Recette`
--

CREATE TABLE `Recette` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `TempsPrepa` int(11) NOT NULL,
  `Instructions` text NOT NULL,
  `Id_Categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Recette`
--

INSERT INTO `Recette` (`Id`, `Nom`, `TempsPrepa`, `Instructions`, `Id_Categorie`) VALUES
(3, 'Crêpe', 10, 'Mettre la farine dans une terrine et former un puits. Y déposer les oeufs entiers, le sucre, l\'huile et le beurre.Mélanger délicatement avec un fouet en ajoutant au fur et à mesure le lait. La pâte ainsi obtenue doit avoir une consistance d\'un liquide légèrement épais. Parfumer de rhum. Faire chauffer une poêle antiadhésive et la huiler très légèrement à l\'aide d\'un papier Essuie-tout. Y verser une louche de pâte, la répartir dans la poêle puis attendre qu\'elle soit cuite d\'un côté avant de la retourner. Cuire ainsi toutes les crêpes à feu doux.', 1),
(4, 'Pâte à pizza fine', 110, 'Verser la farine dans un grand saladier et y faire un puits.Verser la levure, le sel et le sucre dans un verre doseur. Ajouter 1/4 de litre d\'eau tiède, bien mélanger. Couvrir d\'un film plastique et laisser reposer environ 10 minutes (jusqu\'à l\'apparition d\'une mousse brune bien épaisse en surface).Laisser reposer au moins 1 h sous un linge humide dans un endroit tiède (à côté d\'un radiateur, d\'une cheminée ou d\'un poêle en hiver).', 1),
(5, 'Salade de Kiwis', 5, 'Eplucher les kiwis et les tomates, les couper en rondelles.Disposer dans un plat, saler, arroser d\'un peu d\'huile, ajouter le jus d\'un demi-citron ou un peu de vinaigre selon vos préférences en matière de vinaigrette.Pour une salade de kiwis seuls, on peut se dispenser du vinaigre ou du citron, ils sont parfois assez acides.', 2),
(6, 'Crème dessert', 15, 'Mélanger farine et beurre fondu comme une béchamel, ajouter le lait bien mélanger. Ajouter le sucre après la cuisson du lait dans le roux blanc, puis mélanger à nouveau. Ajouter le chocolat cassé en petit morceaux, laisser chauffer 5 à 10 min, mélanger en faisant des 8 avec la cuillère en bois. Mettre dans des petits pots et réserver au frais. Avec 1 litre de lait, on fait 8 petits pots comme sur la photo.On peut diviser les ingrédients par deux pour faire 4 petits pots , Ceci reste cependant un petit dessert familial qui se bonifie au frigo, meilleur encore 3 jours plus tard.\r\n\r\n', 4),
(7, 'Iles flotantes sur coulis de fraises', 20, 'Faire bouillir de l\'eau dans une casserole assez large.Laver et égoutter les fraises. Les mixer avec 2 cuillères à soupe de sucre, jusqu\'à obtention d\'un coulis.Battre les blancs d\'oeufs en neige et y ajouter 1 cuillère à soupe de sucreA l\'aide d\'une spatule ou d\'une grande cuillère, faire cuire les blancs d\'oeufs battus en neige sur l\'eau frémissante (faire des petits paquets pour obtenir des \'îles flottantes\'.Après environ 5 minutes de cuisson, les blancs d\'oeufs deviennent plus consistants et sont prêts à être égouttés sur un papier absorbant.\r\n\r\n', 4),
(8, 'Petit pains plats', 25, 'Mélanger le yaourt, la farine et la levure dans un saladier.Laisser reposer 10 minutes à température ambiante.Pétrir légèrement la pâte et former de petites boules. Rouler les boules de pâte avec un rouleau à pâtisserie.Effectuer quelques incisions dans la pâte avec un couteau.Mettre de l’huile à chauffer dans une poêle et cuire les pains 2 à 3 minutes de chaque côté dans la poêle.Si la pâte colle un peu, ajouter de la farine sur le plan de travail et sur les mains.', 1),
(9, 'Entree chaude à la basque de homard', 40, 'Mixer le tout, mettre dans un moule à couronne bien beurré.\r\n\r\nÉTAPE 2\r\nFaire cuire au bain marie environ 30 minutes à 200°C (thermostat 7).\r\n\r\nÉTAPE 3\r\nServir chaud accompagné d\'une sauce à la crème avec du concentré de tomate et des petites crevettes.', 2),
(10, 'Hareng en fourrure', 30, 'Faites cette recette le soir pour le lendemain.Si vous pouvez trouver du hareng salé c\'est mieux.Faites cuire les légumes à l\'eau et enlevez la peau. Réservez.Otez la peau du hareng si nécessaire et découpez le filet en tout petits carrés.Hachez l\'oignon finement.Prenez une assiette creuse qui servira de plat pour le hareng en fourrure.Dans le fond de l\'assiette, éparpillez les petits morceaux de hareng.Ensuite éparpillez la moitié de l\'oignon haché par-dessus sans mélanger. Râpez la pomme de terre cuite par dessus, répartissez et aplatissez légèrement. Râpez la carotte et faites de même.\r\n\r\n\r\n\r\n', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Recette`
--
ALTER TABLE `Recette`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Recette_Categorie_FK` (`Id_Categorie`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Recette`
--
ALTER TABLE `Recette`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Recette`
--
ALTER TABLE `Recette`
  ADD CONSTRAINT `Recette_Categorie_FK` FOREIGN KEY (`Id_Categorie`) REFERENCES `Categorie` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
