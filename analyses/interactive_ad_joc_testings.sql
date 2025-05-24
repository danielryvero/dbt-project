select customer_id
from {{ ref('dim_customers') }}
group by customer_id having count(*)> 1