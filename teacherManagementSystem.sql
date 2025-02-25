-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.41 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for teachers_management
CREATE DATABASE IF NOT EXISTS `teachers_management` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `teachers_management`;

-- Dumping structure for table teachers_management.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `gender_id` int NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(45) NOT NULL,
  PRIMARY KEY (`gender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table teachers_management.gender: ~2 rows (approximately)
INSERT INTO `gender` (`gender_id`, `gender_name`) VALUES
	(1, 'Male'),
	(2, 'Female');

-- Dumping structure for table teachers_management.month
CREATE TABLE IF NOT EXISTS `month` (
  `month_id` int NOT NULL AUTO_INCREMENT,
  `month_name` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`month_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table teachers_management.month: ~12 rows (approximately)
INSERT INTO `month` (`month_id`, `month_name`) VALUES
	(1, 'January'),
	(2, 'February'),
	(3, 'March'),
	(4, 'Aprill'),
	(5, 'May'),
	(6, 'June'),
	(7, 'July'),
	(8, 'Auguest'),
	(9, 'September'),
	(10, 'Octomber'),
	(11, 'November'),
	(12, 'December');

-- Dumping structure for table teachers_management.salarymanagement
CREATE TABLE IF NOT EXISTS `salarymanagement` (
  `teacher_id` int NOT NULL,
  `month_month_id` int NOT NULL,
  `full_Salary` double NOT NULL,
  `paid_salary` double NOT NULL,
  `status` varchar(10) NOT NULL,
  `paid_date` date NOT NULL,
  `year` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `attend_dates` int NOT NULL,
  PRIMARY KEY (`teacher_id`,`month_month_id`,`year`) USING BTREE,
  KEY `fk_salaryManagement_teacher1_idx` (`teacher_id`),
  KEY `fk_salaryManagement_month1_idx` (`month_month_id`),
  CONSTRAINT `fk_salaryManagement_month1` FOREIGN KEY (`month_month_id`) REFERENCES `month` (`month_id`),
  CONSTRAINT `fk_salaryManagement_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table teachers_management.salarymanagement: ~4 rows (approximately)
INSERT INTO `salarymanagement` (`teacher_id`, `month_month_id`, `full_Salary`, `paid_salary`, `status`, `paid_date`, `year`, `attend_dates`) VALUES
	(14, 2, 8000, 8000, 'PAID', '2025-02-24', '2025', 4),
	(15, 2, 4000, 4000, 'PAID', '2025-02-24', '2025', 2),
	(16, 2, 4000, 4000, 'PAID', '2025-02-24', '2025', 2),
	(17, 1, 20000, 20000, 'PAID', '2025-02-23', '2025', 10),
	(18, 2, 4000, 4000, 'PAID', '2025-02-24', '2025', 2);

-- Dumping structure for table teachers_management.teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `teacher_status` varchar(45) DEFAULT NULL,
  `mobile` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `gender_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teacher_gender_idx` (`gender_id`),
  CONSTRAINT `fk_teacher_gender` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table teachers_management.teacher: ~6 rows (approximately)
INSERT INTO `teacher` (`id`, `first_name`, `last_name`, `email`, `teacher_status`, `mobile`, `address`, `gender_id`) VALUES
	(13, 'Nethmina', 'Bandara', 'herathnethuwa@gmail.com', 'Deactive', '0775938450', 'Udathawa,Matikubura,Polgahawela', 1),
	(14, 'Sachethana', 'Thennakoon', 'chethana33@yahoo.com', 'Active', '0776785432', 'Udathawa,Matikubura,Polgahawela', 2),
	(15, 'Chethana', 'Thennakon', 'chethana33@gmail.com', 'Active', '0776785432', 'Udathawa,Matikubura,Polgahawela', 2),
	(16, 'Chaminda ', 'Herath', 'herathcc@gmail.com', 'Active', '0702093270', 'Polgahawela,Kurunegala', 1),
	(17, 'Sathsara ', 'Savinda', 'sathsara33@yahoo.com', 'Active', '0724443270', 'Udathwa,Matikubura,Polgahawela', 1),
	(18, 'Gayani', 'Herath', 'gayaniherath73@gmail.com', 'Active', '0717706939', 'Kurunegala,Waduragala', 2);

-- Dumping structure for table teachers_management.teacher_attendanse
CREATE TABLE IF NOT EXISTS `teacher_attendanse` (
  `date` date NOT NULL,
  `on_time` varchar(50) DEFAULT NULL,
  `leave_time` varchar(50) DEFAULT NULL,
  `attend` varchar(50) DEFAULT NULL,
  `on_attendanse_status` varchar(10) DEFAULT NULL,
  `month_month_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`teacher_id`,`date`),
  KEY `fk_teacher_attendanse_month1_idx` (`month_month_id`),
  KEY `fk_teacher_attendanse_teacher1_idx` (`teacher_id`),
  CONSTRAINT `fk_teacher_attendanse_month1` FOREIGN KEY (`month_month_id`) REFERENCES `month` (`month_id`),
  CONSTRAINT `fk_teacher_attendanse_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table teachers_management.teacher_attendanse: ~13 rows (approximately)
INSERT INTO `teacher_attendanse` (`date`, `on_time`, `leave_time`, `attend`, `on_attendanse_status`, `month_month_id`, `teacher_id`) VALUES
	('2025-02-08', '01-29', '01-29', 'attend', 'Leaved', 2, 13),
	('2025-02-08', '08-42', '08-42', 'attend', 'Leaved', 2, 14),
	('2025-02-10', '09-25', '09-25', 'attend', 'Leaved', 2, 14),
	('2025-02-13', '08-43', '08-43', 'attend', 'Leaved', 2, 14),
	('2025-02-23', '19-48', '19-48', 'attend', 'Leaved', 2, 14),
	('2025-02-08', '01-28', '01-29', 'attend', 'Leaved', 2, 15),
	('2025-02-10', '09-26', '09-26', 'attend', 'Leaved', 2, 15),
	('2025-02-10', '09-26', '09-26', 'attend', 'Leaved', 2, 16),
	('2025-02-23', '19-53', '19-53', 'attend', 'Leaved', 2, 16),
	('2025-02-14', '09-38', '09-38', 'attend', 'Leaved', 2, 17),
	('2025-02-24', '20-22', '20-22', 'attend', 'Leaved', 2, 17),
	('2025-02-10', '10-14', '10-14', 'attend', 'Leaved', 2, 18),
	('2025-02-23', '19-48', '19-48', 'attend', 'Leaved', 2, 18);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
