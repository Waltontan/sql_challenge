DROP TABLE salaries;
DROP TABLE dept_manager;
DROP TABLE dept_emp;
DROP TABLE employees;
DROP TABLE departments;
DROP TABLE titles;
--------------------------------------
CREATE TABLE titles(
	titles_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(20)
);
--------------------------------------
CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(20)
);
--------------------------------------
SET datestyle TO "ISO, MDY";
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5),
	FOREIGN KEY (emp_title_id) REFERENCES titles(titles_id),
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(1),
	hire_date DATE
);
--------------------------------------
CREATE TABLE dept_emp(
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(4),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
--------------------------------------
CREATE TABLE dept_manager(
	dept_no VARCHAR(4),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
--------------------------------------	
CREATE TABLE salaries(
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT
);
--------------------------------------


