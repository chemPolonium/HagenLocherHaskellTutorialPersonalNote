-- (+) :: Num a -> a -> -> a
-- a has to have an instance of Num

-- (+) :: Num a -> a -> -> a
-- a has to have an instance of Num
import Data.Maybe (fromJust, fromMaybe)

data Temperature = C Float | F Float
  deriving (Show)

instance Eq Temperature where
  (==) (C n) (C m) = n == m
  (==) (F n) (F m) = n == m
  (==) (C c) (F f) = (1.8 * c + 32) == f
  (==) (F f) (C c) = (1.8 * c + 32) == f

main :: IO ()
main = do
  print "hello world"
  print [1 .. 10]