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

-- 3. Churn rate by income category
SELECT
    Income_Category,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*),
        2
    ) AS churn_rate_pct
FROM bank_churners
GROUP BY Income_Category
ORDER BY churn_rate_pct DESC;
