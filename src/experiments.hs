main :: IO ()
main = putStrLn "hello world"


_replicate :: Int -> a -> [a]
_replicate times value = 
    if times > 0
        then value : _replicate (times - 1) value
        else []    








