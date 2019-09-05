{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell       #-}

module Infrastructure.Query.ProjectQuery where

import Database.Relational
import GHC.Int

import qualified Infrastructure.Table.Project as TProject
import Domain.Project
import Infrastructure.DataSource (connect)
import Database.Relational.Type (relationalQuery)
import Database.HDBC.Record.Query (runQuery')

allProjects :: IO [Project]
allProjects = do
  con <- connect
  tprojects <- runQuery' con (relationalQuery TProject.project) ()
  let names = map TProject.name tprojects
  let projects = map Project names
  return projects
