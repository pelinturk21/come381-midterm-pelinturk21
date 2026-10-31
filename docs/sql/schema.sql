-- Spor Salonu Yönetim Sistemi (Gym Management System) - Veritabanı Şeması

CREATE TABLE memberships (
    membership_id SERIAL PRIMARY KEY,
    package_name VARCHAR(100) NOT NULL,
    duration_months INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE trainers (
    trainer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    join_date DATE DEFAULT CURRENT_DATE,
    membership_id INT,
    CONSTRAINT fk_membership
        FOREIGN KEY (membership_id) 
        REFERENCES memberships(membership_id)
        ON DELETE SET NULL
);

CREATE TABLE classes (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    schedule_time TIMESTAMP NOT NULL,
    trainer_id INT,
    CONSTRAINT fk_trainer
        FOREIGN KEY (trainer_id) 
        REFERENCES trainers(trainer_id)
        ON DELETE SET NULL
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    member_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE DEFAULT CURRENT_DATE,
    payment_method VARCHAR(50),
    CONSTRAINT fk_member_payment
        FOREIGN KEY (member_id) 
        REFERENCES members(member_id)
        ON DELETE CASCADE
);