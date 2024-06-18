/* Question: What are the top 10 paying Data Scientist jobs?
- Identify the Data Scientist roles available in Atlanta, GA and remotely
- Focus on job postings with specified salaries (not nill)
- Why? Highlight the top-paying opportunities for Data Scientist, 
  offering insights into skills and roles to pursure
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
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_location IN ('Atlanta, GA','Anywhere')
ORDER BY 
    salary_year_avg DESC
LIMIT 10;


/*

*/