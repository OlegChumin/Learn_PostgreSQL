SELECT *
FROM employee;

SELECT DISTINCT id, first_name, last_name, salary
FROM employee
ORDER BY salary DESC;

UPDATE employee
SET salary = 4500
WHERE id = 10
  AND last_name = 'Grimov';

SELECT SUM(salary) AS "Расходы на зарплату на всех сотрудников"
FROM employee;

SELECT min(salary) AS "минимальна ЗП", max(salary) AS "максимальная ЗП"
FROM employee;

SELECT id, last_name, salary
FROM employee
WHERE salary BETWEEN 3000 AND 6000
ORDER BY salary DESC;

SELECT id, last_name, salary
FROM employee
WHERE salary NOT BETWEEN 3000 AND 6000
ORDER BY id ASC;

INSERT INTO employee
VALUES (12, 'Arnold', 'Schwarzenegger', 9000);

INSERT INTO employee
VALUES (14, 'Leonid2', 'Chumin', 5500);

CREATE SEQUENCE employee_id_sequence;

ALTER TABLE employee
    ALTER COLUMN id SET DEFAULT nextval('employee_id_sequence');

DROP SEQUENCE employee_id_sequence;

ALTER TABLE employee
    ALTER COLUMN id DROP DEFAULT;

DROP SEQUENCE employee_id_sequence CASCADE;

INSERT INTO employee
VALUES (15, 'Leonid3', 'Chumin', 5500);

SELECT SUM(salary)
FROM employee;

SELECT ROUND(AVG(salary), 2)
FROM employee;

SELECT COUNT(*)
FROM employee;

CREATE TABLE employee_company
(
    id         SERIAL PRIMARY KEY,
    --id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name  VARCHAR(128) NOT NULL,
    company_id INT REFERENCES company (id),
    salary     INT,
    UNIQUE (first_name, last_name)
-- FOREIGN KEY (company_id) REFERENCES company (id)
);

DROP TABLE employee_company;

INSERT INTO employee_company(first_name, last_name, salary)
VALUES ('Ivan', 'Ivanov', 1000),
       ('Petr', 'Petrov', 2000),
       ('Sveta', 'Svetikova', 1500),
       ('Oleg', 'Chumin', 6000),
       ('Irina', 'Gromik', 8000),
       ('Arsenii', 'Chumin', 4000);

UPDATE employee_company
SET salary = NULL
WHERE id = 2;

SELECT last_name, salary
FROM employee_company
ORDER BY salary DESC;

UPDATE employee_company
SET company_id = 1
WHERE id = 2;

UPDATE employee_company
SET company_id = 2
WHERE id = 3;

UPDATE employee_company
SET company_id = 3
WHERE id = 2;

UPDATE employee_company
SET company_id = 1
WHERE id = 3;

UPDATE employee_company
SET company_id = 1
WHERE id = 6;

SELECT id, first_name, last_name, salary, company_id
FROM employee_company
ORDER BY id;

SELECT first_name
FROM employee_company
WHERE company_id IS NOT NULL
UNION ALL
SELECT first_name
FROM employee_company
WHERE salary IS NULL;

SELECT first_name
FROM employee_company
WHERE company_id IS NOT NULL
UNION
SELECT first_name
FROM employee_company
WHERE salary IS NULL;

SELECT *
FROM employee_company;

CREATE TABLE fine
(
    fine_id        SERIAL PRIMARY KEY,
    name           VARCHAR(30),
    number_plate   VARCHAR(6),
    violation      VARCHAR(50),
    sum_fine       DECIMAL(8, 2),
    date_violation DATE,
    date_payment   DATE
);

DROP TABLE fine;

CREATE TABLE fine
(
    fine_id        BIGSERIAL PRIMARY KEY,
    --fine_id INT PRIMARY KEY AUTO_INCREMENT,
    name           VARCHAR(30),
    number_plate   VARCHAR(6),
    violation      VARCHAR(50),
    sum_fine       DECIMAL(8, 2),
    date_violation DATE,
    date_payment   DATE
);

