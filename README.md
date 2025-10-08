# Student-course-Registration

This Project defines a student database management system called DataKirk.

The schema includes:

Courses — details of academic courses.

Prerequisite_Table — course dependencies.

Student Table — student information.

Course Offering — links courses, instructors, and students per semester.

Instructor Table — faculty data.

Grade Table — grading schema.

(Likely continues with Enrollment, based on the last line.)

Here’s a clean, professional technical report summary you can include in your GitHub repository:

:::writing{id="59381", title="DataKirk Student Database – Technical Schema Report"}

DataKirk Student Database – Technical Schema Report
Overview

The DataKirk Student Database is a structured relational database designed to manage academic information for an educational institution. It centralizes data about students, instructors, courses, prerequisites, enrollments, and grades, ensuring integrity through relational constraints and timestamp-based auditing.

Database Design
1. Courses

Stores all course-related information such as course code, title, credits, and department.

Primary Key: Course_ID

Unique Key: Course_code

Timestamps: Created_date, Updated_date

Purpose: Acts as a reference for offerings, prerequisites, and enrollments.

2. Prerequisite_Table

Defines prerequisite relationships between courses.

Primary Key: Prerequisite_ID

Foreign Key: Course_ID → Courses(Course_ID)

Purpose: Enforces academic progression by linking dependent courses.

3. Student Table

Contains student demographic and academic information.

Primary Key: Student_ID

Attributes: First name, last name, gender, email, phone, major, and year of study.

Timestamps: Automatically tracks creation and updates.

4. Instructor Table

Maintains instructor records.

Primary Key: Instructor_ID

Attributes: First and last names, email, department.

Purpose: Used to assign instructors to course offerings.

5. Course Offering

Represents specific course sessions available per semester.

Primary Key: Offering_ID

Foreign Keys:

Course_ID → Courses(Course_ID)

Instructor_ID → Instructor Table(Instructor_ID)

Student_ID → Student Table(Student_ID)

Purpose: Connects students, instructors, and courses in a many-to-many relationship model.

6. Grade Table

Defines grading standards (e.g., A, B, C) and their corresponding score ranges.

Primary Key: Grade_ID

Unique Key: Grade

Purpose: Provides standardized grading across the system.

7. Enrollment

(Defined later in the file.)
Expected to record the association between students and courses, linking with grades and course offerings.

Key Design Features

Relational Integrity: All dependent entities use foreign key constraints to maintain referential accuracy.

Auditability: Timestamp fields (Created_date, Updated_date) are automatically updated on data changes.

Normalization: Tables are structured to reduce redundancy and support scalability.

Traceability: Each record includes created by and updated by metadata fields.

Use Cases

Student registration and course enrollment tracking

Instructor assignment and course scheduling

Grade entry and academic performance analysis

Prerequisite validation for course registration

Future Enhancements

Implement stored procedures for enrollment automation

Add views for performance reporting (e.g., GPA summaries)

Integrate user authentication and access control tables
