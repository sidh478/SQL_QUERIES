create database training;
-- drop database training;
use training;
-- ---------
create table customer(
custid int,
custname varchar(50), 
age int,
gender char(1),
city varchar(50)
);
-- Load data
SELECT * FROM customer;
insert into customer values(1000,'Raghul Ramesh',37,'M','Chennai');
insert into customer values(1001,'Saghul Ramesh',33,'F','Bangalore');
insert into customer(custid,custname,gender,city) values(1002,'malini','F','Bangalore');
insert into customer(city,custname,gender,custid,age) values('Pune','Pankaj Kumar','M',1003,40);
insert into customer values(1004,'Mohan kumar',37,'M','Chennai'),(1005,'shivanandam',50,'M','Delhi'),(1006,'Ranga',55,'M','Chennai');
-- Update data
select * from customer;
-- safe mode disable
set sql_safe_updates=0;
update customer set age=30 where custid=1000;
update customer set age=60 where custid=1003;

update customer set age=41,city='Hyderabad' where custid=1003;
update customer set custid=2000 where custid=1001;

insert into customer(custname,age,gender,city) values('aveek sharma',45,'M','Hyderabad');
update customer set custid=1008 where custid is null;
select * from customer;

-- Delete the records
delete from customer where custname='ranga';
delete from customer where age>=50;
delete from customer where city != 'Hyderabad';
-- selected city
delete from customer where city in ('chennai','Bangalore');
-- except
delete from customer where city not in ('Chennai','Hyderabad');

select * from customer;
