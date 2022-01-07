-- 1. How many employees with each title were born after 01-01-1965?

select count(*) as "Number Of Employees", t.title as 'Title'from employees e 
inner join titles t on t.emp_no = e.emp_no 
where e.birth_date > '1965-01-01'
group by t.title;

-- 2. What is the average salary per title?

select concat('$', format(avg(s.salary), 2)) as 'Average Salary', t.title as Title 
from salaries s 
inner join titles t using (emp_no)
group by t.title;



-- 3. How much money was spent on salary for the marketing department between the years 1990 and 1992?

select concat('$', format(sum(s.salary), 2)) as 'Total Marketing Salaries'
from salaries s 
inner join dept_emp de using (emp_no)
inner join departments d using (dept_no)
where d.dept_name = 'Marketing'
and year (s.from_date) >= 1990 and year(s.to_date) <= 1992;

