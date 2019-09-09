{-# LANGUAGE DeriveGeneric #-}

module Domain.Project where

import Database.HDBC.Query.TH
import GHC.Generics (Generic)

newtype Project = Project String deriving (Show, Read, Eq, Ord, Generic)
