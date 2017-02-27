-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2017 at 10:34 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_dbms`
--
CREATE DATABASE IF NOT EXISTS `project_dbms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `project_dbms`;

-- --------------------------------------------------------

--
-- Table structure for table `book_issue_amount`
--

CREATE TABLE `book_issue_amount` (
  `student_id` int(11) NOT NULL,
  `no_books` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_issue_amount`
--

INSERT INTO `book_issue_amount` (`student_id`, `no_books`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `book_location`
--

CREATE TABLE `book_location` (
  `genre_id` int(11) NOT NULL,
  `genre_title` varchar(50) NOT NULL,
  `location` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_location`
--

INSERT INTO `book_location` (`genre_id`, `genre_title`, `location`) VALUES
(1, 'Education', 'A1'),
(2, 'Fiction', 'A2'),
(3, 'Science', 'E2'),
(4, 'Management', 'G1'),
(5, 'Mathematics', 'M2'),
(6, 'Uncategorized', 'B1');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(10) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `BookName` varchar(50) NOT NULL,
  `BookAuthor` varchar(20) NOT NULL,
  `BookEdition` int(5) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `ISBN`, `BookName`, `BookAuthor`, `BookEdition`, `genre_id`, `availability`) VALUES
(1, ' 9781944376031', 'Laws of thermodynamics', 'Helen Marks', 1, 1, 1),
(2, '9781943893201', 'Database Management System', 'RK Joshi', 3, 1, 1),
(3, '9781943893188', 'Microprocessor and Assembly Language', 'Stephen Colbert', 9, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Dep_id` int(20) NOT NULL,
  `dep_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dep_id`, `dep_name`) VALUES
(1, 'Computer Science and Engineering'),
(2, 'Electrical Engineering'),
(3, 'Civil Engineering'),
(4, 'Natural Sciences');

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

CREATE TABLE `issue` (
  `issue_id` int(11) NOT NULL,
  `issue_date` date NOT NULL,
  `book_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issue`
--

INSERT INTO `issue` (`issue_id`, `issue_date`, `book_id`, `student_id`) VALUES
(9, '2017-02-25', 1, 1),
(10, '2017-02-25', 1, 1),
(11, '2017-02-25', 2, 2),
(12, '2017-02-25', 2, 2),
(14, '2017-02-25', 3, 2),
(15, '2017-02-25', 3, 1),
(16, '2017-02-25', 2, 1),
(17, '2017-02-25', 1, 2),
(18, '2017-02-25', 1, 1),
(19, '2017-02-25', 2, 1),
(20, '2017-02-25', 3, 1),
(21, '2017-02-25', 2, 1),
(22, '2017-02-25', 1, 7),
(23, '2017-02-25', 2, 1),
(24, '2017-02-25', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `return_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `return_date` date NOT NULL,
  `fee_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`return_id`, `issue_id`, `book_id`, `return_date`, `fee_amount`) VALUES
(28, 9, 1, '2017-02-25', 0),
(29, 10, 1, '2017-02-25', 0),
(30, 11, 2, '2017-02-25', 0),
(31, 12, 2, '2017-02-25', 0),
(32, 14, 3, '2017-02-25', 0),
(33, 15, 3, '2017-02-25', 0),
(34, 16, 2, '2017-02-25', 0),
(35, 17, 1, '2017-02-25', 0),
(36, 18, 1, '2017-02-25', 0),
(37, 19, 2, '2017-02-25', 0),
(38, 20, 3, '2017-02-25', 0),
(39, 21, 2, '2017-02-25', 0),
(40, 22, 1, '2017-02-25', 0),
(41, 23, 2, '2017-02-25', 0),
(42, 24, 3, '2017-02-25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `gender`, `designation_id`) VALUES
(1, 'Ravi Chandra', 'm', 1),
(2, 'Sita Ram', 'f', 2);

--
-- Triggers `staff`
--
DELIMITER $$
CREATE TRIGGER `test_before_inserting` BEFORE INSERT ON `staff` FOR EACH ROW BEGIN
    IF NEW.gender not in ('M', 'F') THEN
        SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = 'check constraint on gender failed';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staff_contact`
--

CREATE TABLE `staff_contact` (
  `staff_id` int(11) NOT NULL,
  `address` varchar(40) DEFAULT NULL,
  `contact_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_contact`
--

INSERT INTO `staff_contact` (`staff_id`, `address`, `contact_number`) VALUES
(1, 'Lagankhel,Lalitpur', 5533534),
(2, 'New Road,Kathmandu', 5548226);

-- --------------------------------------------------------

--
-- Table structure for table `staff_designation`
--

CREATE TABLE `staff_designation` (
  `designation_id` int(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_designation`
--

INSERT INTO `staff_designation` (`designation_id`, `title`, `salary`) VALUES
(1, 'Librarian', 20000),
(2, 'Maintainance', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(20) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `Dep_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `student_name`, `Gender`, `Dep_id`) VALUES
(1, 'Arpan', 'm', 1),
(2, 'Rabin', 'f', 2),
(3, 'John', 'm', 3),
(4, 'Bobby', 'm', 4),
(7, 'Jillian', 'f', 3);

--
-- Triggers `student`
--
DELIMITER $$
CREATE TRIGGER `test_before_insert` BEFORE INSERT ON `student` FOR EACH ROW BEGIN
    IF NEW.Gender not in ('M', 'F') THEN
        SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = 'check constraint gender failed';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `student_contact`
--

CREATE TABLE `student_contact` (
  `student_id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_contact`
--

INSERT INTO `student_contact` (`student_id`, `address`, `email`) VALUES
(1, 'Thasikhel,Lalitpur', 'rey_arpankc7@gmail.com'),
(2, 'Chardobato,Banepa', 'randomemailid@gmail.com'),
(3, 'Jawlakhel,Kathmandu', 'john_wall@yahoo.com'),
(4, 'Tinkune,Kathmandu', 'bobby_ybbob@hotmail.com'),
(7, 'Basantapur,Tanahu', 'jillian_jill2210@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_issue_amount`
--
ALTER TABLE `book_issue_amount`
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- Indexes for table `book_location`
--
ALTER TABLE `book_location`
  ADD PRIMARY KEY (`genre_id`),
  ADD UNIQUE KEY `genre_id` (`genre_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `book_id` (`book_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dep_id`);

--
-- Indexes for table `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`issue_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`return_id`),
  ADD UNIQUE KEY `return_id` (`return_id`),
  ADD UNIQUE KEY `issue_id` (`issue_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `designation_id` (`designation_id`);

--
-- Indexes for table `staff_contact`
--
ALTER TABLE `staff_contact`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`);

--
-- Indexes for table `staff_designation`
--
ALTER TABLE `staff_designation`
  ADD PRIMARY KEY (`designation_id`),
  ADD UNIQUE KEY `designation_id` (`designation_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD KEY `Dep_id` (`Dep_id`);

--
-- Indexes for table `student_contact`
--
ALTER TABLE `student_contact`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `issue`
--
ALTER TABLE `issue`
  MODIFY `issue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_issue_amount`
--
ALTER TABLE `book_issue_amount`
  ADD CONSTRAINT `book_issue_amount_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `book_location` (`genre_id`);

--
-- Constraints for table `issue`
--
ALTER TABLE `issue`
  ADD CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `issue_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`);

--
-- Constraints for table `returns`
--
ALTER TABLE `returns`
  ADD CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `issue` (`issue_id`),
  ADD CONSTRAINT `returns_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`designation_id`) REFERENCES `staff_designation` (`designation_id`);

--
-- Constraints for table `staff_contact`
--
ALTER TABLE `staff_contact`
  ADD CONSTRAINT `staff_contact_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Dep_id`) REFERENCES `department` (`Dep_id`);

--
-- Constraints for table `student_contact`
--
ALTER TABLE `student_contact`
  ADD CONSTRAINT `student_contact_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
