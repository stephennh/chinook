### Active Record Query Interface Assignment

### Provide one or more Active Record queries that retrieve the requested data
### below each of the following questions:


# 1a) Find the genre with the name "Hip Hop/Rap".
    ActiveQuery:  Genre.where(name: "Hip Hop/Rap")
    PSQL: SELECT "genres".* FROM "genres" WHERE "genres"."name" = $1

# 1b) Count how many tracks belong to the "Hip Hop/Rap" genre
    ActiveQuery: Genre.where(name: "Hip Hop/Rap").count
    PSQL: SELECT COUNT(*) FROM "genres" WHERE "genres"."name" = $1

# 2) Find the total amount of time required to listen to all the tracks in the database.
    ActiveQuery: Track.sum(:milliseconds)
    PSQL: SELECT SUM("tracks"."milliseconds") FROM "tracks"

# 3a) Find the highest price of any track that has the media type "MPEG audio file".
    ActiveQuery: Track.where(media_type_id: "MPEG audio file").order(unit_price: :desc)
    PSQL: SELECT "tracks".* FROM "tracks" WHERE "tracks"."media_type_id" = $1 ORDER BY "tracks"."unit_price" DESC

# 3b) Find the name of the most expensive track that has the media type "MPEG audio file".
    ActiveQuery: Track.where(media_type_id: "MPEG audio file").maximum(:unit_price)
    PSQL: SELECT MAX("tracks"."unit_price") FROM "tracks" WHERE "tracks"."media_type_id" = $1

# 4) Find the 2 oldest artists.
    ActiveQuery: Track.where(composer: :desc).limit(2)
    PSQL: SELECT  "tracks".* FROM "tracks" WHERE "tracks"."composer" = $1 LIMIT $2

### Stretch Exercise (Active Record Query Interface)


# 1) Find all the albums whose titles start with B.
    ActiveQuery: Track.where("name ILIKE?", 'B%')
    PSQL: SELECT "tracks".* FROM "tracks" WHERE (name ILIKE'B%')
