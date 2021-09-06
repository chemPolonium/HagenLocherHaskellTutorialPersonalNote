f :: [a] -> [a]
f x = foldr (:) x x

main :: IO ()
main = do
  print "hello"
  print $ f [1, 2, 3]