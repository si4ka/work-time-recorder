{-# LANGUAGE DeriveGeneric #-}

module Domain.Project where

import Database.HDBC.Query.TH

newtype Project = Project String deriving (Show, Read, Eq, Ord)

