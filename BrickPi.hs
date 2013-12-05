
import Data.Char
import BrickPi_Serial

send :: Int -> [Int] -> IO ()
send h xs = sequence_ (map (serialPutchar h) (map chr xs))

main = do h <- serialOpen "/dev/ttyAMA0" 500000
          print (show h)
          print "Go Forward"
          send h [1,218,4,3,132,28,50]
          getLine
          print "Go Backward"
          send h [1,2,4,3,140,60,50]
          getLine
          print "Turn Left"
          send h [1,226,4,3,140,28,50]
          getLine
          print "Turn Right"
          send h [1,250,4,3,132,60,50]
          getLine
          serialClose h
          return ()