DROP TABLE fine;

CREATE TABLE fine
(
    fine_id        BIGSERIAL PRIMARY KEY,
    name           VARCHAR(30),
    number_plate   VARCHAR(6),
    violation      VARCHAR(50),
    sum_fine       DECIMAL(8, 2),
    date_violation DATE,
    date_payment   DATE
);

INSERT INTO fine (name, number_plate, violation, sum_fine, date_violation, date_payment)
VALUES ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', 500.00, '2020-01-12', '2020-01-17'),
       ('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', 500.00, '2020-01-12', '2020-01-17'),
       ('Яковлев Г.Р.', 'Т330ТТ', 'Превышение скорости(от 20 до 40)', 500.00, '2020-01-12', '2020-01-17');;


INSERT INTO fine (name, number_plate, violation, date_violation)
VALUES ('Яковлев Г.Р.', 'Т330ТТ', 'Превышение скорости(от 20 до 40)', '2020-01-12'),
       ('Колесов С.П.', 'К892АХ', 'Превышение скорости(от 20 до 40)', '2020-02-01'),
       ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', '2020-02-14'),
       ('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', '2020-02-23'),
       ('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', '2020-03-03');

CREATE TABLE traffic_violation
(
    violation_id SERIAL PRIMARY KEY,
    violation    VARCHAR(50),
    sum_fine     DECIMAL(8, 2)
);

INSERT INTO traffic_violation(violation, sum_fine)
VALUES ('Превышение скорости(от 20 до 40)', 500.00),
       ('Превышение скорости(от 40 до 60)', 1000.00),
       ('Проезд на запрещающий сигнал', 1000.00);

UPDATE fine AS f
SET sum_fine = tv.sum_fine
    FROM traffic_violation AS tv
WHERE f.sum_fine IS NULL
  AND f.violation = tv.violation;

ROLLBACK;

BEGIN;

-- UPDATE fine AS f
-- SET f.sum_fine = (
--     SELECT tv.sum_fine
--     FROM traffic_violation AS tv
--     WHERE f.violation = tv.violation
-- )
-- WHERE f.sum_fine IS NULL;

SELECT name, number_plate, violation, COUNT(*)
FROM fine
GROUP BY name, number_plate, violation
ORDER BY 4 DESC;

SELECT name, number_plate, violation, COUNT(violation)
FROM fine
GROUP BY name, number_plate, violation
HAVING COUNT(violation) >= 2
ORDER BY 4 DESC;

UPDATE fine
SET number_plate = 'M701AA'
WHERE fine_id = 4;

SELECT *
FROM fine
ORDER BY fine_id;

SELECT name, number_plate, violation, COUNT(violation)
FROM fine
GROUP BY name, number_plate, violation
HAVING COUNT(violation) >= 2
ORDER BY 1, 2, 3;


SELECT name, number_plate, violation
FROM fine
GROUP BY name, number_plate, violation
HAVING COUNT(violation) >= 2
ORDER BY 1, 2, 3;

SELECT name, violation, COUNT(violation), date_payment
FROM fine
WHERE date_payment IS NULL AND
GROUP BY name, violation, date_payment;

SELECT avg(empl.salary)
FROM (SELECT *
      FROM employee
      ORDER BY salary
          LIMIT 2) empl;

SELECT avg(empl.salary)
FROM (SELECT *
      FROM employee_company
      ORDER BY salary
          LIMIT 2) empl;

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
    created_by BIGINT    NOT NULL REFERENCES admin_user,
    created_at TIMESTAMP NOT NULL
);

INSERT INTO admin_user (id, name, surname, email)
VALUES (1, 'John', 'Doe', 'john.doe@example.com'),
       (2, 'Alice', 'Johnson', 'alice.johnson@example.com'),
       (3, 'Robert', 'Smith', 'robert.smith@example.com');


