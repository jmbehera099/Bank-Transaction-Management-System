-- create_tables.sql
-- Table: CUSTOMERS
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100) NOT NULL,
    dob DATE,
    address VARCHAR2(200)
);

-- Table: ACCOUNTS
CREATE TABLE accounts (
    account_no NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    balance NUMBER(12,2) DEFAULT 0
);

-- Table: TRANSACTIONS
CREATE TABLE transactions (
    txn_id NUMBER PRIMARY KEY,
    account_no NUMBER REFERENCES accounts(account_no),
    txn_type VARCHAR2(20),
    amount NUMBER(12,2),
    txn_date DATE DEFAULT SYSDATE
);

-- Table: ACCOUNT_LOG
CREATE TABLE account_log (
    log_id NUMBER PRIMARY KEY,
    account_no NUMBER,
    action VARCHAR2(20),
    log_date DATE DEFAULT SYSDATE
);

-- Sequences
CREATE SEQUENCE seq_customer START WITH 1;
CREATE SEQUENCE seq_account START WITH 1001;
CREATE SEQUENCE seq_txn START WITH 1;
CREATE SEQUENCE seq_log START WITH 1;
