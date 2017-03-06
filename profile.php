<?php


// Start Session
session_start();

// check user login
if(empty($_SESSION['user_id']))
{
    header("Location: index.php");
}

// Database connection
require __DIR__ . '/database.php';
$db = DB();

// Application library ( with DemoLib class )
require __DIR__ . '/lib/library.php';
$app = new DemoLib();

$user = $app->UserDetails($_SESSION['user_id']); // get user details

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Tangerine" rel="stylesheet">


</head>
<body id="profil">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <h2 id="h2">Profile</h2>
                <h3 id="h3">Hello <?php echo $user->name ?>,</h3>
            </div>
            <div class="col-md-3" style="padding-bottom: 25%">
                <a href="logout.php" class="btn btn-default" id="h6">Logout</a>
            </div>
        </div>

        <br />

        <div class="row">
            <div class="col-md-12">
                <a href="jeux.php" class="btn btn-default btn-lg btn-block" id="h1">Start</a>
            </div>
        </div>
    </div>
</body>
</html>
