module Game.Account.Requests.Logout
    exposing
        ( Response(..)
        , request
        , receive
        )

import Json.Encode as Encode exposing (Value)
import Core.Config exposing (Config)
import Game.Account.Messages exposing (..)
import Requests.Requests as Requests
import Requests.Topics exposing (Topic(..))
import Requests.Types exposing (Code(..))


type Response
    = OkResponse


request : String -> Config -> Cmd Msg
request token =
    let
        payload =
            Encode.object
                [ ( "token", Encode.string token ) ]
    in
        Requests.request AccountLogoutTopic
            (LogoutRequest >> Request)
            Nothing
            payload


receive : Code -> Value -> Response
receive _ _ =
    OkResponse
