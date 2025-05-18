{{
    config(
        materialized='incremental',
        unique_key='order_id',
        incremental_strategy='merge'
    )
}}

with

    customers as (
        select * from {{ ref('stg_jaffle_shop__customers') }}
    ),

   paid_orders as (
        select * from {{ ref('int_orders') }}
   ),

   employees as (
    select * from {{ ref('employees') }}
   ),

    final as (
        select

            paid_orders.order_id,
            paid_orders.customer_id,
            employees.email,
            employees.employee_id,
            paid_orders.order_placed_at,
            paid_orders.order_status,
            paid_orders.total_amount_paid,
            paid_orders.payment_finalized_date,
            customers.givenname as customer_first_name,
            customers.surname as customer_last_name,

            --sales transaction sequence
            row_number() over (order by paid_orders.order_id) as transaction_seq,

            --customer sales sequence
            row_number() over (partition by paid_orders.customer_id order by paid_orders.order_id) 
            as customer_sales_seq,
            
            --new vs returning customer
            case 
                when (
                    rank() over (
                        partition by paid_orders.customer_id
                        order by paid_orders.order_placed_at, paid_orders.order_id
                    ) = 1
                ) then 'new'
            else 'return' end as nvsr,

            --customer lifetime value
            sum(paid_orders.total_amount_paid) over (
                partition by paid_orders.customer_id
                order by paid_orders.order_placed_at
            ) as customer_lifetime_value,

            --first day of sale
            first_value(paid_orders.order_placed_at) over (
                partition by paid_orders.customer_id
                order by paid_orders.order_placed_at
            ) as fdos

        from paid_orders
        left join customers
            on customers.customer_id = paid_orders.customer_id
        left join employees 
            on customers.customer_id = employees.customer_id
    )

select * from final
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where order_placed_at >= (select max(order_placed_at) from {{ this }}) 
{% endif %}
