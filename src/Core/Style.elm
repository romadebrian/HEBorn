module Core.Style exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, li, main_, header, footer, nav)
import Css.Namespace exposing (namespace)


css : Stylesheet
css =
    (stylesheet << namespace "core")
        [ body
            [ displayFlex
            , minWidth (vw 100)
            , minHeight (vh 100)
            , maxWidth (vw 100)
            , maxHeight (vh 100)
            , overflow hidden
            , margin (px 0)
            , backgroundColor (rgb 57 109 166)
            , fontFamily sansSerif
            ]
        , id "app"
            [ width (pct 100)
            , minHeight (pct 100)
            ]
        ]