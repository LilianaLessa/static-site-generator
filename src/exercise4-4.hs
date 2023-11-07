import Data.Word (Word8) -- Word8 is an 8-bit unsigned integer type
import Data.Maybe (listToMaybe)

colorToTest :: AnsiColor
colorToTest = AnsiColor Bright Red

emptyList = [];
notEmptyList = [1, 2];

main :: IO ()
main = putStrLn (emptyListToStringV1 emptyList <> emptyListToStringV2 emptyList <> emptyListToStringV1 notEmptyList <> emptyListToStringV2 notEmptyList)

-- Data definitions
data Brightness
  = Dark
  | Bright

data EightColor
  = Black
  | Red
  | Green
  | Yellow
  | Blue
  | Magenta
  | Cyan
  | White

data AnsiColor
  = AnsiColor Brightness EightColor

data Color
  = RGB Word8 Word8 Word8
-- Helpers

brightnessToString :: AnsiColor -> String
brightnessToString c = 
    let bright = isBright c
    in (if bright then "Bright!" else "Dark!")

emptyListToStringV1 c =   
    let empty = isEmptyV1 c
    in (if empty then "Empty!" else "NotEmpty!")

emptyListToStringV2 c =   
    let empty = isEmptyV2 c
    in (if empty then "Empty!" else "NotEmpty!")

-- exercise 4.4.1
isBright :: AnsiColor -> Bool
isBright color = 
    case color of
        AnsiColor Bright _ -> True
        _ -> False

-- exercise 4.4.2
ansiToUbuntu :: AnsiColor -> Color
ansiToUbuntu ansicolor = 
    case ansicolor of
        AnsiColor Dark Black ->
            RGB 1 1 1
        AnsiColor Dark Red ->
            RGB 222 56 43
        AnsiColor Dark Green ->
            RGB 57 181 74
        AnsiColor Dark Yellow ->
            RGB 255 199 6
        AnsiColor Dark Blue ->
            RGB 0 111 184
        AnsiColor Dark Magenta ->
            RGB 118 38 113
        AnsiColor Dark Cyan ->
            RGB 44 181 233
        AnsiColor Dark White ->
            RGB 204 204 204
        AnsiColor Bright Black ->
            RGB 128 128 128
        AnsiColor Bright Red ->
            RGB 255 0 0
        AnsiColor Bright Green ->
            RGB 0 255 0
        AnsiColor Bright Yellow ->
            RGB 255 255 0
        AnsiColor Bright Blue ->
            RGB 0 0 255
        AnsiColor Bright Magenta ->
            RGB 255 0 255
        AnsiColor Bright Cyan ->
            RGB 0 255 255
        AnsiColor Bright White ->
            RGB 255 255 255

-- Obs, for the nested way:
-- Since pattern matching goes arbitrarily deep, as we saw before, we could instead pattern match all the way through in one case expression.
ansiToUbuntuNestedCase :: AnsiColor -> Color
ansiToUbuntuNestedCase ansiColor =
    case ansiColor of
    AnsiColor brightness color ->
        case brightness of
        Dark ->
            case color of
            Black -> RGB 1 1 1
            Red -> RGB 22 56 43
            Green -> RGB 57 181 74
            Yellow -> RGB 255 199 6
            Blue -> RGB 0 111 184
            Magenta -> RGB 118 38 113
            Cyan -> RGB 44 181 233
            White -> RGB 204 204 204

        Bright ->
            case color of
            Black -> RGB 128 128 128
            Red -> RGB 255 0 0
            Green -> RGB 0 255 0
            Yellow -> RGB 255 255 0
            Blue -> RGB 0 0 255
            Magenta -> RGB 255 0 255
            Cyan -> RGB 0 255 255
            White -> RGB 255 255 255


--exercise 4.4.3
isEmptyV1 :: [a] -> Bool
isEmptyV1 list = 
    let empty = listToMaybe list
    in case empty of 
        Nothing -> True
        Just _ -> False

--exercise 4.4.4
isEmptyV2 :: [a] -> Bool
isEmptyV2 list = 
    case list of 
        [] -> True
        _ : _ -> False

-- 4.4 incomplete, skipped "Parsing with rich context"