f :: (Num b, Ord b) => [b] -> [b]
f xs = map (+ 1) $ filter (> 1) xs

main :: IO ()
main = do
  print "hello world"