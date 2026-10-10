# 💻 SQL Developer – Stored Procedure Interview Task

## 📌 About the Project

This repository contains my SQL Developer interview assignment, where I worked on different stored procedures using MySQL.

The main goal of this task was to understand how stored procedures can make SQL operations easier to reuse and manage. I worked on employee salary reports, salary calculations, salary grading, and department summaries.

While working on these tasks, I got practical experience with **stored procedures, conditional statements, derived tables, CASE statements, and aggregate functions**.

## 🛠️ Technologies Used

* **Database:** MySQL
* **Language:** SQL
* **Concepts:** Stored Procedures, SELECT Queries, WHERE Clause, IF Statements, CASE Statements, Derived Tables, GROUP BY, Aggregate Functions

---

## 📋 Task 1: Employee Salary Report

### 🎯 Objective

Create a stored procedure to display active employees from a particular department whose basic salary meets a specified minimum amount.

### 💡 Stored Procedure

**Procedure Name:** `Get_Employee_Salary_Report`

```sql
DELIMITER //

CREATE PROCEDURE Get_Employee_Salary_Report(
    department_name VARCHAR(50),
    minimum_salary DECIMAL(8,2)
)
BEGIN
    SELECT *
    FROM employees
    WHERE department = department_name
      AND basic_salary >= minimum_salary
      AND status = 'Active';
END //

DELIMITER ;
```

### ▶️ How to Execute

```sql
CALL Get_Employee_Salary_Report('IT', 50000);
```

### 📊 Expected Output

The result displays employee details such as:

* Employee ID
* Employee Name
* Department
* Designation
* Basic Salary
* Joining Date

### 🔍 Observation

When I executed the procedure for the IT department with a minimum salary of ₹50,000, **two employees—Shraddha and Darshani—matched the specified conditions**, according to my original output.

### 📚 SQL Concepts Used

* SELECT statement
* WHERE clause
* AND operator
* Stored procedure

---

## 📋 Task 2: Employee Salary Calculation

### 🎯 Objective

Calculate an employee's HRA, DA, PF, and net salary using their employee ID.

### 💡 Stored Procedure

**Procedure Name:** `CalculatesEmployeeSalary`

```sql
DELIMITER //

CREATE PROCEDURE CalculatesEmployeeSalary(
    employeeID INT
)
BEGIN
    SELECT
        employee_name,
        basic_salary,
        HRA,
        DA,
        PF,
        Basic_salary + HRA + DA - PF AS net_salary
    FROM (
        SELECT
            employee_id,
            employee_name,
            basic_salary,
            basic_salary * 0.20 AS HRA,
            basic_salary * 0.10 AS DA,
            basic_salary * 0.12 AS PF
        FROM employees
        WHERE employee_id = employeeID
    ) AS salary_calculations;
END //

DELIMITER ;
```

### ▶️ How to Execute

```sql
CALL CalculatesEmployeeSalary(1);
```

### 📊 Expected Output

The result displays:

* Employee Name
* Basic Salary
* HRA (20% of Basic Salary)
* DA (10% of Basic Salary)
* PF (12% of Basic Salary)
* Net Salary

**Net Salary = Basic Salary + HRA + DA − PF**

### 🔍 Observation

This procedure calculates the salary components for the employee whose ID is provided. It helps simplify salary calculations by performing them directly in SQL.

### 📚 SQL Concepts Used

* SELECT statement
* WHERE clause
* Derived table
* Stored procedure
* Arithmetic operations

---

## 📋 Task 3: Employee Salary Grade

### 🎯 Objective

Assign a salary grade to an employee based on their basic salary.

### 💡 Stored Procedure

**Procedure Name:** `Employee_Salary_Grade`

```sql
DELIMITER //

CREATE PROCEDURE Employee_Salary_Grade(
    employeeID INT
)
BEGIN
    SELECT
        employee_name,
        basic_salary,
        grade
    FROM (
        SELECT
            employee_id,
            employee_name,
            basic_salary,
            CASE
                WHEN basic_salary < 30000 THEN 'C'
                WHEN basic_salary BETWEEN 30000 AND 60000 THEN 'B'
                WHEN basic_salary > 60000 THEN 'A'
            END AS Grade
        FROM employees
        WHERE employee_id = employeeID
    ) AS Salary_grade;
END //

DELIMITER ;
```

### ▶️ How to Execute

```sql
CALL Employee_Salary_Grade(1);
```

### 📊 Salary Grading Criteria

| Basic Salary    | Grade |
| --------------- | ----- |
| Below ₹30,000   | C     |
| ₹30,000–₹60,000 | B     |
| Above ₹60,000   | A     |

### 🔍 Observation

According to my original output, Shraddha has employee ID 1 and a basic salary of ₹80,000. Since her salary is above ₹60,000, the procedure assigns her **Grade A**.

### 📚 SQL Concepts Used

* SELECT statement
* WHERE clause
* CASE statement
* Derived table
* Stored procedure

---

## ⭐ Bonus Task: Department Summary

### 🎯 Objective

Create a stored procedure that provides a salary summary for a specified department. If the department does not exist in the employee table, the procedure should display a helpful message instead.

### 💡 Stored Procedure

**Procedure Name:** `Get_Department_Summary`

```sql
DELIMITER //

CREATE PROCEDURE Get_Department_Summary(
    Department_Name VARCHAR(50)
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM employees
        WHERE department = department_name
    )
    THEN
        SELECT
            department,
            COUNT(*) AS Total_employees,
            AVG(Basic_salary) AS Average_salary,
            MAX(Basic_salary) AS Highest_salary,
            MIN(Basic_salary) AS Lowest_salary,
            SUM(Basic_salary) AS Total_expenditure
        FROM employees
        WHERE department = department_name
        GROUP BY department;
    ELSE
        SELECT 'Department not found' AS message;
    END IF;
END //

DELIMITER ;
```

### ▶️ How to Execute

**Example 1: Existing Department**

```sql
CALL Get_Department_Summary('IT');
```

**Example 2: Non-Existing Department**

```sql
CALL Get_Department_Summary('Marketing');
```

### 📊 Expected Output

For an existing department, the procedure displays:

* Department Name
* Total Employees
* Average Salary
* Highest Salary
* Lowest Salary
* Total Salary Expenditure

For a department that does not exist, it displays:

`Department not found`

### 🔍 Observation

When the IT department exists in the employee table, the procedure returns its employee count and salary statistics.

If the specified department is not present, the `IF...ELSE` logic displays a message instead of returning a department summary.

### 📚 SQL Concepts Used

* Stored procedure
* IF...ELSE conditional logic
* IF EXISTS
* SELECT statement
* WHERE clause
* GROUP BY
* Aggregate functions: COUNT(), AVG(), MAX(), MIN(), SUM()

---

## 🎓 Key Learnings

Through this assignment, I gained practical experience in:

* Creating and executing stored procedures in MySQL.
* Passing parameters to procedures to make queries reusable.
* Calculating salary components using SQL expressions.
* Using CASE statements to apply business rules.
* Working with derived tables and conditional logic.
* Summarizing employee and salary data using aggregate functions.
* Handling departments that do not exist using an IF...ELSE condition.

## 🚀 Conclusion

This assignment helped me strengthen my understanding of MySQL stored procedures and how they can be used to solve practical database problems.

From generating employee salary reports to calculating salaries and summarizing department data, each task gave me an opportunity to apply SQL concepts in a practical way.

I look forward to building on these concepts and improving my SQL development skills through more hands-on projects.

---

**Project:** SQL Developer – Stored Procedure Interview Task
**Database:** MySQL
**Focus:** Stored Procedures and Practical SQL Development
