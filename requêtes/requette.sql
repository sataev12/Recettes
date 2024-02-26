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

