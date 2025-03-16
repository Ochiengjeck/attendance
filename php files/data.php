<?php
header('Content-Type: application/json');

// Database credentials
$servername = "localhost";
$username = "root";
$password = "maraclara2002";
$dbname = "attend";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query to fetch data from admin table
$admin_sql = "SELECT * FROM admin";
$admin_result = $conn->query($admin_sql);

$admins = array();
if ($admin_result->num_rows > 0) {
    while($row = $admin_result->fetch_assoc()) {
        $admins[] = $row;
    }
}

// Query to fetch data from students table
$students_sql = "SELECT name FROM students";
$students_result = $conn->query($students_sql);

$students = array();
if ($students_result->num_rows > 0) {
    while($row = $students_result->fetch_assoc()) {
        $students[] = $row;
    }
}

// Query to fetch IoT data from students table
$iot_sql = "SELECT name FROM students WHERE IoT = 'enrolled'";
$iot_result = $conn->query($iot_sql);

$IoT = array();
if ($iot_result->num_rows > 0) {
    while ($row = $iot_result->fetch_assoc()) {
        $IoT[] = $row;
    }
}

// Query to fetch HCI data from students table
$hci_sql = "SELECT name FROM students WHERE HCI = 'enrolled'";
$hci_result = $conn->query($hci_sql);

$HCI = array();
if ($hci_result->num_rows > 0) {
    while ($row = $hci_result->fetch_assoc()) {
        $HCI[] = $row;
    }
}

// Query to fetch Linux data from students table
$linux_sql = "SELECT name FROM students WHERE Linux = 'enrolled'";
$linux_result = $conn->query($linux_sql);

$Linux = array();
if ($linux_result->num_rows > 0) {
    while ($row = $linux_result->fetch_assoc()) {
        $Linux[] = $row;
    }
}

// Query to fetch SAD data from students table
$sad_sql = "SELECT name FROM students WHERE SAD = 'enrolled'";
$sad_result = $conn->query($sad_sql);

$SAD = array();
if ($sad_result->num_rows > 0) {
    while ($row = $sad_result->fetch_assoc()) {
        $SAD[] = $row;
    }
}

// Query to fetch Graphics data from students table
$graphics_sql = "SELECT name FROM students WHERE Graphics = 'enrolled'";
$graphics_result = $conn->query($graphics_sql);

$Graphics = array();
if ($graphics_result->num_rows > 0) {
    while ($row = $graphics_result->fetch_assoc()) {
        $Graphics[] = $row;
    }
}

// Combine data into a single array
$data = array(
  'admins' => $admins,
  'students' => $students,
  'iot' => $IoT,
  'hci' => $HCI,
  'linux' => $Linux,
  'sad' => $SAD,
  'graphics' => $Graphics
);

// Convert data to JSON format
echo json_encode($data);

$conn->close();
?>
