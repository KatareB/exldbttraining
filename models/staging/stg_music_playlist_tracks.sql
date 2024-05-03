with playlist_tracks as (
    select
        playlistid as playlist_id,
        trackid as track_id
    from {{ source('music', 'playlisttrack') }}
)

select * from playlist_tracks
