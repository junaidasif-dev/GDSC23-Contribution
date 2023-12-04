CREATE DATABASE Dummydata;
use Dummydata;
--create table
CREATE TABLE student  (
	student_id INT PRIMARY KEY, --use constraint (primary kay)
	name VARCHAR(20) NOT NULL,  --use constraint (not null)
	major_sub VARCHAR(20) UNIQUE --use constraint (unique key)
);

SELECT * FROM student;

INSERT INTO student VALUES(1, 'Junaid', 'Data Eng'),
						(2, 'Asad', 'Front end'), 
						(3, 'Adeel', 'Flutter');
INSERT INTO student VALUES(4, 'Tahir', NULL);
INSERT INTO student VALUES(5, 'Ali', 'Data scientist');

--alter table
ALTER TABLE student ADD gpa DEC(3,2) DEFAULT '0.00'; --use constraint (default)

INSERT INTO student(student_id, name, major_sub) VALUES(6, 'Tahir', 'Graphic Designer');

ALTER TABLE student ADD Marks INT CHECK(Marks>10);   --use constraint (check)

INSERT INTO student VALUES(7, 'Umair', 'UI/UX', 3.4, 35);

SELECT student_id FROM student WHERE name = 'Ali';

--truncate command delete all the data from table
TRUNCATE TABLE student;

--delete table
DROP TABLE student;