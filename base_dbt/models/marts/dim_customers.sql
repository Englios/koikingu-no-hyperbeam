-- models/marts/dim_customers.sql

with customers as (

    select * from {{ ref('stg_customers') }}

),

order_history as (

    select * from {{ ref('int_customer_order_history') }}

),

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        order_history.first_order_date,
        order_history.most_recent_order_date,
        coalesce(order_history.number_of_orders, 0) as number_of_orders

    from customers
    left join order_history on customers.customer_id = order_history.customer_id

)

select * from final
