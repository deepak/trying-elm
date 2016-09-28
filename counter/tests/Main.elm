port module Main exposing (..)

import Counter
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit Counter.all


port emit : ( String, Value ) -> Cmd msg
