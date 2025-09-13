/*
Question: what are the most in-demand skills for data analyst?
-   join job to inner join table similar to query 2
-   identify top_5 in-demand skills for a data analyst
-   focus on all job postings
-   highlight the most sought-after skills for data analysts, providing insights into the current job market demands.
-    why? Retrieves the top 5 skills with the highest demand in the job market
-    by counting the occurrences of each skill in job postings.
-   providing insights into the most valuable skills for job market.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5