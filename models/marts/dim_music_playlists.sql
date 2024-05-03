with music_playlists as (
    select
        track_id,
        album_id,
        mediatype_id,
        genre_id,
        track_name,
        track_composer,
        album_name,
        artist_name,
        mediatype_name,
        genre_name,
        track_length_ms,
        track_length_seconds,
        track_length_mins,
        bytes,
        unit_price
    from {{ ref('int_tracks_joined_to_albums_artists_genre_mediatype') }}
)

select * from music_playlists
