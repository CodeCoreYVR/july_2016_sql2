-- morning cohort 14!!!
--SELECT * FROM projects WHERE student_id = 244;
--SELECT * FROM students WHERE id = 244;

-- if a student does not have a project, they will not be displayed
--SELECT * FROM students INNER JOIN projects ON projects.student_id = students.id;

-- slide exercise 2
-- how many projects does each student have?
SELECT students.first_name, students.last_name, COUNT(*) AS num_projects
FROM students INNER JOIN projects
ON projects.student_id = students.id
GROUP BY students.id
ORDER BY num_projects DESC
LIMIT 10;


SELECT *
FROM students
INNER JOIN enrolments
ON students.id = enrolments.student_id
INNER JOIN courses
ON courses.id = enrolments.course_id
WHERE courses.title = 'Up-sized hybrid project'
LIMIT 10;


-- ALIAS TABLE NAMES
SELECT st.id, st.first_name, st.last_name
FROM students AS st
LIMIT 10;


-- LEFT JOIN
SELECT *
FROM students LEFT JOIN projects
ON projects.student_id = students.id
WHERE projects.id IS NULL
LIMIT 100;


--LEFT JOIN EXERCISE
SELECT enrolments.course_id, courses.title, ROUND(AVG(enrolments.score), 2)
FROM enrolments LEFT JOIN courses
ON enrolments.course_id = courses.id
GROUP BY courses.title, enrolments.course_id
ORDER BY AVG(enrolments.score)
LIMIT 10;


--how many students are enrolled in 'Up-sized hybrid project'
SELECT courses.title, COUNT(*) AS num_students_enrolled
FROM courses LEFT JOIN enrolments
ON courses.id = enrolments.course_id
GROUP BY courses.id
LIMIT 10;


SELECT * FROM (SELECT courses.title, COUNT(*) AS num_students_enrolled
FROM courses LEFT JOIN enrolments
ON courses.id = enrolments.course_id
GROUP BY courses.id) subQuery
WHERE subQuery.num_students_enrolled > 10
ORDER BY subQuery.num_students_enrolled DESC;
--LIMIT 10;



-- modify a table after it has been created
ALTER TABLE students
ADD address TEXT

ALTER TABLE students
DROP COLUMN phone_number

ALTER TABLE students
MODIFY email BLOB

--CONSTRAINTS
--adding a foreign key to the projects table
ALTER TABLE projects
ADD CONSTRAINT projects_students_fk
FOREIGN KEY (student_id) --this will be field name in our projects table for our new foreign key
REFERENCES students
ON DELETE CASCADE; --optional, if you want your projects associated with a student to be deleted when that student is deleted.
