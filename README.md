# SQL Practice Projects

Two small relational-database exercises using sample music and railway data.

## Projects

| Project | Main file | Concepts |
| --- | --- | --- |
| Music catalogue | [Spotify analysis SQL](Spotify%20Analysis%20SQL/spotify%20analysis%20SQL.txt) | Artists/songs tables, joins, popularity filtering, genre aggregation |
| Transport enquiry | [main.sql](Transport%20Equiry%20System/main.sql) | Passengers, routes, bookings, foreign keys, inner/left joins, counts |

The music example uses fictional artists and songs; it does not query the Spotify API.

## Run the examples

Use a disposable SQLite database. The transport script uses SQLite's `INTEGER PRIMARY KEY AUTOINCREMENT` syntax.

With the SQLite command-line tool installed, open a new database and run:

```sql
PRAGMA foreign_keys = ON;
.read "Transport Equiry System/main.sql"
```

For the music example, use a separate database:

```sql
PRAGMA foreign_keys = ON;
.read "Spotify Analysis SQL/spotify analysis SQL.txt"
```

Run commands from the repository root. The scripts create tables, insert sample records, and execute queries. Re-running inserts against the same populated database can create duplicates or primary-key errors.

## Additional material

The project folders contain original notes, an alternative transport script, and a music-query output image. Database syntax in alternative files should be checked before use with a different SQL engine.
