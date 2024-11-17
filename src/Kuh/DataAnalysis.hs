module Kuh.DataAnalysis (chooseMode) where

import Kuh (DataMode (..))
import Data.Char (isDigit)

-- | Choose the right data mode (as of now, Kanji is not supportet)
chooseMode :: String -> DataMode
chooseMode input
  | isNumeric input = Numeric
  | isAlphanumeric input = Alphanumeric
  | otherwise = Binary

isNumeric :: String -> Bool
isNumeric = all isDigit

alphanumericTable :: [Char]
alphanumericTable = ['0'..'9'] ++ ['A'..'Z'] ++ " $%*+-./:"

isAlphanumeric :: String -> Bool
isAlphanumeric = all (`elem` alphanumericTable)

-- TODO: determine best version
-- capacity :: ErrorCorrectionLevel -> Version -> Int
-- capacity errLvl version = undefined
