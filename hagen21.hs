type MyColor = (Int, Int, Int)

type Palette = [MyColor]

-- newtype: only one constructor and only one field
newtype Name = Name String

-- newtype vs data
-- the new type and the type of the field are
-- in the direct corrospondence (isomorphic)
-- new type is checked at compile time.

main :: IO ()
main = do
  print "hello"