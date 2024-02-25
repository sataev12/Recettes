<?php 

    //Connection à notre Base des données

    
    
    $dbHost = "localhost";
    $dbUser = "root";
    $dbUserPassword = "root";

    

    
        try {
            $bdd = new PDO("mysql:host=$dbHost;dbname=Recettes", $dbUser, $dbUserPassword, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
            
            // echo "Connexion réussie !";
        } catch (PDOException $e) {
            echo "Erreur : ".$e->getMessage();
        }

        //Effectuons la requête à l'aide de l'objet PDO
        $sqlQuery = 'SELECT Nom, TempsPrepa, TypePlat FROM Recette
        INNER JOIN Categorie ON Recette.Id = Categorie.Id';
        $recetStatement = $bdd->prepare($sqlQuery);
        //Afficher le résultat d'une requête SQL
        $recetStatement->execute();
        $recettes = $recetStatement->fetchAll();

        // On affiche chaque recette une à une
        foreach ($recettes as $recette) {
        ?>
            <p><?php echo $recette['Nom']; ?></p>
        <?php    
        };
        ?>
        

    

    
    


