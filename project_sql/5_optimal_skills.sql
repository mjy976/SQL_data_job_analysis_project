/*
Question 5 : What are the most optimal skills for a Data Analyst?
*/


-- Top Demand Skills CTE :

WITH da_most_demand_skills AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills AS skill_name,
        COUNT(*) AS skill_count

    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND
        job_postings_fact.salary_year_avg is NOT NULL
        AND
        job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
)

-- Top Paying Skills CTE :

, da_most_paying_skills AS (
SELECT
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    ROUND(AVG(job_postings_fact.salary_year_avg)) AS avg_skill_salary

FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    job_postings_fact.salary_year_avg is NOT NULL
    AND
    job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
)

SELECT
    da_most_demand_skills.skill_id,
    da_most_demand_skills.skill_name,
    da_most_demand_skills.skill_count,
    da_most_paying_skills.avg_skill_salary
FROM
    da_most_demand_skills
INNER JOIN da_most_paying_skills ON da_most_demand_skills.skill_id = da_most_paying_skills.skill_id
WHERE
    da_most_demand_skills.skill_count>10
ORDER BY
    
    da_most_paying_skills.avg_skill_salary DESC,
    da_most_demand_skills.skill_count DESC
LIMIT
    25;



-- more concise way :
/*
SELECT
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    COUNT(skills_dim.skill_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg)) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
    AND
    job_postings_fact.job_work_from_home = TRUE
    AND
    job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_dim.skill_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT
    25;
*/