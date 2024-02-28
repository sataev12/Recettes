<?php
    session_start();
    ob_start();

    include('./DataBase.php');
?>

<?php 
//Faire une requête SQL pour recuperer les données
$req = $bdd->query(
    "SELECT Recette.Nom, Categorie.TypePlat
    FROM Categorie
    INNER JOIN Recette ON Categorie.Id = Recette.Id_Categorie
    WHERE Categorie.Id = 1;");
//Récupère les resultats sous forme de tableau
$recettes = $req->fetchAll(PDO::FETCH_ASSOC);

echo "<table class='table table-striped table-bordered'>
        <thead>
            <tr>
                <th>Nom</th>
                <th>Catégorie</th>
            </tr>
        <thead>
        <tbody>";
        foreach ($recettes as $recette) {
            echo "<tr>",
                    "<td>".$recette['Nom']."</td>",
                    "<td>".$recette['TypePlat']."</td>";
        }


















$content = ob_get_clean();
require_once "./template.php";  
?>