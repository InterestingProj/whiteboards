module Models exposing (..)

import Users.Models exposing (User)
import Routes

type alias Model = 
    { users : List User
    , route : Routes.Route
    }

initialModel : Routes.Route -> Model
initialModel route = 
    { users = []
    , route = route
    }


