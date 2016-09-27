module Main exposing (main)

import Html.App as App
import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)


main : Program Never
main =
    App.beginnerProgram
        { model = 0
        , update = update
        , view = view
        }


type Msg
    = Inc
    | Dec


update : Msg -> number -> number
update msg model =
    case msg of
        Inc ->
            model + 1

        Dec ->
            model - 1


view : a -> Html Msg
view model =
    div []
        [ button [ onClick Inc ] [ text "+" ]
        , div [] [ text (toString model) ]
        , button [ onClick Dec ] [ text "-" ]
        ]
