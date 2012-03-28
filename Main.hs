{-# LANGUAGE OverloadedStrings #-}

import qualified System.Directory as Dir
import qualified Text.Printf

import qualified Data.ByteString.Lazy.Char8 as B

import qualified Network.HTTP.Types as HTTPTypes
import qualified Network.Wai as Wai
import qualified Network.Wai.Handler.Warp as Warp


main :: IO ()
main = do
  pwd <- Dir.getCurrentDirectory
  print "Serving your current directory on port: 8080 - Be Safe!"

  Warp.run port staticServe
  where
    port = 8080


{- Doesn't list drectories or do anything fancy
 -
 - Maybe do MIME types later -}

staticServe :: Wai.Application
staticServe req = do
            return $ Wai.responseLBS (HTTPTypes.status200) []
                   $ B.pack "Hey"

