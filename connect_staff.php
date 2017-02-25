<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname="project_dbms";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
//echo "Connected successfully";
$sea= $_GET["id"];
$sql="SELECT staff.staff_id,staff.staff_name,staff.gender,staff_designation.title, staff_contact.address, staff_contact.contact_number
FROM staff
INNER JOIN staff_designation
ON staff.designation_id=staff_designation.designation_id
INNER join staff_contact
ON staff.staff_id=staff_contact.staff_id

";

$sql1="SELECT staff.staff_id,staff.staff_name,staff.gender,staff_designation.title, staff_contact.address, staff_contact.contact_number
FROM staff
INNER JOIN staff_designation
ON staff.designation_id=staff_designation.designation_id
INNER join staff_contact
ON staff.staff_id=staff_contact.staff_id
WHERE staff.staff_id=
". $sea;



$student=array();

if($sea==null){
	$result = mysqli_query($conn, $sql);
}else{
	$result = mysqli_query($conn, $sql1);
}
if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
    	$student[] = $row;
    }

} else {
}
    echo json_encode($student);
?>