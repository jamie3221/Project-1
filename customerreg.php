<?php
$servername = "";
$username = "root";
$password = "";
$dbname = "IS_PROJECT";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$name = $_POST['name'];
$email = $_POST['email'];
$password = $_POST['password'];
$phone = $_POST['phone'];
$address = $_POST['address'];
$locationID = $_POST['location'];
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo "Invalid email format.";
    $conn->close();
    exit;
}
$emailCheckSQL = "SELECT * FROM customer WHERE Cemail='$email' UNION SELECT * FROM ServiceProvider WHERE SPemail='$email'";
$emailCheckResult = $conn->query($emailCheckSQL);
if ($emailCheckResult->num_rows > 0) {
    echo "This email is already registered. Please use a different email.";
    $conn->close();
    exit;
}
$profilePic = null;
if (isset($_FILES['profilePic']) && $_FILES['profilePic']['error'] == 0) {
    $targetDir = "uploads/";
    $targetFile = $targetDir . basename($_FILES["profilePic"]["name"]);
    if (move_uploaded_file($_FILES["profilePic"]["tmp_name"], $targetFile)) {
        $profilePic = $targetFile;
    } else {
        echo "Sorry, there was an error uploading your file.";
        exit;
    }
}
$sql = "INSERT INTO customer (Cname, Cemail, Cpassword, Caddress, Cphone, CprofilePic, locationID)
        VALUES ('$name', '$email', '$password', '$address', '$phone', '$profilePic', $locationID)";
if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>