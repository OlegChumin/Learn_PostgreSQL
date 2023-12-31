SELECT id,
       first_name AS NAME,
       last_name  AS SURNAME,
       salary        SALARY
FROM employee empl
ORDER BY salary
LIMIT 50 OFFSET 0;

SELECT id,
       first_name AS NAME,
       last_name  AS SURNAME,
       salary        SALARY
FROM employee empl
ORDER BY id
LIMIT 50 OFFSET 0;

SELECT id,
       first_name AS NAME,
       last_name  AS SURNAME,
       salary        SALARY
FROM employee empl
ORDER BY NAME
LIMIT 50 OFFSET 0;

SELECT id,
       first_name AS NAME,
       last_name  AS SURNAME,
       salary        SALARY
FROM employee empl
ORDER BY first_name;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary        SALARY
FROM employee empl
ORDER BY first_name;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary        SALARY
FROM employee empl
ORDER BY salary ASC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary        SALARY
FROM employee empl
ORDER BY salary DESC;

SELECT id,
       first_name AS NAME,
       last_name  AS SURNAME,
       salary        SALARY
FROM employee empl
ORDER BY salary ASC;

SELECT id,
       first_name AS NAME,
       last_name  AS SURNAME,
       salary        SALARY
FROM employee empl
ORDER BY first_name, salary;


SELECT id,
       first_name AS NAME,
       last_name  AS SURNAME,
       salary        SALARY
FROM employee empl
ORDER BY first_name, salary DESC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary        SALARY
FROM employee empl
ORDER BY first_name, salary DESC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary        SALARY
FROM employee empl
ORDER BY NAME;
--LIMIT 8
--OFFSET 3;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary     AS SALARY
FROM employee
WHERE salary != 2000 -- != заменяют на <>
ORDER by first_name, salary DESC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary     AS SALARY
FROM employee
WHERE first_name = 'Ivan'
ORDER by first_name, salary DESC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary     AS SALARY
FROM employee
WHERE first_name != 'Ivan'
ORDER by first_name, salary DESC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary     AS SALARY
FROM employee
WHERE first_name LIKE 'Ol%'
ORDER by first_name, salary DESC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary     AS SALARY
FROM employee
WHERE last_name LIKE '%ov'
ORDER by first_name, salary DESC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary     AS SALARY
FROM employee
WHERE first_name LIKE 'ivan'
ORDER by first_name, salary DESC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary     AS SALARY
FROM employee
WHERE first_name ILIKE 'oleg'
ORDER by first_name, salary DESC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary     AS SALARY
FROM employee
WHERE salary BETWEEN 3000 AND 5000
ORDER by first_name, salary DESC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary     AS SALARY
FROM employee
WHERE salary NOT BETWEEN 3000 AND 5000
ORDER by first_name, salary DESC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary     AS SALARY
FROM employee
WHERE salary IN (1000, 2000, 5000)
ORDER by first_name, salary DESC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary     AS SALARY
FROM employee
WHERE salary IN (1000, 2000, 5000)
  AND first_name LIKE 'Iv%'
ORDER by first_name, salary DESC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary     AS SALARY
FROM employee
WHERE salary IN (1000, 2000, 5000)
   OR first_name LIKE 'Iv%'
ORDER by first_name, salary DESC;

SELECT DISTINCT id,
                first_name AS NAME,
                last_name  AS SURNAME,
                salary     AS SALARY
FROM employee empl
WHERE salary IN (1000, 2000, 5000)
   OR (first_name LIKE 'Iv%'
    AND last_name ILIKE '%ov%') --ILIKE сравнение без чета регистра только в postgres
ORDER by first_name, salary DESC;

SELECT
    sum(salary)
FROM employee empl;

SELECT
    avg(salary)
FROM employee empl;

SELECT
    min(salary)
FROM employee empl;

SELECT
    max(salary)
FROM employee empl;

SELECT
    count(salary) --количество строк в выборке
FROM employee empl;

SELECT
    count(*) --количество строк в выборке
FROM employee empl;

-- sum, avg, min, max, count это агрегирующие функции
SELECT
    count(salary) --количество строк в выборке
FROM employee empl;

