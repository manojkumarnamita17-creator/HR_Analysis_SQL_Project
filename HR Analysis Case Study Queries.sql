use hr;
-- problem solving with where clause -- 

-- 1. where clause query -- 
select first_name, last_name , department_id 
 from employees 
 where last_name = 'DE HAAN'; 

-- 2. where clause query -- 
select department_id,department_name,location_id,manager_id 
from departments 
where department_name = 'Sales';

-- 3. where clause query -- 
select first_name,last_name,department_id,salary 
from employees  
where salary > 9700;

-- 4. where clause query -- 
select employee_id,first_name,last_name,hire_date
 from employees 
 where hire_date < '1992-01-01';

-- 5. where clause query -- 
select employee_id, first_name,job_id,department_id 
from employees 
where department_id in (20,60,80);

-- 6. where clause query -- 
select  employee_id, first_name,job_id,department_id 
from employees 
where department_id not in (20,60,80);

-- 7. where clause query -- 
select last_name,phone_number,salary ,manager_id 
from employees 
where manager_id in(101,102,103);

-- 8. where clause query -- 
select first_name ,salary 
from employees 
where first_name like '%e';

-- 9. where clause query -- 
select last_name,department_id 
from employees 
where last_name like '_i%';

-- 10.where clause query -- 
select employee_id, first_name,last_name,email,phone_number,hire_date,job_id,salary ,department_id 
from employees
 where last_name like '%L%' 
 or last_name like'%J%'
 or last_name  like'%H%'
 order by salary desc ;
 
 -- 11.where clause query -- 
 select first_name,hire_date,salary,department_id from employees
 where first_name not like '%A%'
 order by department_id asc;
 
 -- 12. where clause query --  
 select employee_id ,first_name ,last_name,email,phone_number,job_id,salary,manager_id,hire_date,commission_pct 
 from employees;
 
 -- 13. where clause query -- 
 select concat(first_name,' , ',last_name) as full_name,salary from employees
 where salary not between 7000 and 15000
 order by full_name asc;
 
 -- 14. where clause query -- 
 select concat(first_name,' , ',last_name) as Full_name ,concat(email ,'-' ,phone_number) as Contacts ,salary as Sal 
 from employees 
 where salary between 5000 and 10000;
 
--  15. where clasue query -- 
select employee_id, first_name,last_name,salary,commission_pct,department_id 
from employees 
where (salary  between 6000 and 8000 and commission_pct is not null) 
or (department_id not in (80,90,100) and hire_date < '1990-01-01') ;

-- 16. where clause query -- 
 select last_name,job_id ,hire_date
 from employees
 where hire_date between '1995-12-12' and '1998=04-17';
 
 -- 17.where clause query -- 
 select concat(first_name,' ',last_name) as FUll_name,commission_pct, hire_date,phone_number,salary 
 from employees where salary > 10000 or SUBSTRING(phone_number, 3, 1) = '5'
 order by first_name desc;
 
 -- 18 where clause query -- 
 select last_name,salary 
 from employees 
 where salary > 12000;
 
 -- 19 where clause query -- 
 select last_name,department_id 
 from employees 
 where department_id in(50,80);
 
select last_name,department_id 
 from employees 
 where department_id = 50
 or department_id = 80;
 
 -- 20 where clause query --
 select first_name,salary 
 from employees
 where commission_pct is null
 or commission_pct = 0;
 
 -- 21 where clasue query -- 
 select first_name ,salary,manager_id 
 from employees
 where manager_id is not null;
 
 
 
 -- SQL / Scalar numerical functions -- 
 
 
 -- 1. query -- 
 select lower(first_name) as first_lower_name,
 upper(last_name) as last_upper_name, employee_id
 from employees 
 where employee_id between 80 and 150;
 
 -- 2. query  -- 
 SELECT first_name, last_name
FROM employees
WHERE UPPER(last_name) = 'KING';

-- 3 query -- generating new email address -- 
SELECT first_name, last_name,
CONCAT(LEFT(first_name, 1), LEFT(last_name, 3), '@oracle.com') AS email
FROM employees;

SELECT first_name, last_name,
CONCAT(LEFT(first_name, 1), RIGHT(last_name, 3), '@oracle.com') AS email
FROM employees;

-- 4. query -- 
select concat(first_name,' ',last_name) as FULL_NAME 
from employees;

select concat(first_name,' ',last_name,' ',hire_date) as full_name_date
from employees;

-- 5. query -- 
select last_name 
from employees 
where length(last_name)> 8;

-- 6. query -- phone numbers -- 
select first_name,last_name, phone_number, 
replace(phone_number, '515', '815')
from employees;

select first_name,last_name, phone_number, 
replace(phone_number, '515', '815')
from employees
where phone_number like '515%';

