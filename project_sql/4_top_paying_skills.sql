/*
Question : What are the Top-Paying skills based on average salary for a Data Analyst
BONUS : also for remote jobs skills
*/


SELECT
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
    skill_name
ORDER BY
    avg_skill_salary DESC
LIMIT
    25;

/*
[
  {
    "skill_name": "pyspark",
    "avg_skill_salary": "208172"
  },
  {
    "skill_name": "bitbucket",
    "avg_skill_salary": "189155"
  },
  {
    "skill_name": "couchbase",
    "avg_skill_salary": "160515"
  },
  {
    "skill_name": "watson",
    "avg_skill_salary": "160515"
  },
  {
    "skill_name": "datarobot",
    "avg_skill_salary": "155486"
  },
  {
    "skill_name": "gitlab",
    "avg_skill_salary": "154500"
  },
  {
    "skill_name": "swift",
    "avg_skill_salary": "153750"
  },
  {
    "skill_name": "jupyter",
    "avg_skill_salary": "152777"
  },
  {
    "skill_name": "pandas",
    "avg_skill_salary": "151821"
  },
  {
    "skill_name": "elasticsearch",
    "avg_skill_salary": "145000"
  },
  {
    "skill_name": "golang",
    "avg_skill_salary": "145000"
  },
  {
    "skill_name": "numpy",
    "avg_skill_salary": "143513"
  },
  {
    "skill_name": "databricks",
    "avg_skill_salary": "141907"
  },
  {
    "skill_name": "linux",
    "avg_skill_salary": "136508"
  },
  {
    "skill_name": "kubernetes",
    "avg_skill_salary": "132500"
  },
  {
    "skill_name": "atlassian",
    "avg_skill_salary": "131162"
  },
  {
    "skill_name": "twilio",
    "avg_skill_salary": "127000"
  },
  {
    "skill_name": "airflow",
    "avg_skill_salary": "126103"
  },
  {
    "skill_name": "scikit-learn",
    "avg_skill_salary": "125781"
  },
  {
    "skill_name": "jenkins",
    "avg_skill_salary": "125436"
  },
  {
    "skill_name": "notion",
    "avg_skill_salary": "125000"
  },
  {
    "skill_name": "scala",
    "avg_skill_salary": "124903"
  },
  {
    "skill_name": "postgresql",
    "avg_skill_salary": "123879"
  },
  {
    "skill_name": "gcp",
    "avg_skill_salary": "122500"
  },
  {
    "skill_name": "microstrategy",
    "avg_skill_salary": "121619"
  }
]


There are some interesting trends and insights into the top-paying skills for data analysts. The salary range for the top 25 skills is quite large, from $121,619 to over $208,000, with the highest-paying skills leaning heavily towards big data and specific developer operations (DevOps) tools.

Big Data & Advanced Analytics Lead the Way
The top of the list is dominated by Big Data and Advanced Analytics skills. For example, the highest-paying skill, PySpark, is a powerful tool for large-scale data processing. Other skills like Databricks and DataRobot also command high salaries, suggesting that companies are willing to pay a premium for analysts who can work with massive datasets and implement machine learning models.

DevOps and Cloud Skills Are Highly Valued 
A significant portion of the top-paying skills are not traditional data analysis tools. Skills like Bitbucket, GitLab, Kubernetes, and Jenkins are all part of the DevOps ecosystem, which focuses on continuous integration and deployment. The presence of GCP (Google Cloud Platform) also highlights the importance of cloud computing knowledge. This shows that data analysts are increasingly expected to not only analyze data but also to manage the pipelines and infrastructure that handle it.

Core Programming Skills Remain Essential 
While the list includes many specialized tools, core programming and scientific computing libraries are still highly valued. The presence of pandas, NumPy, and Scikit-learn—all fundamental libraries in the Python data science ecosystem—confirms that a strong foundation in these tools is crucial for a high-paying career. Other general programming languages like Scala and Golang also made the list, which indicates that versatility is rewarded.

Niche & Foundational Tools Still Offer High Pay
Some of the other skills on the list are a mix of specific technologies and foundational tools. PostgreSQL, a robust relational database, and Elasticsearch, a search and analytics engine, show the value of database expertise. Unexpectedly, Notion and MicroStrategy are also on the list, suggesting that mastery of specific business intelligence and productivity platforms can also lead to high salaries in certain roles.

*/