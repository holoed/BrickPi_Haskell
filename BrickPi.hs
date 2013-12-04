import Data.Bits
import qualified Data.ByteString.Char8 as B
import System.Hardware.Serialport

port :: String
port = "/dev/ttyAMA0"

brickPiSetup :: () -> IO SerialPort
brickPiSetup () = openSerial port defaultSerialSettings

close :: SerialPort -> IO ()
close = closeSerial 
         


main :: IO()
main = do sp <- brickPiSetup ()
          close sp
          return ()