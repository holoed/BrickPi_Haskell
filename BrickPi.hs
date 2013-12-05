
import Data.Char
import BrickPi_Serial



main = do h <- serialOpen "/dev/ttyAMA0" 500000
          print (show h)
          sequence_ (map (serialPutchar h) (map chr [1,218,4,3,132,28,50]))
          getLine
          sequence_ (map (serialPutchar h) (map chr [1,2,4,3,140,60,50]))
          getLine
          serialClose h
          return ()