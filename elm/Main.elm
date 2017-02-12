import Generated.MyApi exposing (getUsers, User)
import Html exposing (Html, table, div, img, input, button, text, li, ul, h1, dl, dd, dt, program, tr, td, th, thead, tbody)
import Http 
import Task exposing (..)
import Platform.Cmd exposing (..)
import Users.Commands exposing (fetchUsers)
import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import Routes exposing (Route)
import Update exposing (update)
import View exposing (view)
import Navigation exposing (Location)


main : Program Never Model Msg
main = Navigation.program OnLocationChange
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

init : Location -> ( Model, Cmd Msg )
init location = 
    let 
        currentRoute = 
            Routes.parseLocation location
    in 
        (initialModel currentRoute, Cmd.map UsersMsg fetchUsers )

subscriptions : Model -> Sub Msg
subscriptions model = 
    Sub.none


