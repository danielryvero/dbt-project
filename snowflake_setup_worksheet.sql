//commands to initialize databases
create warehouse transforming;
create database raw;
create database analytics;
create schema raw.jaffle_shop;
create schema raw.stripe;

//create table customers:
create table raw.jaffle_shop.customers 
( id integer,
  first_name varchar,
  last_name varchar
);

//copy data into the table customers
copy into raw.jaffle_shop.customers (id, first_name, last_name)
from 's3://dbt-tutorial-public/jaffle_shop_customers.csv'
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    );

//create orders table
create table raw.jaffle_shop.orders
( id integer,
  user_id integer,
  order_date date,
  status varchar,
  _etl_loaded_at timestamp default current_timestamp);

//load data into orders
copy into raw.jaffle_shop.orders (id, user_id, order_date, status)
from 's3://dbt-tutorial-public/jaffle_shop_orders.csv'
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    );

//create payments table
create table raw.stripe.payment 
( id integer,
  orderid integer,
  paymentmethod varchar,
  status varchar,
  amount integer,
  created date,
  _batched_at timestamp default current_timestamp
);

//load data into payments table
copy into raw.stripe.payment (id, orderid, paymentmethod, status, amount, created)
from 's3://dbt-tutorial-public/stripe_payments.csv'
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    );

//verify data is in the tables
select * from raw.jaffle_shop.customers;
select * from raw.jaffle_shop.orders;
select * from raw.stripe.payment;


//setting up the role to operate in snowflake
create role transformer;
grant role transformer to user danielryvero;

//grant necessary privileges to the role
grant all on database raw to role transformer;
grant all on database analytics to role transformer;

grant all on schema raw.jaffle_shop to role transformer;
grant all on schema raw.stripe to role transformer;

grant all on all tables in database raw to role transformer;
grant all on future tables in database raw to role transformer;
