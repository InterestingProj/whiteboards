module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Users.Update
import Routes exposing (parseLocation)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        UsersMsg subMsg ->
            let
                ( updatedUsers, cmd ) =
                    Users.Update.update subMsg model.users
            in
                ( { model | users = updatedUsers }, Cmd.map UsersMsg cmd)
        OnLocationChange location ->
            let newRoute = 
                parseLocation location
            in ( { model | route = newRoute }, Cmd.none )
