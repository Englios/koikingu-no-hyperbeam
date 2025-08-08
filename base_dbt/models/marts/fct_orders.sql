-- models/marts/fct_orders.sql

with orders as (

    select * from {{ ref('stg_orders') }}

),

order_payments as (

    select * from {{ ref('int_order_payment_summary') }}

),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.total_amount, 0) as amount

    from orders
    left join order_payments on orders.order_id = order_payments.order_id

)

select * from final
