SELECT employee_number, last_name, first_name, sex, salaries.salary
FROM employees JOIN salaries
USING(employee_number)

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR from hire_date) = 1986;


--manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT employees.employee_number, last_name, first_name, department_manager.department_number, departments.department_name
FROM employees
RIGHT OUTER JOIN department_manager
ON employees.employee_number = department_manager.employee_number
RIGHT OUTER JOIN departments
ON department_manager.department_number = departments.department_number

--employee number, last name, first name, and department name
CREATE VIEW new_employees_data AS
SELECT employees.employee_number, last_name, first_name, department_emp.department_number, departments.department_name
FROM employees
RIGHT OUTER JOIN department_emp
ON employees.employee_number = department_emp.employee_number
RIGHT OUTER JOIN departments
ON department_emp.department_number = departments.department_number

SELECT employee_number, last_name, first_name, department_name
FROM new_employees_data

SELECT first_name, last_name, sex
FROM employees
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%'

CREATE VIEW departments_and_employees AS
SELECT first_name, last_name, department_emp.department_number, departments.department_name
FROM employees
JOIN department_emp
ON (employees.employee_number = department_emp.employee_number)
  JOIN departments
  ON (department_emp.department_number = departments.department_number)
  
SELECT * from departments_and_employees

SELECT first_name, last_name, department_name
FROM departments_and_employees
WHERE department_name LIKE 'Sales'

SELECT first_name, last_name, department_name
FROM departments_and_employees
WHERE department_name LIKE 'Sales'
OR department_name LIKE 'Development'

SELECT last_name, COUNT(last_name) as "frequency of last names"
FROM employees
GROUP BY last_name
ORDER BY "frequency of last names" DESC;