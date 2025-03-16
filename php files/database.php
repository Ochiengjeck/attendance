<?php
header('Content-Type: application/json');

$db_server ="localhost";
$db_user ="root";
$db_pass="maraclara2002";
$db_name ="attend";
$conn;

try{
    $conn = mysqli_connect($db_server,
                        $db_user,
                        $db_pass,
                        $db_name);

}
catch(mysqli_sql_exception){
    echo 'could not connect';
}
?>
C:\xampp\htdocs\attendance\database.php