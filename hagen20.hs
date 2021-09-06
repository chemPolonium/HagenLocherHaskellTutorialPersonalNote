data Tree a = Leaf | Node (Tree a) a (Tree a)

invTupTree :: Tree (Integer, Integer)
invTupTree = aux (0, 0)
  where
    aux (l, r) = Node (aux (l + 1, r)) (l, r) (aux (l, r + 1))

cut :: Int -> Tree a -> Tree a
cut 0 _ = Leaf
cut n Leaf = Leaf
cut n (Node l v r) = Node (cut (n -1) l) v (cut (n -1) r)

myinsert :: (Ord a) => a -> Tree a -> Tree a
myinsert v Leaf = Node Leaf v Leaf
myinsert v (Node l vt r)
  | v <= vt = Node (myinsert v l) vt r
  | otherwise = Node l vt (myinsert v r)

myinorder :: Tree a -> [a]
myinorder Leaf = []
myinorder (Node l v r) = myinorder l ++ [v] ++ myinorder r

main :: IO ()
main =
  print "hello"
