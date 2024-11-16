module CLI (CliArgs(..), cliParser) where

import Options.Applicative (Parser, argument, str, metavar, help, long, short, switch)

data CliArgs = Args
  { text :: String
  , test :: Bool }

cliParser :: Parser CliArgs
cliParser = Args
      <$> argument str
          ( metavar "TEXT"
         <> help "Input text" )
      <*> switch
          ( long "test"
         <> short 't'
         <> help "test test test" )
