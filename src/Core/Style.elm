module Core.Style exposing (..)

import Css exposing (..)
import Css.Elements exposing (typeSelector, body, li, main_, header, footer, nav)
import Css.Namespace exposing (namespace)
import Css.Utils exposing (unselectable)


prefix : String
prefix =
    "c"


css : Stylesheet
css =
    (stylesheet << namespace prefix)
        [ body
            [ displayFlex
            , minWidth (vw 100)
            , minHeight (vh 100)
            , maxWidth (vw 100)
            , maxHeight (vh 100)
            , overflow hidden
            , margin (px 0)
            , backgroundColor (rgb 57 109 166)
            , backgroundImage <| url "https://phabricator.kde.org/file/data/mxrdg7a4rkgyksktoixa/PHID-FILE-ruyhxb5yqo5xteeprgoh/2560x1600.png"
            , backgroundSize cover
            , fontFamily sansSerif
            , cursor default
            , unselectable
            ]
        , id "app"
            [ width (pct 100)
            , minHeight (pct 100)
            ]
        , typeSelector "elastic"
            [ flex (int 1) ]
        ]
