create database windows;
use windows;
create table product(
product_cat varchar(50),
brand varchar(50),
product_name varchar(50),
price int);

insert into product values('phone','apple','iphone12 pro max',1300),
('phone','apple','iphone12 pro max',1300),
('phone','apple','iphone12 pro ',1100),
('phone','apple','iphone12',1000),
('phone','samsung','galaxy z fold 3',1800),
('phone','samsung','galaxy z flip 3',1000),
('phone','samsung','galaxy not 20',1200),
('phone','samsung','galaxy 21',1000),
('phone','oneplus','oneplus nord',300),
('phone','oneplus','oneplus 9',800),
('phone','google','pixel 6',600),
('laptop','apple','mackbook pro 13',2000),
('laptop','apple','mackbook air',1200),
('laptop','microsoft','surface laptop 4',2100),
('laptop','dell','xps 13',2000),
('laptop','dell','xps 15',2300),
('laptop','dell','xps 17',2500),
('earphone','apple','airpods pro',280),
('earphone','samsung','galaxy buds pro',270),
('earphone','samsung','galaxy buds live',220),
('earphone','sony','wf-1000xm4',250),
('headphone','sony','wh-1000xm4',400),
('headphone','apple','airpods max',550),
('headphone','microsoft','surface headphones 2',250),
('smartwatch','apple','apple watch series 6',1000),
('smartwatch','apple','apple watch series 7',2000),
('smartwatch','apple','apple watch se',400),
('smartwatch','samsung','galaxy watch 4',600),
('smartwatch','oneplus','oneplus watch',220);

select * from product;
-- first_value
-- write query to display the most expensive and lest expensive product under each category(corresponding to each record)
select *,
first_value(product_name) over(partition by product_cat order by price desc) as most_exp_product
from product;
-- last value(frame clause must be used)
select *,
last_value(product_name) over(partition by product_cat order by price desc) as least_exp_product
from product;
-- default frame clause affect last value,nth value,aggregate functions
-- first value and last value(frame clause is used)
select *,
first_value(product_name) 
	over(partition by product_cat order by price desc) 
as most_exp_product,
last_value(product_name) 
	over(partition by product_cat order by price desc 
		range between unbounded preceding and unbounded following)
	as least_exp_product
from product;
-- controlling range by numbers
select *,
first_value(product_name) 
	over(partition by product_cat order by price desc) 
as most_exp_product,
last_value(product_name) 
	over(partition by product_cat order by price desc 
		range between 2 preceding and 2 following)
	as least_exp_product
from product;
-- Alternate way of writing window function
select *,
first_value(product_name) over w as most_exp_product,
last_value(product_name) over w as least_exp_product
from product
window w as (partition by product_cat order by price desc 
			range between unbounded preceding and unbounded following);
-- NTH value
-- write query to display the second most expensive product under each category.
select *,
first_value(product_name) over w as most_exp_product,
last_value(product_name) over w as least_exp_product,
-- 2 means from 2nd row value is fetched
-- if value given is out of range it will return null value
nth_value(product_name,2) over w as second_most_exp_prodct
from product
window w as (partition by product_cat order by price desc 
			range between unbounded preceding and unbounded following);
-- NTILE
-- write a query to seggerate all the expensive phones,mid range phones and cheaper phones.
select product_name,
case when x.buckets=1 then 'Expensive Phones'
	 when x.buckets=2 then 'Mid Range Phones'
     when x.buckets=3 then 'Cheaper Phones'
     end as phone_category
from (
	select *,
	ntile(3) over(order by price desc) as buckets
	from product
	where product_cat='phone') x;
-- CUME_DIST
-- query to fetch all products which are constituting the first 30% of the data in products table based on price
select *,
cume_dist() over(order by price desc) as cume_distribution,
round(cume_dist() over(order by price desc) :: numeric * 100,2) as cume_dist_percentage
from product;



