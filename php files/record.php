<?php
include "database.php";

// Get the JSON data sent from Flutter
$data = json_decode(file_get_contents('php://input'), true);
$className = $data['className']; // Receive className from Flutter
$names = $data['names'];

// Get the current date and time
$date = date('Y_m_d_H');
$col = "{$className}_date_{$date}";

// Check if the column exists
$check_column_sql = "SHOW COLUMNS FROM students LIKE '$col'"; // Use $col instead of $date
$result = $conn->query($check_column_sql);
if ($result->num_rows == 0) {
    // Column does not exist, add it
    $alter_sql = "ALTER TABLE students ADD COLUMN `$col` VARCHAR(10) DEFAULT 'absent'";
    if ($conn->query($alter_sql) === TRUE) {
        echo "New column created successfully.\n";
    } else {
        echo "Error creating column: " . $conn->error . "\n";
    }
} else {
    echo "Column already exists.\n";
}

// Check if names are received
if (!empty($names)) {
    foreach ($names as $name) {
        // Check if the name exists in the database and enrolled in the class
        $enrollmentQuery = "SELECT $className FROM students WHERE id = '$name'";
        $enrollmentResult = $conn->query($enrollmentQuery);
        
        // Check if the enrollment status is 'enrolled' or 'not'
        if ($enrollmentResult->num_rows > 0) {
            $enrollmentStatus = $enrollmentResult->fetch_assoc()[$className];
            $attendanceValue = '';

            if ($enrollmentStatus == 'enrolled') {
                $attendanceValue = 'present';
            } elseif ($enrollmentStatus == 'not') {
                $attendanceValue = 'not a student';
            } else {
                echo "Error: Unknown enrollment status for $name\n";
                continue; // Skip this record if enrollment status is unknown
            }

            // Update the table with attendance record
            $update_sql = "UPDATE students SET `$col` = '$attendanceValue' WHERE id = '$name'";
            if ($conn->query($update_sql) === TRUE) {
                echo "Record updated successfully for $name\n";
            } else {
                echo "Error updating record for $name: " . $conn->error . "\n";
            }
        } else {
            echo "Name $name not found in the database or not enrolled in $className\n";
        }
    }
} else {
    echo "No names received";
}

$conn->close();
?>
