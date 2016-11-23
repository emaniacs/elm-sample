module SimpleHtml.Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = init
        , view = view
        , update = update
        }


type Msg
    = Calculate
    | OnInputValue1 String
    | OnInputValue2 String


type alias Model =
    { value1 : String
    , value2 : String
    , result : Int
    , message : String
    }


init : Model
init =
    Model "" "" 0 ""


update : Msg -> Model -> Model
update msg model =
    case msg of
        OnInputValue1 value ->
            { model | value1 = value }

        OnInputValue2 value ->
            { model | value2 = value }

        Calculate ->
            calculate model


view : Model -> Html Msg
view model =
    div [ class "divclass" ]
        [ div [ class "divclass" ]
            [ label [] [ text "Value 1:" ]
            , input [ value model.value1, onInput OnInputValue1 ] []
            , label [] [ text "Value 2:" ]
            , input [ value model.value2, onInput OnInputValue2 ] []
            , button [ onClick Calculate ] [ text "Calculate" ]
            ]
        , div [ class "divclass" ]
            [ p [] [ text "Model" ]
            , pre [] [ text <| toString model ]
            ]
        ]


calculate : Model -> Model
calculate model =
    let
        toInt value name =
            case String.toInt value of
                Ok val ->
                    ( val, "" )

                Err err ->
                    ( 0, "Invalid " ++ name )

        ( value1, message1 ) =
            toInt model.value1 "value1"

        ( value2, message2 ) =
            toInt model.value2 "value2"

        result =
            value1 + value2
    in
        { model
            | result = result
            , message = String.join "," [ message1, message2 ]
        }
