module Main (main) where

import CLI
import Lib

import Options.Applicative
import Diagrams.Prelude
import Diagrams.Backend.SVG

main :: IO ()
main = main' =<< execParser opts
  where
    opts = info (cliParser <**> helper)
      ( fullDesc
     <> header "kuh - QR code generator" )

main' :: CliArgs -> IO ()
main' args = r "test.svg" (dims2D d d) (renderMatrix testMatrix)
  where r = if prettySvg args then renderPretty else renderSVG
        d = dim args
