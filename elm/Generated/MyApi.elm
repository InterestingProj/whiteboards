module Generated.MyApi exposing (..)

import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Json.Encode
import Http
import String


type alias User =
    { name : String
    , age : Int
    , email : String
    }

decodeUser : Decoder User
decodeUser =
    decode User
        |> required "name" string
        |> required "age" int
        |> required "email" string

getUsers : Http.Request (List (User))
getUsers =
    Http.request
        { method =
            "GET"
        , headers =
            []
        , url = 
            String.join "/"
                [ ""
                , "users"
                ]
        , body =
            Http.emptyBody
        , expect =
            Http.expectJson (list decodeUser)
        , timeout =
            Nothing
        , withCredentials =
            False
        }

getAlbert : Http.Request (User)
getAlbert =
    Http.request
        { method =
            "GET"
        , headers =
            []
        , url =
            String.join "/"
                [ ""
                , "albert"
                ]
        , body =
            Http.emptyBody
        , expect =
            Http.expectJson decodeUser
        , timeout =
            Nothing
        , withCredentials =
            False
        }

getIsaac : Http.Request (User)
getIsaac =
    Http.request
        { method =
            "GET"
        , headers =
            []
        , url =
            String.join "/"
                [ ""
                , "isaac"
                ]
        , body =
            Http.emptyBody
        , expect =
            Http.expectJson decodeUser
        , timeout =
            Nothing
        , withCredentials =
            False
        }
