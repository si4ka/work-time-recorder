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
type CRUD = "projects" :> Get '[JSON] [Project]
       :<|> "projects" :> ReqBody '[JSON, FormUrlEncoded] Project :> Post '[JSON] Project

crud :: Proxy CRUD
crud = Proxy

allProjectHandler :: Handler [Project]
allProjectHandler = liftIO $ PQ.allProjects

postProjects :: Project -> Handler Project
postProjects project = do
  liftIO $ PQ.insertProject project
  return project
