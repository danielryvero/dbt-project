with 
    customers as (

        select *
        from {{ ref('stg_models_customers') }}
    ),
    
    orders as (
        select *
        from {{ ref('stg_models_orders') }}
    ),

    customer_orders as (
        select *
        from customers c
            join orders o 
        on c.id = o.customer_id
    )

select *
from customer_orders