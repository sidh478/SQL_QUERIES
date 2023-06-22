
create table EmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50));


create table EmployeeSalary
(EmployeeId int,
JobTitle varchar(50),
salary int);

insert into EmployeeDemographics values
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male');

select * from EmployeeDemographics;

insert into EmployeeSalary values
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000);

select * from EmployeeSalary;
-- Disttinct
select distinct(EmployeeID) from EmployeeDemographics;
select distinct(Gender) from EmployeeDemographics;
-- Top 5 values
select * from EmployeeDemographics limit 5;
-- Count
select count(LastName) from employeedemographics as lastname;
-- max
select max(salary) from EmployeeSalary;
-- min
select min(salary) from EmployeeSalary;
-- avg
select avg(salary) from EmployeeSalary ;

-- =,<>
select * from EmployeeDemographics where FirstName='Jim';
select * from EmployeeDemographics where FirstName<>'Jim';
-- <,>
select * from EmployeeDemographics where Age>30;
select * from EmployeeDemographics where Age<32;
-- and 
select * from EmployeeDemographics where Age<32 and Gender='Male';
-- or
select * from EmployeeDemographics where Age<32 or Gender='Male';
-- Like(first letter s)
select * from EmployeeDemographics where LastName like 'S%';
-- Like(anywhere letter s)
select * from EmployeeDemographics where LastName like '%S%';
-- Like(multiple letter)
select * from EmployeeDemographics where LastName like '%S%o%';
-- Null
select * from EmployeeDemographics where FirstName is null;
-- Not Null
select * from EmployeeDemographics where FirstName is not null;
-- IN
select * from EmployeeDemographics where FirstName in('Jim','Michael');
-- Groupby
SET sql_mode = '';
select * from EmployeeDemographics group by Gender;

select Gender,Age,count(Gender) 
from EmployeeDemographics 
group by Gender,Age;

select Gender,count(Gender) 
from EmployeeDemographics 
where Age>31
group by Gender;

-- Order by
select * from EmployeeDemographics order by Age,gender;

select Gender,Age,count(Gender) 
from EmployeeDemographics 
order by Gender;

select Gender,count(Gender) as countgender 
from EmployeeDemographics 
where Age>31
group by Gender
order by countgender desc;

select *
from EmployeeDemographics
order by 4 desc,5 desc;

-- Inner Join
select * from EmployeeDemographics
inner join Employeesalary
on EmployeeDemographics.EmployeeID=Employeesalary.EmployeeID ;

-- Left Join
select * from EmployeeDemographics
left join Employeesalary
on EmployeeDemographics.EmployeeID=Employeesalary.EmployeeID;

-- Right Join
select * from EmployeeDemographics
right join Employeesalary on EmployeeDemographics.EmployeeID=Employeesalary.EmployeeID
where FirstName<> 'Michael'
order by salary desc;

-- Union Join
select * from EmployeeDemographics
union Employeesalary on EmployeeDemographics.EmployeeID=Employeesalary.EmployeeID;

select *,avg(Salary)
from EmployeeDemographics
right join Employeesalary on EmployeeDemographics.EmployeeID=Employeesalary.EmployeeID
where JobTitle='Salesman'
group by JobTitle;









-- delete
delete from employeedemographics;
delete from employeesalary;
