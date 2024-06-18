/* 
Question: What are the most in-demand skills for Data Scientist?
- Join job postings to inner join table similair to query 2
- Identify top 5 in-demand skills for data scientist.
- Focus on all job postings.
- Group by location 
- Why? Retrieves the top 5 skills with the highest demand in the job market,
    providing insights into the most valuable skills for job seekers.
*/


WITH ranked_skills AS (
    SELECT 
        skills_dim.skills AS skills,
        job_postings_fact.job_location AS job_location,
        COUNT(skills_job_dim.*) AS demand_count,
        ROW_NUMBER() OVER(PARTITION BY job_postings_fact.job_location ORDER BY COUNT(skills_job_dim.*) DESC) AS rn
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_postings_fact.job_title_short = 'Data Scientist' 
        AND job_postings_fact.job_location IN ('Atlanta, GA', 'Anywhere')
    GROUP BY
        job_location,
        skills_dim.skills
)
SELECT 
    skills,
    job_location,
    demand_count
FROM 
    ranked_skills
WHERE 
    rn <= 5
ORDER BY 
    job_location,
    demand_count DESC;

