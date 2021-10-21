import Control.Exception (Exception, SomeException, catch, throw)

data MyError = Error deriving (Show)

instance Exception MyError

failing :: IO ()
failing = do
  throw Error

main :: IO ()
main = do
  catch
    failing
    ( \e -> do
        let t = (e :: SomeException)
        putStrLn "Something went wrong"
    )
