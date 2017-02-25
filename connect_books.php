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
$sql="SELECT books.book_id,books.ISBN,books.BookName,books.BookAuthor, book_location.genre_title, book_location.location
FROM books
INNER JOIN book_location
ON books.genre_id=book_location.genre_id
";

$sql1="SELECT books.book_id,books.ISBN,books.BookName,books.BookAuthor, book_location.genre_title, book_location.location
FROM books
INNER JOIN book_location
ON books.genre_id=book_location.genre_id
WHERE books.book_id=
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