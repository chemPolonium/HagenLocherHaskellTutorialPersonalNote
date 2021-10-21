import Data.Maybe (fromJust)
import System.Environment (getArgs, getProgName, lookupEnv)
import System.Exit (exitFailure, exitSuccess)

-- getEnvironment :: IO [(String, String)]

printHelp :: IO ()
printHelp = do
  progName <- getProgName
  putStrLn $ "Usage: " ++ progName ++ " [-h | --help | -v | --version] <greeting>"

printVersion :: IO ()
printVersion = putStrLn "v1"

mainAct :: [String] -> IO ()
mainAct [] = do
  putStrLn "Needs a Greeting!"
  printHelp
  exitFailure
mainAct args = do
  let greeting = unwords args
  name <- lookupEnv "USERNAME"
  putStrLn $ maybe "No user to greet!" (\name -> greeting ++ " " ++ name) name

main :: IO ()
main = do
  args <- getArgs
  if "-h" `elem` args || "--help" `elem` args
    then printHelp >> exitSuccess
    else
      if "-v" `elem` args || "--version" `elem` args
        then printVersion >> exitSuccess
        else mainAct args