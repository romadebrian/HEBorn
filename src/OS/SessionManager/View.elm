module OS.SessionManager.View exposing (..)

import OS.SessionManager.Models exposing (..)
import OS.SessionManager.Messages exposing (..)
import Html exposing (..)
import Game.Models as Game
import OS.SessionManager.WindowManager.View as WindowManager
import OS.SessionManager.WindowManager.Models as WindowManager
import OS.SessionManager.Dock.View as Dock


view : Game.Model -> Model -> Html Msg
view game model =
    node "sess"
        []
        [ viewWM game model
        , viewDock game model
        ]



-- internals


viewDock : Game.Model -> Model -> Html Msg
viewDock game model =
    model
        |> Dock.view game
        |> Html.map DockMsg


viewWM : Game.Model -> Model -> Html Msg
viewWM game model =
    node "wmCanvas"
        []
        (List.filterMap (maybeViewWindow game model) (windows model))


maybeViewWindow :
    Game.Model
    -> Model
    -> WindowRef
    -> Maybe (Html Msg)
maybeViewWindow game model ( wmID, id ) =
    case getWindowManager wmID model of
        Just wm ->
            model
                |> getWindow ( wmID, id )
                |> Maybe.andThen
                    (\window ->
                        case window.state of
                            WindowManager.NormalState ->
                                wm
                                    |> WindowManager.view id game
                                    |> Html.map WindowManagerMsg
                                    |> Just

                            _ ->
                                Nothing
                    )

        Nothing ->
            Nothing
