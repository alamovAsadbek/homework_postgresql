-- Birinchi database yaratib oldim yani postgres databaseni uzgartirmaslik uchun
-- CREATE DATABASE statistics_database;

-- Yangi table yasadim. Company table
CREATE TABLE IF NOT EXISTS company
(
    ID         BIGSERIAL PRIMARY KEY,
    NAME       VARCHAR(255) NOT NULL,
    CREATED_AT TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Company tablega malumot qo'shib oldim
INSERT INTO company (name)
VALUES ('Tech Innovators Inc.'),
       ('Global Financial Services Ltd.'),
       ('Wellness Solutions LLC'),
       ('SuperMart'),
       ('EduTech Systems'),
       ('Fast Transport Co.'),
       ('Prime Properties'),
       ('Green Energy Solutions'),
       ('Precision Manufacturing Corp.'),
       ('Creative Media Group');

-- Department table yaratib oldim
CREATE TABLE IF NOT EXISTS department
(
    ID         BIGSERIAL PRIMARY KEY,
    NAME       VARCHAR(255) NOT NULL,
    COMPANY_ID BIGINT       NOT NULL REFERENCES company (ID),
    CREATED_AT TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Department tableni malumot bilan to'ldirib oldim
INSERT INTO department (name, company_id)
VALUES ('Human Resources', 1),
       ('Finance', 1),
       ('Engineering', 2),
       ('Marketing', 2),
       ('Sales', 3),
       ('Customer Support', 3),
       ('Research and Development', 4),
       ('IT', 4),
       ('Legal', 5),
       ('Logistics', 5);


-- Employee table yasab oldim
CREATE TABLE IF NOT EXISTS employee
(
    ID            BIGSERIAL PRIMARY KEY,
    FULL_NAME     VARCHAR(255) NOT NULL,
    DEPARTMENT_ID BIGINT REFERENCES department (ID),
    CREATED_AT    TIMESTAMP    NULL DEFAULT CURRENT_TIMESTAMP
);

-- Employee tableni malumot bilan to'ldirib oldim
INSERT INTO employee (full_name, department_id)
VALUES ('Alice Johnson', 1),
       ('Bob Smith', 2),
       ('Charlie Brown', 3),
       ('David Wilson', NULL),
       ('Emily Davis', 4),
       ('Frank Miller', NULL),
       ('Grace Lee', 5),
       ('Henry Moore', 1),
       ('Ivy Clark', 2),
       ('Jack Taylor', NULL),
       ('Kathy Anderson', 3),
       ('Louis Thomas', NULL),
       ('Mia Harris', 4),
       ('Noah Martin', 5),
       ('Olivia White', 1);

-- Bunda man har bitta kompaniyda nechta xodim borligini aniqladim
SELECT c.name as NAME, COUNT(c.ID) as All_EMPLOYEES
FROM company c
         LEFT JOIN department d ON d.COMPANY_ID = c.ID
         LEFT JOIN employee e ON e.DEPARTMENT_ID = d.id
GROUP BY c.name;

-- Bu query orqali har bir kompaniyani nechta department i borligini aniqlasa buladi
SELECT c.name as NAME, COUNT(c.ID) as All_DEPARTMENTS
FROM company c
         LEFT JOIN department d ON d.COMPANY_ID = c.ID
GROUP BY c.name;

-- Bu query orqali har bir departmentda nechta xodim borligini aniqlaydi
SELECT c.name, d.name, COUNT(e.id)
FROM department d
    LEFT JOIN employee e on d.ID = e.DEPARTMENT_ID
    LEFT JOIN company c on d.company_id=c.ID
group by c.name, d.name ORDER BY count(*) desc ;


-- Bu query orqali xodimsiz departamentlarni kurish mumkin
SELECT c.name, d.name, COUNT(*)
FROM department d
LEFT JOIN employee e on e.DEPARTMENT_ID IS NULL
LEFT JOIN company c on d.company_id=c.ID
group by c.name, d.name;

