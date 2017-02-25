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
$sql="SELECT issue.issue_id,books.book_id,books.BookName,student.student_name,department.dep_name,issue.issue_date,returns.return_date
FROM issue
INNER JOIN books
ON issue.book_id=books.book_id
INNER JOIN student
ON student.student_id=issue.student_id
INNER JOIN department
ON student.Dep_id=department.Dep_id
LEFT JOIN returns
ON issue.issue_id=returns.issue_id
";

$sql1="SELECT issue.issue_id,books.book_id,books.BookName,student.student_name,department.dep_name,issue.issue_date,returns.return_date
FROM issue
INNER JOIN books
ON issue.book_id=books.book_id
INNER JOIN student
ON student.student_id=issue.student_id
INNER JOIN department
ON student.Dep_id=department.Dep_id
LEFT JOIN returns
ON issue.issue_id=returns.issue_id
WHERE books.book_id=
".$sea;

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