f :: Integral p => p -> p -> p
f a b = if even a then a else b

-- for f (1+1) (2+1), even (1+1) is true, so (2+1) is not evaluated.

factors :: Integral a => a -> [a]
factors n = filter (\m -> n `mod` m == 0) [2 .. (n - 1)]

-- the whole list [2 .. (n-1)] is not built
-- each single element in the list is checked

isPrime :: Integral a => a -> Bool
isPrime n = n > 1 && null (factors n)

-- foldl (+) 0 [1, 2, 3] will build the whole thunk
-- because the foldl function is lazy
-- foldl' (+) 0 [1, 2, 3] will get the value right away
-- because it's strict for the evaluation

-- strict is using seq
-- seq a b = b
-- seq is strict for the first argument

-- foldl' :: (a -> b -> a) -> a -> [b] -> a
-- foldl' _ z [] = z
-- foldl' f z (x:xs) =
--   let z' = f z x in
--     seq z' foldl' f z' xs

-- ($) will use lazy value
-- ($!) will not use lazy value

main :: IO ()
main = do
  print "hello"