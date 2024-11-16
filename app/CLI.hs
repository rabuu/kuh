module CLI (CliArgs(..), cliParser) where

import Options.Applicative

data CliArgs = Args
  { text :: String
  , dim :: Double
  , prettySvg :: Bool }

cliParser :: Parser CliArgs
cliParser = Args
      <$> argument str
          ( metavar "TEXT"
         <> help "Input text" )
      <*> option auto
          ( metavar "DIMENSION"
         <> long "dim"
         <> short 'd'
         <> showDefault
         <> value 400
         <> help "Height and width of the output image" )
      <*> switch
          ( long "pretty-svg"
         <> help "Pretty print the output file" )
