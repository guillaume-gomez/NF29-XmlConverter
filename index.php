<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MindMapping/Freemind to HDOC</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
  </head>
  <body>
<div class="container" style="margin:auto;margin-top:100px;max-width:800px">
<h3>Convertisseur Freemind <i>(.mm)</i> vers <i>hdoc/.scar</i></h3>
<form role="form" method="post" action='' enctype="multipart/form-data">
  <div class="form-group">  
    <label for="browse">Formulaire d'envoi de fichier</label>
    <input type="file" class="form-control" name="myfile">
    <br />
  </div>
  <button type="submit" name="make_hdoc" class="btn btn-default">Make HDOC</button>
  <button type="submit" name="make_scar" class="btn btn-default">Make for opale</button>
</form>
<hr>
<pre>
<?php

if (isset($_FILES['myfile']) AND $_FILES['myfile']['error'] == 0)
{
    echo "On charge un fichier \n\n";

     // Testons si le fichier n'est pas trop gros
        if ($_FILES['myfile']['size'] <= 1000000)
        {
                // Testons si l'extension est autorisée
                $infosfichier = pathinfo($_FILES['myfile']['name']);
                $extension_upload = $infosfichier['extension'];
                $extensions_autorisee = 'mm';
                if ($extension_upload == $extensions_autorisee)
                {
                    // On peut valider le fichier et le stocker définitivement
                    if(move_uploaded_file($_FILES['myfile']['tmp_name'], 'uploads/fileToConvert'))
                    {
                         echo "L'envoi a bien été effectué !\n";
                        if(!chmod("uploads/fileToConvert", 0755))
                        {
                          echo "erreur dans le serveur\n";
                        }
                        echo "my file --> {$_FILES['myfile']['name']} \n";
                    }

                    
                }
                else
                {

                   echo "
                   <script type=\"text/javascript\">
                   alert(\"Le fichier n'est pas valide\n\");
                   </script>
                   ";
                   die("Le fichier n'est pas valide\n");
                }

                  $cmd = 'ant -buildfile mapMapping2Hdoc.ant -DinputPath uploads/fileToConvert';
                  $out_cmd = shell_exec($cmd);
                  echo "<strong>ant script:</strong> $cmd \n\n";
                  echo $out_cmd;
                  echo "<h3>Download link: <a href='result/hdoc/'>resultat</a><h3>";

                  if(isset($_POST['make_scar'])) 
                  {
                    echo "</pre><pre>";
                    $cmd = $cmd + " -Dopale true";
                    $out_cmd = shell_exec($cmd);
                    echo "<strong>ant script:</strong> $cmd \n\n";
                    echo $out_cmd;
                    echo "<h3>Download link: <a href='result/opale/'>resultat</a><h3>";
                  }

           unlink("uploads/fileToConvert");
        }
        else
        {
            die("The file is not correct");
        }
}
?>
</pre>
</div>

  </body>
</html>
