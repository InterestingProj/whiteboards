module Routes exposing (..)

import Navigation exposing (Location)
import Generated.MyApi exposing (User)
import UrlParser exposing (..)

type alias Name = String

type Route = UsersRoute
           | UserRoute Name
           | NotFoundRoute

matchers : Parser (Route -> a) a
matchers = 
    oneOf
        [ map UsersRoute top
        , map UserRoute (s "u" </> string)
        , map UsersRoute (s "u")
        ]

parseLocation : Location -> Route
parseLocation location = 
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


