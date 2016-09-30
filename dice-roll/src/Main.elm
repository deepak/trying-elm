-- https://guide.elm-lang.org/architecture/effects/random.html
-- TODO: Exercises: Here are some that build on stuff that has already been introduced:
--
-- Instead of showing a number, show the die face as an image.
-- Add a second die and have them both roll at the same time.
-- And here are some that require new skills:
--
-- Instead of showing an image of a die face, use the elm-lang/svg library to draw it yourself.
-- After you have learned about tasks and animation, have the die flip around randomly before they settle on a final value.


module Main exposing (..)

import Html.App as App
import Html exposing (Html, div, text, button, pre)
import Html.Events exposing (onClick)
import Random
import String


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
    { diceFace : Int
    , diceHistory : List Int
    }


initialModel : ( Model, Cmd Msg )
initialModel =
    ( Model 1 [], Cmd.none )



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
            ( { model
                | diceFace = newFace
                , diceHistory = newFace :: model.diceHistory
              }
            , Cmd.none
            )



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
        , text (diceHistory model.diceHistory)
        , pre [] [ text (toString model) ]
        ]


diceHistory : List Int -> String
diceHistory runs =
    let
        len =
            List.length runs

        butLast =
            List.take (len - 1) runs
                |> List.map (\x -> (toString x))
                |> String.join " -> "

        maybeLast =
            (List.head (List.reverse runs))
    in
        if List.isEmpty runs then
            ""
        else if (List.length runs) == 1 then
            (toString (Maybe.withDefault 0 (List.head runs)))
        else
            butLast ++ " and " ++ (toString (Maybe.withDefault 0 maybeLast))
