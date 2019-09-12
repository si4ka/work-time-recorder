{-# LANGUAGE DeriveGeneric #-}

module Domain.Project where

import Database.HDBC.Query.TH
import Web.FormUrlEncoded (FromForm(..), parseUnique)
import GHC.Generics

data Project = Project {name :: String} deriving (Show, Read, Eq, Ord, Generic)
instance FromForm Project
