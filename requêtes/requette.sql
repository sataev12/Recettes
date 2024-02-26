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

