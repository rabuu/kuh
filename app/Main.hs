module Main (main) where

import qualified CLI
import Lib

import Options.Applicative
import Diagrams.Prelude
import Diagrams.Backend.SVG

main :: IO ()
main = main' =<< execParser opts
  where
    opts = info (CLI.cliParser <**> helper)
      ( fullDesc
     <> header "kuh - QR code generator" )

main' :: CLI.Args -> IO ()
main' args = renderer (CLI.outputFile args) (dims2D d d) (renderMatrix testMatrix)
  where
    renderer = if CLI.prettySvg args then renderPretty else renderSVG
    d = CLI.dimension args
