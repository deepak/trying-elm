module Main exposing (main, update, view, Model, Msg(..))

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



-- MODEL


type alias Model =
    Int


model : Model
model =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 2

        Decrement ->
            model - 2



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Increment ] [ text "+" ]
        , div [] [ text (toString model) ]
        , button [ onClick Decrement ] [ text "-" ]
        ]
