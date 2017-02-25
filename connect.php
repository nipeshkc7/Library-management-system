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
$sql="SELECT student.student_id,student.student_name,student.Gender,department.dep_name,student_contact.address,student_contact.email
FROM student
INNER JOIN department
ON student.Dep_id=department.Dep_id
INNER JOIN student_contact
ON student.student_id=student_contact.student_id";

$sql1="SELECT student.student_id,student.student_name,student.Gender,department.dep_name,student_contact.address,student_contact.email
FROM student
INNER JOIN department
ON student.Dep_id=department.Dep_id
INNER JOIN student_contact
ON student.student_id=student_contact.student_id
WHERE student.student_id=
". $sea;

class studentInfo{
	public $address="";
	public $studentId="";
	public $studentName="";
	public $gender="";
	public $department="";
	public $email="";

}

$student=array();

if($sea==null){
	$result = mysqli_query($conn, $sql);
}else{
	$result = mysqli_query($conn, $sql1);
}
if (mysqli_num_rows($result) > 0) {
	$std=new studentInfo();
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
    	$student[] = $row;
    }

} else {
    
}

    echo json_encode($student);




?>