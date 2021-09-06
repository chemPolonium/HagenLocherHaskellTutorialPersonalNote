import Control.Monad (when)
import Data.Char (toUpper)

greet :: IO ()
greet = do
  putStrLn "What is your name?"
  name <- getLine
  let uname = map toUpper name
  putStrLn ("Hello " ++ uname ++ ".")

-- count :: Int -> Int -> IO ()
-- count n m = do
--   putStrLn (show n)
--   if n < m
--     then count (n + 1) m
--     else return ()

count :: Int -> Int -> IO ()
count n m = do
  print n
  when (n < m) $ count (n + 1) m

-- main = do
--   i <- getLine
--   if i /= "quit"
--     then do
--       putStrLn ("Input: " ++ i)
--       main
--     else return ()

main :: IO ()
main = do
  count 5 10
  i <- getLine
  Control.Monad.when (i /= "quit") $ do
    putStrLn ("Input: " ++ i)
    main