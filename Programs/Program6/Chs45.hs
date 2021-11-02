module Chs45 where

-- Problem 4.1
halve :: [a] -> ([a],[a])
halve xs = splitAt (length xs `div` 2) xs

-- Problem 4.2 a with head and tail
third :: [a] -> a
third xs = head (tail(tail xs)) --removed head, removes head again, grabs head

-- Problem 4.2 b with indexing !!
third' :: [a] -> a
third' xs = xs !! 2 --page 23

-- Problem 4.2 c with pattern matching
third'' :: [a] -> a
third'' (_:_:x:_) = x --page 49

-- Problem 5.2
grid :: Int -> Int -> [(Int,Int)]
grid x y = [(x,y) | x <- [0..x], y <- [0..y]]

-- Problem 5.3
square :: Int -> [(Int,Int)]
square n = [(x,y) | (x,y) <- grid n n, x /= y]

-- Problem 5.4
replicate' :: Int -> a -> [a]
replicate' i x = [x | y <- [1..i]]
