with payments as (
    select *
    from {{ ref('stg_stripe__payments') }}
)
select
    order_id,
    sum(payment_amount) as total_amount
from
    payments
group by 
    order_id
having
    total_amount < 0
