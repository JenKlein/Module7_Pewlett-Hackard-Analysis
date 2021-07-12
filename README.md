# SQL_Pewlett-Hackard-Analysis
## Overview
Pewlett Hackard (PH), a large company with thousands of employees, has a number of employees nearing retirement. Pewlett Hackard is looking ahead to prepare for the mass upcoming retirement, to financially plan for retirement packages, forecast how many roles will need to be filled, and ensure knowledge and skills are passed on prior to the departure of the retiring employees. The objective of this analysis was to determine the number of retiring employees per title, how many of those positions will need to be filled and identifying employees who are eligible to participate in a mentorship program. This analysis was performed using 6 csv files uploaded to SQL database as tables. Below is an Entity Relationship Diagram of the 6 different CSV files as well as their primary and foreign keys. 

{INSERT ERD screenshot}

### Tools
* PostgreSQL

## Results
### Number of Retiring Employees by Title
#### Retirement Titles Table
[INSERT RETIREMENT TITLES SCREENSHOT]

The 'Retirement Titles' table holds all the titles of current employees born between January 1, 1952 and December 31, 1955 - the birth date of employees the company has deemed likely to be nearing retirement. This table was created by left-joining the titles table to the employees table, then filtering by birth dates between January 1, 1952 and December 31, 1955. 

#### Unique Titles Table
[INSERT SCREENSHOT OF UNIQUE TITLES]

The 'Retirement Titles' table showed duplicates of Employees who have held more than one title at PH, so the 'Unique Titles' table was created using the statement 'DISTINCT ON()' to remove these duplicates and show only the most recent title an employee held. This was saved as the table 'Unique Titles'. 

The 'Unique Titles' table demonstrates there are 903,89 employees who nearing the age of retirement.

#### Retiring Titles Table
[INSERT SCREENSHOT OF Retiring TITLES]


To determine the count of each title, the 'GROUP BY' statement and the 'COUNT' statement were applied to the 'Unique Titles' table to group and count the titles of retiring employees - this information was saved to the 'Retiring Titles' table. 

The title with the most employees retiring in the near future is Senior Engineer, with a count of 29,414, followed closely by Senior Staff at 28,254. 

### Employees Eligible for the Mentorship Program
#### Mentorship Eligibility Table
[INSERT SCREENSHOT]

The 'Mentorship Eligibility' table holds the employee information of current employees who were born between January 1, 1965 and December 31, 1965 - the birthdate of employees who will be eligible candidates to mentor more junior employees before they retire. This table was created by inner-joining the employee and titles tables, then filtering for employees born between January 1, 1965 and December 31, 1965. 

The 'Mentorship Eligibility' table shows that there are 1,550 employees eligible for the mentorship program. 

### Suggestions for further analysis
* Another table that could be created could be the count of mentees, people born December 31, 1964 to determine the number of employees who would require mentorship. The table could be created the same as the 'Mentorship Eligibility', except the difference would be the filter date for prior to January 1, 1965. 
* In preparing for employee's retirement, it may be helpful, in terms of financials to look at the salaries of those retiring. This could be done by joining the salary column from the 'Salaries' table to the 'Unique Titles' table.
