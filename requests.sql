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
