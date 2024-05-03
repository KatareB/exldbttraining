with music_sales as (
    select
        invoice_lineid,
        invoice_id,
        c.track_id,
        album_id,
        mediatype_id,
        genre_id,
        a.customer_id,
        employee_id,
        invoice_date_est,
        billing_state,
        billing_country,
        quantity_purchased,
        invoice_lineitem_revenue_usd,
        track_name,
        track_composer,
        album_name,
        artist_name,
        mediatype_name,
        genre_name,
        track_length_ms,
        track_length_seconds,
        track_length_mins
            as bytes,
        customer_mailing_state,
        customer_mailing_country,
        customer_email_address,
        employee_name,
        employee_title,
        employee_state,
        employee_country
    from {{ ref('int_customers_joined_to_employees') }} as a
    inner join {{ ref('int_invoice_lines_joined_to_invoices') }} as b
        on a.customer_id = b.customer_id
    inner join
        {{ ref('int_tracks_joined_to_albums_artists_genre_mediatype') }} as c
        on a.customer_id = c.album_id

)

select * from music_sales
