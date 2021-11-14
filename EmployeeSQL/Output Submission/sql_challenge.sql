-------------------------------------------------------------
--List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
SELECT e.emp_no,e.last_name,e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no = s.emp_no;
-------------------------------------------------------------
--List first name, last name, and hire date for employees 
--who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT('year' from hire_date)=1986;
-------------------------------------------------------------
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name.
SELECT d.dept_no,d.dept_name,dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
INNER JOIN departments AS d ON
dm.dept_no = d.dept_no
INNER JOIN employees AS e ON
dm.emp_no = e.emp_no;
-------------------------------------------------------------
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
d.dept_no = de.dept_no;
-------------------------------------------------------------
--List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND LEFT(last_name,1)='B'
-------------------------------------------------------------
--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees AS e ON de.emp_no = e.emp_no
INNER JOIN departments AS d ON d.dept_no = de.dept_no
WHERE de.dept_no IN
(
	SELECT d.dept_no
	FROM departments
	WHERE d.dept_name = 'Sales'
);
-------------------------------------------------------------
--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees AS e ON de.emp_no = e.emp_no
INNER JOIN departments AS d ON d.dept_no = de.dept_no
WHERE de.dept_no IN
(
	SELECT d.dept_no
	FROM departments
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
);
-------------------------------------------------------------
--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, count(last_name) AS "Count"
FROM employees
GROUP BY last_name
ORDER BY "Count" DESC;
-------------------------------------------------------------