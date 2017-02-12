module Users.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Users.Messages exposing (..)
import Users.Models exposing (User)

view : List User -> Html Msg
view users = 
    div []
        [ nav users
        , list users
        ]

nav : List User -> Html Msg
nav users = 
    div []
        [ div [] [ text "Users" ] ]

list : List User -> Html Msg
list users =
    div  [] 
         [ h1 [] [text "Users"]
         ,
         table [] [thead [] [
          tr [] [
             th [] [text "Name"]
             ,th [] [text "Age"]
             , th [] [text "Email"]
             ]
        ]
    ]
    , tbody [] (List.map userRow users)
 ]

userRow : User -> Html Msg
userRow user = 
  tr [] [
      td [] [a [href ("#u/" ++ user.name)] [text user.name]]
    , td [] [text (toString user.age)]
    , td [] [text user.email]
  ]
