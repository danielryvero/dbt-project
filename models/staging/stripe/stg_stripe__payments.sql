select 
    L_ORDERKEY as order_id,
    L_SUPPKEY as supplier_id,
    L_QUANTITY as quantity,    
    L_EXTENDEDPRICE as amount
from {{ source('stripe', 'payments') }}