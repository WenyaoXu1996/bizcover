/*  This is a model config block. With it, you can create model specific configurations and override the configurations set on the dbt_project.yml. 
*/
{{ config(
    materialized="table"
) }}

/* This is a dbt model  which means that it fits 2 requirements:
- Is a select statement
- Defined in a .sql file under the models directory
When you run the dbt model, dbt will wrap the correct DDL and DML to create the object in Snowflake. This allows users to
focus on writing the SQL without worry about the create statement. 
Full documention: https://docs.getdbt.com/docs/building-a-dbt-project/building-models
*/
with src as (

    select * from {{ source('bizcover_landing', 'BIRD_STRIKES_LANDING') }}

)
select 
    *
from src