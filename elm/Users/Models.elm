module Users.Models exposing (..)

import Generated.MyApi

type alias User = Generated.MyApi.User
type alias Name = String
type alias Age = Int
type alias Email = String

type alias Model = ( List User )

newUser : Name -> Age -> Email -> User
newUser name age email = 
    { name  = name
    , age   = age
    , email = email
    }
