{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators   #-}

module Presentation.ProjectListView where

import Data.Aeson
import Data.Aeson.TH
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import Domain.Project

$(deriveJSON defaultOptions 'Project)
type CRUD = "projects" :> Get '[JSON] [Project]

projects :: [Project]
projects = [Project "test"]

crud :: Proxy CRUD
crud = Proxy

allProject :: [Project]
allProject = projects

allProjectHandler :: Handler [Project]
allProjectHandler = return allProject
