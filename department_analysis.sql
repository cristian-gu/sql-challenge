-- DATA ANALYSIS
-- 1
select employees.emp_no, last_name, first_name, sex, salary
from employees
inner join salaries
on employees.emp_no = salaries.emp_no;

-- 2
select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986

-- 3
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from employees
inner join dept_manager
on employees.emp_no = dept_manager.emp_no
inner join departments
on departments.dept_no = dept_manager.dept_no

-- 4
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on departments.dept_no = dept_emp.dept_no;

-- 5
select first_name, last_name, sex
from employees
where first_name = 'Hercules' 
and last_name LIKE 'B%';

-- 6
select emp_no, last_name, first_name
from employees
where emp_no in (
	select emp_no
	from dept_emp
	where dept_no in (
		select dept_no
		from departments
		where dept_name = 'Sales'
	)
);

-- 7
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- 8 
select last_name, count(last_name) as frequency
from employees
group by last_name
order by frequency desc;
	
