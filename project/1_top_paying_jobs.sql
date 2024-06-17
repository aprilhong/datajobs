/* Question: What are the top paying Data Scientist r jobs?
- Identify the top 10 highest-paying Data Scientist roles that are available remotely
- Focus on job postings with specific salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Scientist, offering insights into skills and roles to pursure
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name
FROM 
    job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND
    --salary_year_avg is NOT NULL AND
    --job_location = 'Anywhere' OR
    job_location = 'Atlanta, GA' AND
    salary_year_avg BETWEEN 120000 AND 150000
ORDER BY 
    salary_year_avg DESC
;

