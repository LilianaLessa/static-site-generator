-- Html/Internal.hs

module Html.Internal where

-- * Types

newtype Html
  = Html String

newtype Structure
  = Structure String

type Title
  = String

-- * EDSL

html_ :: Title -> Structure -> Html
html_ title content =
  Html
    ( el "html"
      ( el "head" (el "title" (escape title))
        <> el "body" (getStructureString content)
      )
    )

p_ :: String -> Structure
p_ = Structure . el "p" . escape

code_ :: String -> Structure
code_ = Structure . el "pre" . escape

h1_ :: String -> Structure
h1_ = Structure . el "h1" . escape

append_ :: Structure -> Structure -> Structure
append_ c1 c2 =
  Structure (getStructureString c1 <> getStructureString c2)

{-
Input: 
ul_
  [ p_ "item 1"
  , p_ "item 2"
  , p_ "item 3"
  ]

Output:

<ul>
  <li><p>item 1</p></li>
  <li><p>item 2</p></li>
  <li><p>item 3</p></li>
</ul>
-}
-- maybe it can be used as variadic
ul_ :: [Structure] -> Structure    
ul_ = 
    let 
        wrapInLi = el "li" . getStructureString
    in Structure . el "ul" . concatMap wrapInLi

-- repeated code here. maybe a create a listWrapper to encapsulate the list build?
ol_ :: [Structure] -> Structure    
ol_ = 
    let 
        wrapInLi = el "li" . getStructureString
    in Structure . el "ol" . concatMap wrapInLi

-- * Render

render :: Html -> String
render html =
  case html of
    Html str -> str

-- * Utilities

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

getStructureString :: Structure -> String
getStructureString content =
  case content of
    Structure str -> str

escape :: String -> String
escape =
  let
    escapeChar c =
      case c of
        '<' -> "&lt;"
        '>' -> "&gt;"
        '&' -> "&amp;"
        '"' -> "&quot;"
        '\'' -> "&#39;"
        _ -> [c]
  in
    concat . map escapeChar