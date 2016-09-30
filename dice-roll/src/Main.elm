module Main exposing (..)

import Html.App as App
import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)
import Random


main : Program Never
main =
    App.program
        { init = initialModel
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { diceFace : Int }


initialModel : ( Model, Cmd Msg )
initialModel =
    ( Model 1, Cmd.none )



-- UPDATE


type Msg
    = Roll
    | NewFace Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model, Random.generate NewFace (Random.int 1 6) )

        NewFace newFace ->
            ( Model newFace, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text (toString model.diceFace)
        , button [ onClick Roll ] [ text "Roll" ]
        ]
