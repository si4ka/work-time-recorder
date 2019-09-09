{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators   #-}
module Lib
    ( startApp
    , app
    ) where

import Data.Aeson
import Data.Aeson.TH
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import Servant.Swagger
import qualified Presentation.ProjectListView as ProjectListView
import qualified Data.ByteString.Lazy.Char8 as BSL8

data User = User
  { userId        :: Int
  , userFirstName :: String
  , userLastName  :: String
  } deriving (Eq, Show)

$(deriveJSON defaultOptions ''User)

type API = "users" :> Get '[JSON] [User]
         :<|> ProjectListView.API

startApp :: IO ()
startApp = do
  BSL8.putStrLn $ encode $ toSwagger (Proxy :: Proxy ProjectListView.API)
  run 8080 app

swaggerDoc :: Swagger
swaggerDoc = toSwagger (Proxy :: Proxy ProjectListView.API)

app :: Application
app = serve api server

api :: Proxy API
api = Proxy

server :: Server API
server = return users
       :<|> ProjectListView.allProjectHandler

users :: [User]
users = [ User 1 "Isaac" "Newton"
        , User 2 "Albert" "Einstein"
        ]
