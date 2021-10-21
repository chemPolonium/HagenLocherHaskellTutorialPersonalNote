import Data.List (intersperse, nub)
import qualified Data.Map as Map

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

testintersperse :: [Char]
testintersperse = intersperse '.' "MONKEY"

phoneBook :: [([Char], [Char])]
phoneBook =
  [ ("betty", "555-2938"),
    ("bonnie", "452-2928"),
    ("patsy", "493-2928"),
    ("lucille", "205-2928"),
    ("wendy", "939-8282"),
    ("penny", "853-2492")
  ]

findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey key [] = Nothing
findKey key ((k, v) : xs) =
  if key == k
    then Just v
    else findKey key xs

main :: IO ()
main = do
  print "hello"