import Html

main :: IO ()
main = putStrLn (render myhtml)

myhtml :: Html
myhtml =
  html_
    "My title"
    ( append_
      (h1_ "Heading")
      ( append_
        (ul_
        [ p_ "item 1"
        , p_ "item 2"
        , p_ "item 3"
        ])
        (ol_
        [ p_ "item 1"
        , p_ "item 2"
        , p_ "item 3"
        ])
      )
    )
