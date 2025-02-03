use hr_analytics;
select * from c;

#kpi1  Average Attrition rate for all Departments

select Department,avg(Attrition_number)*100 from (select Department,
case when Attrition = "Yes" then 1 else 0 end as Attrition_number From hr_data)as KPi1
group by Department;


#KPI 2  Average Hourly rate of Male Research Scientist

select avg(HourlyRate) from hr_data
group by jobRole,Gender having JobRole="Research Scientist" and Gender="Male";


#kpi3 Attrition rate Vs Monthly income stats

use hr_analytics;
select MonthlyIncomeState , Avg(Attrition_Rate)*100 as avg_attrition_rate from (
SELECT 
    CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END  AS Attrition_Rate,
    CASE 
        WHEN MonthlyIncome < 20000 THEN 'LOW'
        WHEN MonthlyIncome < 35000 THEN 'MID'
        ELSE 'HIGH'
    END AS MonthlyIncomestate
FROM hr_data  ) as KPI3
group by MonthlyIncomeState;

select* from hr_data;


#kpi4  Average working years for each Department

select Department,avg(TotalWorkingYears) from hr_data
group by Department ;




#kpi5 Job Role Vs Work life balance

select JobRole,avg(WorkLifeBalance) from hr_data
group by JobRole;



#kpi6  Attrition rate Vs Year since last promotion relation

SELECT YearsSinceLastPromotion, AVG(Attrition_number)*100 AS Avg_Attrition_rate
FROM (
    SELECT YearsSinceLastPromotion,
           CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END AS Attrition_number
    FROM hr_data
) AS subquery
GROUP BY YearsSinceLastPromotion
ORDER BY  Avg_Attrition_rate ;





