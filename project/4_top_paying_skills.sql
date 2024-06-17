/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Scientist positions
- Focus on roles with specified salaries, regardless of location
- WHy? It reveals how different skills impact salary levels for Data Scientist and
    helps identify the most finacially rewarding skills to acquire or improve

*/



SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS salary_avg
FROM
    job_postings_fact
INNER JOIN skills_job_dim
            ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
            ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Scientist' 
    AND salary_year_avg BETWEEN 120000 AND 150000
    AND job_location = 'Atlanta, GA'
    AND salary_year_avg is NOT NULL
GROUP BY
    skills
ORDER BY 
    salary_avg DESC
LIMIT 25
;


/*
[
  {
    "skills": "go",
    "salary_avg": "130500"
  },
  {
    "skills": "flow",
    "salary_avg": "130500"
  },
  {
    "skills": "bigquery",
    "salary_avg": "130500"
  },
  {
    "skills": "shell",
    "salary_avg": "130247"
  },
  {
    "skills": "mongodb",
    "salary_avg": "130247"
  },
  {
    "skills": "databricks",
    "salary_avg": "130247"
  },
  {
    "skills": "ibm cloud",
    "salary_avg": "129500"
  },
  {
    "skills": "c",
    "salary_avg": "129333"
  },
  {
    "skills": "github",
    "salary_avg": "128124"
  },
  {
    "skills": "numpy",
    "salary_avg": "127750"
  },
  {
    "skills": "nosql",
    "salary_avg": "127624"
  },
  {
    "skills": "excel",
    "salary_avg": "126353"
  },
  {
    "skills": "bash",
    "salary_avg": "126000"
  },
  {
    "skills": "sql",
    "salary_avg": "125973"
  },
  {
    "skills": "linux",
    "salary_avg": "125500"
  },
  {
    "skills": "oracle",
    "salary_avg": "125188"
  },
  {
    "skills": "pandas",
    "salary_avg": "125167"
  },
  {
    "skills": "azure",
    "salary_avg": "125124"
  },
  {
    "skills": "snowflake",
    "salary_avg": "125124"
  },
  {
    "skills": "kafka",
    "salary_avg": "125082"
  },
  {
    "skills": "hadoop",
    "salary_avg": "125041"
  },
  {
    "skills": "power bi",
    "salary_avg": "125000"
  },
  {
    "skills": "alteryx",
    "salary_avg": "125000"
  },
  {
    "skills": "c++",
    "salary_avg": "125000"
  },
  {
    "skills": "ggplot2",
    "salary_avg": "125000"
  }
]
*/