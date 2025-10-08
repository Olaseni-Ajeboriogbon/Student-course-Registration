/* DataKirk Student Database--------------------------- */

-- Name: Olaseni Ajeboriogbon
-- Project: Student Database Management

-- Create database	Datakirk;
Use datakirk;

-- Creating Tables -------------------------------------------------------------

CREATE TABLE `Courses` (
    `Course_ID` INT AUTO_INCREMENT,
    `Course_code` VARCHAR(100) NOT NULL unique key,
    `Course Title` VARCHAR(100) NOT NULL,
    `Credits` VARCHAR(100) NOT NULL,
    `Department` VARCHAR(100) NOT NULL,
    `Created_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Updated_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created by` VARCHAR(100) NOT NULL,
    `updated by` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`Course_ID`)
);

CREATE TABLE `Prerequisite_Table` (
    `Course_ID` INT,
    `Prerequisite_ID` INT auto_increment primary key,
    `Course` VARCHAR(100),
    `Prerequisite_Code` VARCHAR(50) Unique key,
    `Created_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Updated_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created by` VARCHAR(100),
    `updated by` VARCHAR(100) NOT NULL,
    FOREIGN KEY (`Course_ID`)
        REFERENCES `Courses` (`Course_id`)
);
    
CREATE TABLE `Student Table` (
    `Student_ID` INT auto_increment,
    `First_Name` VARCHAR(100) not null,
    `Last_Name` VARCHAR(100) Not Null,
	Gender VARCHAR(20),
    `Email` VARCHAR(100) Not Null,
    `Phone` VARCHAR(100),
    `Major` VARCHAR(100) Not null,
    `Year` varchar(20),
    `Created_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Updated_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created by` VARCHAR(100) NULL,
    `updated by` VARCHAR(100) NULL,
    PRIMARY KEY (`Student_ID`)
);

CREATE TABLE `Course Offering` (
    `Offering_ID` INT AUTO_INCREMENT NOT NULL,
    `Course_ID` INT NOT NULL,
    `Course_code` Varchar(100) not null,
    `Semester` VARCHAR(100) NOT NULL,
    `Student_ID` INT NOT NULL,
    `Instructor_ID` INT NOT NULL,
    `Schedule` VARCHAR(100),
    `Created_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Updated_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created by` VARCHAR(100),
    `updated by` VARCHAR(100),
    PRIMARY KEY (`Offering_ID`),
    FOREIGN KEY (`Course_ID`)
        REFERENCES `Courses` (`course_ID`),
    FOREIGN KEY (instructor_ID)
        REFERENCES `instructor table` (`instructor_id`),
    FOREIGN KEY (`student_ID`)
        REFERENCES `student table` (`student_ID`)
);

CREATE TABLE `Instructor Table` (
    `Instructor_Id` INT auto_increment Not Null,
    `First Name` VARCHAR(100) Not Null,
    `Last Name` VARCHAR(100) Not Null,
    `Email` VARCHAR(100) Not Null,
    `Department` VARCHAR(100) Not Null,
    `Created_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Updated_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created by` VARCHAR(100) NULL,
    `updated by` VARCHAR(100) NULL,
    PRIMARY KEY (`Instructor_Id`)
);

CREATE TABLE `Grade Table` (
    `Grade Id` INT AUTO_INCREMENT,
    `Grade` VARCHAR(20) NOT NULL,
    `Grade score` varchar(20) NOT NULL,
    `Created_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Updated_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created by` VARCHAR(100) NULL,
    `updated by` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`Grade Id`),
    UNIQUE KEY (`Grade`)
);

CREATE TABLE `Enrollment` (
    `Serial No` INT AUTO_INCREMENT not null,
    `Student_ID` INT NOT NULL,
    `Offering_ID` INT NOT NULL,
    `Enrolment Date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Enrollment status` VARCHAR(50) NOT NULL,
    `Created_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Updated_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created by` VARCHAR(100) NOT NULL,
    `updated by` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`Serial No`),
    FOREIGN KEY (`Offering_ID`)
        REFERENCES `Course Offering` (`offering_ID`),
    FOREIGN KEY (`Student_ID`)
        REFERENCES `Student table` (`student_ID`)
);

