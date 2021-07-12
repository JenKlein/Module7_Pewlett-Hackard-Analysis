

----- PEWLETT HACKER ASSIGNMENT -----
--------------------

-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.

SELECT emp_no, 
	first_name,
	last_name
FROM employees;

-- Retrieve the title, from_date, and to_date columns from the Titles table.

SELECT title, 
	from_date, 
	to_date
FROM titles;

-- Create a new table using the INTO clause & join on the primary key. 

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

-- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
SELECT * FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no ASC;

-- export to retirement_titles.csv

-- Added this query it to Employee_Database_challenge.sql file.

-- Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.

SELECT emp_no,
	first_name,
	last_name
FROM retirement_titles;

-- Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
-- Create a Unique Titles table using the INTO clause.
-- Sort the Unique Titles table in ascending order by the employee number and descending order by the last date
SELECT DISTINCT ON (emp_no) 
	emp_no,
	first_name,
	last_name
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- Export to unique_titles.csv

-- Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
-- First, retrieve the number of titles from the Unique Titles table.
-- Then, create a Retiring Titles table to hold the required information.
-- Group the table by title, then sort the count column in descending order.
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY emp_no;

-- Export to retiring_titles.csv & save to sql queries


------------------------------
-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.

SELECT emp_no, 
	first_name, 
	last_name, 
	birth_date 
FROM employees;

-- Retrieve the from_date and to_date columns from the Department Employee table.

SELECT from_date,
	to_date
FROM dept_emp;

-- Retrieve the title column from the Titles table.

SELECT title
FROM titles;

-- Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
-- Create a new table using the INTO clause.
-- Join the Employees and the Department Employee tables on the primary key.
-- Join the Employees and the Titles tables on the primary key.
-- Filter the data on the to_date column to get current employees whose birth dates are between January 1, 1965 and December 31, 1965.
-- Order the table by the employee number.
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

-- Export the Mentorship Eligibility table as mentorship_eligibilty.csv
