newtype Structure = Structure String

getStructureString :: Structure -> String
getStructureString (Structure str) = str

testStruct = Structure "hello world"
testStr = getStructureString testStruct

main :: IO ()
main = putStrLn testStr




