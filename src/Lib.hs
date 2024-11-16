module Lib where

import GHC.Natural (Natural)

data Matrix = Matrix
  { dim  :: Natural
  , bits :: [Bool] }

testMatrix :: Matrix
testMatrix = Matrix
  { dim = 4
  , bits = [ True, False, True, True
           , False, False, True, True
           , True, False, False, False
           , False, True, True, False ]}
