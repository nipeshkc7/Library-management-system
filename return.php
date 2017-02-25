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
$bea= $_GET["bid"];

// $sql="SELECT MAX(issue.issue_id) AS issue_id, issue.issue_date, issue.student_id, books.availability,
// 		CASE WHEN NOW() > DATE_ADD(issue.issue_date, INTERVAL 20 DAY)
//             THEN 10*DATEDIFF(NOW(), DATE_ADD(issue.issue_date, INTERVAL 20 DAY))
//             ELSE 0 END AS fine_amount
//             FROM issue
//             INNER JOIN books
//             ON issue.book_id=books.book_id
//             WHERE books.book_id=".$bea;

$sql="SELECT issue.issue_id AS issue_id, issue.issue_date, issue.student_id, books.availability,
    CASE WHEN NOW() > DATE_ADD(issue.issue_date, INTERVAL 20 DAY)
        THEN 10*DATEDIFF(NOW(), DATE_ADD(issue.issue_date, INTERVAL 20 DAY))
        ELSE 0 END AS fine_amount
        FROM issue
        INNER JOIN books
        ON issue.book_id=books.book_id
        WHERE books.book_id=".$bea. "
        ORDER BY issue.issue_id DESC LIMIT 1";

$result = mysqli_query($conn, $sql);

$issue_info= mysqli_fetch_array($result);
//if (mysqli_num_rows($result) > 0) {
if ($result!=null && $issue_info['availability']==0){
	//Update return table
	//because the book has an issue id
	$issue_id=$issue_info['issue_id'];
	$issue_date=$issue_info['issue_date'];
	$fine_amount=$issue_info['fine_amount'];
	$student_id=$issue_info['student_id'];

    $sql_update="INSERT INTO returns(issue_id,book_id,return_date,fee_amount) 
				VALUES (".$issue_id.",".$bea.",CURRENT_DATE,".$fine_amount.");";

	$finalquery=mysqli_query($conn,$sql_update);

	$sql_bookcounter="UPDATE book_issue_amount
						SET no_books=no_books-1
						WHERE student_id=".$student_id;

	
	$sql_availability="UPDATE books SET availability=1 WHERE book_id=".$bea;

	if($finalquery){
		mysqli_query($conn,$sql_availability);
		mysqli_query($conn,$sql_bookcounter);
		echo $fine_amount; 
	}
    
    }
    else{
    	//The book was never issued So return nothing
    }


?>