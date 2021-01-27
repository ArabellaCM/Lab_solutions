use dummyd;
-- Write a query to print the ID, FIRST_NAME, and LAST_NAMEs of the customers whose combined name length, i.e., 
-- the sum of the length of the FIRST_NAME and LAST_NAME, is less than 21. The IDs and names should be printed in the ascending order of the combined name length. 
-- If two or more customers have the same combined name length, sort the result in lexicographical order of the full names, ignoring case. 
-- If two or more customers have the same full name, sort those results by ID, ascending.

select id, first_name, last_name, (length(first_name)+length(last_name)) as total_length from customer
having total_length < 12
order by total_length, last_name, first_name, id;

-- Given two tables, Employee and Department, generate a summary of how many employees are in each department. 
-- Each department should be listed, whether they currently have any employees or not. 
-- The results should be sorted from high to low by number of employees, and then alphabetically by department when departments have the same number of employees. 
-- The results should list the department name followed by the employee count. The column names are not tested, so use whatever is appropriate.

select department.name, count(employee.dept_id)
from department left join employee
on employee.dept_id = department.id
group by department.name
order by count(employee.dept_id) desc, department.name;


-- There are two data tables with employee information: EMPLOYEE and EMPLOYEE_UIN. 
-- Query the tables to generate a list of all employees who are less than 25 years old first in order of NAME, then of ID, both ascending.  
-- The result should include the UIN followed by the NAME.  

select employee_uin.uin, employee.name
from employee join employee_uin
on employee.id = employee_uin.id
where age < 25
order by employee.name, employee.id;

-- A company maintains an EMPLOYEE table with information for each of their employees. Write a query to produce a list containing two columns.  
-- The first column should include the name of an employee who earns less than some other employee.  The second column should contain the name of a higher earning employee.  
-- All combinations of lesser and greater earning employees should be included.  Sort ascending, first by the lower earning employee's ID, then by the higher earning employee's SALARY.  

select e1.id as id1, e2.id as id2
from employee e1 join employee e2
on e1.id <> e2.id
where e1.salary > e2.salary
order by id2, e1.salary; 