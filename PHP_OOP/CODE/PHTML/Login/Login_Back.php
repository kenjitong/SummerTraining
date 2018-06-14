<?php
require_once('Database.php');
if (isset($_POST['Wifi']) && isset($_POST['Username']) && isset($_POST['Password']))
{
  $q = "SELECT * FROM wifiinfo WHERE WifiName='".$_POST['Wifi']."' AND Username='".$_POST['Username']."' AND Password='".$_POST['Password']."';";
  // echo "$q";
  $result = $conn->query($q);
  if(!$result)
    {
      echo "Invalid";
    }
  else
    {
      $row = $result->fetch_assoc();
      print_r($row);
    }
}
?>
