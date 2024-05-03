with generes as (
    select
        genreid as genre_id,
        name as genre_name
    from {{ source('music', 'genre') }}
)

select * from generes
