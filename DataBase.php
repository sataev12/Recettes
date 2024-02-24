<?php 

    //Connection à notre Base des données

    
    
    $dbHost = "localhost";
    $dbUser = "root";
    $dbUserPassword = "root";

    

    
        try {
            $bdd = new PDO("mysql:host=$dbHost;dbname=Recettes", $dbUser, $dbUserPassword);
            $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            // echo "Connexion réussie !";
        } catch (PDOException $e) {
            echo "Erreur : ".$e->getMessage();
        }
        
    $sql = "SELECT * FROM Recette";
    $req = $bdd->query($sql);
    while($rep = $req->fetch()){
        echo $rep['Nom'] .' // <br>';
    };

        // $serveurName = "localhost";
        // $userName = "root";
        // $password = "root"

    

    
    


?>