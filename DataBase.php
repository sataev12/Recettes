<?php 

    //Connection à notre Base des données

    
    
    $dbHost = "localhost";
    $dbUser = "root";
    $dbUserPassword = "root";

    

    
        try {
            $bdd = new PDO("mysql:host=$dbHost;dbname=Recettes", $dbUser, $dbUserPassword);
            // echo "Connexion réussie !";
        } catch (PDOException $e) {
            echo "Erreur : ".$e->getMessage();
        }


        $sqlQuery = 'SELECT * FROM Recette';
        $recetStatement = $bdd->prepare($sqlQuery);
        $recetStatement->execute();
        $recettes = $recetStatement->fetchAll();


        foreach ($recettes as $recette) {
        ?>
            <p><?php echo $recette['Nom']; ?></p>
        <?php    
        };
        ?>
        

    

    
    


