module Color.Named exposing (Named(..), namedHex, namedRgb, namedColors)

{-|

# Definitions
@docs Named

# Helpers
@docs namedHex, namedRgb

# Color list
@docs namedColors

-}

import Color exposing (Color, rgb)


{-| Representation of named colors.
-}
type Named
    = Aliceblue
    | Antiquewhite
    | Aqua
    | Aquamarine
    | Azure
    | Beige
    | Bisque
    | Black
    | Blanchedalmond
    | Blue
    | Blueviolet
    | Brown
    | Burlywood
    | Cadetblue
    | Chartreuse
    | Chocolate
    | Coral
    | Cornflowerblue
    | Cornsilk
    | Crimson
    | Cyan
    | Darkblue
    | Darkcyan
    | Darkgoldenrod
    | Darkgray
    | Darkgreen
    | Darkgrey
    | Darkkhaki
    | Darkmagenta
    | Darkolivegreen
    | Darkorange
    | Darkorchid
    | Darkred
    | Darksalmon
    | Darkseagreen
    | Darkslateblue
    | Darkslategray
    | Darkslategrey
    | Darkturquoise
    | Darkviolet
    | Deeppink
    | Deepskyblue
    | Dimgray
    | Dimgrey
    | Dodgerblue
    | Firebrick
    | Floralwhite
    | Forestgreen
    | Fuchsia
    | Gainsboro
    | Ghostwhite
    | Gold
    | Goldenrod
    | Gray
    | Green
    | Greenyellow
    | Grey
    | Honeydew
    | Hotpink
    | Indianred
    | Indigo
    | Ivory
    | Khaki
    | Lavender
    | Lavenderblush
    | Lawngreen
    | Lemonchiffon
    | Lightblue
    | Lightcoral
    | Lightcyan
    | Lightgoldenrodyellow
    | Lightgray
    | Lightgreen
    | Lightgrey
    | Lightpink
    | Lightsalmon
    | Lightseagreen
    | Lightskyblue
    | Lightslategray
    | Lightslategrey
    | Lightsteelblue
    | Lightyellow
    | Lime
    | Limegreen
    | Linen
    | Magenta
    | Maroon
    | Mediumaquamarine
    | Mediumblue
    | Mediumorchid
    | Mediumpurple
    | Mediumseagreen
    | Mediumslateblue
    | Mediumspringgreen
    | Mediumturquoise
    | Mediumvioletred
    | Midnightblue
    | Mintcream
    | Mistyrose
    | Moccasin
    | Navajowhite
    | Navy
    | Oldlace
    | Olive
    | Olivedrab
    | Orange
    | Orangered
    | Orchid
    | Palegoldenrod
    | Palegreen
    | Paleturquoise
    | Palevioletred
    | Papayawhip
    | Peachpuff
    | Peru
    | Pink
    | Plum
    | Powderblue
    | Purple
    | Rebeccapurple
    | Red
    | Rosybrown
    | Royalblue
    | Saddlebrown
    | Salmon
    | Sandybrown
    | Seagreen
    | Seashell
    | Sienna
    | Silver
    | Skyblue
    | Slateblue
    | Slategray
    | Slategrey
    | Snow
    | Springgreen
    | Steelblue
    | Tan
    | Teal
    | Thistle
    | Tomato
    | Turquoise
    | Violet
    | Wheat
    | White
    | Whitesmoke
    | Yellow
    | Yellowgreen


{-| Retrieve HEX value of a named color.

    namedHex Red -- #FF0000
-}
namedHex : Named -> String
namedHex named =
    colors
        |> List.filter (\( tag, _, _ ) -> tag == named)
        |> List.head
        |> \color ->
            case color of
                Just ( _, colorHex, _ ) ->
                    colorHex

                Nothing ->
                    Debug.crash "You are attempting to get a non-existant color"


{-| Retrieve RGB value of a named color.

    namedRgb Aliceblue -- Color.rgb 240 248 255
-}
namedRgb : Named -> Color
namedRgb named =
    colors
        |> List.filter (\( tag, _, _ ) -> tag == named)
        |> List.head
        |> \color ->
            case color of
                Just ( _, _, colorRgb ) ->
                    colorRgb

                Nothing ->
                    Debug.crash "You are attempting to get a non-existant color"


