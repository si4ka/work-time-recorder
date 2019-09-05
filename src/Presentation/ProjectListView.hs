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
import qualified Infrastructure.Query.ProjectQuery as PQ
import Control.Monad.IO.Class (liftIO)

$(deriveJSON defaultOptions 'Project)
type AllProjects = "projects" :> Get '[JSON] [Project]
type API = AllProjects

api :: Proxy API
api = Proxy

allProjects :: IO [Project]
allProjects = PQ.allProjects

allProjectHandler :: Handler [Project]
allProjectHandler = liftIO $ PQ.allProjects
