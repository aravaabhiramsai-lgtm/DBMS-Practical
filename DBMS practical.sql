#Create a Hospital Staff Management System using Department and Staff tables.
#1. Create both tables with suitable attributes and establish a Primary Key and Foreign Key relationship.
#2. Apply appropriate NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
#3. Insert at least 4 department records and 6 staff records.
#4. Display staff members whose salaries fall between ₹25,000 and ₹50,000.
#5. Display staff members whose names start with a specified letter using LIKE.
#6. Display staff members belonging to selected departments using IN.
#. Display unique staff designations using DISTINCT.
#8. Count the number of staff members in each department using GROUP BY and COUNT().
#9. Display the maximum and minimum salary using MAX() and MIN().
#10. Update the salary of a staff member.
#11. Display the final staff records using SELECT with appropriate column aliases

CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50) DEFAULT 'Main Block'
);

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(50) NOT NULL,
    designation VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) CHECK (salary >= 0),
    email VARCHAR(100) UNIQUE,
    dept_id INT,
    FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id)
);

INSERT INTO Department VALUES
(1, 'Cardiology', 'Block A'),
(2, 'Neurology', 'Block B'),
(3, 'Orthopedics', 'Block C'),
(4, 'Pediatrics', DEFAULT);

INSERT INTO Staff VALUES
(101, 'Rahul', 'Doctor', 45000, 'rahul@hospital.com', 1),
(102, 'Priya', 'Nurse', 28000, 'priya@hospital.com', 1),
(103, 'Amit', 'Surgeon', 60000, 'amit@hospital.com', 2),
(104, 'Sneha', 'Nurse', 32000, 'sneha@hospital.com', 3),
(105, 'Kiran', 'Receptionist', 22000, 'kiran@hospital.com', 4),
(106, 'Ravi', 'Doctor', 50000, 'ravi@hospital.com', 2);

SELECT * FROM Staff
WHERE salary BETWEEN 25000 AND 50000;

SELECT * FROM Staff
WHERE staff_name LIKE 'R%';

SELECT * FROM Staff
WHERE dept_id IN (1, 2);

SELECT DISTINCT designation
FROM Staff;

SELECT dept_id, COUNT(*) AS total_staff
FROM Staff
GROUP BY dept_id;

SELECT
    MAX(salary) AS maximum_salary,
    MIN(salary) AS minimum_salary
FROM Staff;

UPDATE Staff
SET salary = 48000
WHERE staff_id = 101;

SELECT
    staff_id AS 'Staff ID',
    staff_name AS 'Staff Name',
    designation AS 'Job Designation',
    salary AS 'Monthly Salary',
    email AS 'Email Address',
    dept_id AS 'Department ID'
FROM Staff;