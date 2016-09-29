module Counter exposing (..)

import Test exposing (..)
import Expect
import String
import Main exposing (..)


updateHelper : Msg -> Int -> Model
updateHelper msg counter =
    let
        model : Model
        model =
            { counter = counter
            , bumpBy = { value = Just 1 }
            , err = Nothing
            }
    in
        update msg model


updateTest : Test
updateTest =
    describe "Update"
        [ test "Increment initial" <|
            \() ->
                Expect.equal ((updateHelper Increment 0) |> .counter) 1
        , test "Increment later" <|
            \() ->
                Expect.equal ((updateHelper Increment 100) |> .counter) 101
        , test "Decrement" <|
            \() ->
                Expect.equal ((updateHelper Decrement 0) |> .counter) -1
        , test "Reset" <|
            \() ->
                Expect.equal ((updateHelper Reset 100) |> .counter) 0
        ]


all : Test
all =
    describe "Counter"
        [ updateTest ]
