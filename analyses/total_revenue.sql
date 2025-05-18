with 

payments as (
    select * from {{ ref('stg_stripe__payments') }}
),

total_revenue as (
    select 
        payment_id, 
        sum(payment_amount) as total_amount
    from payments
    where payment_status = 'success'
    group by payment_id
)

select *
from total_revenue