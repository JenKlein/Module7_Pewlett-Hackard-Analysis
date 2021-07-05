# SQL_Pewlett-Hackard-Analysis
## Overview
Pewlett Hackard (PH), a large company with thousands of employees, has a number of employees nearing retirement. Pewlett Hackard is looking ahead to prepare for the mass upcoming retirement, to financially plan for retirement packages, forecast how many roles will need to be filled, and ensure knowledge and skills are passed on prior to the departure of the retiring employees. The objective of this analysis was to determine the number of retiring employees per title, how many of those positions will need to be filled and identifying employees who are eligible to participate in a mentorship program. This analysis was performed using 6 csv files uploaded to SQL database as tables. 

## Results
### Number of Retiring Employees by Title
<img width="180" alt="Screen Shot 2021-04-18 at 10 09 37 AM" src="https://user-images.githubusercontent.com/69849998/115148576-313db700-a02e-11eb-9ffa-59e5d417ff91.png">


**Process**: A table of retirement titles data was created by left joining the titles csv to the employees csv, then filtering by birth dates between January 1, 1952 and December 31, 1955. Since this table showed duplicates of Employees who have held more than one title at PH, the statement 'DISTINCT ON()' was used to remove these duplicates and show only the most recent title an employee held. This was saved as the table 'Unique Titles'. Finally, the "GROUP BY" statement to group by title, and the COUNT statement was used to determine the count by title - this information was saved to the 'Retiring Titles' table. 
* The 'Unique Titles' table demonstrates there are 903,89 employees who nearing retirement in the upcoming years
* The title with the most employees retiring in the near future is Senior Engineer, with a count of 29,414, followed closely by Senior Staff at 28,254. 

### Employees Eligible for the Mentorship Program
<img width="515" alt="Screen Shot 2021-04-17 at 5 13 55 PM" src="https://user-images.githubusercontent.com/69849998/115148583-3c90e280-a02e-11eb-927c-043b4ea3fecb.png">


**Process**: The employee and titles CSV data were combined to one table 'Mentorship Eligibility' using an innner join, then filtered for employees born between January 1, 1965 and December 31, 1965. 

* The 'Mentorship Eligibility' table shows that there are 1,550 employees eligible for the mentorship program. 

## Summary 
* As shown in the Unique Titles table, there are 90,389 employees that make up the 'silver tsunami' (those nearing retirement), whose roles will need to be filled

* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
More information on the mentorship program is needed to answer this question. What is the format of the mentorship program? Will it be 1-1 or 1-many? Perhaps another table that could be created could be the count of mentees, people born December 31, 1964 to determine the number of employees who would require mentorship. The table could be created the same as the 'Mentorship Eligibility', except the difference would be the filter date for prior to January 1, 1965. 
* In preparing for employee's retirement, it may be helpful, in terms of financials to look at the salaries of those retiring. This could be done by joining the salary column from the 'Salaries' table to the 'Unique Titles' table.
