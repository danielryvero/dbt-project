select 
    c_custkey as customer_id,
    c_name as first_name,
    c_address as address,
    c_phone as phone
from {{ source('jaffle_shop', 'customers') }}