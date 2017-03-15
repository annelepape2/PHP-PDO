<?php

/*
  Usage :
   $pdo = Database::getInstance();

*/


class Database
{
    static private $_instance = null;

    public function __construct()
    {
        trigger_error("Not allowed to create a Database Object");
    }

    private static function getPDO()
    {
        $db = new PDO('mysql:host=localhost:3306;dbname=php_tp1','root','root');
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
        return $db;
    }

    static public function getInstance()
    {
        if(self::$_instance == null)
        {
            self::$_instance = self::getPDO();
        }
        return self::$_instance;
    }

}

// database Connection variables
define('HOST', 'localhost:3306'); // Database host name ex. localhost
define('USER', 'root'); // Database user. ex. root ( if your on local server)
define('PASSWORD', 'root'); // Database user password  (if password is not set for user then keep it empty )
define('DATABASE', 'php_tp1'); // Database Database name

function DB()
{
    try {
        $db = new PDO('mysql:host=localhost:8889;dbname=php_tp1','root','root');
        return $db;
    } catch (PDOException $e) {
        return "Error!: " . $e->getMessage();
        die();
    }
}
?>

