with invoice_lines_joined_to_invoices as (
    select
        invoice_lineid,
        invoices.invoice_id,
        track_id,
        customer_id,
        invoice_date_est,
        billing_address,
        billing_city,
        billing_state,
        billing_country,
        billing_zipcode,
        quantity_purchased,
        invoice_lineitem_revenue_usd
    from {{ ref('stg_music_invoice_lines') }} as invoicelines
    inner join {{ ref('stg_music_invoices') }} as invoices
        on invoicelines.invoice_lineid = invoices.invoice_id
)

select * from invoice_lines_joined_to_invoices
