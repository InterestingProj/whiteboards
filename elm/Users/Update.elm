module Users.Update exposing (..)

import Users.Messages exposing (Msg(..))
import Users.Models exposing (User)
import Navigation

update : Msg -> List User -> (List User, Cmd Msg)
update msg users = 
    case msg of
        RetrievedUsers result ->
            case result of
                Ok newUsers ->
                    ( newUsers, Cmd.none )
                Err error -> ( users, Cmd.none )
        ShowUsers ->
            ( users, Navigation.newUrl "#" )
        ShowUser name ->
            ( users, Navigation.newUrl ("#u/" ++ name) )
