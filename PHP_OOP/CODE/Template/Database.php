<?php
$servername = "127.0.0.1";
$username = "root";
$password = "";
$mydb = "IOT"

// Create connection
$conn = new mysqli($servername,$username,$password,$mydb);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
else {
  echo "Connected successfully";
}
?>
