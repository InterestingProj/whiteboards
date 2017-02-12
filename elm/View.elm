module View exposing (..)

import Html exposing (Html, div, text)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Users.List
import Users.View
import Users.Models exposing (Name)
import Routes exposing (Route(..))

view : Model -> Html Msg
view model =
    div []
        [ page model]

page : Model -> Html Msg
page model = 
    case model.route of
        UsersRoute ->
            Html.map UsersMsg (Users.List.view model.users)
        UserRoute name ->
            userPage model name
        NotFoundRoute ->
            notFoundView

userPage : Model -> Name -> Html Msg
userPage model name = 
    let 
        maybeUser =
            model.users
                |> List.filter (\user -> user.name == name)
                |> List.head
    in 
        case maybeUser of
            Just user ->
                Html.map UsersMsg (Users.View.view user)
            Nothing ->
                notFoundView

notFoundView : Html Msg
notFoundView =
    div []
        [ text "404 Not Found" ]




