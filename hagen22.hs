import Data.Either (isLeft, fromRight, partitionEithers)

type SomeData = Either Int String

-- f :: Either Int String -> String
-- f = either (\l -> "Number") (\r -> r)

f :: Either Int String -> String
f = fromRight "Number"

main :: IO ()
main = do
  print $ f (Left 1)
  print $ f (Right "Hello")
  print $ partitionEithers [Left 1, Right "Hello", Left 4, Left 5, Right "Hello World"]
