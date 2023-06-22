-- Delete,Truncate,Drop

-- Delete(roll back)
-- Delete statement can be used to delete one/many/all rows

-- Delete one
delete from products where amount is null;
select * from products;
-- delete many
delete from products where amount<100;
-- delete all
delete  from products;
select * from products;

-- Truncate(permanent)
-- Truncate is to delete all the records in a table
select * from questions;
truncate table questions;

-- Drop(permanent)
-- Drop will delete the entire data as weel as the table
select * from customer;
drop table customer;
select * from customer; -- Error science table deleted