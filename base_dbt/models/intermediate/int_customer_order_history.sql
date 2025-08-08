-- models/intermediate/int_customer_order_history.sql

with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

customer_orders as (

    select
        customers.customer_id,

        min(orders.order_date) as first_order_date,
        max(orders.order_date) as most_recent_order_date,
        count(orders.order_id) as number_of_orders

    from customers
    left join orders on customers.customer_id = orders.customer_id
    group by 1

)

select * from customer_orders
