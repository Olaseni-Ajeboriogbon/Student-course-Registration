
/* ======================== SQL PROJECT FOR STUDENT COURSE ENROLLMENT FOR NEW ACADENIC SESSION  =========================================  */

/*=======================PROJECT BY : OLASENI AJEBORIOGBON (AKA HasHLock)=================================================================*/

use Student_course_Enrollment;

/*------------------CREATING TABLES -----------------------------------------------------------------------------------------------------*/


/* Academic Session Table ----------------------------------------------------------------------------------------------------*/
CREATE TABLE Academic_session(
academic_year date primary key NOT NULL,
created_by	varchar(50) NOT NULL,
created_on 	date NOT NULL,
updated_by 	varchar(50) NOT NULL,
updated_on	date NOT NULL,
flex_field_1	varchar(50),
flex_field_2	varchar(50),
flex_field_3 Varchar(50)
)	;



/* Country TAble ---------------------------------------------------------------------------------------------------------------*/

CREATE TABLE COUNTRY(	
country_id	INT Primary Key NOT NUll,
country_name varchar(50),
country_dialling_code INT NOT NULL,
created_by	varchar(50) NOT NULL,
created_on	date NOT NULL,
updated_by 	varchar(50) NOT NULL,
updated_on	date NOT NULL,
flex_1	 Varchar(50),
flex_2 varchar(50),	
);

/* FACULTY TABLE -------------------------------------------------------------------------------------------------------------*/

CREATE TABLE Faculty(
Faculty_id	INT PRIMARY KEY NOT NULL,
facilty_name varchar (50) NOT NULL,
faculty_acronym	varchar (50) NOT NULL,
faculty_location	varchar(50) NOT NULL,
created_by	varchar(50) NOT NULL,
created_on	date NOT NULL,
Updated_by	varchar(50) NOT NULL,
updated_on	date NOT NULL,
flex_field_1	varchar(50),
flex_field_2	varchar(50)
);

/* Departmental Table ----------------------------------------------------------------------------------------------------------*/

CREATE TABLE Department(	
department_id INT primary key NOT NULL,
department_name	varchar NOT NULL,
department_acronym	varchar (50) NOT NULL,
department_description	varchar (100) NOT NULL,
faculty_id	INT foreign key references Faculty(faculty_id) NOT NULL,
created_by	varchar(50) NOT NULL,
created_on	date NOT NULL,
updated_by	varchar(50) NOT NULL,
updated_on	date NOT NULL,
flex_field_1 varchar(50),	
flex_field_2	varchar(50)
);

/* Course Table ----------------------------------------------------------------------------------------------------------*/

CREATE TABLE COURSE(	
course_id INT primary key Not Null,
course_name	varchar(50) NOT NULL,
course_description	varchar(50) NOT NULL,
course_unit	int NOT NULL,
department_id INT FOREIGN KEY REFERENCES Department(Department_id),
created_by	varchar(50) NOT NULL,
created_on	date NOT NULL,
updated_by	varchar(50) NOT NULL,
updated_on	date NOT NULL,
flex_field_1 varchar(50),	
flex_field_2 varchar(50),	
flex_field_3 varchar(50)
);


/* Semester Table ----------------------------------------------------------------------------------------------------------*/

CREATE TABLE Semester(	
semester_id	INT primary key NOT NULL,
semester_name	varchar(50) NOT NULL,
Academic_year	date foreign key references academic_session(academic_year) NOT NULL,
created_by	varchar(50) NOT  NULL,
created_on	date NOT NULL,
updated_by	varchar(50) NOT NULL,
updated_on	date,
flex_Field_1 varchar(50),	
flex_field_2 varchar(50)	
)

/* Program Table ----------------------------------------------------------------------------------------------------------*/

CREATE TABLE program(	
program_id	INT primary key NOT NULL,
program_title	varchar(50),
Program_description	varchar(50),
created_by	varchar(50),
created_on 	date,
updated_by	varchar(50),
updated_on	date,
flex_field_1 Varchar(50),
flex_field_2 Varchar(50)
);




