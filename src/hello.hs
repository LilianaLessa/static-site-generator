main = putStrLn (getStructureString myhtml)

getStructureString :: Structure -> String
getStructureString (Structure str) = str

myhtml = append_ (Structure "test") (Structure "tset")

-- myhtml = 
--     makeHtml 
--         "Hello title" 
--         (h1_ "Hello, world!" <> p_ "Let's learn about Haskell!")

html_ :: String -> String
html_ = el "html"

body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_ = el "head"

title_ :: String -> String
title_ = el "title"

p_ :: String -> String
p_ = el "p"

h1_ :: String -> String
h1_ = el "h1"

makeHtml title content = html_ (head_ (title_ title)) <> body_ content

-- tag generator function
el :: String -> String -> String
el tag content =
      "<" <> tag <> ">" <> content <> "</" <> tag <> ">"


newtype Structure = Structure String
newtype Html = Html String



append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure (a <> b)