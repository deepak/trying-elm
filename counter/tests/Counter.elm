module Counter exposing (..)

import Test exposing (..)
import Expect
import String
import Main exposing (..)


updateHelper : Msg -> Int -> Int
updateHelper msg counter =
    let
        model : Model
        model =
            { counter = counter
            , bumpBy = { value = Just 1 }
            , err = Nothing
            }
    in
        update msg model |> .counter


updateTest : Test
updateTest =
    describe "Update"
        [ test "Increment initial" <|
            \() ->
                Expect.equal (updateHelper Increment 0) 1
        , test "Increment after 100" <|
            \() ->
                Expect.equal (updateHelper Increment 100) 101
        , test "Increment after -1" <|
            \() ->
                Expect.equal (updateHelper Increment -1) 0
        , test "Decrement initial" <|
            \() ->
                Expect.equal (updateHelper Decrement 0) -1
        , test "Decrement after 100" <|
            \() ->
                Expect.equal (updateHelper Decrement 100) 99
        , test "Decrement after -1" <|
            \() ->
                Expect.equal (updateHelper Decrement -1) -2
        , test "Reset initial" <|
            \() ->
                Expect.equal (updateHelper Reset 0) 0
        , test "Reset after 100" <|
            \() ->
                Expect.equal (updateHelper Reset 100) 0
        , test "Reset after -1" <|
            \() ->
                Expect.equal (updateHelper Reset -1) 0
        ]


all : Test
all =
    describe "Counter"
        [ updateTest ]
