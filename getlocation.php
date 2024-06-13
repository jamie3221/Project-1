<?php
$servername = "";
$username = "root";
$password = "";
$dbname = "IS_PROJECT";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "SELECT locationID, Lnames, Lcity, Lstateorcounty, Lcountry FROM location";
$result = $conn->query($sql);
$locations = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $locations[] = $row;
    }
}
echo json_encode($locations);
$conn->close();
?>
