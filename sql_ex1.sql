use training;
select * from employe;
select * from employe where emp_id > 102 and emp_id <105;
set sql_safe_updates=0;
update employe set emp_name = 'Ram Sahoo' where emp_id =104;

select distinct(salary) from employe;

select * from employe order by salary asc;
select * from employe order by salary desc;
use sys;
select * from employeedemographics;
select * from employeesalary;

select * from employeedemographics
left join employeesalary on employeedemographics.EmployeeId=employeesalary.EmployeeId
union
select * from employeedemographics
right join employeesalary on employeedemographics.EmployeeId=employeesalary.EmployeeId;

select * from employe where emp_id>101 group by emp_id having  salary > 3000 order by salary limit 10 ;

select emp_name,salary from employe limit 5;
select left(emp_name,5) from employe;
select concat(left(emp_name,5),'***') from employe;

