zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

scanl' :: (a -> b -> a) -> a -> [b] -> [a]
scanl' _ x [] = [x]
scanl' f x (y : ys) = x : scanl' f (f x y) ys

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x : xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x : xs)
  | p x = x : filter' p xs
  | otherwise = filter' p xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x : xs) =
  smallerSorted ++ [x] ++ biggerSorted
  where
    smallerSorted = quicksort [a | a <- xs, a <= x]
    biggerSorted = quicksort [a | a <- xs, a > x]

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
  | even n = n : chain (n `div` 2)
  | otherwise = n : chain (n * 3 + 1)

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1 .. 100]))
  where
    isLong xs = length xs > 15

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

dollarmap :: [Float]
dollarmap = map ($ 3) [(4 +), (10 *), (^ 2), sqrt]

oddSquareSum :: Integer
oddSquareSum = sum . takeWhile (< 10000) . filter odd . map (^ 2) $ [1 ..]

oddSquareSum' :: Integer
oddSquareSum' =
  let oddSquares = filter odd $ map (^ 2) [1 ..]
      belowLimit = takeWhile (< 10000) oddSquares
   in sum belowLimit

main :: IO ()
main = do
  print "hello"
  print $ scanl' (+) 1 [1, 2, 3, 4, 5]
