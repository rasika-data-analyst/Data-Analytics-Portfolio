-- Czechoslovakia Bank – Ad-hoc Data Analysis

-- Check available transaction years-- 

SELECT DISTINCT YEAR(`DATE`) AS TRANSACTION_YEAR
FROM TRANSACTIONS
ORDER BY TRANSACTION_YEAR;


-- Check missing bank values by year

SELECT 
    YEAR(`DATE`) AS TRANSACTION_YEAR,
    COUNT(*) AS MISSING_BANK_RECORDS
FROM TRANSACTIONS
WHERE BANK = '' OR BANK IS NULL
GROUP BY YEAR(`DATE`)
ORDER BY TRANSACTION_YEAR;


-- Update missing bank values
-- Based on your assumptions:

-- 2016 → Sky Bank
-- 2017 → DBS Bank
-- 2018 → Northern Bank
-- 2019 → Southern Bank
-- 2020 → Sky Bank
-- 2021 → Yes Bank


SET SQL_SAFE_UPDATES = 0;

UPDATE TRANSACTIONS
SET BANK = CASE
    WHEN YEAR(`DATE`) = 2016 THEN 'Sky Bank'
    WHEN YEAR(`DATE`) = 2017 THEN 'DBS Bank'
    WHEN YEAR(`DATE`) = 2018 THEN 'Northern Bank'
    WHEN YEAR(`DATE`) = 2019 THEN 'Southern Bank'
    WHEN YEAR(`DATE`) = 2020 THEN 'Sky Bank'
    WHEN YEAR(`DATE`) = 2021 THEN 'Yes Bank'
END
WHERE BANK = '' OR BANK IS NULL;


-- Feature Engineering
-- Calculate Client Age
-- Your current query works, but TIMESTAMPDIFF() is more accurate than dividing days by 365.

-- ALTER TABLE client 
-- ADD COLUMN age INT;

-- UPDATE client 
-- SET age = FLOOR(DATEDIFF(CURDATE(), Birth_date) / 365);


--  What is the demographic profile of the bank's clients and how does it vary across 
-- districts? 
- CREATE TABLE czec_demographic_data_kpi AS
-- SELECT
--     D.DISTRICT_NAME,
--     D.AVERAGE_SALARY,
--     SUM(CASE WHEN SEX = 'Male' THEN 1 ELSE 0 END) AS MALE_CLIENT,
--     SUM(CASE WHEN SEX = 'Female' THEN 1 ELSE 0 END) AS FEMALE_CLIENT,
--     COUNT(DISTINCT CLIENT_ID) AS TOTAL_CLIENT,
--     ROUND((SUM(CASE WHEN SEX = 'Female' THEN 1 ELSE 0 END) / 
--            SUM(CASE WHEN SEX = 'Male' THEN 1 ELSE 0 END)) * 100, 2) 
--            AS MALE_FEMALE_RATIO_PERC
-- FROM CLIENT C
-- INNER JOIN DISTRICT D ON C.DISTRICT_ID = D.DISTRICT_CODE
-- GROUP BY D.DISTRICT_NAME, D.AVERAGE_SALARY;  

-- select * from czec_demographic_data_kpi;


-- use bank;
-- select count(*) from czec_demographic_data_kpi;


-- -- Q.2
-- # for every account_id each month last transction date
-- SELECT ACCOUNT_ID, YEAR(DATE) AS TXN_YEAR,
-- MONTH(DATE) AS TXN_MONTH,
-- MAX(DATE) AS LATEST_TXN_DATE
-- FROM TRANSACTIONS
-- GROUP BY 1,2,3
-- ORDER BY 1,2,3;

-- select * from TRANSACTIONS;


-- CREATE TABLE ACC_LATEST_TXNS_WITH_BALANCE AS
-- SELECT LTD.*,TXN.BALANCE
-- FROM TRANSACTIONS AS TXN
-- INNER JOIN
-- (
--   SELECT ACCOUNT_ID,YEAR(DATE) AS TXN_YEAR,
--   MONTH(DATE) AS TXN_MONTH,
--   MAX(DATE) AS LATEST_TXN_DATE
--   FROM TRANSACTIONS
--   GROUP BY 1,2,3
--   ORDER BY 1,2,3
-- ) AS LTD ON TXN.ACCOUNT_ID = LTD.ACCOUNT_ID AND TXN.DATE = LTD.LATEST_TXN_DATE
-- WHERE TXN.TYPE = 'Credit' -- this is the assumptions am having : month end txn data is credit
-- ORDER BY TXN.ACCOUNT_ID,LTD.TXN_YEAR,LTD.TXN_MONTH;

-- SELECT * FROM ACC_LATEST_TXNS_WITH_BALANCE;	





-- How the banks have performed over the years. Give their detailed analysis year & 
-- month-wise. 
-- CREATE TABLE BANKING_KPI AS
-- SELECT
--     ALWB.TXN_YEAR,
--     ALWB.TXN_MONTH,
--     T.BANK,
--     A.ACCOUNT_TYPE,
--     COUNT(DISTINCT ALWB.ACCOUNT_ID) AS TOT_ACCOUNT,
--     COUNT(DISTINCT T.TRANS_ID) AS TOT_TXNS,
--     SUM(CASE WHEN T.TYPE = 'Credit' THEN 1 ELSE 0 END) AS DEPOSIT_COUNT,
--     SUM(CASE WHEN T.TYPE = 'Withdrawal' THEN 1 ELSE 0 END) AS WITHDRAWAL_COUNT,
--     SUM(ALWB.BALANCE) AS TOT_BALANCE,
--     ROUND((SUM(CASE WHEN T.TYPE = 'Credit' THEN 1 ELSE 0 END) / COUNT(DISTINCT T.TRANS_ID)) * 100, 2) AS DEPOSIT_PCT,
--     ROUND((SUM(CASE WHEN T.TYPE = 'Withdrawal' THEN 1 ELSE 0 END) / COUNT(DISTINCT T.TRANS_ID)) * 100, 2) AS WITHDRAWAL_PCT,
--     IFNULL(SUM(ALWB.BALANCE) / COUNT(DISTINCT ALWB.ACCOUNT_ID), 0) AS AVG_BALANCE,
--     ROUND(COUNT(DISTINCT T.TRANS_ID) / COUNT(DISTINCT ALWB.ACCOUNT_ID), 0) AS TPA
-- FROM
--     TRANSACTIONS AS T
-- INNER JOIN
--     ACC_LATEST_TXNS_WITH_BALANCE AS ALWB ON T.ACCOUNT_ID = ALWB.ACCOUNT_ID
-- LEFT OUTER JOIN
--     ACCOUNT AS A ON T.ACCOUNT_ID = A.ACCOUNT_ID
-- GROUP BY
--     ALWB.TXN_YEAR, ALWB.TXN_MONTH, T.BANK, A.ACCOUNT_TYPE
-- ORDER BY
--     ALWB.TXN_YEAR, ALWB.TXN_MONTH, T.BANK, A.ACCOUNT_TYPE;



