-- This script creats view rom two tables and assess the data based on employment status

-- Create Market Segementation based on employment status view

CREATE OR REPLACE VIEW mktsg_employment AS
WITH bank_cust_ranked AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY cust_age) AS row_num,
        cust_age,
        cust_job,
        cust_balance,
        cust_housing,
        cust_loan
    FROM crttbl_bank_cust
),
credit_risk_ranked AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY cr_employment_duration DESC) AS row_num,
        cr_employment_duration,
        cr_months_loan_duration,
        cr_credit_history,
        cr_percent_of_income,
        cr_existing_loans_count,
        cr_purpose
    FROM crttbl_credit_risk
)
SELECT 
    bc.row_num AS customer_id,
    bc.cust_age,
    bc.cust_job,
    bc.cust_balance,
    bc.cust_housing,
    bc.cust_loan,
    cr.cr_employment_duration,
    cr.cr_months_loan_duration,
    cr.cr_credit_history,
    cr.cr_percent_of_income,
    cr.cr_existing_loans_count,
    cr.cr_purpose
FROM bank_cust_ranked bc
JOIN credit_risk_ranked cr ON bc.row_num = cr.row_num
ORDER BY cr.cr_employment_duration DESC, bc.cust_age;