-- 7. query --
-- for each employee display -- 
SELECT first_name, salary,
salary * 1.12 AS raised_salary,
ROUND(salary * 1.12) AS raised_salary_rounded,
FLOOR(salary * 1.12) AS raised_salary_floor
FROM employees;

-- 8. query -- 
SELECT first_name,hire_date,
DATE_SUB(hire_date, INTERVAL 10 DAY) AS minus_10_days,
DATE_ADD(hire_date, INTERVAL 1 MONTH) AS plus_1_month,
DATEDIFF(CURDATE(), hire_date) AS days_worked
FROM employees;

-- 9. query -- 
SELECT first_name, last_name, hire_date,
TIMESTAMPDIFF(MONTH, hire_date, CURDATE()) AS months_worked,
TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_worked
FROM employees;
 
 -- 10. query -- 
 select first_name,hire_date,
 date_add(hire_Date, interval 1 year) as plus_1_year
 from employees;
 
 -- 11.query -- 
 SELECT first_name, hire_date,
MAKEDATE(YEAR(hire_date)+1, 1) AS rounded_year,
LAST_DAY(hire_date) AS rounded_month
FROM employees;

-- 12. query -- 
SELECT first_name,
DAY(hire_date) AS hire_day,
YEAR(hire_date) AS hire_year
FROM employees; 

-- 13. query -- 
SELECT UPPER(last_name) AS last_name_upper,
FORMAT(salary, 3) AS salary_formatted,
DATE_FORMAT(hire_date, '%d/%m/%Y') AS hire_date_formatted
FROM employees
WHERE last_name 
LIKE 'D%' OR last_name LIKE 'K%';

-- 14. query -- 
SELECT first_name, last_name, salary,
IFNULL(commission_pct, 0) AS commission
FROM employees;
 
 SELECT first_name, last_name, salary,
       IFNULL(commission_pct, 'No Commission') AS commission
FROM employees;

-- 15. query -- 
select first_name,last_name,salary ,
CASE 
when salary between 0 and 5000 then 'A'
when salary between 5001 and 15000 then 'B'
when salary between 15001 and 20000 then'C'
else 'D' end as Salary_grade
from employees;

-- basic select problem solving queries  -- 

-- 1. select query -- 
select employee_id, first_name ,last_name,phone_number,department_id
from employees;

-- 2. select query -- 
select first_name,last_name,hire_date,salary,
salary * 1.12 as ANNUAL_SAL 
from employees;

-- 3. select query -- 
select concat(last_name,' ',first_name) as FULL_NAME,
concat(phone_number,' - ',email) as CONTACT_DETAILS
from employees;

-- 4. select query -- 
select distinct manager_id from employees;
 
 -- 5. select query -- 
 select concat(last_name,' ',job_id) as EMPLOYEE_AND_TITLE 
 from employees;
 
 -- 6 select query -- 
 SELECT 
first_name AS FN,
last_name AS LN,
salary AS SAL,
CONCAT(hire_date, ' HD') AS HD
FROM Employees;

-- 7. select query -- 
select distinct salary from employees;

-- 8. select query -- 
select distinct department_id,job_id
from employees;

SELECT DISTINCT department_id, job_id
FROM Employees
where department_id is Not Null AND job_id is not null ;

-- statements with group by queries -- 

-- 1. group by query -- 
SELECT MIN(last_name) AS lowest_last_name
FROM (SELECT last_name FROM Employees
GROUP BY last_name) AS grouped_names;

-- 2. grp by query -- 
SELECT MAX(last_name) AS highest_last_name
FROM (SELECT last_name
FROM Employees
GROUP BY last_name) AS grouped_names;

-- 3. grp by query -- 
SELECT COUNT(*) AS total_rows
FROM (SELECT employee_id
From Employees
GROUP BY employee_id) AS grouped_employees;

-- 4. grp by query -- 
SELECT COUNT(commission_pct) AS non_null_commission_count
FROM (SELECT commission_pct FROM Employees
WHERE commission_pct IS NOT NULL
GROUP BY commission_pct) AS grouped_commissions;

-- 5. grp by query -- 
SELECT COUNT(*) AS null_commission_count
FROM (SELECT commission_pct FROM Employees
WHERE commission_pct IS NULL GROUP BY commission_pct) AS grouped_nulls;

-- 6. grp by query -- 
SELECT MAX(salary) AS highest_salary,
MIN(salary) AS lowest_salary,
AVG(salary) AS average_salary
FROM (SELECT salary FROM Employees
GROUP BY salary) AS grouped_salaries; 

-- statements with group and having clause --  

-- 7. grp and having query -- 
SELECT department_id, 
AVG(salary) AS avg_salary
From Employees
where department_id in(50,80)
GROUP BY department_id;
 
  -- 8. grp and having query -- 
  SELECT job_id, 
COUNT(*) AS employee_count
FROM Employees
GROUP BY job_id;

