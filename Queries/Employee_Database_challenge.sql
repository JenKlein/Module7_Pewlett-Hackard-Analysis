

----- PEWLETT HACKER ASSIGNMENT -----
---------- Deliverable 1 ----------

-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.

SELECT emp_no, 
	first_name,
	last_name
FROM employees;

-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.

SELECT title, 
	from_date, 
	to_date
FROM titles;

-- 3. Create a new table using the INTO clause & 4. join on the primary key. 

SELECT e.emp_no, 
	e.first_name,
	e.last_name,
	t.title, 
	t.from_date, 
	t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
	ON (e.emp_no = t.emp_no);

SELECT * FROM retirement_titles;

-- 5.Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
-- is the retirement table meant to have birth date?????????
SELECT * FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no ASC;

-- 6. data from 3./4. exported to retirement_titles.csv / 7. confirm it matches sample

-- 8. Added this query it to Employee_Database_challenge.sql file.

-- 9. Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.

SELECT emp_no,
	first_name,
	last_name
FROM retirement_titles;

-- 10. Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
-- 11. Create a Unique Titles table using the INTO clause.
-- 12. Sort the Unique Titles table in ascending order by the employee number and descending order by the last date
------------ there is no last_date in instructions?
SELECT DISTINCT ON (emp_no) 
	emp_no,
	first_name,
	last_name
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- 13. Export to unique_titles.csv // 14. confirm my result looks like sample

-- 15. Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
-- 16. First, retrieve the number of titles from the Unique Titles table.
-- 17. Then, create a Retiring Titles table to hold the required information.
-- 18. Group the table by title, then sort the count column in descending order.
------------ what is count column? 
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY emp_no;

-- 19. Export to retiring_titles.csv / 20. confirm table looks like sample / 21. save to sql queries


--------------- DELIVERABLE 2 ---------------
-- 1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.

SELECT emp_no, 
	first_name, 
	last_name, 
	birth_date 
FROM employees;

-- 2. Retrieve the from_date and to_date columns from the Department Employee table.

SELECT from_date,
	to_date
FROM dept_emp;

-- 3. Retrieve the title column from the Titles table.

SELECT title
FROM titles;

-- 4. Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
-- 5. Create a new table using the INTO clause.
-- 6. Join the Employees and the Department Employee tables on the primary key.
-- 7. Join the Employees and the Titles tables on the primary key.
-- 8. Filter the data on the to_date column to get current employees whose birth dates are between January 1, 1965 and December 31, 1965.
-- 9. Order the table by the employee number.
SELECT DISTINCT ON (emp_no)
 	e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY emp_no ASC;

select * from employees;
select * from dept_emp;
select * from titles;

-- 10.Export the Mentorship Eligibility table as mentorship_eligibilty.csv / 11. Confirm it matches sample
