module Main exposing (main)

import Html.App as App
import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)


main : Program Never
main =
    App.beginnerProgram
        { model = initialModel
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { dieFace : Int
    }


initialModel : Model
initialModel =
    Model 1



-- UPDATE


type Msg
    = Roll


update : Msg -> Model -> Model
update msg model =
    case msg of
        Roll ->
            { model | dieFace = 2 }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text (toString model.dieFace)
        , button [ onClick Roll ] [ text "Roll" ]
        ]
