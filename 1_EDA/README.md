XX# Exploratory Data Analysis with SQL : Job Market Analysis

![Project Overview Text](../Images/1_1_Project1_EDA%20(1).png)

A sql project analyzing the data engineering job market using real world job posting data. It demonstrates my ability to ** writ production quality analytical SQL, design efficient querries, and turn business questions into data driven insight**.

## Executive Summary

- ##Project Scope:** Built **3 analytical querries** that anwer key questions about the data engineering job market insights.
- **Data Modeling:** Used **multi-table joins** across fact and dimentions table to extract insights.
- **Analytics:** Applied **aggregation, filtering and sorting** to find top skills by demand, salary and overall value.
-**Outcomes:** Delivered **actionable insights** on SQL/Python dominance, cloud trends and salary patterns.

If you only have a minute, review these:

1. [01_top demanded skills Query](1_EDA/01_top_demanded_skill.sql) - demand analysis with multi- table joins
2. [02_top_paying_skills.sql](1_EDA/02_top_paying_skills.sql) - salary analysis with aggregation

3. [03_optimal_skills.sql](./1_EDA/03_Most_optimal_skill.sql) - combined demand/salary optimization query


## Problem and Context

Job market analysts need to answer questions like:

- **Most in-demand:** *Which skills are most in-demand for data engineers?*
- **Highest Paid:** *Which skills command the highest salaries?*
- Best trade-off:** *What is the optimal skills set balancing demand and compensation?*

This project analyzes a **data warehouse** built using a star schema design. The warehouse consist of:

![Data Warehouse](../Images\1_2_Data_Warehouse.png)

--**Fact Table:**
- `Company_dim` - Company information linked to job postings.
- `skills_dim` - Skills catalog with skill names and types
-**Bridge Table:** `skill_job_dim` - Revolves the many-to-many relationship between job postings and skills.

By querrying across these interconnected tables, i extracted insights about skill demand, salary patterns, and optimal skillcombination for data enginerring roles.

## Tech Stack

- **Query Engine:** DuckDB for fast OLAP-style analtical queries
- **Language:** SQL (ANSI-style with analytical functions)
-**Data Model:** Star schema with fact +
dimension + bridge tables
- **Development:** VS Code for SQL editing + Terminal for DuckDB CLI
- **Version Control:** Git/HubSQL scripts

## Analysis Overview

### Query Structure
1. **[Top Demand Skills](./1_EDA/01_top_demanded_skill.sql)** - Identies the 10 most in-demand skills for remote data engineer position
2. **[Top Paying Skills](./1_EDA/02_top_paying_skills.sql)** - Analyzes the 25 highest paying skills with salary and demand metrics
3. **[Optimal Skills](./1_EDA/03_Most_optimal_skill.sql)** - Calculate an optimal score using natural log of demand combined with salary to identify the most valuable skills to learn

## Key Insights

- Core languages:SQL and Python each appear in ~29,000 job postings, making them the most in-demand skills.
- Cloud platforms: AWS and Azure are critical for modern data engineering roles-
- Infra and Tooling: Kubernetes, Docker, and Terraforms are associated with premium salaries
- Big data tools: Apache spark shows strong demand with competitive compensation

## SQL Skills demonstrated

### Query Design and Optimization

- **Complex Joins**: Multi-table `INNER JOIN` operations across `job_postings_fact`,
`skills_job_dim`, and `skills_dim`
- **Aggregations**: `COUNT()`, `MEDIAN()`, `ROUND()` for statistical analysis
- **Filtering**: Boolean logic with `WHERE` clauses and multiple conditions
(`job_title_short`, `job_work_from_home`, `salary_year_avg IS NOT NULL`)
- **Sorting and Limiting**: `ORDER BY` with `DESC` and `LIMIT` for top-N analysis

### Data Analysis Techniques

- **Grouping**: `GROUP BY` for categorical analysis by skill
- **Conditional Logi**: `CASE WHEN` statements for derived metrics
- **Mathematical Functions**: `LN()`for natural logrithm transformation to normalize demand metrics
- **Calculated Metrics**: Derived optimal score combining log-transformed demand with median salary
- **HAVING Clause**: Filtering Aggregated results (skills with >= 100 postings)
- **NULL Handling**: Proper filtering of incomplete records(`salary_year_avg IS NOT NULL`)
