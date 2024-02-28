<?php
    session_start();
    ob_start();

    include('./DataBase.php');
?>

<?php 
//Faire une requête SQL pour recuperer les données
$req = $bdd->query(
    "SELECT Recette.Id, TotalPrix, Recette.Nom
    FROM Recette
    INNER JOIN (
        SELECT relation0.Id_Recette, SUM(Ingredient.Prix * relation0.QuantiteIngrd) AS TotalPrix
        FROM relation0
        INNER JOIN Ingredient ON relation0.Id = Ingredient.Id
        GROUP BY relation0.Id_Recette 
    ) AS CalculatedTotal ON Recette.Id = CalculatedTotal.Id_Recette");
//Récupère les resultats sous forme de tableau
$recettes = $req->fetchAll(PDO::FETCH_ASSOC);

echo "<table class='table table-striped table-bordered'>
        <thead>
            <tr>
                <th>Id</th>
                <th>Nom</th>
                <th>Total Prix</th>
            </tr>
        <thead>
        <tbody>";
        foreach ($recettes as $recette) {
            echo "<tr>",
                    "<td>".$recette['Id']."</td>",
                    "<td>".$recette['Nom']."</td>",
                    "<td>".$recette['TotalPrix']."</td>";
        }



$content = ob_get_clean();
require_once "./template.php";  
?>