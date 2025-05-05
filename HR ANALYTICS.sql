select *from hr_employees;

/*Employee Attrition Breakdown*/
select attrition,count(*)as total_employee
from hr_employees
group by 1;

/*"Total Number of Employees by Gender"*/

select gender,count(*)Gender
from hr_employees
group by 1;

/*Marital Status */

SELECT 
    Maritalstatus,
    COUNT(*) AS married_employees
FROM hr_employees
WHERE Attrition = 'Yes'
GROUP BY 1
ORDER BY married_employees DESC;

/*Active Employees by Department*/

select
    department,
    count(attrition) as Active_Employees
from hr_employees
where attrition = 'No'
group by department;

/*Attrition Analysis by Job Role*/

select 
    jobrole, 
    count(*) as total_employees
from hr_employees
group by jobrole
order by total_employees desc;

/*Average Monthly Income by Job Role*/

select
jobrole,round(avg(monthlyincome),0)as average_salary
from hr_employees
group by jobrole
order by average_salary desc ;

/*Average Daily Rate by Department*/

select 
    department,
    round(avg(DailyRate),0) as AVG_Daily_Rate
from hr_employees
group by 1;

/*"Attrition Count by Department and Gender"*/

select 
    department,gender,
    count(attrition) as job_quit
from hr_employees
where attrition = 'Yes'
group by 1,2
order by 3 desc;

/*Attrition by Gender and Overtime Workload*/

select 
    OverTime,
    Gender,
    count(OverTime) AS Overtime_Count
from hr_employees
where Attrition = 'Yes'
group by OverTime, Gender
order by OverTime, Gender desc;

/*Employee Count, Attrition, and Average Salary by Job Level*/

SELECT 
    joblevel AS "Job Level",
    COUNT(*) AS "Total Employees",
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS AttritionCount
FROM hr_employees
GROUP BY joblevel
ORDER BY joblevel;

/*Gender-Based Attrition Overview by Education Specialization*/

select 
    educationfield,
    gender,
    sum(case when attrition = 'Yes' then 1 else 0 end) as job_quit,
    sum(case when attrition = 'No' then 1 else 0 end) as job_stayed
from hr_employees
group by educationfield, gender
order by job_quit desc;

/*Attrition Rate by Business Travel Frequency*/

select 
    BusinessTravel,
    count(*) as Total_Employees,
    sum(case  Attrition = 'Yes' then 1 else 0 end) as Attrition_Count,
    ROUND(sum(case when Attrition = 'Yes' then 1 else 0 end) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
from hr_employees
group by BusinessTravel 
order by 4 desc;

/*Impact of Environment Satisfaction on Employee Attrition*/

select 
    case EnvironmentSatisfaction
        when 1 then 'Low'
        when 2 then 'Medium'
        when 3 then 'High'
        when 4 then 'Very High'
    end as Satisfaction_Level,
    count(*) as Total_Employees,
    sum(case when Attrition = 'Yes' then 1 else 0 end) as Attrition_Count,
    ROUND(SUM(case when Attrition = 'Yes' then 1 else 0 end) * 100.0 / count(EnvironmentSatisfaction),) as Attrition_Rate_Percent
from hr_employees
group by EnvironmentSatisfaction
order by Attrition_Rate_Percent desc;

/*Attrition Rate by Job Satisfaction Level*/

select 
    case JobSatisfaction
        when 1 then 'Low'
        when 2 then 'Medium'
        when 3 then 'High'
        when 4 then 'Very High'
    end as Job_Satisfaction,
    count(*) as Total_Employees,
    sum(case when Attrition = 'Yes' then 1 else 0 end) as Attrition_Count,
    ROUND(sum(case when Attrition = 'Yes' then 1 else 0 end) * 100.0 / count(JobSatisfaction),2) as Attrition_Rate_Percent
from hr_employees
group by JobSatisfaction
order by Attrition_Rate_Percent desc;

/*Employee Retention by Work-Life Satisfaction*/

select 
    case WorkLifeBalance
        when 1 then 'Low'
        when 2 then 'Medium'
        when 3 then 'High'
        when 4 then 'Very High'
    end as Work_Life_Balance,
    count(*) AS Total_Employees,
    sum(case when Attrition = 'Yes' then 1 else 0 end) as Attrition_Count,
    round(sum(case when = Attrition = 'Yes' then 1 else 0 end) * 100.0 / count(WorkLifeBalance), 2) as Attrition_Rate_Percent
from hr_employees
group by WorkLifeBalance
order by Attrition_Rate_Percent desc;

/*Attrition Rate by Relationship Satisfaction Level*/

select 
    case relationshipsatisfaction
        when 1 then 'Low'
        when 2 then 'Medium'
        when 3 then 'High'
        when 4 then 'Very High'
    end as satisfaction_level,
    count(*) as total_employees,
    sum(case when attrition = 'Yes' then 1 else 0 end) as attrition_count,
    ROUND(sum(case when attrition = 'Yes' then 1 else 0 end) * 100.0 / count(*), 2) as attrition_rate_percent
from hr_employees
group by relationshipsatisfaction
order by attrition_rate_percent desc;
