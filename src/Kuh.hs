module Kuh (Version, mkVersion, versionDim, ErrorCorrectionLevel, DataMode) where

-- | QR code version (1-40) that corresponds to the size
newtype Version = Version Int
  deriving Show

-- | Construct a Version
mkVersion :: Int -> Maybe Version
mkVersion n
  | n >= 1 && n <= 40 = Just $ Version n
  | otherwise = Nothing

-- | Calculate the size of a QR code of a given version
versionDim :: Version -> Int
versionDim (Version n) = 17 + (n * 4)

-- | Error correction level of a QR code
data ErrorCorrectionLevel = L | M | Q | H
  deriving Show

-- | Data mode that corresponds to the type of data the code contains
data DataMode = Numeric | Alphanumeric | Binary | Kanji
  deriving Show
