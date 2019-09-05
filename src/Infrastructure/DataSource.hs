module Infrastructure.DataSource where

import Database.HDBC.PostgreSQL (Connection, connectPostgreSQL)
import Database.HDBC.Schema.PostgreSQL (driverPostgreSQL)

connect :: IO Connection
connect = connectPostgreSQL $
    "host=localhost"
    ++ " port=5432"
    ++ " user=wtr-user"
    ++ " dbname=wtr"
    ++ " password=abcdefg"
    ++ " sslmode=disable"
