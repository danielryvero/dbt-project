{{ config(materialized='table') }}

with customers as (

    select *
    from ANALYTICS.DBT_DRJIMENEZ.CUSTOMER_SAMPLE

)

select *
from customers