import Data.Maybe ( fromMaybe, fromJust )
safediv :: Integral a => a -> a -> Maybe a
safediv a b =
  if b == 0 then Nothing else Just $ div a b

main :: IO ()
main = do
  print $ safediv 3 0
  print $ fromJust $ safediv 3 5
  print $ fromMaybe 3.5 Nothing
  print $ fromMaybe 3.5 $ Just 2.7