/* ----------STUDENT PROFILE TABLE --------------*/

CREATE TABLE Student_Profile(
Student_ID INT PRIMARY KEY NOT NULL,
first_name varchar(50) NOT NULL,
middle_name varchar(50) NOT NULL,
lastname varchar(100) NOT NULL,
Title varchar(10),
Gender varchar(10) NOT NULL,
Dob date NOT NULL,
Nationality varchar(50) NOT NULL,
state_of_origin varchar(50) NOT NULL,
email varchar(100) NOT NULL,
health_status varchar(100),
blood_group varchar(20) NOT NULL,
phone_no INT NOT NULL,
address1 varchar(100) NOT NULL,
adress2 varchar(100),
city varchar(100) NOT NULL,
country_id INT NOT NULL,
matric_number INT FOREIGN KEY references Academic_Register(matric_number) NOT NULL,   /* Revisit this Line about the matric number*/
created_by varchar(50),
created_on date,
updated_by varchar(50),
updated_on date,
flex_field_1 varchar(50),
flex_field_2 varchar(50),

CONSTRAINT FK_Country_id FOREIGN KEY (country_id) REFERENCES COUNTRY(country_id),
);

/* Admission Status TAble-----------------------------------------------------------------------------*/

CREATE TABLE Admission_status(	
Admission_id INT PRIMARY KEY NOT NULL,
Student_id	INT Foreign key references Student_Profile(student_ID) NOT NULL,
Year_Admitted 	date Foreign key references Academic_session(Academic_year) NOT NULL,
AdmissionEligibility_status	varchar(50) NOT NULL,
Matric_number INT UNIQUE (Year_Admitted, Student_id)								 /* Revisit this Line about the matric number*/
);



/* STudent Grades Table------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE Student_Grades(	
student_id	INT foreign key references student_profile(student_id )ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
course_id	INT foreign key references course(course_id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
score INT NOT NULL,
grade_id INT primary key NOT NULL,
Grade	varchar(10),
updated_by	varchar(50) NOT NULL,
updated_on	date NOT NULL,
created_by	varchar(50) NOT NULL,
created_on	date NOT NULL
);

/* Program_Enrollment Table ----------------------------------------------------------------------------------------------------------*/

CREATE TABLE program_Enrollment(	
student_id	INT foreign key references student_profile(student_id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
department_id	INT foreign key references Department(department_id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
programe_id	INT foreign key references Program(program_id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
Enrollment_status varchar(50) NOT NULL ,
Enrollment_id INT primary key NOT NULL,
Updated_by	varchar(50) NOT NULL,
Updated_on	date NOT NULL,
created_by	varchar(50),
created_on	date
);

/* Course_Enrollment Table ----------------------------------------------------------------------------------------------------------*/

CREATE TABLE course_Enrollment	(
student_id	INT NOT NULL Foreign Key references student_profile(Student_id) ,
course_id	INT NOT NULL Foreign Key references COURSE(course_id),
enrolled_status	varchar(50) PRIMARY KEY NOT NULL,
created_by	varchar(50) NOT NULL,
created_on	date NOT NULL,
updated_by	varchar(50) NOT NULL,
updated_on	date NOT NULL,
flex_field_1 varchar(50), 	
flex_field_2 varchar(50)	
);

-- ACADEMIC REGISTER TABLE -----------------------------------------------------------------------------------------------------------------

create table student_Academic_register(
student_id INT NOT NULL CONSTRAINT FK_student_id FOREIGN KEY references Student_profile(Student_ID), 
Matric_Number INT Foreign key references Admission_status(matric_number) NOT NULL,			 /* Revisit this Line about the matric number*/
program_id INT,
college_id INT,
Department_id INT,
course_id INT,
SessionId INT,
Year_admitted INT,
Admission_status varchar(30),
Student_eligibility_status varchar(30),
student_disciplinary_record varchar(50),
created_by varchar(50),
created_on date,
updated_by varchar(50),
updated_on date,
flex_field_1 varchar(50),
flex_field_2 Varchar(50),
flex_field_3 varchar(50)

);