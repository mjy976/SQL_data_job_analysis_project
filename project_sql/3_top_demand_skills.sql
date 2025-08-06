/*
Question : What are most demand skills for a Data Analyst in general?
Highlight : we get the top-5 skills for a data analyst
*/

SELECT
    skills_dim.skills AS skill_name,
    COUNT(*) AS skill_count

FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skill_name
ORDER BY
    skill_count DESC
LIMIT
    5;