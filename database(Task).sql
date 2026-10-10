create database SQL_Developer;
use SQL_Developer;

create table employees
(employee_id int primary key, employee_name varchar(100), department varchar(50), 
designation varchar(100), basic_salary decimal(8,2), joining_date date, status varchar(50));

insert into employees
values
(1,'Shraddha','IT','Medium-level',80000,'2024-10-12','Active'),
(2,'Shrapti','CS','Senior-level',60000,'2024-08-10','Active'),
(3,'Tanuja','Finance','High-level',75000,'2025-09-07','InActive'),
(4,'Lokesh','HR','Medium-level',90000,'2024-11-09','Active'),
(5,'Saurabh','IT','Low-level',40000,'2026-12-04','InActive'),
(6,'Mohit','HR','High-level',90000,'2025-06-03','Active'),
(7,'Nikita','CS','Medium-level',30000,'2024-02-10','Active'),
(8,'Aayush','Finance','Low-level',80000,'2026-09-08','Active'),
(9,'Darshani','IT','High-level',100000,'2025-10-04','Active'),
(10,'Shivani','IT','Medium-level',20000,'2024-06-03','InActive');

select * from employees;




