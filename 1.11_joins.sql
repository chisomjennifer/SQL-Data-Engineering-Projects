SELECT 
    job_id,
    job_title_short,
    name as company_name,
    job_location
FROM job_postings_fact as jpf
left join company_dim as cd
    ON jpf.company_id = cd.company_id
LIMIT 10;

SELECT
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM job_postings_fact as jpf
LEFT JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
LIMIT 10;

select 
cd.name as company_name,
count(jpf.*) as posting_count
from job_postings_fact as jpf
LEFT JOIN company_dim AS cd
 ON jpf.company_id = cd.company_id
 where jpf.job_country = 'United States'
 GROUP BY cd.name
 Having count(jpf.job_id)> 3000
 ORDER BY posting_count DESC
 LIMIT 10;
 