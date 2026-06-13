-- ─────────────────────────────────────────────
--  Smart Form Validation System — Database Setup
--  Run this in MySQL Workbench or phpMyAdmin
-- ─────────────────────────────────────────────

-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS smart_form_db;
USE smart_form_db;

-- Step 2: Users table
CREATE TABLE IF NOT EXISTS users (
  user_id       INT AUTO_INCREMENT PRIMARY KEY,
  name          VARCHAR(100)  NOT NULL,
  email         VARCHAR(150)  NOT NULL UNIQUE,
  mobile        CHAR(10)      NOT NULL,
  password_hash VARCHAR(255)  NOT NULL,
  dob           DATE          NOT NULL,
  gender        VARCHAR(20)   NOT NULL,
  address       TEXT          NOT NULL,
  created_at    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);

-- Step 3: Validation logs table
CREATE TABLE IF NOT EXISTS validation_logs (
  log_id        INT AUTO_INCREMENT PRIMARY KEY,
  user_id       INT           DEFAULT NULL,
  field_name    VARCHAR(50)   NOT NULL,
  error_type    VARCHAR(50)   NOT NULL,
  error_message TEXT,
  timestamp     TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
);

-- Step 4: Security logs table
CREATE TABLE IF NOT EXISTS security_logs (
  security_id   INT AUTO_INCREMENT PRIMARY KEY,
  threat_type   ENUM('SQL Injection','XSS Attack','Spam Input','Fake Email') NOT NULL,
  input_data    TEXT          NOT NULL,
  field_name    VARCHAR(50)   NOT NULL,
  action_taken  ENUM('Blocked','Flagged','Allowed') DEFAULT 'Blocked',
  ip_address    VARCHAR(45)   DEFAULT NULL,
  timestamp     TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);

-- Done! All tables created successfully.
SELECT 'Database setup complete!' AS Status;
