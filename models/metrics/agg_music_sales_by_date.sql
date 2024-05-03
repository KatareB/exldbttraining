with music_sales_by_date as (
    select
        cast(invoice_date_est as date) as invoice_date_est,
        sum(invoice_lineitem_revenue_usd) as sale
    from {{ ref('fct_music_sales') }}
    group by invoice_date_est
    order by cast(invoice_date_est as date) desc
)

select * from music_sales_by_date
