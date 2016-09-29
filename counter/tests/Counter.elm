module Counter exposing (..)

import Test exposing (..)
import Expect
import String
import Main exposing (..)


updateHelper : Msg -> Int -> Model
updateHelper msg initialState =
    let
        model : Model
        model =
            initialState
    in
        update msg model


updateTest : Test
updateTest =
    describe "Update"
        [ test "Increment" <|
            \() ->
                Expect.equal (updateHelper Increment 0) 2
        , test "Decrement" <|
            \() ->
                Expect.equal (updateHelper Decrement 0) -2
        , test "Reset" <|
            \() ->
                Expect.equal (updateHelper Reset 100) 0
        ]


all : Test
all =
    describe "Counter"
        [ updateTest ]
