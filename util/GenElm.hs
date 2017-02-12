{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import Api

import Elm (Spec (Spec), specsToDir, toElmDecoderSource,
            toElmTypeSource)
import Servant.Elm  (ElmType, Proxy (Proxy), defElmImports,
                               generateElmForAPI)

spec :: Spec
spec = Spec ["Generated", "MyApi"]
            (defElmImports
             : toElmTypeSource (Proxy :: Proxy User)
             : toElmDecoderSource (Proxy :: Proxy User)
             : generateElmForAPI (Proxy :: Proxy UserAPI2))

main :: IO ()
main = specsToDir [spec] "elm"
