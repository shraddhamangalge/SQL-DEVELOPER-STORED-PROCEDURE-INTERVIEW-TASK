use SQL_Developer;

## Task 1 -  Employee Salary Report Procedure

delimiter //
create procedure Get_Employee_Salary_Report(department_name varchar(50), minimum_salary decimal(8,2))
begin
select * from employees
where department = department_name and basic_salary >= minimum_salary and status = 'Active';
end //
delimiter ;

call Get_Employee_Salary_Report('IT',50000);

## Task 2 – Employee Salary Calculation Procedure

delimiter //
create procedure CalculatesEmployeeSalary(employeeID int)
begin
select employee_name,basic_salary,HRA,DA,PF,Basic_salary+HRA+DA-PF as net_salary from(
select employee_id, employee_name, basic_salary, 
basic_salary* 0.2 as HRA, basic_salary*0.1 as DA, basic_salary*0.12 as PF
from employees where employee_id = employeeID) as salary_calculations;
end //
delimiter ;

call CalculatesEmployeeSalary(1);

## Task 3 – Salary Grade Procedure

delimiter //
create procedure Employee_Salary_Grade(employeeID int)
begin 
select employee_name, basic_salary, grade from(
select employee_id, employee_name, basic_salary, 
case
when basic_salary < 30000 then 'C'
when basic_salary between 30000 and 60000 then 'B'
when basic_salary > 60000 then 'A'
end as Grade
from employees where employee_id = employeeID) as Salary_grade;
end //
delimiter ;

call Employee_Salary_Grade(1);
call Employee_Salary_Grade(10);

## Bonus Task - Department Summary

delimiter //
create procedure Get_Department_Summary(Department_Name varchar(50))
begin
if exists(
select 1 from employees where department = department_name)
then 
select department, count(*) as Total_employees , avg(Basic_salary) as Average_salary ,
max(basic_salary) as Highest_salary, min(basic_salary) as Lowest_salary, sum(Basic_salary) as Total_expenditure
from employees where department = department_name group by department;
else select "department not found" as message;
end if ;
end //
delimiter ;

call Get_Department_Summary('IT');