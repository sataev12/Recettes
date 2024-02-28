<?php
    session_start();
    ob_start();

    include('./DataBase.php');
?>

<?php 

        //Faire une requête SQL pour recuperer les données
        $req = $bdd->query("SELECT * FROM Recette");
        $reqCategorie = $bdd->query("SELECT * FROM Categorie");
        //Récupère les resultats sous forme de tableau
        $recettes = $req->fetchAll(PDO::FETCH_ASSOC);
        $categories = $reqCategorie->fetchAll(PDO::FETCH_ASSOC);
        
        // foreach ($categories as $categorie) {
        //     echo $categorie['TypePlat'];
        // }
        // echo $categories['TypePlat'];

    echo //Avec les class de bootstrap on ajouts le style de notre tableau
                    // "<div class='container-btn'>
                    //     <a class='btn btn-primary' href='./index.php'><span class='glyphicon'></span>Ajouter produit</a>
                    // </div>
                    "<table class='table table-striped table-bordered'>
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
                                    "<td>".$recette['Id_Categorie']."</td>",
                                    "<td>".$recette['TempsPrepa']."</td>";
                                    // Boucle pour afficher chaque 'TypePlat' pour cette recette
                                    // echo "<td>";
                                    // foreach ($categories as $categorie) {
                                    //     echo $categorie['TypePlat']." ";
                                    // }
                                    // echo "</td>";

                                    // echo "</tr>";
                        }
 $content = ob_get_clean();
 require_once "./template.php";                       
                        

?>






















<?php 
    
    //Recuperer et effacer le contenu de la temparisation, le contenu est stocké dans la variable $content             
    $content = ob_get_clean();
    //Inclure le fichier
    require_once "./template.php"; ?>