# Introduction


Check out the [SQL Queries](/project/)

# Background


Questions to Answer

1. What are the top-paying jobs for Data Scientist role in Atlanta, GA or remotely and between 120 and 140K salary?

2. What skills are required for these top paying roles?

3. What are the most in-demand skills for my role?

4. What are top skills based on the salary for my role?

5. What are the most optimal skills to learn
    - Optimal: High Demand and High Paying

# Tools Used

- **SQL**:
- **PostgresSQL**:
- **Visio Studio Code**:
- **Python**:
- **Git & Github**:


# The Analysis

### Top Paying Data Scientist Jobs

```sql
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
    -- salary_year_avg is NOT NULL AND
    -- job_location = 'Anywhere' OR
    job_location = 'Atlanta, GA' AND
    salary_year_avg BETWEEN 120000 AND 150000
ORDER BY 
    salary_year_avg DESC;
```

Findings:

### Top Paying Data Scientist Skills 

**Code:**

**Charts:**

**Findings:**

### Top Demanded Skills for Data Scientist

**Code:**

**Charts:**

**Findings:**


### Top Payings Skills for Data Scientist based on Salary

**Code:**

**Charts:**

**Findings:**


### Top in-demand skills with high average salaries for Data Scientist 

**Code:**

**Charts:**

| Skills | Demand Count | Average Salary | 
|---|---|---|
| Python | 88 | 141733 |
| SQL | 83 | 146342 |
| Tableau | 39 | 149127 |
| TensorFlow | 12 | 149333 |
| R | 53 | 127533 |
| Azure | 12 | 127565 |
| SAS | 25 | 112294 |
| C | 11 | 124675 |
| AWS | 18 | 123877 |
| Hadoop | 18 | 133236 |
| Excel | 20 | 131814 |
| Spark | 27 | 146087 |
| Scala | 16 | 143130 |



**Findings:**




# What I Learned


# Conclusion
- summarize insights/answer from each section

### Insights
- How to setup project portfolio using sql 
