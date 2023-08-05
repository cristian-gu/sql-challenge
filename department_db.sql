-- create departments table
DROP TABLE departments;

CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

SELECT * FROM departments;

-- create salaries
DROP TABLE salaries;

CREATE TABLE salaries (
	emp_no SERIAL PRIMARY KEY,
	salary INT);
	
SELECT * FROM salaries;

-- create titles
DROP TABLE titles;

CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title TEXT NOT NULL);
	
SELECT * FROM titles;

-- create employees
DROP TABLE employees;

CREATE TABLE employees (
	emp_no SERIAL,
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
	emp_title_id VARCHAR NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	PRIMARY KEY (emp_no, emp_title_id),
	birth_date DATE NOT NULL,
	first_name TEXT,
	last_name TEXT,
	sex TEXT,
	hire_date DATE NOT NULL);

SELECT * FROM employees;

-- create dept_emp table
DROP TABLE dept_emp;

CREATE TABLE dept_emp (
	emp_no SERIAL,
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);

SELECT * FROM dept_emp;

-- create dept_manager
DROP TABLE dept_manager;

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no SERIAL,
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no));
	
SELECT * FROM dept_manager;








