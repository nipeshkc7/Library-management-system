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
$sea= $_GET["sid"];
$bea= $_GET["bid"];

$sql="SELECT no_books FROM book_issue_amount WHERE student_id=".$sea;

$sql1="UPDATE book_issue_amount 
		SET no_books=no_books+1
		WHERE student_id=".$sea;

$sql2="INSERT INTO issue(issue_date,book_id,student_id) VALUES (CURRENT_DATE,".$bea.",".$sea.")";

$sql3="SELECT issue.issue_date,issue.issue_id,student.student_name,books.BookName
	FROM issue
	INNER JOIN student
	ON student.student_id=issue.student_id
	INNER JOIN books
	ON books.book_id=issue.book_id
	WHERE issue_id=LAST_INSERT_ID();";


$sql_availablility="SELECT availability FROM books WHERE book_id=".$bea;
$checkavail=mysqli_query($conn,$sql_availablility);
$chk=mysqli_fetch_array($checkavail);

if($chk['availability']==1){
			$result = mysqli_query($conn, $sql);
			$student=array();
			$result = mysqli_query($conn, $sql);
			$book_amount= mysqli_fetch_array($result);

			//CHECK  BOOK AMOUNT
			if($book_amount['no_books']<4){
				
				$result2 = mysqli_query($conn, $sql2); //INSERT INTO ISSUE TABLE
				$result3= mysqli_query($conn, $sql3);  //SELECT the data to display

				$sql_makeunavailable="UPDATE books SET availability=0 WHERE book_id=".$bea;
				if ($result2=="true"){
					//INCREMENT BOOK COUNTER
					$result1=mysqli_query($conn, $sql1);
					mysqli_query($conn,$sql_makeunavailable);
					$row = mysqli_fetch_assoc($result3);
					echo json_encode($row);
				}
				else{
					echo "ERROR1";  //FOR BOOK ALREADY TAKEN //UNABLE TO UPDATE DATABASE
				}
			}else{
					echo "ERROR2"; //BOOK LIMIT EXCEEDED FOR STUDENT
			}
}else{
	echo"NA";
}
?>