{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell       #-}

module Infrastructure.Table.Project where

import Database.HDBC.Query.TH (defineTableFromDB)
import Infrastructure.DataSource (connect)
import Database.HDBC.Schema.PostgreSQL (driverPostgreSQL)
import GHC.Generics (Generic)

$(defineTableFromDB
    connect
    driverPostgreSQL
    "Project"
    "project"
    [''Show, ''Generic])

