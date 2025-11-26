-- This script creats view rom two tables and assess the data based on income

-- Create Market Segementation based on income view


CREATE OR REPLACE VIEW mktsg_income AS
WITH bank_cust_ranked AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY cust_balance DESC) AS row_num,
        cust_age,
        cust_job,
        cust_education,
        cust_balance,
        cust_housing,
        cust_loan
    FROM crttbl_bank_cust
),
credit_risk_ranked AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY cr_amount DESC) AS row_num,
        cr_savings_balance,
        cr_employment_duration,
        cr_credit_history,
        cr_percent_of_income,
        cr_existing_loans_count,
        cr_dependents
    FROM crttbl_credit_risk
)
SELECT 
    bc.row_num AS customer_id,
    bc.cust_age,
    bc.cust_job,
    bc.cust_education,
    bc.cust_balance,
    bc.cust_housing,
    bc.cust_loan,
    cr.cr_savings_balance,
    cr.cr_employment_duration,
    cr.cr_credit_history,
    cr.cr_percent_of_income,
    cr.cr_existing_loans_count,
    cr.cr_dependents
FROM bank_cust_ranked bc
JOIN credit_risk_ranked cr ON bc.row_num = cr.row_num
ORDER BY bc.cust_balance DESC;