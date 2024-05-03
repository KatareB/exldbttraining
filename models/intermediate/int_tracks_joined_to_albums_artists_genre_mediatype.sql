with tracks_joined_to_albums_artists_genre_mediatype as (
    select
        tracks.track_id,
        album.album_id,
        media.mediatype_id,
        genres.genre_id,
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
    from {{ ref('stg_music_tracks') }} as tracks
    inner join {{ ref('stg_music_albums') }} as album
        on tracks.track_id = album.album_id
    inner join {{ ref('stg_music_genres') }} as genres
        on tracks.track_id = genres.genre_id
    inner join {{ ref('stg_music_artists') }} as artists
        on tracks.track_id = artists.artist_id
    inner join {{ ref('stg_music_media_types') }} as media
        on tracks.track_id = media.mediatype_id
)

select * from tracks_joined_to_albums_artists_genre_mediatype
