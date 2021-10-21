{- Module

- Main.hs
- Bar
  | - Foo.hs

in Foo.hs:
module Bar.Foo where ...

in Main.hs:
import Bar.Foo

-}

main :: IO ()
main = do
  print "hello"