-- models/intermediate/int_order_payment_summary.sql

with payments as (

    select * from {{ ref('stg_payments') }}

),

aggregated as (

    select
        order_id,
        sum(amount) as total_amount

    from payments
    group by 1

)

select * from aggregated
