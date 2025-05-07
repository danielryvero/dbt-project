with customers as (

     select * from {{ ref('stg_jaffle_shop__customers') }}

),

orders as ( 

    select * from {{ ref('stg_jaffle_shop__orders') }}

),

payments as ( 

    select *
    from {{ ref('fct_orders') }}

),

order_payments as (

    select 
        order_id,
        sum(amount) as amount
    from payments
    group by 1
),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by customer_id

),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce (order_payments.amount, 0) 
        as amount,

    from orders
    left join order_payments using (order_id)
)

select * from final