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

