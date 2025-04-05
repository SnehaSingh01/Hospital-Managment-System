-- phpMyAdmin SQL Dump - Modified for Modern Standards
-- Database: `myhmsdb`

DROP DATABASE IF EXISTS `myhmsdb`;
CREATE DATABASE `myhmsdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `myhmsdb`;

-- Admin Table
CREATE TABLE IF NOT EXISTS `admintb` (
  `username` VARCHAR(50) PRIMARY KEY,
  `password` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `admintb` (`username`, `password`) VALUES 
('admin', 'admin123');

-- Doctor Table
CREATE TABLE IF NOT EXISTS `doctb` (
  `username` VARCHAR(50) PRIMARY KEY,
  `password` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `spec` VARCHAR(50) NOT NULL,
  `docFees` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `doctb` (`username`, `password`, `email`, `spec`, `docFees`) VALUES
('ashok', 'ashok123', 'ashok@gmail.com', 'General', 500),
('arun', 'arun123', 'arun@gmail.com', 'Cardiologist', 600),
('Dinesh', 'dinesh123', 'dinesh@gmail.com', 'General', 700),
('Ganesh', 'ganesh123', 'ganesh@gmail.com', 'Pediatrician', 550),
('Kumar', 'kumar123', 'kumar@gmail.com', 'Pediatrician', 800),
('Amit', 'amit123', 'amit@gmail.com', 'Cardiologist', 1000),
('Abbis', 'abbis123', 'abbis@gmail.com', 'Neurologist', 1500),
('Tiwary', 'tiwary123', 'tiwary@gmail.com', 'Pediatrician', 450);

-- Patient Table
CREATE TABLE IF NOT EXISTS `patreg` (
  `pid` INT AUTO_INCREMENT PRIMARY KEY,
  `fname` VARCHAR(20) NOT NULL,
  `lname` VARCHAR(20) NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `contact` VARCHAR(15) NOT NULL,
  `password` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- No cpassword field needed for security

-- Contact Table
CREATE TABLE IF NOT EXISTS `contact` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `contact` VARCHAR(15) NOT NULL,
  `message` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Appointment Table
CREATE TABLE IF NOT EXISTS `appointmenttb` (
  `ID` INT AUTO_INCREMENT PRIMARY KEY,
  `pid` INT NOT NULL,
  `fname` VARCHAR(20) NOT NULL,
  `lname` VARCHAR(20) NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `contact` VARCHAR(15) NOT NULL,
  `doctor` VARCHAR(50) NOT NULL,
  `docFees` INT NOT NULL,
  `appdate` DATE NOT NULL,
  `apptime` TIME NOT NULL,
  `userStatus` TINYINT(1) NOT NULL,
  `doctorStatus` TINYINT(1) NOT NULL,
  FOREIGN KEY (`pid`) REFERENCES `patreg`(`pid`) ON DELETE CASCADE,
  FOREIGN KEY (`doctor`) REFERENCES `doctb`(`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Prescription Table
CREATE TABLE IF NOT EXISTS `prestb` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `doctor` VARCHAR(50) NOT NULL,
  `pid` INT NOT NULL,
  `appointment_id` INT NOT NULL,
  `fname` VARCHAR(50) NOT NULL,
  `lname` VARCHAR(50) NOT NULL,
  `appdate` DATE NOT NULL,
  `apptime` TIME NOT NULL,
  `disease` VARCHAR(255) NOT NULL,
  `allergy` VARCHAR(255),
  `prescription` TEXT NOT NULL,
  FOREIGN KEY (`pid`) REFERENCES `patreg`(`pid`),
  FOREIGN KEY (`doctor`) REFERENCES `doctb`(`username`),
  FOREIGN KEY (`appointment_id`) REFERENCES `appointmenttb`(`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sample data insertion (can be added later as needed)