INSERT INTO account (id, acc_number, created_by, created_at)
VALUES (1, 'ACC001', 1, '2023-06-01 12:00:00'),
       (2, 'ACC002', 1, '2023-06-02 10:30:00'),
       (3, 'ACC003', 2, '2023-06-03 15:45:00'),
       (4, 'ACC004', 2, '2023-06-03 16:00:00'),
       (5, 'ACC005', 1, '2023-06-04 09:20:00'),
       (6, 'ACC006', 3, '2023-06-05 14:10:00'),
       (7, 'ACC007', 3, '2023-06-05 14:15:00'),
       (8, 'ACC008', 1, '2023-06-06 11:00:00'),
       (9, 'ACC009', 2, '2023-06-07 13:45:00'),
       (10, 'ACC010', 1, '2023-06-08 17:30:00');

SELECT CONCAT(name, ' ', surname) AS full_name,
       email,
       COALESCE(account_count, 0) AS account_count,
       last_created_at
FROM admin_user
         LEFT JOIN
     (SELECT created_by,
             COUNT(*)        AS account_count,
             MAX(created_at) AS last_created_at
      FROM account
      GROUP BY created_by) AS account_info
     ON
             admin_user.id = account_info.created_by;

SELECT name, number_plate, violation, count(*)
FROM fine
GROUP BY name, number_plate, violation
HAVING COUNT(violation) >= 2
ORDER BY 1, 2, 3;



-- -- Создание временной таблицы с результатами подзапроса
-- CREATE TEMPORARY TABLE tmp_fine AS
-- SELECT name, number_plate, violation
-- FROM fine
-- GROUP BY name, number_plate, violation
-- HAVING COUNT(violation) >= 2;

BEGIN;

WITH query_in AS (
    SELECT name, number_plate, violation
    FROM fine
    GROUP BY name, number_plate, violation
    HAVING COUNT(violation) >= 2
)
UPDATE fine AS f1
SET sum_fine = f1.sum_fine * 2
    FROM query_in AS f2
WHERE f1.name = f2.name
  AND f1.number_plate = f2.number_plate
  AND f1.violation = f2.violation
  AND f1.date_payment IS NULL;

SELECT name,
       number_plate,
       violation,
       sum_fine,
       date_violation,
       date_payment
FROM fine
ORDER BY fine_id ASC;

ROLLBACK;

BEGIN;

UPDATE fine AS f1
    LEFT JOIN (
    SELECT name, number_plate, violation
    FROM fine
    GROUP BY name, number_plate, violation
    HAVING COUNT(violation) >= 2
    ) AS f2
ON f1.name = f2.name AND f1.number_plate = f2.number_plate AND f1.violation = f2.violation
    SET f1.sum_fine = f1.sum_fine * 2;

SELECT name,
       number_plate,
       violation,
       sum_fine,
       date_violation,
       date_payment
FROM fine
ORDER BY fine_id ASC;

ROLLBACK;
COMMIT;


DROP TABLE fine;

CREATE TABLE fine
(
    id             SERIAL PRIMARY KEY,
    name           TEXT    NOT NULL,
    number_plate   TEXT    NOT NULL,
    violation      TEXT    NOT NULL,
    sum_fine       NUMERIC NOT NULL,
    date_violation DATE    NOT NULL,
    date_payment   DATE
);

INSERT INTO fine (name, number_plate, violation, sum_fine, date_violation, date_payment)
VALUES ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', 500.00, '2020-01-12', '2020-01-17'),
       ('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', 500.00, '2020-01-12', '2020-01-17'),
       ('Яковлев Г.Р.', 'Т330ТТ', 'Превышение скорости(от 20 до 40)', 500.00, '2020-01-12', '2020-01-17'),
       ('Яковлев Г.Р.', 'M701AA', 'Превышение скорости(от 20 до 40)', 500.00, '2020-01-12', NULL),
       ('Колесов С.П.', 'К892АХ', 'Превышение скорости(от 20 до 40)', 500.00, '2020-02-01', NULL),
       ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', 1000.00, '2020-02-14', NULL),
       ('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', 1000.00, '2020-02-23', NULL),
       ('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', 1000.00, '2020-03-03', NULL);

