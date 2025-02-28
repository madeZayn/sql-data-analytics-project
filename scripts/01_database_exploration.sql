--Explore all the objects in the Database
select * from INFORMATION_SCHEMA.TABLES;

--Explore all the objects in the Database
select * from INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'fact_sales';
