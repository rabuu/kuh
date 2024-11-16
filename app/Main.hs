module Main (main) where

import CLI

import Lib ()

import Options.Applicative

main :: IO ()
main = execParser opts >> putStrLn "Hello, world!"
  where
    opts = info (cliParser <**> helper)
      ( fullDesc
     <> header "kuh - QR code generator" )
