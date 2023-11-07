main :: IO ()
main = putStrLn (concat ( _replicate 4 "a"))


_replicate :: Int -> a -> [a]
_replicate times value = 
    if times > 0
        then value : _replicate (times - 1) value
        else []    


even :: Int -> Bool
even n =
    if n == 0
        then True
        else odd (n - 1)

odd :: Int -> Bool
odd n = (n /= 0) && even (n - 1)
