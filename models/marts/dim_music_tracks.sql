with music_tracks as (
    select
        a.track_id,
        a.album_id,
        a.mediatype_id,
        a.genre_id,
        a.track_name,
        a.track_composer,
        a.album_name,
        a.artist_name,
        a.mediatype_name,
        a.genre_name,
        a.track_length_ms,
        a.track_length_seconds,
        a.track_length_mins,
        a.bytes,
        a.unit_price
    from {{ ref('int_tracks_joined_to_albums_artists_genre_mediatype') }} as a
)

select * from music_tracks
