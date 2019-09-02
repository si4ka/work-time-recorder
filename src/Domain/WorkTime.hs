{-# LANGUAGE DeriveGeneric #-}

module Domain.WorkTime where

data WorkTime = WorkTime
  {
    hour :: Int
    , minute :: Int
  }
  deriving (Show)