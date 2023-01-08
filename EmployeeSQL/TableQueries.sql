--1. Employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name,
employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--2. First name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01'
;

--3. Manager and department number, department name, employee number, last name, and first name 
SELECT dept_manager.emp_no, dept_manager.dept_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
JOIN departments
ON departments.dept_no = dept_manager.dept_no
;

--4. Department number for each employee along with that employees employee number, last name, first name, and department name 
SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
;

--5. First name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
;

--6. Each employee in the Sales department, including their employee number, last name, and first name
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
;

--7. Each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' AND departments.dept_name = 'Development'
;

--8. Frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, Count(last_name) AS "Frequency_Counts"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
;



