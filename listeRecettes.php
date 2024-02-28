<?php
    session_start();
    ob_start();

    include('./DataBase.php');
?>

<?php 

        //Faire une requête SQL pour recuperer les données
        $req = $bdd->query(
        "SELECT Recette.Nom, Recette.TempsPrepa, Categorie.TypePlat
        FROM Recette
        INNER JOIN Categorie ON Categorie.Id = Recette.Id_Categorie;");
        // $reqCategorie = $bdd->query("SELECT * FROM Categorie");
        //Récupère les resultats sous forme de tableau
        $recettes = $req->fetchAll(PDO::FETCH_ASSOC);
        // $categories = $reqCategorie->fetchAll(PDO::FETCH_ASSOC);
        // foreach ($categories as $categorie) {
        //     echo $categorie['TypePlat'];
        // }
        // echo $categories['TypePlat'];

    echo //Avec les class de bootstrap on ajouts le style de notre tableau
                    // "<div class='container-btn'>
                    //     <a class='btn btn-primary' href='./index.php'><span class='glyphicon'></span>Ajouter produit</a>
                    // </div>
                    "
                    <table class='table table-striped table-bordered'>
                        <thead>
                            <tr>
                                <th>Nom</th>
                                <th>Catégorie</th>
                                <th>Temps Preparation</th>
                            </tr>
                        <thead>
                        <tbody>";

                        foreach ($recettes as $recette) {
                            echo "<tr>",
                                    "<td>".$recette['Nom']."</td>",
                                    "<td>".$recette['TypePlat']."</td>",
                                    "<td>".$recette['TempsPrepa']."</td>";
                        }
 $content = ob_get_clean();
 require_once "./template.php";                       
                        

?>





















