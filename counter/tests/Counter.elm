module Counter exposing (..)

import Test exposing (..)
import Expect
import String
import Main exposing (..)


updateHelper : Msg -> Model
updateHelper msg =
    let
        model : Model
        model =
            0
    in
        update msg model


updateTest : Test
updateTest =
    describe "Update"
        [ test "Increment" <|
            \() ->
                Expect.equal (updateHelper Increment) 2
        , test "Decrement" <|
            \() ->
                Expect.equal (updateHelper Decrement) -2
        ]


all : Test
all =
    describe "Counter"
        [ updateTest ]