{-| A list of all available named colors.
-}
namedColors : List Named
namedColors =
    [ Aliceblue
    , Antiquewhite
    , Aqua
    , Aquamarine
    , Azure
    , Beige
    , Bisque
    , Black
    , Blanchedalmond
    , Blue
    , Blueviolet
    , Brown
    , Burlywood
    , Cadetblue
    , Chartreuse
    , Chocolate
    , Coral
    , Cornflowerblue
    , Cornsilk
    , Crimson
    , Cyan
    , Darkblue
    , Darkcyan
    , Darkgoldenrod
    , Darkgray
    , Darkgreen
    , Darkgrey
    , Darkkhaki
    , Darkmagenta
    , Darkolivegreen
    , Darkorange
    , Darkorchid
    , Darkred
    , Darksalmon
    , Darkseagreen
    , Darkslateblue
    , Darkslategray
    , Darkslategrey
    , Darkturquoise
    , Darkviolet
    , Deeppink
    , Deepskyblue
    , Dimgray
    , Dimgrey
    , Dodgerblue
    , Firebrick
    , Floralwhite
    , Forestgreen
    , Fuchsia
    , Gainsboro
    , Ghostwhite
    , Gold
    , Goldenrod
    , Gray
    , Green
    , Greenyellow
    , Grey
    , Honeydew
    , Hotpink
    , Indianred
    , Indigo
    , Ivory
    , Khaki
    , Lavender
    , Lavenderblush
    , Lawngreen
    , Lemonchiffon
    , Lightblue
    , Lightcoral
    , Lightcyan
    , Lightgoldenrodyellow
    , Lightgray
    , Lightgreen
    , Lightgrey
    , Lightpink
    , Lightsalmon
    , Lightseagreen
    , Lightskyblue
    , Lightslategray
    , Lightslategrey
    , Lightsteelblue
    , Lightyellow
    , Lime
    , Limegreen
    , Linen
    , Magenta
    , Maroon
    , Mediumaquamarine
    , Mediumblue
    , Mediumorchid
    , Mediumpurple
    , Mediumseagreen
    , Mediumslateblue
    , Mediumspringgreen
    , Mediumturquoise
    , Mediumvioletred
    , Midnightblue
    , Mintcream
    , Mistyrose
    , Moccasin
    , Navajowhite
    , Navy
    , Oldlace
    , Olive
    , Olivedrab
    , Orange
    , Orangered
    , Orchid
    , Palegoldenrod
    , Palegreen
    , Paleturquoise
    , Palevioletred
    , Papayawhip
    , Peachpuff
    , Peru
    , Pink
    , Plum
    , Powderblue
    , Purple
    , Rebeccapurple
    , Red
    , Rosybrown
    , Royalblue
    , Saddlebrown
    , Salmon
    , Sandybrown
    , Seagreen
    , Seashell
    , Sienna
    , Silver
    , Skyblue
    , Slateblue
    , Slategray
    , Slategrey
    , Snow
    , Springgreen
    , Steelblue
    , Tan
    , Teal
    , Thistle
    , Tomato
    , Turquoise
    , Violet
    , Wheat
    , White
    , Whitesmoke
    , Yellow
    , Yellowgreen
    ]


