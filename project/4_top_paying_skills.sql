/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Scientist positions
- Focus on roles with specified salaries, regardless of location
- Group by location
- Why? It reveals how different skills impact salary levels for Data Scientist and
    helps identify the most finacially rewarding skills to acquire or improve
*/


WITH ranked_skills AS (
    SELECT 
        skills_dim.skills AS skills,
        job_postings_fact.job_location AS job_location,
        AVG(job_postings_fact.salary_year_avg) AS avg_salary,
        ROW_NUMBER() OVER(PARTITION BY job_postings_fact.job_location ORDER BY AVG(job_postings_fact.salary_year_avg) DESC) AS rn
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_postings_fact.job_title_short = 'Data Scientist' 
        AND job_postings_fact.salary_year_avg IS NOT NULL
        AND job_postings_fact.job_location IN ('Atlanta, GA', 'Anywhere')
    GROUP BY
        job_location,
        skills_dim.skills
)
SELECT 
    skills,
    job_location,
    ROUND(avg_salary, 0) AS salary_avg
FROM 
    ranked_skills
WHERE 
    rn <= 5
ORDER BY 
    job_location,
    avg_salary DESC;
