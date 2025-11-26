-- This script creats table for credit risk data of customers 

-- Create CREDIT RISK table

CREATE TABLE crttbl_credit_risk (
    CR_checking_balance VARCHAR(50),
    CR_months_loan_duration INT,
    CR_credit_history VARCHAR(50),
    CR_purpose VARCHAR(100),
    CR_amount DECIMAL(10,2),
    CR_savings_balance VARCHAR(50),
    CR_employment_duration VARCHAR(50),
    CR_percent_of_income INT,
    CR_years_at_residence INT,
    CR_age INT,
    CR_other_credit VARCHAR(50),
    CR_housing VARCHAR(50),
    CR_existing_loans_count INT,
    CR_job VARCHAR(50),
    CR_dependents INT,
    CR_phone VARCHAR(10),
    CR_default VARCHAR(10)
);