-- 1 Create a database named training_institute_db and use that database.
CREATE DATABASE training_institute_db;

-- 2 Create a table named trainers with columns trainer_id, trainer_name, trainer_email, trainer_city, experience_years.
CREATE TABLE trainers(
     trainer_id INT PRIMARY KEY,
     trainer_name VARCHAR(50) NOT NULL,
     trainer_email VARCHAR(40) UNIQUE,
     trainer_city VARCHAR(30),
     experience_years INT
);

-- 3 Create a table named courses with columns course_id, course_name,course_duration_months, course_fee, trainer_id.
CREATE TABLE courses(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    course_duration_months INT,
    course_fee INT CHECK (course_fee>0),
    trainer_id INT,
    FOREIGN KEY (trainer_id) REFERENCES trainers (trainer_id)
);


-- 4 Create a table named students with columns student_id, student_name, student_email, student_phone, student_city, student_age, course_id.
CREATE TABLE students(
     student_id INT PRIMARY KEY,
     student_name VARCHAR(40) NOT NULL,
     student_email VARCHAR(40) UNIQUE,
     student_phone INT,
     student_city VARCHAR(20),
     student_age INT CHECK (student_age >= 18),
     course_id INT,
     FOREIGN KEY (course_id) REFERENCES courses (course_id)
     
);

