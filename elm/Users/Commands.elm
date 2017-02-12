module Users.Commands exposing (..)

import Http
import Users.Models exposing (User, Name)
import Users.Messages exposing (..)
import Generated.MyApi

fetchUsers : Cmd Msg
fetchUsers = Http.send RetrievedUsers <| Generated.MyApi.getUsers 
