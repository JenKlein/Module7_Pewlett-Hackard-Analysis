# Module7_Pewlett-Hackard-Analysis
## Overview
A large company with thousands of employees, called Pewlett Hackard, is looking ahead to prepare for the upcoming retirement of many of their employees. With my partner, Bobby, an HR Analyst, together we determined who will be retiring in the upcoming years, and how many of those positions will need to be filled. We built databases from 6 CSV files of employee data with SQL. Now, we are tasked with determining the number of retiring employees per title, and identifying employees who are eligible to participate in a mentorship program. 

## Results
### Number of Retiring Employees by Title
[ADD SCREEN SHOOT HERE of retirint titles]

Process: A table of retirement titles data was created by left joining the titles csv to the employees csv, then filtering by birth dates between January 1, 1952-01-01 and December 31, 1955. Since this table showed duplicates of Employees who have held more than one title at PH, we used the statement 'DISTINCT ON()' to remove these duplicates and show only the most recent title an employee held. This was saved as the table 'Unique Titles'. Finally, the "GROUP BY" statement to group by title, and the COUNT statement to determine the count by title - this information was saved to the 'Retiring Titles' table. 
* The 'Unique Titles' table demonstrates there are 903,89 employees who nearing retirement in the upcoming years
 * The title with the most employees retiring in the near future is Senior Engineer, with a count of 29,414, followed closely by Senior Staff at 28,254. 

### Employees Eligible for the Mentorship Program
[ADD SCREEN SHOOT HERE of mentorship eligibility]

Process: The employee and titles CSV data were combined to one table 'Mentorship Eligibility' using an innner join, then filtered for employees born between January 1, 1965 and December 31, 1965. 

* The 'Mentorship Eligibility' table shows that there are 1,550 employees eligible for the mentorship program. 

## Summary 
* How many roles will need to be filled as the "silver tsunami" begins to make an impact?

As shown in the 'Unique Titles table, there are 90,389 employees that make up the 'silver tsunami' (lol), whose roles will need to be filled

* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
More information on the mentorship program is needed to answer this question. What is the format of the mentorship program? Will it be 1-1 or 1-many? Perhaps another table that could be created could be the count of mentees, people born December 31, 1964 to determine the number of employees who would require mentorship. The table could be created the same as the 'Mentorship Eligibility', except the difference would be the filter date for prior to January 1, 1965. 
* In preparing for employee's retirement, it may be helpful, in terms of financials to look at the salaries of those retiring. This could be done by joining the salary column from the 'Salaries' table to the 'Unique Titles' table.
