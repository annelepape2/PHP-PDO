<?php

@ini_set('display_errors', 'on'); 
function chargerClasse($classe)
{
  require $classe . '.php';
}

spl_autoload_register('chargerClasse');

session_start();

if (isset($_GET['deconnexion']))
{
  session_destroy();
  header('Location: .');
  exit();
}

$db = new PDO('mysql:host=localhost:3306;dbname=php_tp1', 'root', 'root');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

$manager = new PersonnagesManager($db);

if (isset($_SESSION['perso'])) // Si la session perso existe, on restaure l'objet.
{
  $perso = $_SESSION['perso'];
}

if (isset($_POST['creer']) && isset($_POST['nom'])) // Si on a voulu créer un personnage.
{
  switch ($_POST['type'])
  {
    case 'magicien' :
      $perso = new Magicien(array('nom' => $_POST['nom']));
      break;
    
    case 'guerrier' :
      $perso = new Guerrier(array('nom' => $_POST['nom']));
      break;
    
    default :
      $message = 'Le type du personnage est invalide.';
      break;
  }
  
  if (isset($perso)) // Si le type du personnage est valide, on a créé un personnage.
  {
    if (!$perso->nomValide())
    {
      $message = 'Le nom choisi est invalide.';
      unset($perso);
    }
    elseif ($manager->exists($perso->nom()))
    {
      $message = 'Le nom du personnage est deja pris.';
      unset($perso);
    }
    else
    {
      $manager->add($perso);
    }
  }
}

elseif (isset($_POST['utiliser']) && isset($_POST['nom'])) // Si on a voulu utiliser un personnage.
{
  if ($manager->exists($_POST['nom'])) // Si celui-ci existe.
  {
    $perso = $manager->get($_POST['nom']);
  }
  else
  {
    $message = 'Ce personnage n existe pas !'; // S'il n'existe pas, on affichera ce message.
  }
}

elseif (isset($_GET['frapper'])) // Si on a cliqué sur un personnage pour le frapper.
{
  if (!isset($perso))
  {
    $message = 'Merci de creer un personnage ou de vous identifier.';
  }
  
  else
  {
    if (!$manager->exists((int) $_GET['frapper']))
    {
      $message = 'Le personnage que vous voulez frapper n existe pas !';
    }
    
    else
    {
      $persoAFrapper = $manager->get((int) $_GET['frapper']);
      $retour = $perso->frapper($persoAFrapper); 
      
      switch ($retour)
      {
        case Personnage::CEST_MOI :
          $message = 'Mais... pourquoi voulez-vous vous frapper ???';
          break;
        
        case Personnage::PERSONNAGE_FRAPPE :
          $message = 'Le personnage a bien ete frappe !';
          
          $perso->gagnerargent();
          
          $manager->update($perso);
          $manager->update($persoAFrapper);
          
          break;
        
        case Personnage::PERSONNAGE_TUE :
          $message = 'Vous avez tué ce personnage !';
          
            $perso->gagnerargent();
          
          $manager->update($perso);
          $manager->delete($persoAFrapper);
          
          break;
        
        case Personnage::PERSO_ENDORMI :
          $message = 'Vous êtes endormi, vous ne pouvez pas frapper de personnage !';
          break;
      }
    }
  }
}

elseif (isset($_GET['ensorceler']))
{
  if (!isset($perso))
  {
    $message = 'Merci de creer un personnage ou de vous identifier.';
  }
  
  else
  {
    
    if ($perso->type() != 'magicien')
    {
      $message = 'Seuls les magiciens peuvent ensorceler des personnages !';
    }
    
    else
    {
      if (!$manager->exists((int) $_GET['ensorceler']))
      {
        $message = 'Le personnage que vous voulez frapper n\'existe pas !';
      }
      
      else
      {
        $persoAEnsorceler = $manager->get((int) $_GET['ensorceler']);
        $retour = $perso->lancerUnSort($persoAEnsorceler);
        
        switch ($retour)
        {
          case Personnage::CEST_MOI :
            $message = 'Mais... pourquoi voulez-vous vous ensorceler ???';
            break;
          
          case Personnage::PERSONNAGE_ENSORCELE :
            $message = 'Le personnage a bien ete ensorcele !';
            
            $manager->update($perso);
            $manager->update($persoAEnsorceler);
            
            break;
          
          case Personnage::PAS_DE_MAGIE :
            $message = 'Vous n\'avez pas de magie !';
            break;
          
          case Personnage::PERSO_ENDORMI :
            $message = 'Vous êtes endormi, vous ne pouvez pas lancer de sort !';
            break;
        }
      }
    }
  }
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>TP - PDO</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Tangerine" rel="stylesheet"> 

</head>
<body class="body" >

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2>
                TP - PDO
            </h2>
        </div>
    </div>
    <p>Nombre de personnages creer : <?php echo $manager->count(); ?></p>
<?php
if (isset($message)) 
{
  echo '<p>', $message, '</p>'; 
}

if (isset($perso)) 
{
?>
    <p><a href="?deconnexion=1">Deconnexion</a></p>
    
    <fieldset>
      <legend class="game">Mes informations</legend>
      <p style="color:white;">
        Type : <?php echo ucfirst($perso->type()); ?><br />
        Nom : <?php echo htmlspecialchars($perso->nom()); ?><br />
        pv : <?php echo $perso->pv(); ?><br />
         bourse d or : <?php echo $perso->argent(); ?><br />
      
<?php

switch ($perso->type())
{
  case 'magicien' :
    echo 'Magie : ';
    break;
  
  case 'guerrier' :
    echo 'Protection : ';
    break;
}

echo $perso->atout();
?>
      </p>
    </fieldset>
    
    <fieldset style="color:white;">
      <legend>Qui attaquer ?</legend>
      <p>
<?php

$retourPersos = $manager->getList($perso->nom());

if (empty($retourPersos))
{
  echo 'Personne a frapper !';
}

else
{
  if ($perso->estEndormi())
  {
    echo 'Un magicien vous a endormi ! Vous allez vous réveiller dans ', $perso->reveil(), '.';
  }
  
  else
  {
    foreach ($retourPersos as $unPerso)
    {
      echo '<a href="?frapper=', $unPerso->id(), '">', htmlspecialchars($unPerso->nom()), '</a> (pv : ', $unPerso->pv(), ' | type : ', $unPerso->type(),'| argent : ', $unPerso->argent(),')';
      
      
      if ($perso->type() == 'magicien')
      {
        echo ' | <a href="?ensorceler=', $unPerso->id(), '">Lancer un sort</a>';
      }
      
      echo '<br />';
    }
  }
}
?>
      </p>
    </fieldset>
<?php
}
else
{
?>
    <form action="" method="post">
      <p>
        Nom : <input type="text" name="nom" maxlength="50" /> <input type="submit" value="Utiliser ce personnage" name="utiliser" /><br />
        Type :
        <select name="type">
          <option value="magicien">Magicien</option>
          <option value="guerrier">Guerrier</option>
        </select>
        <input type="submit" value="Creer ce personnage" name="creer" />
      </p>
    </form>
<?php
}
?>
  </body>
</html>
<?php
if (isset($perso)) 
{
  $_SESSION['perso'] = $perso;
}