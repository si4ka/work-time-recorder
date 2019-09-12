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
import Database.Relational.Type (relationalQuery, insert)
import Database.HDBC.Record.Query (runQuery')
import Database.HDBC.Record.Insert (runInsert)
import Database.HDBC (commit)

allProjects :: IO [Project]
allProjects = do
  con <- connect
  tprojects <- runQuery' con (relationalQuery TProject.project) ()
  let names = map TProject.name tprojects
  let projects = map Project names
  return projects

insertProject :: Project -> IO ()
insertProject (Project project) = do
  con <- connect
  runInsert con (insert TProject.name') project
  commit con


insertProjectQuery :: Project -> Insert ()
insertProjectQuery (Project project) = insertValueNoPH $ do
  TProject.name' <-# value project
