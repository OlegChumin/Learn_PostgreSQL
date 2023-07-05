-- CREATE DATABASE company_repository;
-- CREATE SCHEMA company_storage;
-- DROP SCHEMA company_storage;
CREATE TABLE company_storage.company
(
    id   INT PRIMARY KEY,
    name VARCHAR(128) UNIQUE NOT NULL,
    date DATE NOT NULL CHECK ( date > '1995-01-01' AND date < '2020-01-01' )
-- PRIMARY KEY (id)
-- UNIQUE (name, date)
);

-- DROP TABLE public.company;
-- DROP TABLE company_storage.company;

INSERT INTO company(id, name, date)
VALUES (1, 'Google', '2001-01-01'),
       (2, 'Apple', '2002-10-29'),
       (3, 'Facebook', '1998-09-13');

       -- CREATE DATABASE company_repository;
       -- CREATE SCHEMA company_storage;
       -- DROP SCHEMA company_storage;
       CREATE TABLE company_storage.company
       (
           id   INT PRIMARY KEY,
           name VARCHAR(128) UNIQUE NOT NULL,
           date DATE                NOT NULL CHECK ( date > '1995-01-01' AND date < '2020-01-01' )
       -- PRIMARY KEY (id) == UNIQUE NOT NULL
       -- UNIQUE (name, date)
       );

       -- DROP TABLE public.company;
       -- DROP TABLE company_storage.company;

       INSERT INTO company(id, name, date)
       VALUES (1, 'Google', '2001-01-01'),
              (2, 'Apple', '2002-10-29'),
              (3, 'Facebook', '1998-09-13');

       --DROP TABLE public.company

       CREATE TABLE employee
       (
           id         INT PRIMARY KEY,
           first_name VARCHAR(128) NOT NULL,
           last_name  VARCHAR(128) NOT NULL,
           salary     INT

       );

       INSERT INTO employee(id, first_name, last_name, salary)
       VALUES (1, 'Ivan', 'Ivanov', 1000),
              (2, 'Petr', 'Petrov', 2000),
              (3, 'Sveta', 'Svetikova', 1500);

       DROP TABLE employee;

       CREATE TABLE employee
       (
           id         SERIAL PRIMARY KEY,
           first_name VARCHAR(128) NOT NULL,
           last_name  VARCHAR(128) NOT NULL,
           salary     INT
       );

       INSERT INTO employee(first_name, last_name, salary)
       VALUES ('Ivan', 'Ivanov', 1000),
              ('Petr', 'Petrov', 2000),
              ('Sveta', 'Svetikova', 1500);

       INSERT INTO employee(first_name, last_name, salary)
       VALUES ('Oleg', 'Chumin', 6000),
              ('Irina', 'Gromik', 8000),
              ('Arsenii', 'Chumin', 4000);

       DROP TABLE employee;

       CREATE TABLE employee
       (
           id         SERIAL PRIMARY KEY,
           first_name VARCHAR(128) NOT NULL,
           last_name  VARCHAR(128) NOT NULL,
           salary     INT,
           UNIQUE (first_name, last_name)
           --UNIQUE (last_name, first_name) another primary key

       );

       INSERT INTO employee(first_name, last_name, salary)
       VALUES ('Ivan', 'Ivanov', 1000),
              ('Petr', 'Petrov', 2000),
              ('Sveta', 'Svetikova', 1500);

       INSERT INTO employee(first_name, last_name, salary)
       VALUES ('Oleg', 'Chumin', 6000),
              ('Irina', 'Gromik', 8000),
              ('Arsenii', 'Chumin', 4000);
       --DDL data definition language CREATE DROP ALTER


       --DML data manipulation language
       SELECT id, first_name, last_name, salary
       FROM employee;

       SELECT id, last_name
       FROM employee;

       SELECT id,
              first_name Имя,
              last_name Фамилия,
              salary Зарплата
       FROM employee;

       SELECT id,
              first_name Имя,
              last_name Фамилия,
              salary Зарплата
       FROM employee Employees;