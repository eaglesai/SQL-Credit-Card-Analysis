-- This script creats view rom two tables and assess the data based on risk

-- Create Market Segementation based on credit risk score view


CREATE OR REPLACE VIEW mktsg_credit_risk AS
WITH bank_cust_ranked AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY cust_age) AS row_num,
        cust_age,
        cust_job,
        cust_education,
        cust_default, -- default AS default_status_bank,
        cust_balance
    FROM crttbl_bank_cust
),
credit_risk_ranked AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY cr_age) AS row_num,
        cr_credit_history,
        cr_amount,
        cr_existing_loans_count,
        cr_default,-- AS default_status_credit,
        cr_percent_of_income,
        cr_months_loan_duration
    FROM crttbl_credit_risk
)
SELECT 
    bc.row_num AS customer_id,
    bc.cust_age,
    bc.cust_job,
    bc.cust_education,
    bc.cust_default, -- _status_bank,
    bc.cust_balance,
    cr.cr_credit_history,
    cr.cr_amount, -- credit_amount, --cr_amount,
    cr.CR_existing_loans_count, -- cr_existing_loans_count,
    cr.cr_default, --_status_credit,
    cr.cr_percent_of_income,
    cr.cr_months_loan_duration
FROM bank_cust_ranked bc
JOIN credit_risk_ranked cr ON bc.row_num = cr.row_num
ORDER BY cr.cr_default DESC, bc.cust_age;