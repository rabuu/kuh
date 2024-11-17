module Kuh.Encoding (numericEncode) where

import Data.List.Split (chunksOf)

type Digit = Int

concatDigits :: Int -> [Digit] -> Int
concatDigits base = foldl addDigit 0
  where addDigit n d = base * n + d

intToBinary :: Int -> [Bool]
intToBinary = map (/= 0) . intToBinary'

intToBinary' :: Int -> [Int]
intToBinary' 0 = [0]
intToBinary' n = go n []
  where
    go 0 r = r
    go k rs = go (div k 2) (mod k 2:rs)

numericEncode :: [Digit] -> [Bool]
numericEncode digits = concatMap (intToBinary . concatDigits 10) (chunksOf 3 digits)
