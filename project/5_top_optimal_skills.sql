/* 
Question: What are the most optimal skills to learn (aka in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Scientist roles
- Concentrates on remote positions with specified salaries
- Why? Target skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career developmentn in data scientist
*/


WITH ranked_skills AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        job_location,
        COUNT(skills_job_dim.job_id) AS demand_count,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary,
        ROW_NUMBER() OVER (PARTITION BY job_location ORDER BY ROUND(AVG(job_postings_fact.salary_year_avg), 0) DESC, COUNT(skills_job_dim.job_id) DESC) AS rank
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Scientist'
        AND job_location IN ('Anywhere', 'Atlanta, GA')
        AND job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id,
        skills_dim.skills,
        job_location
    HAVING
        COUNT(skills_job_dim.job_id) > 10
)
SELECT 
    skills,
    job_location,
    demand_count,
    avg_salary
FROM 
    ranked_skills
WHERE 
    rank <= 5;
