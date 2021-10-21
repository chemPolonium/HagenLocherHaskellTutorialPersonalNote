f :: Integral p => p -> p -> p
f a b = if even a then a else b

main :: IO ()
main = do
  print "hello"