SELECT job_id, 
COUNT(*) AS employee_count
from Employees
WHERE salary > 10000
GROUP BY job_id;

SELECT job_id, 
COUNT(*) AS employee_count
FROM Employees
GROUP BY job_id
HAVING COUNT(*) > 2; 

-- 9. grp by and having query -- 
SELECT department_id, job_id, 
avg(salary) AS avg_salary
FROM Employees
GROUP BY department_id, job_id;

-- 10.grp by and having query -- 
SELECT manager_id, 
MAX(salary) AS highest_salary
from Employees
group by manager_id ;
 
 select manager_id, 
MAX(salary) as highest_salary
FROM Employees
where salary > 10000
GROUP BY manager_id; 

 -- 11.grp by and having query -- 
select job_id, min(salary) as min_salary
from employees
group by job_id having min(salary) > 7000; 

-- 12.grp by and having query -- 
select department_id, avg(salary) as avg_salary
from employees
where department_id between 20 and 80
group by department_id having avg(salary) > 10000;

-- problem statement to be solved by using sub-queries -- 
-- 1. query
select first_name,salary from employees 
where salary >(select salary from employees
where employee_id = 103);

-- 2. query -- 
select department_id ,department_name from departments
where location_id = ( select location_id from employees 
where department_id = 90);

-- 3. query -- 
select last_name,hire_date from employees
where hire_date > (select hire_date from employees 
where employee_id =101);

-- 4. query -- 
select first_name,last_name,department_id from employees
where department_id =(select department_id from departments
where department_name= 'sales');

-- 5. query -- 
select department_id,department_name from departments 
where location_id = (select location_id from locations
where city = 'Toronto');

-- 6. query -- 
select first_name,salary ,department_id from employees
where department_id = ( select department_id from employees
where employee_id = 124);

-- 7.query -- 
select first_name ,salary,department_id from employees 
where salary>(select avg(salary) from employees) ;

-- 8. query -- 
select first_name,salary,department_id from employees
where salary in(select salary from employees
where department_id = 20);

-- 9. query -- 
select first_name,salary,department_id from employees
where salary >(select max(salary) from employees
where department_id = 50);

-- 10. query -- 
select first_name,salary,department_id
from employees where salary >(select min(salary) from employees
where department_id = 60);

-- 11.query -- 
select first_name,salary,department_id
from employees where salary <(select min(salary) from employees
where department_id = 90);

-- 12. query -- 
select e.first_name, e.salary, e.department_id
from employees e
where e.department_id in (select d.department_id
from departments d join locations l on d.location_id = l.location_id
where l.city = 'Seattle');

-- 13. query -- 
select first_name,salary,department_id from employees
where salary <(select avg(salary) from employees) 
and department_id in(select department_id
from employees where first_name = 'Kevin');

-- problems statement by using inner join -- 
-- employees and department tables -- 

-- a) query -- 
select e.first_name,e.last_name,e.department_id,d.department_name 
from employees e inner join departments d on e.department_id = d.department_id ;

-- b) query -- 
select e.first_name,e.last_name,e.department_id,d.department_name 
from employees e inner join departments d on e.department_id = d.department_id
 where e.department_id in (50,90) ;
 
 -- department.employees and locations -- 
 -- a) query -- 
 select d.department_name,l.city,l.state_province 
 from departments d inner join locations l on d.location_id = l.location_id;
 
 -- b. query -- 
select concat(e.first_name,' ',e.last_name) as full_name,d.department_name,l.city,l.state_province 
from employees e inner join departments d on e.department_id = d.department_id
inner join locations l on d.location_id = l.location_id;

-- c. query -- 
select concat(e.first_name,' ',e.last_name) as full_name,d.department_name,l.city,l.state_province 
 from employees e inner join departments d on e.department_id = d.department_id
inner join locations l on d.location_id = l.location_id 
where e.last_name like '%a%';

-- problem statements by using outer join -- 
-- employees amd departments table -- 

-- a) query -- 
select e.first_name,e.last_name,e.department_id,d.department_name
from employees e left outer join departments d on e.department_id = d.department_id ;

-- b) query -- 
select e.first_name,e.last_name,e.department_id,d.department_name
from employees e right outer join departments d on e.department_id = d.department_id ;

-- problem statements by using self join -- 

-- a) query -- 
select e.last_name as employees, m.last_name as managers from employees e join employees m 
on e.manager_id = m.employee_id ;

-- b) query -- 
select e.last_name as employees, m.last_name as managers from employees e left join employees m 
on e.manager_id = m.employee_id ;

-- 6. query  -- 
select first_name,last_name,department_id from employees 
where department_id in (select department_id from employees where
last_name = 'king') and last_name <> 'king';

-- 7.query -- 
select last_name, salary from employees 
where salary <( select salary 
from employees where employee_id = 103);













 
 
 
 
 
 
 
 
 
 