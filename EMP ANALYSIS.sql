create database EMP;
USE EMP;
RENAME TABLE `wa_fn-usec_-hr-employee-attrition` TO EMP1;
SELECT * FROM EMP1 LIMIT 100;
DESCRIBE EMP1;
DELETE FROM EMP1 WHERE Age IS NULL OR YearsWithCurrManager IS NULL ;
DESCRIBE EMP1;
ALTER TABLE EMP1
CHANGE`ï»¿Age` Age INT;
SELECT 
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Null_Age,
    SUM(CASE WHEN YearsWithCurrManager IS NULL THEN 1 ELSE 0 END) AS Null_YearsWithCurrManager,
    SUM(CASE WHEN YearsSinceLastPromotion IS NULL THEN 1 ELSE 0 END) AS Null_YearsSinceLastPromotion,
    SUM(CASE WHEN YearsInCurrentRole IS NULL THEN 1 ELSE 0 END) AS Null_YearsInCurrentRole,
    SUM(CASE WHEN YearsAtCompany IS NULL THEN 1 ELSE 0 END) AS Null_YearsAtCompany,
    SUM(CASE WHEN WorkLifeBalance IS NULL THEN 1 ELSE 0 END) AS Null_WorkLifeBalance,
    SUM(CASE WHEN TrainingTimesLastYear IS NULL THEN 1 ELSE 0 END) AS Null_TrainingTimesLastYear,
    SUM(CASE WHEN TotalWorkingYears IS NULL THEN 1 ELSE 0 END) AS Null_TotalWorkingYears,
    SUM(CASE WHEN StockOptionLevel IS NULL THEN 1 ELSE 0 END) AS Null_StockOptionLevel,
    SUM(CASE WHEN StandardHours IS NULL THEN 1 ELSE 0 END) AS Null_StandardHours,
    SUM(CASE WHEN RelationshipSatisfaction IS NULL THEN 1 ELSE 0 END) AS Null_RelationshipSatisfaction,
    SUM(CASE WHEN PerformanceRating IS NULL THEN 1 ELSE 0 END) AS Null_PerformanceRating,
    SUM(CASE WHEN PercentSalaryHike IS NULL THEN 1 ELSE 0 END) AS Null_PercentSalaryHike,
    SUM(CASE WHEN OverTime IS NULL THEN 1 ELSE 0 END) AS Null_OverTime,
    SUM(CASE WHEN Over18 IS NULL THEN 1 ELSE 0 END) AS Null_Over18,
    SUM(CASE WHEN NumCompaniesWorked IS NULL THEN 1 ELSE 0 END) AS Null_NumCompaniesWorked,
    SUM(CASE WHEN MonthlyRate IS NULL THEN 1 ELSE 0 END) AS Null_MonthlyRate,
    SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS Null_MonthlyIncome,
    SUM(CASE WHEN MaritalStatus IS NULL THEN 1 ELSE 0 END) AS Null_MaritalStatus,
    SUM(CASE WHEN JobSatisfaction IS NULL THEN 1 ELSE 0 END) AS Null_JobSatisfaction,
    SUM(CASE WHEN JobRole IS NULL THEN 1 ELSE 0 END) AS Null_JobRole,
    SUM(CASE WHEN JobLevel IS NULL THEN 1 ELSE 0 END) AS Null_JobLevel,
    SUM(CASE WHEN JobInvolvement IS NULL THEN 1 ELSE 0 END) AS Null_JobInvolvement,
    SUM(CASE WHEN HourlyRate IS NULL THEN 1 ELSE 0 END) AS Null_HourlyRate,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Null_Gender,
    SUM(CASE WHEN EnvironmentSatisfaction IS NULL THEN 1 ELSE 0 END) AS Null_EnvironmentSatisfaction,
    SUM(CASE WHEN EmployeeNumber IS NULL THEN 1 ELSE 0 END) AS Null_EmployeeNumber,
    SUM(CASE WHEN EducationField IS NULL THEN 1 ELSE 0 END) AS Null_EducationField,
    SUM(CASE WHEN Education IS NULL THEN 1 ELSE 0 END) AS Null_Education,
    SUM(CASE WHEN DistanceFromHome IS NULL THEN 1 ELSE 0 END) AS Null_DistanceFromHome,
    SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Null_Department,
    SUM(CASE WHEN DailyRate IS NULL THEN 1 ELSE 0 END) AS Null_DailyRate,
    SUM(CASE WHEN BusinessTravel IS NULL THEN 1 ELSE 0 END) AS Null_BusinessTravel,
    SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS Null_Attrition
