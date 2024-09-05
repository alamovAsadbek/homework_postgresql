-- Birinchi database yaratib oldim yani postgres databaseni uzgartirmaslik uchun
CREATE DATABASE statistics_database;

-- Yangi table yasadim. Company table
CREATE TABLE IF NOT EXISTS company
(
    ID         BIGSERIAL PRIMARY KEY,
    NAME       VARCHAR(255) NOT NULL,
    CREATED_AT TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Company tablega malumot qo'shib oldim
INSERT INTO Company (name)
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
INSERT INTO Department (name, company_id)
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
