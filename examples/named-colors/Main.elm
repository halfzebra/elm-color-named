module Main exposing (..)

import Html exposing (Html, text, div, span)
import Html.Attributes exposing (style)
import Color exposing (Color, rgb)
import Color.Named exposing (Named(..), namedHex, namedColors)


(=>) : a -> b -> ( a, b )
(=>) a b =
    ( a, b )


main : Html a
main =
    div
        []
        (List.map
            (\color ->
                div
                    [ style
                        [ "font-family" => "monospace"
                        ]
                    ]
                    [ span
                        [ style
                            [ "background-color" => namedHex color
                            , "height" => "20px"
                            , "width" => "20px"
                            , "display" => "inline-block"
                            ]
                        ]
                        []
                    , text (toString color)
                    ]
            )
            namedColors
        )