FROM EMP1;
SELECT 
    EmployeeNumber, 
    COUNT(*) AS Count 
FROM 
    EMP1 
GROUP BY 
    EmployeeNumber 
HAVING 
    COUNT(*) > 1;
SELECT * 
FROM EMP1 
WHERE Age < 18 OR Age > 90;  -- Check for out-of-range ages
ALTER TABLE EMP1 
DROP COLUMN MaritalStatus;
SELECT 
    *,
    CASE 
        WHEN Age < 18 OR Age > 65 THEN 'Outlier' 
        ELSE 'Normal' 
    END AS Age_Status
FROM EMP1;
DESCRIBE EMP1;
SELECT DISTINCT Gender FROM EMP1;
SELECT 
    AVG(Age) AS avg_age,
    MIN(Age) AS min_age,
    MAX(Age) AS max_age,
    COUNT(*) AS total_records
FROM EMP1;
SELECT Age, COUNT(*) AS frequency
FROM EMP1
GROUP BY Age
ORDER BY Age;
SELECT JobRole, COUNT(*) AS count
FROM EMP1
GROUP BY JobRole;
ALTER TABLE EMP1
ADD Age_Group VARCHAR(10);
SELECT MonthlyIncome, COUNT(*) AS frequency
FROM EMP1
GROUP BY MonthlyIncome
ORDER BY MonthlyIncome;
SELECT DISTINCT JobRole FROM EMP1;
SELECT JobRole, COUNT(*) AS employee_count
FROM EMP1
GROUP BY JobRole;
SELECT 
    (SELECT COUNT(*) FROM EMP1 WHERE Attrition = 'Yes') * 100.0 / COUNT(*) AS attrition_rate
FROM EMP1;
SELECT 
    JobRole, 
    COUNT(*) AS attrition_count,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM EMP1 WHERE JobRole = EMP1.JobRole)) AS attrition_percentage
FROM EMP1
WHERE Attrition = 'Yes'
GROUP BY JobRole;
SELECT 
    Department, 
    COUNT(*) AS attrition_count
FROM EMP1
WHERE Attrition = 'Yes'
GROUP BY Department;
SELECT 
    JobRole, 
    AVG(JobSatisfaction) AS avg_job_satisfaction
FROM EMP1
GROUP BY JobRole;
SELECT 
    JobSatisfaction, 
    COUNT(*) AS attrition_count
FROM EMP1
WHERE Attrition = 'Yes'
GROUP BY JobSatisfaction;
SELECT 
    JobRole, 
    AVG(PerformanceRating) AS avg_performance_rating
FROM EMP1
GROUP BY JobRole;
SELECT 
    TrainingTimesLastYear, 
    AVG(JobSatisfaction) AS avg_job_satisfaction
FROM EMP1
GROUP BY TrainingTimesLastYear;
-- Employees with High Income and Low Job Satisfactio
SELECT *
FROM EMP1
WHERE MonthlyIncome > (SELECT AVG(MonthlyIncome) FROM EMP1) 
AND JobSatisfaction < 3;
-- Employees with Long Tenure and Attrition
SELECT *
FROM EMP1
WHERE YearsAtCompany > 5 
AND Attrition = 'Yes';
-- Summary Statistics by Gender
SELECT 
    Gender, 
    COUNT(*) AS count,
    AVG(MonthlyIncome) AS avg_monthly_income,
    AVG(JobSatisfaction) AS avg_job_satisfaction
FROM EMP1
GROUP BY Gender;

-- Summary Statistics by Education Field
SELECT 
    EducationField, 
    COUNT(*) AS count,
    AVG(MonthlyIncome) AS avg_monthly_income,
    AVG(PerformanceRating) AS avg_performance_rating
FROM EMP1
GROUP BY EducationField;
-- FINAL REPORT
SELECT 
    COUNT(*) AS total_employees,
    (SELECT COUNT(*) FROM EMP1 WHERE Attrition = 'Yes') AS total_attrition,
    (SELECT COUNT(*) FROM EMP1 WHERE Gender = 'Male') AS total_males,
    (SELECT COUNT(*) FROM EMP1 WHERE Gender = 'Female') AS total_females,
    AVG(MonthlyIncome) AS avg_monthly_income
FROM EMP1;
--  NUM OF EMPLYEE THEY WANT TO LEAVE
SELECT 
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS num_leavers,
    COUNT(*) AS total_employees,
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentage_leavers
FROM EMP1;




