--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Employees".gender, "Salary".salary
FROM "Employees"
INNER JOIN "Salary" ON "Employees".emp_no = "Salary".emp_no
ORDER BY emp_no


--List employees who were hired in 1986.
SELECT * FROM "Employees"
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31'


--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
SELECT "Department_Manager".dept_no, "Department".dept_name, "Department_Manager".emp_no, 
"Employees".first_name, "Employees".last_name, "Dept_emp".from_date, "Dept_emp".to_date
FROM "Department_Manager"
INNER JOIN "Department"
ON "Department".dept_no = "Department_Manager".dept_no
INNER JOIN "Employees"
ON "Employees".emp_no = "Department_Manager".emp_no
INNER JOIN "Dept_emp"
ON "Employees".emp_no = "Dept_emp".emp_no
ORDER BY "Department_Manager".dept_no


--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Department".dept_name
FROM "Employees"
INNER JOIN "Dept_emp"
ON "Employees".emp_no = "Dept_emp".emp_no
INNER JOIN "Department"
ON "Dept_emp".dept_no = "Department".dept_no
ORDER BY "Employees".emp_no


--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name like 'B%'
ORDER BY "Employees".emp_no


--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Department".dept_name
FROM "Employees", "Department", "Dept_emp"
WHERE "Department".dept_name = 'Sales'
AND "Dept_emp".dept_no = "Department".dept_no
AND "Dept_emp".emp_no = "Employees".emp_no
ORDER BY emp_no


--List all employees in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.

SELECT "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Department".dept_name
FROM "Employees", "Department", "Dept_emp"
WHERE "Department".dept_name IN ('Sales', 'Development')
AND "Dept_emp".dept_no = "Department".dept_no
AND "Dept_emp".emp_no = "Employees".emp_no
ORDER BY emp_no


--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name, COUNT (last_name) AS "frequency_count"
FROM "Employees"
GROUP BY last_name
HAVING COUNT(last_name) > 1
ORDER BY "frequency_count" DESC