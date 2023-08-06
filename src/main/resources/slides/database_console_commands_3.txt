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

SELECT sum(salary)
FROM employee empl;

SELECT avg(salary)
FROM employee empl;

SELECT min(salary)
FROM employee empl;

SELECT max(salary)
FROM employee empl;

SELECT count(salary) --количество строк в выборке
FROM employee empl;

SELECT count(*) --количество строк в выборке
FROM employee empl;

-- sum, avg, min, max, count это агрегирующие функции
SELECT count(salary) --количество строк в выборке
FROM employee empl;

SELECT upper(first_name)
FROM employee empl;

SELECT lower(first_name)
FROM employee empl
ORDER BY first_name DESC;

SELECT lower(first_name),
       concat(first_name, ' ', last_name) fio
FROM employee empl;

SELECT
    upper(first_name),
    upper(last_name),
    first_name || ' ' || last_name fio,
    now() -- время и дата  по серверу
FROM
    employee empl;

SELECT now();

SELECT now(), 1 * 2 + 3;

SELECT 1 * 2 + 3;

CREATE TABLE admin_user
(
    id      BIGINT PRIMARY KEY NOT NULL,
    name    VARCHAR(255),
    surname VARCHAR(255),
    email   VARCHAR(255)
);

DROP TABLE admin_user;

CREATE TABLE account
(
    id         BIGINT,
    acc_number VARCHAR(255),
    --     внешний ключ, связывающий счет с администратором через поле id в таблице admin_user;
    created_by BIGINT NOT NULL REFERENCES admin_user,
    created_at TIMESTAMP NOT NULL
);

INSERT INTO admin_user (id, name, surname, email)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com'),
    (2, 'Alice', 'Johnson', 'alice.johnson@example.com'),
    (3, 'Robert', 'Smith', 'robert.smith@example.com');


INSERT INTO account (id, acc_number, created_by, created_at)
VALUES
    (1, 'ACC001', 1, '2023-06-01 12:00:00'),
    (2, 'ACC002', 1, '2023-06-02 10:30:00'),
    (3, 'ACC003', 2, '2023-06-03 15:45:00'),
    (4, 'ACC004', 2, '2023-06-03 16:00:00'),
    (5, 'ACC005', 1, '2023-06-04 09:20:00'),
    (6, 'ACC006', 3, '2023-06-05 14:10:00'),
    (7, 'ACC007', 3, '2023-06-05 14:15:00'),
    (8, 'ACC008', 1, '2023-06-06 11:00:00'),
    (9, 'ACC009', 2, '2023-06-07 13:45:00'),
    (10, 'ACC010', 1, '2023-06-08 17:30:00');

SELECT
    CONCAT(name, ' ', surname) AS full_name,
    email,
    COALESCE(account_count, 0) AS account_count,
    last_created_at
FROM
    admin_user
        LEFT JOIN
    (
        SELECT
            created_by,
            COUNT(*) AS account_count,
            MAX(created_at) AS last_created_at
        FROM
            account
        GROUP BY
            created_by
    ) AS account_info
    ON
            admin_user.id = account_info.created_by;

