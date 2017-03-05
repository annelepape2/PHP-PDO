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
</head>
<body>
    <div class="container">
        <div class="well">
            <h2>
                Profile
            </h2>
            <h3>Hello <?php echo $user->name ?>,</h3>
            <p>
                <a href="jeux.php" class="btn btn-info">Débuter la partie</a>
            </p>
            <a href="logout.php" class="btn btn-primary">Logout</a>
        </div>
    </div>
</body>
</html>
