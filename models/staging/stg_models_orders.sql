select 
    O_ORDERKEY as order_id,
    O_CUSTKEY as customer_id,
    O_TOTALPRICE as price,
    O_ORDERDATE as orderdate
from ANALYTICS.DBT_DRJIMENEZ.orders