module Main exposing (main, update, Model, Msg(..))

import Html.App as App
import Html exposing (Html, div, button, text, input, pre)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (defaultValue, value, type')
import String
import Maybe exposing (withDefault)


main : Program Never
main =
    App.beginnerProgram
        { model = initialModel
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { bumpBy : Maybe Int
    , counter : Int
    , err : Maybe String
    }


initialModel : Model
initialModel =
    { counter = 0
    , bumpBy = Just 1
    , err = Nothing
    }



-- UPDATE


type Msg
    = Increment
    | Decrement
    | Reset
    | BumpBy String


update : Msg -> Model -> Model
update msg model =
    let
        bumpBy =
            (withDefault 0 model.bumpBy)

        checkBumpBy =
            \operator ->
                if model.bumpBy == Nothing then
                    model
                else
                    { model | counter = (operator bumpBy model.counter) }
    in
        case msg of
            Increment ->
                checkBumpBy (+)

            Decrement ->
                checkBumpBy (-)

            BumpBy bumpBy ->
                case (String.toInt (Debug.log "bumpBy: " bumpBy)) of
                    Ok result ->
                        { model | bumpBy = Just result, err = Nothing }

                    Err err ->
                        { model | bumpBy = Nothing, err = Just err }

            Reset ->
                initialModel



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Increment ] [ text "+" ]
        , div [] [ text (toString model.counter) ]
        , button [ onClick Decrement ] [ text "-" ]
        , input
            [ type' "text"
            , onInput BumpBy
            , value (bumpByValue model.bumpBy)
            ]
            []
        , text (errorMessage model.err)
        , pre [] [ text (toString model) ]
        ]


errorMessage : Maybe String -> String
errorMessage err =
    (toString (withDefault "" err))


bumpByValue : Maybe Int -> String
bumpByValue bumpBy =
    (toString (withDefault 0 bumpBy))
