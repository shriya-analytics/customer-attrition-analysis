-- Credit Card Customer Attrition Analysis
-- Dataset: BankChurners.csv

-- 1. Understand churn vs inactivity
SELECT
    Attrition_Flag,
    AVG(Months_Inactive_12_mon) AS avg_inactive_months,
    COUNT(*) AS customers
FROM bank_churners
GROUP BY Attrition_Flag;

-- 2. Income category vs churn
SELECT
    Income_Category,
    Attrition_Flag,
    COUNT(*) AS customers
FROM bank_churners
GROUP BY Income_Category, Attrition_Flag
ORDER BY Income_Category;
