module App
    (run') where

import Api ( User, UserAPI2, UserAPI2', userAPI2, userAPI2', users2, isaac, albert, marie)
import Network.Wai.Handler.Warp as W
import Data.Text
import Data.Time (UTCTime, fromGregorian)
import Servant.API
import Control.Monad.IO.Class
import Data.Aeson
import Data.Proxy
import Data.Text as T (Text)
import GHC.Generics
import Network.Wai
import qualified Data.Text as T
import Servant
import Servant.JS
import Data.Time.Calendar
import Elm (Spec (Spec), specsToDir, toElmDecoderSource,
            toElmTypeSource)
import Servant.Elm  (ElmType, Proxy (Proxy), defElmImports,
                               generateElmForAPI)

app :: Application
app = serve userAPI2 server2

server2 :: Server UserAPI2
server2 = return users2
     :<|> return albert
     :<|> return isaac
     :<|> return marie

server2' :: Server UserAPI2'
server2' = server2 :<|> serveDirectory "static"

app' :: Application
app' = serve userAPI2' server2'

run' :: Int -> IO ()
run' port = W.run port app'
