import Html

test = ul_
    [ 
        p_ "item 1",
        p_ "item 2",
        p_ "item 3"
    ]

main :: IO ()
main = putStrLn "hello world"


-- el :: String -> String -> String
-- el tag content =
--   "<" <> tag <> ">" <> content <> "</" <> tag <> ">"



-- ul_ :: [String] -> String    
-- ul_ = 
--     let 
--         wrapInLi = el "li"
--     in concat . map wrapInLi