-- 5 Create a table named enrollments with columns enrollment_id, student_id, course_id,enrollment_date, payment_status, amount_paid.
CREATE TABLE enrollments(
     enrollment_id INT PRIMARY KEY,
     student_id INT ,
     course_id INT,
	 enrollment_date DATE DEFAULT CURRENT_DATE,
     payment_status VARCHAR(30) CHECK (payment_status IN ('Paid','Pending','Partial')),
     amount_paid INT CHECK (amount_paid >=0),
	FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


-- 6 Apply appropriate constraints such as PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, CHECK, and DEFAULT while creating the tables.

-- 7 Ensure trainer_id, course_id, student_id, and enrollment_id are primary keys.
-- trainer_id INT PRIMARY KEY,
-- course_id INT PRIMARY KEY,
-- student_id INT PRIMARY KEY,
-- enrollment_id INT PRIMARY KEY,

-- 8 Ensure trainer_email and student_email are unique.
-- trainer_email VARCHAR(40) UNIQUE,
-- student_email VARCHAR(40) UNIQUE

-- 9 Ensure student_age is greater than or equal to 18.
-- student_age INT CHECK (student_age >= 18)

-- 10 Ensure course_fee is greater than 0.
-- course_fee INT CHECK (course_fee>0),

-- 11 Ensure amount_paid is not negative.
-- amount_paid VARCHAR(20) CHECK (amount_paid >=0),

-- 12 Ensure payment_status allows only values Paid, Pending, and Partial.
-- payment_status VARCHAR(30) CHECK (payment_status IN ('Paid','Pending','Partial')),

-- 13 Ensure enrollment_date takes the current date by default if not provided.
 -- enrollment_date DATE DEFAULT CURRENT_DATE,

-- 14 Ensure trainer_id in courses references the trainers table.
-- FOREIGN KEY (trainer_id) REFERENCES trainers (trainer_id)

-- 15 Ensure course_id in students references the courses table.
-- FOREIGN KEY (course_id) REFERENCES courses (course_id)

-- 16 Ensure student_id and course_id in enrollments reference the respective tables.
-- FOREIGN KEY (student_id) REFERENCES students(student_id),
-- FOREIGN KEY (course_id) REFERENCES courses(course_id)

-- 17 Insert at least 5 records into the trainers table.
INSERT INTO trainers(trainer_id,trainer_name,trainer_email,trainer_city,experience_years) VALUES
(101,'NEHA SHETTY','nehashetty@gmail.com','PUNE',2),
(102,'MAYURI MORE','mayurimore@gmail.com','MUMBAI',3),
(103,'OMKAR CHIKANE','omkarchikane@gmail.com','BANGLORE',5),
(104,'RIYA SURMA','riyasurma@gmail.com','PUNE',1),
(105,'PRASAD SURVE','prasadsurve@gmail.com','MUMBAI',3);

-- 18 Insert at least 6 records into the courses table.
INSERT INTO courses(course_id,course_name,course_duration_months,course_fee,trainer_id) VALUES
(1,'Data Analytics',4,35000,101),
(2,'Data Science',5,30000,102),
(3,'Machine Learning',3,45000,103),
(4,'Artificial Intelligence',5,50000,104),
(5,'Python',3,90000,105),
(6,'Tableau',6,40000,105);

-- 19 Insert at least 10 records into the students table.
INSERT INTO students(student_id,student_name,student_email,student_phone,student_city,student_age,course_id) VALUES
(1,'Rahul Sharma','rahulsharma@gmail.com','9876543210','Pune',20,1),
(2,'Neha Patil','nehapatil@gmail.com','9876543211','Mumbai',21,2),
(3,'Amit Verma','amitverma@gmail.com','9876543212','Delhi',22,3),
(4,'Priya Singh','priyasingh@gmail.com','9876543213','Pune',20,1),
(5,'Rohan Mehta','rohanmehta@gmail.com','9876543214','Bangalore',23,4),
(6,'Sneha Joshi','snehajoshi@gmail.com','9876543215','Nagpur',21,2),
(7,'Karan Shah','karanshah@gmail.com','9876543216','Ahmedabad',22,3),
(8,'Pooja Desai','poojadesai@gmail.com','9876543217','Surat',20,4),
(9,'Arjun Gupta','arjungupta@gmail.com','9876543218','Delhi',24,1),
(10,'Anjali Kulkarni','anjalikulkarni@gmail.com','9876543219','Pune',21,2);

-- 20 Insert at least 10 records into the enrollments table.
INSERT INTO enrollments(enrollment_id,student_id,course_id,enrollment_date,payment_status,amount_paid) VALUES
(1,1,1,'2026-04-03','Paid',35000),
(2,2,2,'2025-03-04','Pending',40000),
(3,3,3,'2022-04-05','Paid',36000),
(4,4,4,'2021-03-01','Partial',20000),
(5,5,5,'2022-10-20','Pending',32000),
(6,6,6,'2021-09-03','Paid',50000),
(7,7,2,'2020-06-25','Pending',20000),
(8,8,3,'2024-01-23','Paid',40000),
(9,9,1,'2025-04-30','Partial',25000),
(10,10,4,'2022-03-05','Paid',30000);

-- 21 Update the city of a trainer.
UPDATE trainers 
SET trainer_city='Delhi'
WHERE trainer_id =101;

-- 22 Update the fee of a particular course.
UPDATE courses
SET course_fee = 85000
WHERE course_id= 5;

-- 23 Increase the course fee by 10 percent for all courses.
UPDATE courses
SET course_fee = course_fee * 0.10;

-- 24 Update payment status from Pending to Paid for a specific enrollment.
UPDATE enrollments
SET payment_status='Paid'
WHERE enrollment_id =2;

-- 25 Change the course assigned to a student.
UPDATE students
SET course='Power Bi'
WHERE student_id=3;

-- 26 Delete a student with a specific student_id.
DELETE FROM students
WHERE student_id = 5;

-- 27 Delete all enrollments where payment status is Pending.
DELETE FROM enrollments
WHERE payment_status = 'Pending';

-- 28 Delete a course with a specific course_id.
DELETE FROM courses
WHERE course_id = 3;

-- 29 Delete trainers who have less than 2 years of experience.
DELETE FROM trainers
WHERE experience_years < 2;

-- 30 Display all students from Pune.
SELECT * FROM students
WHERE student_city = 'Pune';

-- 31 Display all trainers from Mumbai.
SELECT * FROM trainers
WHERE trainer_city = 'Mumbai';

-- 32 Show courses with fee greater than 40000.
SELECT * FROM courses
WHERE course_fee > 40000; 

-- 33 Show students whose age is greater than 22.
SELECT * FROM students
WHERE student_age > 22;

-- 34 Display enrollments where payment status is Paid.
SELECT * FROM enrollments
WHERE payment_status = 'Paid';

-- 35 Display all students ordered by student_name in ascending order.
SELECT * FROM students
ORDER BY student_name ASC;

-- 36 Display all trainers ordered by experience_years in descending order.
SELECT * FROM trainers
ORDER BY experience_years DESC;

-- 37 Show courses ordered by course_fee from highest to lowest.
SELECT * FROM courses
ORDER BY course_fee DESC;

-- 38 Display enrollments ordered by amount_paid.
SELECT * FROM enrollments
ORDER BY amount_paid; 

-- 39 Display all distinct student cities.
SELECT DISTINCT student_city
FROM students;

-- 40 Display all distinct trainer cities.
SELECT DISTINCT trainer_city
FROM trainers;

-- 41 Display distinct payment statuses from enrollments.
SELECT DISTINCT payment_status
FROM enrollments;

-- 42 Display students whose age is between 20 and 25.
SELECT * FROM students
WHERE student_age BETWEEN 20 AND 25;

-- 43 Show courses whose fee is between 30000 and 60000.
SELECT * FROM courses
WHERE course_fee BETWEEN 30000 AND 60000;

-- 44 Display trainers whose experience is between 3 and 8 years.
SELECT * FROM trainers
WHERE experience_years BETWEEN 3 AND 8;

-- 45 Display students from cities Pune, Mumbai, and Bangalore.
SELECT * FROM students
WHERE student_city IN ('Pune','Mumbai','Bangalore');

-- 46 Show enrollments where payment status is Paid or Partial.
SELECT * FROM enrollments
WHERE payment_status IN ('Paid','Partial');

-- 47 Display trainers whose city is Delhi or Hyderabad.
SELECT * FROM trainers
WHERE trainer_city IN ('Delhi','Hyderabad');

-- 48 Display records where student_phone is NULL.
SELECT * FROM students
WHERE student_phone IS NULL;

-- 49 Display records where student_email is NOT NULL.
SELECT * FROM students
WHERE student_email IS NOT NULL;

-- 50 Show the first 5 students.
SELECT * FROM students
LIMIT 5;

-- 51 Show the top 3 highest fee courses.
SELECT * FROM courses
ORDER BY course_fee DESC
LIMIT 3;

-- 52 Show the first 2 trainers.
SELECT * FROM trainers
LIMIT 2;

-- 53 Find the total number of students.
SELECT COUNT(*) FROM students;

-- 54 Find the average age of students.
SELECT AVG(student_age) FROM students;

-- 55 Find the maximum course fee.
SELECT MAX(course_fee) FROM courses;

-- 56 Find the minimum course fee.
SELECT MIN(course_fee) FROM courses;

-- 57 Find the total amount paid in enrollments.
SELECT SUM(amount_paid) FROM enrollments;

-- 58 Count the number of students in each city.
SELECT student_city, COUNT(*)
FROM students
GROUP BY student_city;

-- 59 Count the number of courses handled by each trainer.
SELECT trainer_id, COUNT(course_id)
FROM courses
GROUP BY trainer_id;

-- 60 Find total amount paid for each payment status.
SELECT payment_status, SUM(amount_paid)
FROM enrollments
GROUP BY payment_status;

-- 61 Find the average age of students course-wise.
SELECT course_id, AVG(student_age)
FROM students
GROUP BY course_id;

-- 62 Display cities having more than 2 students.
SELECT student_city, COUNT(*)
FROM students
GROUP BY student_city
HAVING COUNT(*) > 2;

-- 63 Show trainers handling more than 1 course.
SELECT trainer_id, COUNT(course_id)
FROM courses
GROUP BY trainer_id
HAVING COUNT(course_id) > 1;

-- 64 Display payment statuses where total amount_paid is greater than 50000.
SELECT payment_status ,SUM(amount_paid)
FROM enrollments
GROUP BY payment_status
HAVING SUM(amount_paid) > 50000;

-- 65 Display student name and course name.
SELECT student_name, course_name
FROM students
INNER JOIN courses
ON students.course_id = courses.course_id;

-- 66 Display course name and trainer name.
SELECT course_name, trainer_name
FROM courses
INNER JOIN trainers
ON courses.trainer_id = trainers.trainer_id;

-- 67 Display student name, course name, and enrollment date.


-- 68 Display student name with payment status.
SELECT student_name, payment_status
FROM enrollments
INNER JOIN students
ON enrollments.student_id = students.student_id;

-- 69 Display all trainers and the courses they teach.
SELECT trainer_name, course_name
FROM trainers
LEFT JOIN courses
ON trainers.trainer_id = courses.trainer_id;

-- 70 Display all courses and the students enrolled in them.
SELECT course_name, student_name
FROM courses
LEFT JOIN students
ON courses.course_id = students.course_id;

-- 71 Display all students and their enrollment details.
SELECT * 
FROM students
LEFT JOIN enrollments
ON students.students_id =enrollments.students_id;

-- 72 Display all courses and their trainers.
SELECT * 
FROM courses
INNER JOIN trainers
ON courses.trainer_id= trainers.trainer_id;

-- 73 Display all enrollments and corresponding student details.
SELECT * 
FROM enrollments
LEFT JOIN students
ON enrollments.student_id=students.student_id

-- 74 Display the names of students enrolled in the Data Science course.
SELECT student_name
FROM students
LEFT JOIN courses
ON students.course_id = courses.course_id
WHERE course_name = 'Data Science';

-- 75 Show the names of trainers teaching courses with fee greater than 50000.
SELECT trainer_name
FROM trainers
INNER JOIN courses
ON trainers.trainer_id = courses.trainer_id
WHERE course_fee > 50000;

-- 76 Display all students who have fully paid their fees.
SELECT student_name
FROM enrollments
INNER JOIN students
ON enrollments.student_id = students.student_id
WHERE payment_status = 'Paid';

-- 77 Find the number of students enrolled in each course.
SELECT course_id, COUNT(student_id)
FROM students
GROUP BY course_id;

-- 78 Show the course with the highest fee.
SELECT *
FROM courses
ORDER BY course_fee DESC
LIMIT 1;

-- 79 Display students and their course names only for students from Pune.
SELECT student_name, course_name
FROM students
INNER JOIN courses
ON students.course_id = courses.course_id
WHERE student_city = 'Pune';

-- 80 Show trainer details for courses with duration more than 6 months.
SELECT *
FROM trainers
INNER JOIN courses
ON trainers.trainer_id = courses.trainer_id
WHERE course_duration_months > 6;

-- 81 Display the total amount collected course-wise.
SELECT course_id, SUM(amount_paid)
FROM enrollments
GROUP BY course_id;

-- 82 Show all students whose names contain the letter a and are older than 20.

-- 83 Display all courses that currently have no students enrolled.
SELECT course_name
FROM courses
LEFT JOIN students
ON courses.course_id = students.course_id
WHERE students.student_id IS NULL;

-- 84 Show all trainers who are not assigned to any course.
SELECT trainer_name
FROM trainers
LEFT JOIN courses
ON trainers.trainer_id = courses.trainer_id
WHERE courses.course_id IS NULL;

-- 85 Display students who paid more than 30000.
SELECT student_name
FROM enrollments
INNER JOIN students
ON enrollments.student_id = students.student_id
WHERE amount_paid > 30000;

-- 86 Show the average amount paid by students for each course
SELECT course_name, AVG(amount_paid)
FROM enrollments
GROUP BY course_name;

-- 87 Display the course name and total number of enrollments.
SELECT course_name, COUNT(enrollment_id)
FROM courses
INNER JOIN enrollments
ON courses.course_id = enrollments.course_id;


-- 88 Show student name, course name, and payment status for all partial payments.


-- 89 Try inserting a student with a duplicate email and observe the error.
INSERT INTO students
VALUES (11,'Test','rahulsharma@gmail.com',9876543200,'Pune',21,1);

-- 90 Try inserting a course with a negative fee and observe the error.
INSERT INTO courses
VALUES (7,'SQL',3,-5000,101);

-- 91 Try inserting a student with age less than 18 and observe the error.
INSERT INTO students
VALUES (12,'Minor','minor@gmail.com',9876543000,'Pune',16,1);

-- 92 Try inserting an enrollment with invalid payment status and observe the error.
INSERT INTO enrollments
VALUES (11,1,1,'2025-05-01','Completed',20000);

-- 93 Try inserting a course with a trainer_id that does not exist and observe the error
INSERT INTO courses
VALUES (8,'Power BI',3,25000,999);