CREATE TABLE `Student_Academic_Records` (
`record_id` int auto_increment primary key,
    `Student_ID` INT not Null,
    `Offering_ID` INT Not null,
    `course_code` varchar(50),
    `score` numeric Not null,
    `Grade` VARCHAR(20) Not Null,
    `Created_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Updated_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created by` VARCHAR(100) NOT NULL,
    `updated by` VARCHAR(100) NOT NULL,
    FOREIGN KEY (`Offering_ID`)
        REFERENCES `Course Offering` (`offering_ID`),
	FOREIGN KEY (`course_code`)
        REFERENCES `courses` (`course_code`),
    FOREIGN KEY (`Grade`)
        REFERENCES `Grade Table` (`Grade`),
    FOREIGN KEY (`Student_ID`)
        REFERENCES `Student table` (`student_ID`)
);

/* --------Inserting and importing Data Into Tables---------- 
data was populated using csv and then imported into the workbench
This local_infile allows for swift importation*/

set global local_infile = 1;

load data local infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/student_table_final.csv'
into table `student table`
fields terminated by ','
ignore 1 rows;

load data local infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/courses_table.csv'
into table `courses`
fields terminated by ','
ignore 1 rows;

load data local infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Instructor table.csv'
into table `Instructor table`
fields terminated by ','
ignore 1 rows;

load data local infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/course_offering.csv'
into table `course offering`
fields terminated by ','
ignore 1 rows;

load data local infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/enrollment_data.csv'
into table `Enrollment`
fields terminated by ','
ignore 1 rows;

INSERT INTO `Grade Table` (`Grade`, `Grade score`, `created by`, `updated by`)
VALUES
    ('A+', '90-100', 'system', 'system'),
    ('A', '85-89', 'system', 'system'),
    ('A-', '80-84', 'system', 'system'),
    ('B+', '75-79', 'system', 'system'),
    ('B', '70-74', 'system', 'system'),
    ('B-', '65-69', 'system', 'system'),
    ('C+', '60-64', 'system', 'system'),
    ('C', '55-59', 'system', 'system'),
    ('C-', '50-54', 'system', 'system'),
    ('D', '45-49', 'system', 'system'),
    ('E', '40-44', 'system', 'system'),
    ('F', '0-39', 'system', 'system');
    
INSERT INTO `Prerequisite_Table` (Course, `Prerequisite_code`, `created by`, `updated by`)
VALUES
('Introduction to Programming', 'CS101' ,'system', 'system'),
('Data Structures', 'CS102' ,'system','system'),
('Algorithms', 'CS201' , 'system','system'),
('Database Systems', 'CS202' ,'system','system'),
('Operating Systems', 'CS203' ,'system','system'),
('Software Engineering', 'CS301' ,'system','system'),
('Computer Networks', 'CS302' ,'system','system'),
('Machine Learning','CS401','system','system'),
('Artificial Intelligence', 'CS402','system','system'),
('Web Development', 'CS103','system', 'system');
    
/* Creating a trigger for enrolment table for student when enrolled for a course on the course offering table
Whenever data is inputted into the course offering table, the trigger fires and automatically populate the enrollment table*/
    
