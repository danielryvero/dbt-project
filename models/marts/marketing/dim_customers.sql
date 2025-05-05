with 
    customers as (

        select *
        from {{ ref('stg_jaffle_shop__customers.sql') }}
    ),
    
    orders as (
        select *
        from {{ ref('stg_jaffle_shop__orders.sql') }}
    ),

    customer_orders as (
        select *
        from customers c
            join orders o 
        on c.id = o.customer_id
    )

select *
from customer_orders