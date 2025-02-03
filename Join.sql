CREATE DATABASE MAIN;
USE MAIN;

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department VARCHAR(50)
);

-- Insert sample data
INSERT INTO Courses (course_id, course_name, department) VALUES
(101, 'Introduction to Programming', 'Computer Science'),
(102, 'Data Structures', 'Computer Science'),
(103, 'Calculus', 'Mathematics');

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);

-- Insert sample data
INSERT INTO Students (student_id, name, email, department) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', 'Computer Science'),
(2, 'Bob Smith', 'bob.smith@example.com', 'Computer Science'),
(3, 'Charlie Brown', 'charlie.brown@example.com', 'Mathematics');


CREATE TABLE Assignments (
    assignment_id INT PRIMARY KEY,
    course_id INT,
    title VARCHAR(100),
    due_date DATE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
INSERT INTO Assignments (assignment_id, course_id, title, due_date) VALUES
(1, 101, 'Assignment 1', '2024-01-15'),
(2, 101, 'Assignment 2', '2024-02-10'),
(3, 102, 'Midterm Project', '2024-03-01'),
(4, 103, 'Final Exam', '2024-04-20');

CREATE TABLE Grades (
    grade_id INT PRIMARY KEY,
    student_id INT,
    assignment_id INT,
    score DECIMAL(5, 2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (assignment_id) REFERENCES Assignments(assignment_id)
);

-- Insert sample data
INSERT INTO Grades (grade_id, student_id, assignment_id, score) VALUES
(1, 1, 1, 85.5),
(2, 2, 1, 90.0),
(3, 3, 2, 75.0),
(4, 1, 3, 88.0),
(5, 2, 4, 92.0);

CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    course_id INT,
    name VARCHAR(50),
    email VARCHAR(100),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert sample data
INSERT INTO Instructors (instructor_id, course_id, name, email) VALUES
(1, 101, 'Dr. Smith', 'smith@example.com'),
(2, 102, 'Dr. Johnson', 'johnson@example.com'),
(3, 103, 'Dr. Lee', 'lee@example.com');

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    attendance_date DATE,
    status VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert sample data
INSERT INTO Attendance (attendance_id, student_id, course_id, attendance_date, status) VALUES
(1, 1, 101, '2024-01-10', 'Present'),
(2, 2, 101, '2024-01-10', 'Absent'),
(3, 3, 102, '2024-02-05', 'Present'),
(4, 1, 103, '2024-02-07', 'Absent'),
(5, 2, 103, '2024-02-07', 'Present');

--Retrieve a List of Students Along with the Names of Courses They Are Enrolled In
Select Students.name , Courses.course_name From Students 
	inner join Attendance on Students.student_id = Attendance.student_id
	inner join Courses on Attendance.course_id =Courses.course_id;

--list all student and courses they are enrolled in,including students not enrolled in any course
select Students.name,Courses.course_name From Students
	left join Attendance on Students.student_id = Attendance.student_id
	left join Courses on Attendance.course_id =Courses.course_id;

--list all courses and the students enrolled in each course,including courses with no Student
Select Courses.course_name,Students.name  From Courses
	left join Attendance on Attendance.course_id =Courses.course_id
	left join Students on Attendance.student_id = Students.student_id;

--Full Outer join:Retrieve a list of all students and courses.Including students without any courses and Courses without any student
Select Students.name ,Courses.course_name From Students
	full outer join Attendance on Students.student_id = Attendance.student_id
	full outer join Courses on Attendance.course_id =Courses.course_id;

--Retrieve each studentname along with their course name and their instructors name
Select Students.name ,Courses.course_name,Instructors.name from Students
	inner join Attendance on Students.student_id = Attendance.student_id
	inner join Courses on Attendance.course_id =Courses.course_id
	inner join Instructors on Courses.course_id = Instructors.course_id;

--use left join to find students who are not enrolled into any course
Select Students.name from Students
	left join Attendance on Students.student_id = Attendance.student_id
	where Attendance.course_id IS NULL;

--Retrieve the title of each assignment along with the student name and their score
Select Assignments.title,Students.name,Grades.score From Assignments
	inner join Attendance on Assignments.course_id = Attendance.course_id
	inner join Students on Attendance.student_id = Students.student_id
	inner join Grades on Students.student_id = Grades.student_id;

--List each course name,the total number of students enrolled and the instructors name
Select Courses.course_name,COUNT(Students.student_id),Instructors.name From Courses
	inner join Attendance on Courses.course_id = Attendance.course_id
	inner join Students on Attendance.student_id = Students.student_id
	inner join Instructors on Attendance.course_id = Instructors.course_id
	Group by Courses.course_name,Instructors.name;

--calculate the average attendance rate for each course(percentage of "persent" status)
Select Courses.course_id,Courses.course_name,
	AVG(
		CASE 
			When Attendance.status ='present' Then 1
			else 0
		END)*100 AS Attendence_rate
from Courses
	inner join Attendance on Courses.course_id = Attendance.course_id
	Group by Courses.course_id,Courses.course_name;

Select * from Students;
Select * from Courses;
Select * from Attendance;