module CLI (Args(..), cliParser) where

import Options.Applicative

data Args = Args
  { text :: String
  , outputFile :: String
  , dimension :: Double
  , prettySvg :: Bool }

cliParser :: Parser Args
cliParser = Args
      <$> argument str
          ( metavar "TEXT"
         <> help "Input text" )
      <*> strOption
          ( metavar "OUTPUT"
         <> long "output"
         <> short 'o'
         <> help "Output file" )
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
