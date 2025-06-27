mysql> use task4;
Database changed
mysql> CREATE TABLE Employees (
    ->     EmpID INTEGER PRIMARY KEY,
    ->     Name TEXT,
    ->     Department TEXT,
    ->     Salary INTEGER,
    ->     Age INTEGER
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> INSERT INTO Employees (EmpID, Name, Department, Salary, Age) VALUES
    -> (1, 'Alice', 'HR', 50000, 30),
    -> (2, 'Bob', 'IT', 60000, 28),
    -> (3, 'Charlie', 'IT', 75000, 32),
    -> (4, 'Diana', 'Finance', 80000, 40),
    -> (5, 'Eve', 'HR', 52000, 29),
    -> (6, 'Frank', 'Finance', 77000, 38),
    -> (7, 'Grace', 'IT', 67000, 26);
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> SELECT Department, SUM(Salary) AS TotalSalary
    -> FROM Employees
    -> GROUP BY Department;
+------------+-------------+
| Department | TotalSalary |
+------------+-------------+
| HR         |      102000 |
| IT         |      202000 |
| Finance    |      157000 |
+------------+-------------+
3 rows in set (0.03 sec)

mysql>
mysql> SELECT Department, ROUND(AVG(Salary), 2) AS AverageSalary
    -> FROM Employees
    -> GROUP BY Department;
+------------+---------------+
| Department | AverageSalary |
+------------+---------------+
| HR         |      51000.00 |
| IT         |      67333.33 |
| Finance    |      78500.00 |
+------------+---------------+
3 rows in set (0.02 sec)

mysql> SELECT Department, COUNT(*) AS EmployeeCount
    -> FROM Employees
    -> GROUP BY Department;
+------------+---------------+
| Department | EmployeeCount |
+------------+---------------+
| HR         |             2 |
| IT         |             3 |
| Finance    |             2 |
+------------+---------------+
3 rows in set (0.01 sec)

mysql> SELECT Department, COUNT(*) AS EmployeeCount
    -> FROM Employees
    -> GROUP BY Department
    -> HAVING COUNT(*) > 2;
+------------+---------------+
| Department | EmployeeCount |
+------------+---------------+
| IT         |             3 |
+------------+---------------+
1 row in set (0.00 sec)

mysql> SELECT Department, MAX(Salary) AS HighestSalary
    -> FROM Employees
    -> GROUP BY Department;
+------------+---------------+
| Department | HighestSalary |
+------------+---------------+
| HR         |         52000 |
| IT         |         75000 |
| Finance    |         80000 |
+------------+---------------+
3 rows in set (0.02 sec)

mysql> SELECT COUNT(DISTINCT Department) AS UniqueDepartments
    -> FROM Employees;
+-------------------+
| UniqueDepartments |
+-------------------+
|                 3 |
+-------------------+
1 row in set (0.00 sec)