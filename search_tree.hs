-- Joonatan Kuosa
-- Binary search tree
-- Keys that map to lists of values
-- Not balanced (so worst case perfomance O(n^2))
--
-- Help
-- use ghci (glasgow compiler)
-- :l search_tree.hs
-- main

import qualified Data.List as List

-- Tree is defined as either Empty or as a [key, value, Tree, Tree] tuple
data Tree k v = Empty | Tree k v (Tree k v) (Tree k v)
   deriving (Show)

-- Find an element from the tree
-- returns the element (sub tree) if found
-- error if not found
find :: (Ord k) => k -> (Tree k v) -> (Tree k v)
find _ Empty = error "Not found"
find key (Tree k v l r)
   | k == key = (Tree k v l r)
   | k < key = find key l
   | k > key = find key r
   | otherwise = error "Something went wrong."

-- Insert a [key, value] pair into the tree
-- if the tree already has the key add the value to a list
-- if not add a new key
-- return a new tree with N keys if key was found, N+1 keys if not
insert :: (Ord k) => k -> v -> (Tree k [v]) -> (Tree k [v])
insert key value Empty = Tree key [value] Empty Empty
insert key value (Tree k v l r)
   | k == key = Tree key (value:v) l r
   | k < key = Tree k v (insert key value l) r
   | otherwise = Tree k v l (insert key value r)

isEmpty :: (Tree k v) -> Bool
isEmpty (Empty) = True
isEmpty (Tree _ _ _ _) = False

-- delete a [key, value] pair from the Tree
-- returns a new tree with N-1 elements if last value for that key
-- otherwise new tree with N elements
-- error if [key, value] was not found
delete :: (Eq k, Ord k, Eq v) => k -> v -> (Tree k [v]) -> (Tree k [v])
delete _ _ Empty = error "not found in Tree"
delete key value (Tree k v l r)
   | k == key && (elem value v) && length v > 1 = Tree k (List.delete value v) l r
   -- Problematic if both r and l are not empty
   | k == key && (elem value v) && not (isEmpty r) = r
   | k == key && (elem value v) = l
   | k < key = Tree k v (delete key value l) r
   | otherwise = Tree k v l (delete key value r)

-- Example code
main = do
   -- Insert values, since the way Haskell works
   -- we need to use this syntax instead of the more familiar procedural
   -- t1.insert(val) or insert(t1, val)
   -- Haskell: t1 = insert k, v $ tree
   -- where tree is a [key, value] tree
   let t1 = insert 4 "baz" $ insert 2 "foo" $ insert 5 "foo"
            $ insert 1 "var" $ insert 4 "foo" $ insert 2 "val" Empty
   print t1
   -- create a new tree by deleting and print it
   print $ delete 4 "baz" t1
   -- create a new tree by deleting and print it
   print $ delete 5 "foo" t1
   -- make a copy of the tree with key 4 removed
   let t2 = delete 4 "baz" $ delete 4 "foo" t1
   print t2

   -- prints [baz, val] (and the rest of the tree)
   print $ find 4 t1
   -- prints [var]
   print $ find 1 t1
   -- throws an exception
   print $ find 4 t2

