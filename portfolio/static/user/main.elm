module Main exposing (..)

import Html exposing (..)
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
                [ i [ class "user icon" ] []
                , text "22 views"
                ]
            ]
        ]


main =
    div
        [ class "ui grid"
        , style
            [ ( "position", "relative" )
            , ( "left", "15px" )
            , ( "top", "-15px" )
            ]
        ]
        [ project 1
        , project 2
        , project 3
        , project 4
        , project 5
        , project 6
        , project 7
        , project 8
        , project 9
        , project 10
        ]
