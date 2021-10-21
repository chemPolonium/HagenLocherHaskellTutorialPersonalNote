type Weight = Int

type Value = Double

type Items = [(Weight, Value)]

knapsack :: Items -> Weight -> Value
knapsack items capacity = head $ bar items capacity
  where
    bar :: Items -> Weight -> [Value]
    bar [] 0 = [0]
    bar (_ : items) 0 = 0 : bar items capacity
    bar [] y = 0 : bar [] (y -1)
    bar ((w, v) : items) y
      | w <= y =
        let course = bar ((w, v) : items) (y -1)
         in let v1 = course !! capacity
                v2 = course !! capacity
             in let new = max v1 (v2 + v)
                 in new : course
      | otherwise =
        let course = bar ((w, v) : items) (y -1)
         in course !! capacity : course

main :: IO ()
main = do
  print "hello"