/*   DELIMITER $$

CREATE TRIGGER Enrolment_status
AFTER INSERT ON `course offering`
FOR EACH ROW
BEGIN
    INSERT INTO enrollment (`student_id`, `offering_id`, `enrollment_status`)
    VALUES (NEW.student_id, NEW.offering_id, 'Enrolled');
END$$

DELIMITER ;

-- This trigger is to populate the Grade column on the student academic records using case statement

/*DELIMITER $$ 

CREATE TRIGGER Student_Grade_Assessment
BEFORE INSERT ON `Student_Academic_Records` 
FOR EACH ROW
BEGIN
    -- Assigning the Grade based on the score
    SET NEW.Grade =
        CASE
            WHEN NEW.score >= 90 AND NEW.score <= 100 THEN 'A+'
            WHEN NEW.score >= 85 AND NEW.score <89 THEN 'A'
            WHEN NEW.score >= 80 AND NEW.score < 84  THEN 'A-'
            WHEN NEW.score >= 75 AND NEW.score < 79 THEN 'B+'
            WHEN NEW.score >= 70 AND NEW.score < 74 THEN 'B'
            WHEN NEW.score >= 65 AND NEW.score < 69  THEN 'B-'
            WHEN NEW.score >= 60 AND NEW.score < 64  THEN 'C+'
            WHEN NEW.score >= 55 AND NEW.score < 59  THEN 'C'
            WHEN NEW.score >= 50 AND NEW.score < 54 THEN 'C-'
            WHEN NEW.score >= 45 AND NEW.score < 49  THEN 'D'
            WHEN NEW.score >= 40 AND NEW.score < 44  THEN 'E'
            
            ELSE 'F' -- For scores below 40
        END;
END$$

DELIMITER ;*/



SELECT 
    *
FROM
    `Student_Academic_Records`;
    
-- Inserting records into the academic records table to test the functionality of the trigger--

/*INSERT INTO Student_Academic_Records
(Student_ID, Offering_ID, course_code, score,`created by`, `updated by`)
VALUES
(1, 3, 'CSE450', 14,'Admin', 'Admin'),
(2, 4, 'PHY189', 71,'Admin', 'Admin'),
(2, 5, 'PHY351', 60,'Admin', 'Admin'),
(3, 6, 'PHY456', 20,'Admin', 'Admin'),
(3, 7, 'MAT431', 82,'Admin', 'Admin'),
(4, 8, 'MAT437', 86, 'Admin', 'Admin'),
(4, 9, 'MAT120', 74,'Admin', 'Admin'),
(4, 10, 'BIO210', 74,'Admin', 'Admin'),
(5, 11, 'BIO412', 87,'Admin', 'Admin'),
(5, 12, 'BIO427', 99, 'Admin', 'Admin'),
(6, 13, 'EEE315', 23, 'Admin', 'Admin'),
(7, 14, 'EEE184', 2, 'Admin', 'Admin'),
(8, 15, 'EEE148', 21, 'Admin', 'Admin'),
(8, 16, 'BUS423', 52,'Admin', 'Admin'),
(8, 17, 'BUS471', 1, 'Admin', 'Admin'),
(9, 18, 'BUS488', 87,'Admin', 'Admin'),
(10, 19, 'CS101', 29, 'Admin', 'Admin'),
(11, 20, 'CS102', 37, 'Admin', 'Admin'),
(11, 21, 'CS201', 1, 'Admin', 'Admin'),
(11, 22, 'CS202', 63, 'Admin', 'Admin'),
(11, 23, 'CS203', 59,'Admin', 'Admin'),
(12, 24, 'CS301', 20, 'Admin', 'Admin'),
(12, 25, 'CS302', 32,'Admin', 'Admin'),
(12, 26, 'CS401', 75, 'Admin', 'Admin'),
(12, 27, 'CS402', 57, 'Admin', 'Admin'),
(13, 28, 'CS103', 21,  'Admin', 'Admin');*/

-- Creating views for student data informarion and Instructors data Information

CREATE VIEW students_Record AS
SELECT
    st.Student_ID,
    st.First_Name,
    st.Last_Name,
    st.Gender,
    st.Major,
    co.course_code,
    gr.grade
FROM
    `student table` st, `Course offering` co, student_academic_records gr
    where st.student_id = co.student_id
    and
    st.student_id = gr.student_id;
    
    select * from students_record;
    
-- Instructors views
create view Instrictors_Information as
SELECT 
    CONCAT(i.`first name`, i.`Last Name`) AS Instructors_Name,
    i.Department AS Department,
    c.`course title` AS Courses_Taught,
    F.`course_code` AS Course_code,
    f.`schedule` AS Timetable
