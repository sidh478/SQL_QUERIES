use training;

create table product(
prod_id int,
prod_name varchar(100),
amount int
);

insert into product values(1,'Mobile',30000),(2,'laptop',75000),(3,'TV',60000),(4,'Desktop',55000),(5,'Fridge',30000);
select * from product;

update product set prod_name='Television',amount=100000 where prod_id=3;

select * from births;

select * from births where wday='Thu' and month=8;

select * from births where wday='Fri' or month>5;

select births,month from births where month<5;
-- rename table name
rename table births to birth;

select * from birth;
-- Filtering by null values in wday
select * from birth where wday='';
set sql_safe_updates=0;
-- updating year to 2016
update birth set year=2015 where year='' ;

select * from birth;

-- Delete records
select * from product;
delete from product where prod_name='Fridge';
delete from product where prod_id>5;
delete from product where prod_name='';
drop table unique_table;
-- Constraints
-- Unique constarints
create table unique_table(
custid int unique,
custname varchar(100),
age int,
city varchar(100)
);

insert into unique_table values(100,'Ram kumar',35,'Chennai');
insert into unique_table values(101,'Balaravikumar',30,'Hyderabad');
-- Duplicate entry restricted by UNIQUE key
insert into unique_table values(101,'Balaravikumar',30,'Hyderabad');

select * from unique_table;
-- NULL constarints
select * from product;
insert into product values(10,'house',1000000);
insert into product(prod_id,prod_name) values(11,'car');
insert into product(prod_name) values('Bike');
insert product values(null,null,1000);
-- NOT NULL constarints

select * from unique_table;
insert unique_table values(103,'Mohan',40,'Bangalore');
insert into unique_table(customer,age,city) values('CChandra',30,'Pune');

create table notnull_table(
custid int not null,
custname varchar(100) unique,
age int,
city varchar(100)
);

insert into notnull_table values(1,'Raja',25,'Hyderabad');
insert into notnull_table values(1,'Raja',25,'Hyderabad'); -- raja is duplicate so error
insert into notnull_table values(1,'Rajesh',25,'Hyderabad');
insert into notnull_table values('Roja',26,'Bangalore'); -- custid is NOT NULL so error
select* from notnull_table;

-- Check constraints
create table check_table(
custid int unique not null,
custname varchar(100) not null,
age int check(age>0 and age<=100),
city varchar(100) check(city in ('Chennai','Hyderabad','Bangalore'))
);
insert into check_table values(1,'siva',30,'Chennai'); -- valid record
insert into check_table values(1,'vencatesh',30,'Hyderabad'); -- ERROR since it is duplicated custid
insert into check_table(custname,age,city) values('venkatesh',36,'Hyderabad'); -- Error since it is null
insert into check_table values(2,'Ramya',-1,'Hyderabad'); -- ERROR since age is < 0
insert into check_table values(2,'Ramya',101,'Hyderabad'); -- ERROR since age is > 101
insert into check_table values(10,'Ramya',50,'Hyderabad');
select * from check_table;

-- Defalut constraint
create table default_table(
custid int unique not null,
custname varchar(100) unique,
age int check (age>=22 and age <=40),
city Varchar(100) default 'Bangalore'
);
insert into default_table values(1,'Prakash',25,'Hyderabad');
insert into default_table values(2,'Priya',20,'Hyderabad'); -- Error since age is <=22
insert into default_table values(2,'Priya',50,'Hyderabad'); -- Error since age is >=22
insert into default_table values(2,'Priya',30,'Hyderabad'); 
insert into default_table(custid,custname,age) values(3,'satya',35);
select * from default_table;

-- Auto increment
create table users(
user_id int unique auto_increment,
user_name varchar(100),
city varchar(100)
);
insert into users(user_name,city) values('ganesh','Mumbai');
insert into users(user_name,city) values('shiva','belagavi');
insert into users(user_name,city) values('hanuman','bangalore');
select * from users;

-- Sequence(customisation)

-- Alter statement
-- Add new column,remove/modifiy/rename column table
use training;
select * from product;
-- describe data types
desc product;
alter table product
--- add new column
add column country varchar(100);
select * from product;
insert into product values(20,'macbook',100000,'india');
-- safe mode disable(before update)
set sql_safe_updates=0;
-- update null values
update product set country='India' where country is null;
select * from product;
-- other way
alter table product 
add column category varchar(100) default 'Electronics';
select * from product;
desc product;
-- removing the column
alter table product
drop column country;
select * from product;
-- Modify the column
desc product;

alter table product
modify column category varchar(20) default 'Gagets';
desc product;
--
alter table product
modify  prod_id int unique not null;
select * from product;
desc product;

-- Rename the column
alter table product
rename column prod_id to user_id;
select * from product;
-- Rename the Table
alter table product
rename to items;
-- or
rename table items to products;
select * from products;
-- Add PK Constrain
desc products;
alter table products
add primary key (user_id); -- error since null value and duplicate key
delete from products where user_id='10';
delete from products where user_id is null;
desc products;
-- 
alter table products
modify column amount int check(amount>0);
select * from products;

insert into products values(12,'toys',-10,'Electronics'); -- Error since less than 0
insert into products values(12,'toys',100,'Electronics');
