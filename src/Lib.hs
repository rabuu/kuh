module Lib (testMatrix, renderMatrix) where

import Data.List.Split

import Diagrams.Prelude
import Diagrams.Backend.SVG

data Matrix = Matrix
  { dim  :: Int
  , bits :: [Bool] }

testMatrix :: Matrix
testMatrix = Matrix
  { dim = 4
  , bits = [ True, False, True, True
           , False, False, True, True
           , True, False, False, False
           , False, True, True, False ]}

box :: Bool -> Diagram B
box enabled = square 1 # fc color # lw none
  where color = if enabled then black else white

renderMatrix :: Matrix -> Diagram B
renderMatrix m = foldr1 (===) rows
  where rows = map (foldr1 (|||)) boxes
        boxes = map (map box) (chunksOf (dim m) (bits m))
