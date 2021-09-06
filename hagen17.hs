maybeadd :: Num b => Maybe b -> b -> Maybe b
maybeadd mx y = mx >>= (\x -> Just $ x + y)

maybeadd1 :: Num b => Maybe b -> Maybe b -> Maybe b
maybeadd1 mx my = mx >>= (\x -> my >>= (\y -> Just $ x + y))

maybeadd2 :: (Monad m, Num b) => m b -> m b -> m b
maybeadd2 mx my = mx >>= (\x -> my >>= (\y -> return $ x + y))

monadd :: (Monad m, Num b) => m b -> m b -> m b
monadd mx my = do
  x <- mx
  y <- my
  return $ x + y

-- (>>) :: Monad m => m a -> m b -> m b
-- m >> n = m >>= \_ -> n
-- Nothing >> Just 1
--   => Nothing
-- Just 1 >> Just 2
--   => Just 2
-- Just 1 >> Nothing
--   => Nothing

main :: IO ()
main = do
  print "hello"
  print $ maybeadd Nothing 1
  print $ maybeadd (Just 1) 1
  print $ maybeadd1 (Just 1) (Just 2)
  print $ maybeadd1 Nothing (Just 1)
  print $ maybeadd1 (Just 1) Nothing
  print $ maybeadd2 (Just 1) (Just 2)
  print $ maybeadd2 Nothing (Just 1)
  print $ maybeadd2 (Just 1) Nothing
  print $ Just 1 >> Just 2