FROM
    `instructor table` i,
    `course offering` f,
    `courses` c
WHERE
    i.Instructor_Id = F.Instructor_id
        AND c.Course_ID = F.course_id
        order by i.department;

-- Querrying the created database to attest its functionality

-- COURSES ENROLLED BY A STUDENT

SELECT 
    s.`Student_ID`,
    CONCAT(s.`First_Name`, ' ', s.`Last_Name`) AS Student_Name,
    s.`major`,
    c.`Course_code`,
    c.`Course Title`,
    co.`Semester`,
    e.`Enrollment status`,
    e.`Enrolment Date`
FROM
    `Enrollment` e
JOIN
    `Student Table` s ON e.`Student_ID` = s.`Student_ID`
JOIN
    `Course Offering` co ON e.`Offering_ID` = co.`Offering_ID`
JOIN
    `Courses` c ON co.`Course_ID` = c.`Course_ID`
WHERE
    e.`Student_ID` = 1
ORDER BY 
    s.`Student_ID`, co.`Semester`, c.`Course_code`;

-- TO CALCULATE STUDENTS GPA
SELECT 
    sar.student_id,
    CONCAT(s.First_Name, ' ', s.Last_Name) AS student_name,
    sar.course_code,
    ROUND(SUM(CASE
                WHEN sar.score >= 90 THEN 5.0
                WHEN sar.score >= 80 THEN 4.0
                WHEN sar.score >= 70 THEN 3.5
                WHEN sar.score >= 60 THEN 3.0
                WHEN sar.score >= 55 THEN 2.5
                WHEN sar.score >= 50 THEN 2.0
                WHEN sar.score >= 40 THEN 1.0
                ELSE 0.0
            END * c.credits) / SUM(c.credits),
            2) AS GPA
FROM
    student_academic_records sar
        JOIN
    `Student Table` s ON sar.student_id = s.student_id
        JOIN
    `Course Offering` co ON sar.Offering_ID = co.Offering_ID
        JOIN
    Courses c ON sar.course_code = c.course_code
GROUP BY sar.student_id , student_name,sar.course_code;

select credits from courses;


  
					-- ADMIN QUERIES --
-- Courses by department

SELECT 
    `Department`,
    `Course_code`,
    `Course Title`,
    `Credits`
FROM `Courses`
ORDER BY `Department`, `Course_code`;
    
--- Instructor teaching load
SELECT i.`Instructor_Id`,
CONCAT(i.`First Name`, ' ', i.`Last Name`) AS Instructor_Name,i.`Department`,
COUNT(co.`Offering_ID`) AS Courses_Taught
FROM `Instructor Table` i
LEFT JOIN `Course Offering` co ON i.`Instructor_Id` = co.`Instructor_ID`
GROUP BY i.`Instructor_Id`, i.`First Name`, i.`Last Name`, i.`Department`
ORDER BY Courses_Taught DESC;

--- Under enrolled courses (Courses with less than 5 students)
SELECT 
    co.`Course_code`,
    c.`Course Title`,
    c.`Department`,
    co.`Semester`,COUNT(e.`Student_ID`) AS Enrolled_Students
FROM `Enrollment` e
JOIN `Course Offering` co ON e.`Offering_ID` = co.`Offering_ID`
JOIN `Courses` c ON co.`Course_ID` = c.`Course_ID`
GROUP BY co.`Offering_ID`
HAVING COUNT(e.`Student_ID`) < 5
ORDER BY Enrolled_Students ASC;
    
		
        --- DATA MAINTENANCE QUERIES ---

--- Updating students major
Update `student table`
SET Major = "Computer Science"
where Student_ID = "3";
   
select * from `student table`
where student_id = 3;

-- drop enrollment

  UPDATE `Enrollment`
SET `Enrollment status` = 'Dropped',
    `updated by` = 'student',
    `Updated_date` = CURRENT_TIMESTAMP
WHERE `Student_ID` = 3;
  select * from enrollment 
  where student_id = 3;
