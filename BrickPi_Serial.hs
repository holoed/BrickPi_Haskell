{-# LANGUAGE ForeignFunctionInterface #-}
module BrickPi_Serial where

import Data.Char
import Foreign.C -- get the C types

foreign import ccall "wiringPi.h wiringPiSetup" c_wiringPiSetup :: IO CInt
wiringPiSetup :: IO Int
wiringPiSetup = fmap fromIntegral c_wiringPiSetup

--extern int   serialOpen      (const char *device, const int baud) ;
--extern void  serialClose     (const int fd) ;
--extern void  serialFlush     (const int fd) ;
--extern void  serialPutchar   (const int fd, const unsigned char c) ;
--extern void  serialPuts      (const int fd, const char *s) ;
--extern void  serialPrintf    (const int fd, const char *message, ...) ;
--extern int   serialDataAvail (const int fd) ;
--extern int   serialGetchar   (const int fd) ;

foreign import ccall "wiringSerial.h serialOpen" c_serialOpen :: CString -> CInt -> IO CInt
serialOpen :: String -> Int -> IO Int
serialOpen port baud = fmap fromIntegral (withCString port (\s -> c_serialOpen s (fromIntegral baud)))  

foreign import ccall "wiringSerial.h serialClose" c_serialClose :: CInt -> IO ()
serialClose :: Int -> IO ()
serialClose h = c_serialClose (fromIntegral h)

foreign import ccall "wiringSerial.h serialPutchar" c_serialPutchar :: CInt -> CUChar -> IO ()
serialPutchar :: Int -> Char -> IO ()
serialPutchar h ch = c_serialPutchar (fromIntegral h) (castCharToCUChar ch)