{-| Internal storage for colors.
-}
colors : List ( Named, String, Color )
colors =
    [ ( Aliceblue, "#F0F8FF", rgb 240 248 255 )
    , ( Antiquewhite, "#FAEBD7", rgb 250 235 215 )
    , ( Aqua, "#00FFFF", rgb 0 255 255 )
    , ( Aquamarine, "#7FFFD4", rgb 127 255 212 )
    , ( Azure, "#F0FFFF", rgb 240 255 255 )
    , ( Beige, "#F5F5DC", rgb 245 245 220 )
    , ( Bisque, "#FFE4C4", rgb 255 228 196 )
    , ( Black, "#000000", rgb 0 0 0 )
    , ( Blanchedalmond, "#FFEBCD", rgb 255 235 205 )
    , ( Blue, "#0000FF", rgb 0 0 255 )
    , ( Blueviolet, "#8A2BE2", rgb 138 43 226 )
    , ( Brown, "#A52A2A", rgb 165 42 42 )
    , ( Burlywood, "#DEB887", rgb 222 184 135 )
    , ( Cadetblue, "#5F9EA0", rgb 95 158 160 )
    , ( Chartreuse, "#7FFF00", rgb 127 255 0 )
    , ( Chocolate, "#D2691E", rgb 210 105 30 )
    , ( Coral, "#FF7F50", rgb 255 127 80 )
    , ( Cornflowerblue, "#6495ED", rgb 100 149 237 )
    , ( Cornsilk, "#FFF8DC", rgb 255 248 220 )
    , ( Crimson, "#DC143C", rgb 220 20 60 )
    , ( Cyan, "#00FFFF", rgb 0 255 255 )
    , ( Darkblue, "#00008B", rgb 0 0 139 )
    , ( Darkcyan, "#008B8B", rgb 0 139 139 )
    , ( Darkgoldenrod, "#B8860B", rgb 184 134 11 )
    , ( Darkgray, "#A9A9A9", rgb 169 169 169 )
    , ( Darkgreen, "#006400", rgb 0 100 0 )
    , ( Darkgrey, "#A9A9A9", rgb 169 169 169 )
    , ( Darkkhaki, "#BDB76B", rgb 189 183 107 )
    , ( Darkmagenta, "#8B008B", rgb 139 0 139 )
    , ( Darkolivegreen, "#556B2F", rgb 85 107 47 )
    , ( Darkorange, "#FF8C00", rgb 255 140 0 )
    , ( Darkorchid, "#9932CC", rgb 153 50 204 )
    , ( Darkred, "#8B0000", rgb 139 0 0 )
    , ( Darksalmon, "#E9967A", rgb 233 150 122 )
    , ( Darkseagreen, "#8FBC8F", rgb 143 188 143 )
    , ( Darkslateblue, "#483D8B", rgb 72 61 139 )
    , ( Darkslategray, "#2F4F4F", rgb 47 79 79 )
    , ( Darkslategrey, "#2F4F4F", rgb 47 79 79 )
    , ( Darkturquoise, "#00CED1", rgb 0 206 209 )
    , ( Darkviolet, "#9400D3", rgb 148 0 211 )
    , ( Deeppink, "#FF1493", rgb 255 20 147 )
    , ( Deepskyblue, "#00BFFF", rgb 0 191 255 )
    , ( Dimgray, "#696969", rgb 105 105 105 )
    , ( Dimgrey, "#696969", rgb 105 105 105 )
    , ( Dodgerblue, "#1E90FF", rgb 30 144 255 )
    , ( Firebrick, "#B22222", rgb 178 34 34 )
    , ( Floralwhite, "#FFFAF0", rgb 255 250 240 )
    , ( Forestgreen, "#228B22", rgb 34 139 34 )
    , ( Fuchsia, "#FF00FF", rgb 255 0 255 )
    , ( Gainsboro, "#DCDCDC", rgb 220 220 220 )
    , ( Ghostwhite, "#F8F8FF", rgb 248 248 255 )
    , ( Gold, "#FFD700", rgb 255 215 0 )
    , ( Goldenrod, "#DAA520", rgb 218 165 32 )
    , ( Gray, "#808080", rgb 128 128 128 )
    , ( Green, "#008000", rgb 0 128 0 )
    , ( Greenyellow, "#ADFF2F", rgb 173 255 47 )
    , ( Grey, "#808080", rgb 128 128 128 )
    , ( Honeydew, "#F0FFF0", rgb 240 255 240 )
    , ( Hotpink, "#FF69B4", rgb 255 105 180 )
    , ( Indianred, "#CD5C5C", rgb 205 92 92 )
    , ( Indigo, "#4B0082", rgb 75 0 130 )
    , ( Ivory, "#FFFFF0", rgb 255 255 240 )
    , ( Khaki, "#F0E68C", rgb 240 230 140 )
    , ( Lavender, "#E6E6FA", rgb 230 230 250 )
    , ( Lavenderblush, "#FFF0F5", rgb 255 240 245 )
    , ( Lawngreen, "#7CFC00", rgb 124 252 0 )
    , ( Lemonchiffon, "#FFFACD", rgb 255 250 205 )
    , ( Lightblue, "#ADD8E6", rgb 173 216 230 )
    , ( Lightcoral, "#F08080", rgb 240 128 128 )
    , ( Lightcyan, "#E0FFFF", rgb 224 255 255 )
    , ( Lightgoldenrodyellow, "#FAFAD2", rgb 250 250 210 )
    , ( Lightgray, "#D3D3D3", rgb 211 211 211 )
    , ( Lightgreen, "#90EE90", rgb 144 238 144 )
    , ( Lightgrey, "#D3D3D3", rgb 211 211 211 )
    , ( Lightpink, "#FFB6C1", rgb 255 182 193 )
    , ( Lightsalmon, "#FFA07A", rgb 255 160 122 )
    , ( Lightseagreen, "#20B2AA", rgb 32 178 170 )
    , ( Lightskyblue, "#87CEFA", rgb 135 206 250 )
    , ( Lightslategray, "#778899", rgb 119 136 153 )
    , ( Lightslategrey, "#778899", rgb 119 136 153 )
    , ( Lightsteelblue, "#B0C4DE", rgb 176 196 222 )
    , ( Lightyellow, "#FFFFE0", rgb 255 255 224 )
    , ( Lime, "#00FF00", rgb 0 255 0 )
    , ( Limegreen, "#32CD32", rgb 50 205 50 )
    , ( Linen, "#FAF0E6", rgb 250 240 230 )
    , ( Magenta, "#FF00FF", rgb 255 0 255 )
    , ( Maroon, "#800000", rgb 128 0 0 )
    , ( Mediumaquamarine, "#66CDAA", rgb 102 205 170 )
    , ( Mediumblue, "#0000CD", rgb 0 0 205 )
    , ( Mediumorchid, "#BA55D3", rgb 186 85 211 )
    , ( Mediumpurple, "#9370DB", rgb 147 112 219 )
    , ( Mediumseagreen, "#3CB371", rgb 60 179 113 )
    , ( Mediumslateblue, "#7B68EE", rgb 123 104 238 )
    , ( Mediumspringgreen, "#00FA9A", rgb 0 250 154 )
    , ( Mediumturquoise, "#48D1CC", rgb 72 209 204 )
    , ( Mediumvioletred, "#C71585", rgb 199 21 133 )
    , ( Midnightblue, "#191970", rgb 25 25 112 )
    , ( Mintcream, "#F5FFFA", rgb 245 255 250 )
    , ( Mistyrose, "#FFE4E1", rgb 255 228 225 )
    , ( Moccasin, "#FFE4B5", rgb 255 228 181 )
    , ( Navajowhite, "#FFDEAD", rgb 255 222 173 )
    , ( Navy, "#000080", rgb 0 0 128 )
    , ( Oldlace, "#FDF5E6", rgb 253 245 230 )
    , ( Olive, "#808000", rgb 128 128 0 )
    , ( Olivedrab, "#6B8E23", rgb 107 142 35 )
    , ( Orange, "#FFA500", rgb 255 165 0 )
    , ( Orangered, "#FF4500", rgb 255 69 0 )
    , ( Orchid, "#DA70D6", rgb 218 112 214 )
    , ( Palegoldenrod, "#EEE8AA", rgb 238 232 170 )
    , ( Palegreen, "#98FB98", rgb 152 251 152 )
    , ( Paleturquoise, "#AFEEEE", rgb 175 238 238 )
    , ( Palevioletred, "#DB7093", rgb 219 112 147 )
    , ( Papayawhip, "#FFEFD5", rgb 255 239 213 )
    , ( Peachpuff, "#FFDAB9", rgb 255 218 185 )
    , ( Peru, "#CD853F", rgb 205 133 63 )
    , ( Pink, "#FFC0CB", rgb 255 192 203 )
    , ( Plum, "#DDA0DD", rgb 221 160 221 )
    , ( Powderblue, "#B0E0E6", rgb 176 224 230 )
    , ( Purple, "#800080", rgb 128 0 128 )
    , ( Rebeccapurple, "#663399", rgb 102 51 153 )
    , ( Red, "#FF0000", rgb 255 0 0 )
    , ( Rosybrown, "#BC8F8F", rgb 188 143 143 )
    , ( Royalblue, "#4169E1", rgb 65 105 225 )
    , ( Saddlebrown, "#8B4513", rgb 139 69 19 )
    , ( Salmon, "#FA8072", rgb 250 128 114 )
    , ( Sandybrown, "#F4A460", rgb 244 164 96 )
    , ( Seagreen, "#2E8B57", rgb 46 139 87 )
    , ( Seashell, "#FFF5EE", rgb 255 245 238 )
    , ( Sienna, "#A0522D", rgb 160 82 45 )
    , ( Silver, "#C0C0C0", rgb 192 192 192 )
    , ( Skyblue, "#87CEEB", rgb 135 206 235 )
    , ( Slateblue, "#6A5ACD", rgb 106 90 205 )
    , ( Slategray, "#708090", rgb 112 128 144 )
    , ( Slategrey, "#708090", rgb 112 128 144 )
    , ( Snow, "#FFFAFA", rgb 255 250 250 )
    , ( Springgreen, "#00FF7F", rgb 0 255 127 )
    , ( Steelblue, "#4682B4", rgb 70 130 180 )
    , ( Tan, "#D2B48C", rgb 210 180 140 )
    , ( Teal, "#008080", rgb 0 128 128 )
    , ( Thistle, "#D8BFD8", rgb 216 191 216 )
    , ( Tomato, "#FF6347", rgb 255 99 71 )
    , ( Turquoise, "#40E0D0", rgb 64 224 208 )
    , ( Violet, "#EE82EE", rgb 238 130 238 )
    , ( Wheat, "#F5DEB3", rgb 245 222 179 )
    , ( White, "#FFFFFF", rgb 255 255 255 )
    , ( Whitesmoke, "#F5F5F5", rgb 245 245 245 )
    , ( Yellow, "#FFFF00", rgb 255 255 0 )
    , ( Yellowgreen, "#9ACD32", rgb 154 205 50 )
    ]
