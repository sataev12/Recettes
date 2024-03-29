-- 1) Afficher toutes les recettes disponibles(nom de la recette, catégorie et temps de préparation) 
--  triées de façon décroissante sur la durée de réalisation

SELECT Nom, TempsPrepa, TypePlat 
FROM Recette
INNER JOIN Categorie ON Recette.Id_Categorie = Categorie.Id
ORDER BY TempsPrepa DESC;

-- 2) En modifiant la requête précédente, faites apparaître le nombre d'ingrédients nécessaire par recette.

SELECT Recette.Nom, Recette.TempsPrepa, Categorie.TypePlat, COUNT(relation0.Id_Recette) AS NombreIngredients 
FROM Recette
INNER JOIN Categorie ON Recette.Id_Categorie = Categorie.Id
INNER JOIN relation0 ON Recette.Id = relation0.Id_Recette
GROUP BY Recette.Id, Recette.Nom  
ORDER BY TempsPrepa DESC;

-- 3)Afficher les recettes qui nécessitent au moins 30 min de préparation
SELECT Nom, TempsPrepa
FROM Recette
WHERE TempsPrepa >= 30;

-- 4) Afficher les recettes dont le nom contient le mot "Salade" (peu importe où est situé le mot en question)
SELECT Nom
FROM Recette
WHERE Nom LIKE 'salade%';
-- 5) Insérer une nouvelle recette: "Pâtes à la carbonara" dont la durée de réalisation est de 20 min avec
-- les instructions de votre choix. Pensez à alimenter votre base de donées en conséquence afin de pouvoir 
-- lister les détails de cette recettes (ingrédients)

INSERT INTO Recette (Nom, TempsPrepa, instructions, Id_Categorie)
VALUES ('Pâtes à la carbonara', 20, 'Faire cuire les pâtes dans un grand volume deau', 1)

INSERT INTO Ingredient(Nom, UniteMesure, Prix)
VALUES 
('Lardons', 'Gramm', 9),
('Parmesan', 'Gramm', 13);

-- 6) Modifier le nom de la recette ayant comme identifiant id_recette = 3 (nom de la recette à votre convenance)
UPDATE Recette
SET Nom  = 'Recette de crêpes'
WHERE Id = 3;

-- 7) Supprimer la recette n°2 de la base de données
DELETE FROM Recette
WHERE Id = '4';

-- 8) Afficher le prix total de la recette n°5
SELECT Recette.Id, TotalPrix, Recette.Nom
FROM Recette
INNER JOIN (
    SELECT relation0.Id_Recette, SUM(Ingredient.Prix * relation0.QuantiteIngrd) AS TotalPrix
    FROM relation0
    INNER JOIN Ingredient ON relation0.Id = Ingredient.Id
    GROUP BY relation0.Id_Recette 
) AS CalculatedTotal ON Recette.Id = CalculatedTotal.Id_Recette
WHERE Recette.Id = 8;

-- 9)Afficher le détail de la recette n°5(liste des ingrédients, quantités et prix)
SELECT Ingredient.Nom AS Nom_Ingredient, relation0.QuantiteIngrd, Ingredient.Prix *relation0.QuantiteIngrd AS Prix_Total
FROM relation0
INNER JOIN Ingredient ON relation0.Id = Ingredient.Id
WHERE relation0.Id_Recette = 8;
-- 10 Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 €
INSERT INTO Ingredient(Nom, UniteMesure, Prix)
VALUES 
('Poivre1', 'cuillère à café', 2.5);

-- 11 Modifier le prix de l'ingrédient n°12(prix à votre convenance)
UPDATE Ingredient
SET Prix  = 4
WHERE Id = 12;

-- 12 Afficher le nombre de recettes par catégories : X entrée, Y plats, Z desserts

SELECT Categorie.TypePlat, COUNT(Recette.Id_Categorie) AS NbCategorie
FROM Categorie
JOIN Recette ON Categorie.Id = Recette.Id_Categorie
GROUP BY Categorie.Id, Categorie.TypePlat;

-- 13 Afficher les recettes qui contiennent l'ingrédient "Poulet"

SELECT Recette.Nom, Ingredient.Nom
FROM relation0
INNER JOIN Recette ON relation0.Id_Recette = Recette.Id
INNER JOIN Ingredient ON relation0.Id = Ingredient.Id
WHERE Ingredient.Nom LIKE 'Poulet%'
GROUP BY relation0.Id, relation0.Id_Recette

-- 14 Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes

UPDATE Recette
SET TempsPrepa = TempsPrepa - 5
WHERE Id; 

-- 15 Afficher les recettes qui ne nécessitent pas d'ingrédients coûtant plus de 2€ par unité de mesure

SELECT DISTINCT Recette.Nom
FROM Recette
INNER JOIN relation0
ON Recette.Id = relation0.Id_Recette
WHERE Recette.Id NOT IN (
    SELECT Recette.Id
    FROM relation0
    INNER JOIN Ingredient ON relation0.Id = Ingredient.Id
    WHERE relation0.Id_Recette = Recette.Id
    AND Ingredient.Prix > 2
);

-- 16) Afficher la/les recette(s) les plus rapides à préparer

SELECT *
FROM Recette
WHERE TempsPrepa = (
	SELECT MIN(TempsPrepa)
    FROM Recette
);

-- 17) Trouver les recettes qui ne nécessitent aucun ingédient
-- (par exemple la recette de la tasse d'eau chaude qui consiste à verser de l'eau chaude dans une tasse)
SELECT Nom
FROM Recette
WHERE Id IS NOT IN (
    SELECT Id_Recette
    FROM relation0
)

-- 18) Trouver les ingrédients qui sont utilisés dans au moins 3 recettes

SELECT Ingredient.Nom
FROM relation0
INNER JOIN Ingredient ON relation0.Id = Ingredient.Id
GROUP BY Ingredient.Id
HAVING COUNT(relation0.Id_Recette) >= 3

-- 19) Ajouter un nouvel ingrédient à une recette spécifique
INSERT INTO relation0 (Id, Id_Recette, QuantiteIngrd)
VALUES (1, 14, 20);

-- 20 Bonus: Trouver la recette la plus coûteuse de la base de donées
SELECT Recette.Nom, ROUND(SUM(Ingredient.Prix * relation0.QuantiteIngrd),2) AS coutTotal
FROM Recette
INNER JOIN relation0 ON Recette.Id = relation0.Id_Recette
INNER JOIN Ingredient ON Ingredient.Id = relation0.Id
GROUP BY Recette.Id
HAVING coutTotal >= ALL(
	SELECT ROUND(SUM(Ingredient.Prix * relation0.QuantiteIngrd),2)
    FROM Recette
    INNER JOIN relation0 ON Recette.Id = relation0.Id_Recette
	INNER JOIN Ingredient ON Ingredient.Id = relation0.Id
    GROUP BY Recette.Id
)










