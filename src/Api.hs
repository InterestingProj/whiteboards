{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveGeneric #-}

module Api
    ( User
    , UserAPI2
    , UserAPI2'
    , userAPI2
    , userAPI2'
    , users2
    , isaac
    , albert
    , marie
    ) where

import Data.Text
import Data.Time (UTCTime, fromGregorian)
import Servant.API
import Control.Monad.IO.Class
import Data.Aeson
import Data.Proxy
import Data.Text as T (Text)
import GHC.Generics
import Network.Wai
import Network.Wai.Handler.Warp
import qualified Data.Text as T
import Servant
import Servant.JS
import Data.Time.Calendar
import Elm (Spec (Spec), specsToDir, toElmDecoderSource,
            toElmTypeSource)
import Servant.Elm  (ElmType, Proxy (Proxy), defElmImports,
                               generateElmForAPI)

data User = User
  { name :: String
  , age :: Int
  , email :: String
  } deriving (Eq, Show, Generic)

instance ElmType User
instance ToJSON User

type UserAPI2 = "users" :> Get '[JSON] [User]
           :<|> "albert" :> Get '[JSON] User
           :<|> "isaac" :> Get '[JSON] User
           :<|> "marie" :> Get '[JSON] User

type UserAPI2' = UserAPI2 :<|>Raw

isaac :: User
isaac = User "Isaac Newton" 372 "isaac@newton.co.uk"

albert :: User
albert = User "Albert Einstein" 136 "ae@mc2.org"

marie :: User
marie = User "Marie Curie" 100 "curie@email.org"

users2 :: [User]
users2 = [isaac, albert, marie]

userAPI2 :: Proxy UserAPI2
userAPI2 = Proxy

userAPI2' :: Proxy UserAPI2'
userAPI2' = Proxy




