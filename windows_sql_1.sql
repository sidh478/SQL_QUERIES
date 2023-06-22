-- windows in SQL
-- use traing data base
create database windows;
use windows;
-- creating new table employe
create table employe(
emp_id int,
emp_name varchar(20),
dept_name varchar(20),
salary int);
-- inserting values
insert into employe values(101,'mohan','admin',4000);
insert into employe values(102,'rajkumar','hr',3000);
insert into employe values(103,'akbar','it',6500);
insert into employe values(104,'dorvin','finance',6500);
insert into employe values(105,'rohit','hr',3000);
insert into employe values(106,'rajesh','finance',5000);
insert into employe values(107,'preet','hr',7000);
insert into employe values(108,'marvan','admin',4000);
insert into employe values(113,'gautam','admin',2000);
-- max salary
select * from employe;
select max(salary) as max_salary from employe;
-- max salary in each department
select dept_name,max(salary) as max_salary 
from employe 
group by dept_name;
-- max salary using window function
select e.*,
max(salary) over() as max_salary
from employe e;
-- max salary in each department using window function
select e.*,
max(salary) over(partition by dept_name) as max_salary
from employe e;
-- row_number,rank,dense_rank,lead and lag
-- row_number()
select e.*,
row_number() over() as rn
from employe e;
-- row_number by dept_name
select e.*,
row_number() over(partition by dept_name)
from employe e;
-- fetch the first 2 employee from each department
select* from(
	select e.*,
	row_number() over(partition by dept_name order by emp_id) as rn
	from employe e) x
    where x.rn < 3;
-- rank()
-- fetch the top 3 employee in each department earning the max salary
select * from (
select e.*,
rank() over(partition by dept_name order by salary desc) as rnk
from employe e) x
where x.rnk<4;
-- dense rank()
-- difference between rank and dense rank
-- rank sikp the values repeated
-- dense rank dont skip the values even its repeated
-- row number just give number irrespective of duplicates
select e.*,
rank() over(partition by dept_name order by salary desc) as rnk,
dense_rank() over(partition by dept_name order by salary desc) as dense_rnk,
row_number() over(partition by dept_name order by emp_id) as rn
from employe e;
-- lag
--  without conditions
select e.*,
lag(salary) over(partition by dept_name order by emp_id) as previous_emp_salary
from employe e;
-- 1 start after 1st row and intitiate 0 to lag index
select e.*,
lag(salary,1,0) over(partition by dept_name order by emp_id) as previous_emp_salary
from employe e;
-- lag() and lead()
select e.*,
lag(salary) over(partition by dept_name order by emp_id) as previous_emp_salary,
lead(salary) over(partition by dept_name order by emp_id) as previous_emp_salary
from employe e;
-- fetch a query to display if the salary of an employee is higher,lower or equal to the previous employee.alter
select e.*,
lag(salary) over(partition by dept_name order by emp_id) as previous_emp_salary,
case when e.salary > lag(salary) over(partition by dept_name order by emp_id) then 'higher than previous employee'
	 when e.salary < lag(salary) over(partition by dept_name order by emp_id) then 'lower than previous employee'
	 when e.salary = lag(salary) over(partition by dept_name order by emp_id) then 'same as than previous employee'
end sal_range
from employe e;
