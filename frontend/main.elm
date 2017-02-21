module Main exposing (..)

import Html exposing (..)
import Html.App exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


project id =
    div
        [ class "ui card" ]
        [ div [ class "image" ]
            [ img [ src "images/portfolio.png" ] [] ]
        , div [ class "content" ]
            [ a [ class "header" ] [ text ("Project " ++ toString id) ]
            , div [ class "meta" ]
                [ span [ class "date" ] [ text "Completed in 2013" ] ]
            , div [ class "description" ] [ text "My first UI project in C#!" ]
            ]
        , div [ class "extra content" ]
            [ a []
                [ i [ class "feed icon" ] []
                , text "22 views"
                ]
            , div [ class "ui buttons", style [ ( "position", "relative" ), ( "left", "20" ) ] ]
                [ button [ class "ui button" ] [ text "Edit" ]
                , div [ class "or" ] []
                , div [ class "ui negative button" ] [ text "Delete" ]
                ]
            ]
        ]


portfolio =
    let
        ( _, _, projects, _ ) =
            model
    in
        div
            [ class "ui four column doubling stackable grid container" ]
            [ div [ class "column" ]
                [ project 1
                , project 2
                , project 3
                , project 4
                ]
            , div [ class "column" ]
                [ project 5
                , project 6
                , project 7
                , project 8
                ]
            , div [ class "column" ]
                [ project 9
                , project 10
                , project 11
                , project 12
                ]
            , div [ class "column" ]
                [ project 13
                , project 14
                , project 15
                , project 16
                ]
            ]



--    , style
--[ ( "position", "relative" )
--, ( "left", "15px" )
--]


menu =
    let
        ( _, loggedIn, _, _ ) =
            model

        logItem =
            if loggedIn then
                div [ class "ui simple dropdown item" ]
                    [ text "Options      "
                    , i [ class "dropdown icon" ]
                        []
                    , div [ class "menu" ]
                        [ a [ class "item" ]
                            [ i [ class "edit icon" ]
                                []
                            , text "Edit HomePage"
                            ]
                        , a [ class "item" ]
                            [ a [ class "globe icon" ]
                                []
                            , text "Edit Profile"
                            ]
                        , a [ class "item", onClick Logout ]
                            [ i [ class "settings icon" ]
                                []
                            , text "Logout"
                            ]
                        ]
                    ]
            else
                a [ class "item", onClick Login ]
                    [ i [ class "mail icon" ]
                        []
                    , text "Login    "
                    ]
    in
        div [ class "ui stackable menu" ]
            [ div [ class "ui container" ]
                [ a [ class "item", onClick Home ]
                    [ i [ class "home icon" ]
                        []
                    , text "Home    "
                    ]
                , a [ class "item", onClick Browse ]
                    [ i [ class "grid layout icon" ]
                        []
                    , text "Browse    "
                    ]
                , a [ class "item", onClick Profile ]
                    [ i [ class "mail icon" ]
                        []
                    , text "Profile    "
                    ]
                , logItem
                , div [ class "right item" ]
                    [ div [ class "ui input" ]
                        [ input [ placeholder "Search...", type' "text" ]
                            []
                        ]
                    ]
                ]
            ]


browse =
    div
        []
        [ menu
        , portfolio
        ]


home =
    div
        []
        [ menu ]


profile =
    div
        []
        [ menu
        , text "Profile"
        ]


error =
    div [] [ text "Wtf Bro!?" ]


view model =
    case model of
        ( 0, _, _, _ ) ->
            home

        ( 1, False, _, _ ) ->
            browse

        ( 2, False, _, _ ) ->
            profile

        ( _, _, _, _ ) ->
            error


model =
    ( 0, False, 0, 0 )



--(Current Page, Login Status, Total Projects, Total Experience)


type Msg
    = Home
    | Browse
    | Profile
    | Login
    | Logout


controller msg model =
    let
        totalProj =
            16

        totalExp =
            0
    in
        case msg of
            Home ->
                ( 0, False, totalProj, totalExp )

            Browse ->
                ( 1, False, totalProj, totalExp )

            Profile ->
                ( 2, False, totalProj, totalExp )

            Login ->
                ( 0, True, totalProj, totalExp )

            _ ->
                ( 0, False, totalProj, totalExp )


main =
    beginnerProgram
        { model = model
        , view = view
        , update = controller
        }
