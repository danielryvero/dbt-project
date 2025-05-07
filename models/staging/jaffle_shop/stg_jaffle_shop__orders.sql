select 
    O_ORDERKEY as order_id,
    O_CUSTKEY as customer_id,
    O_ORDERDATE as order_date,    
    O_ORDERSTATUS as status
from {{ source('jaffle_shop', 'orders') }}