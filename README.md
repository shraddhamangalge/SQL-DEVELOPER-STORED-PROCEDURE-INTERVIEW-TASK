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

When
# SQL-DEVELOPER-STORED-PROCEDURE-INTERVIEW-TASK
SQL Developer interview task demonstrating stored procedures, conditional logic, and advanced SQL concepts using MySQL.
