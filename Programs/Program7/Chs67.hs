module Chs67 where

--don't delete the import, obviously
--remember to include function types (3 points each)

sumdown 0 = 0
sumdown n = n + sumdown (n-1)


euclid x y | x == y = x
           | x > y = euclid (x-y) y
           | otherwise = euclid x (y-x)

sum' :: Num a => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs


take' :: Int -> [a] -> [a]
take' 0 _= []
take' n [] = []
take' n (x:xs) = x : take' (n-1) xs

last' :: Num a => [a] -> a
last' [x] = x
last' (x:xs) = last' xs

dec2int' :: [Int] -> Int
dec2int' = foldl (\a b -> 10*a + b) 0

altmap _ _ [] = []
altmap f g (x:xs) = f x : altmap g f xs

--define your own function(s) to help with luhn

luhn :: [Int] -> Bool
luhn xs = sum' (altmap (\x -> if x*2 > 9 then x*2 - 9 else x*2) (\x -> x) xs) `mod` 10 == 0
