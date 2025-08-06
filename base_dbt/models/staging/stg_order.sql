with source as (
    select *
    from {{source('jaffle_shop','orders')}}
),

renamed as (
    select field
      into variable
      from table
     where condition
)