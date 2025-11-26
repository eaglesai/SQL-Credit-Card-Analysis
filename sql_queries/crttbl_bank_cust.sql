-- This script creats table for bank customer 

-- Create BANK_CUST table

CREATE TABLE crttbl_bank_cust (
    cust_age INT,
    cust_job VARCHAR(50),
    cust_marital VARCHAR(50),
    cust_education VARCHAR(50),
    cust_default VARCHAR(10),
    cust_balance DECIMAL(10,2),
    cust_housing VARCHAR(10),
    cust_loan VARCHAR(10),
    cust_contact VARCHAR(50),
    cust_day INT,
    cust_month VARCHAR(20),
    cust_duration INT,
    cust_campaign INT,
    cust_pdays INT,
    cust_previous INT,
    cust_poutcome VARCHAR(20),
    cust_acceptance VARCHAR(10)
);
