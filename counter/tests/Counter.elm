module Counter exposing (..)

import Test exposing (..)
import Expect
import String
import TestUtil exposing (outdented)
import Html exposing (Html)
import Main exposing (..)


updateTest : Test
updateTest =
    describe "Update"
        [ test "Increment initial" <|
            \() ->
                Expect.equal (updateHelper Increment 0) 2
        , test "Increment after 0" <|
            \() ->
                Expect.equal (updateHelper Increment 2) 4
        , test "Decrement initial" <|
            \() ->
                Expect.equal (updateHelper Decrement 0) -2
        , test "Decrement after 0" <|
            \() ->
                Expect.equal (updateHelper Decrement 2) 0
        ]


viewTest : Test
viewTest =
    describe "View"
        [ test "markup" <|
            \() ->
                outdented (viewHelper 0)
                    |> Expect.equal (outdented initialOutput)
        ]


all : Test
all =
    describe "Counter"
        [ updateTest
        , viewTest
        ]


updateHelper : Msg -> Int -> Model
updateHelper msg initialState =
    let
        model : Model
        model =
            initialState
    in
        update msg model


viewHelper : Int -> Html Msg
viewHelper initialState =
    let
        model : Model
        model =
            initialState
    in
        view model


initialOutput =
    """
    <div>
      <button>+</button>
      <div>0</div>
      <button>-</button>
    </div>
    """


incrementedOutput =
    """
    <div>
      <button>+</button>
      <div>2</div>
      <button>-</button>
    </div>
    """


decrementedOutput =
    """
    <div>
      <button>+</button>
      <div>-2</div>
      <button>-</button>
    </div>
    """
