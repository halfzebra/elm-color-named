module Main exposing (..)

import Html exposing (Html, program, text, div, button)
import Html.Events exposing (onClick)
import Random.Pcg exposing (Seed, Generator)
import Color.Named exposing (Named)
import Time exposing (Time)


exclude : List a -> List a -> List a
exclude what from =
    List.filter (\item -> not (List.member item what)) from


maybeGeneratorValueOrCrash : Generator (Maybe a) -> Generator a
maybeGeneratorValueOrCrash maybeValueGeneartor =
    Random.Pcg.map
        (\v ->
            case v of
                Just val ->
                    val

                Nothing ->
                    Debug.crash "It seems like you have passed an empty List [] to sampleManyWithoutRepeats"
        )
        maybeValueGeneartor


sampleManyWithoutRepeats : List a -> number -> Generator (List a)
sampleManyWithoutRepeats list amount =
    let
        nextValue : List a -> Generator (List a)
        nextValue tail =
            Random.Pcg.sample (exclude tail list)
                |> maybeGeneratorValueOrCrash
                |> Random.Pcg.map (\head -> head :: tail)
    in
        List.foldr
            (\v -> Random.Pcg.andThen nextValue)
            (nextValue [])
            (List.range 1 (amount - 1))


main : Program Never Model Msg
main =
    program { init = init, view = view, update = update, subscriptions = subscriptions }


view : Model -> Html Msg
view model =
    div
        []
        [ button [ onClick GenerateCombination ] [ text "Click" ]
        , (model.combination
            |> toString
            |> text
          )
        , (text (toString model.sample))
        , (text (toString model.start))
        , (text (toString model.time))
        ]


type alias Model =
    { seed : Maybe Seed
    , combination : Maybe (List Named)
    , sample : Maybe Named
    , time : Maybe Time
    , start : Maybe Time
    , round : Int
    }


init : ( Model, Cmd Msg )
init =
    ( { seed = Nothing
      , combination = Nothing
      , sample = Nothing
      , time = Nothing
      , start = Nothing
      , round = 0
      }
    , Random.Pcg.generate UpdateSeed Random.Pcg.independentSeed
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every Time.millisecond UpdateTimer


type Msg
    = UpdateSeed Seed
    | GenerateCombination
    | PickAnswer
    | UpdateTimer Time


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateSeed seed ->
            ( { model | seed = Just seed }, Cmd.none )

        GenerateCombination ->
            let
                ( newCombination, nextSeed ) =
                    model.seed
                        |> Maybe.map (Random.Pcg.step (sampleManyWithoutRepeats Color.Named.namedColors 4))
                        |> Maybe.map (\( combination, seed ) -> ( Just combination, Just seed ))
                        |> Maybe.withDefault ( model.combination, model.seed )

                ( newModel, _ ) =
                    update PickAnswer { model | combination = newCombination, seed = nextSeed }
            in
                ( { newModel | start = model.time, round = model.round + 1 }, Cmd.none )

        PickAnswer ->
            let
                ( sample, seed ) =
                    (Maybe.map2
                        (\seed combination ->
                            Random.Pcg.step
                                (Random.Pcg.sample combination)
                                seed
                        )
                        model.seed
                        model.combination
                    )
                        |> Maybe.map (\( sample, seed ) -> ( sample, Just seed ))
                        |> Maybe.withDefault ( model.sample, model.seed )
            in
                ( { model | sample = sample, seed = seed }, Cmd.none )

        UpdateTimer time ->
            let
                newModel =
                    { model | time = Just time }

                shouldStep =
                    model
                        |> .start
                        |> Maybe.map (\t -> 5000 <= (time - t))
                        |> Maybe.withDefault False
            in
                if shouldStep == True then
                    update GenerateCombination newModel
                else
                    ( newModel, Cmd.none )


pubDateDecoder : Decoder Date.Date
pubDateDecoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\s ->
                case Date.fromString s of
                    Err e ->
                        fail e

                    Ok d ->
                        succeed d
            )
