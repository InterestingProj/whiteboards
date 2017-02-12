module Users.View exposing (..)

import Html.Attributes exposing (href)
import Html exposing (Html, div, text, p, h1, a)
import Users.Messages exposing (Msg(..))
import Users.Models exposing (User, Name)
import Users.List
import Routes exposing (Route(..))

view : User -> Html Msg
view user =
    div []
        [ nav user
        , form user
        ]

nav : User -> Html Msg
nav model =
    div [] 
        [a [href "/#u"] [text "back"]]

form : User -> Html Msg
form user = 
    div []
        [ h1 [] [ text user.name ]
        , p [] [text ("age: " ++ (toString user.age)) ]
        , p [] [text ("email: " ++ user.email) ]
        ]
