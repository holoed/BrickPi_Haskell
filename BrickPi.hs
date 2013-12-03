import Data.Bits
import qualified Data.ByteString.Char8 as B
import System.Hardware.Serialport

port = "/dev/ttyAMA0"

baudrate = 500000

port_A = 0
port_B = 1
port_C = 2
port_D = 3

port_1 = 0
port_2 = 1
port_3 = 2
port_4 = 3

mask_D0_M :: Int
mask_D0_M = 0x01
mask_D1_M = 0x02
mask_9V   = 0x04
mask_D0_S = 0x08
mask_D1_S = 0x10

byte_msg_type             = 0 -- MSG_TYPE is the first byte.
msg_type_change_addr      = 1 -- Change the UART address.
msg_type_sensor_type      = 2 -- Change/set the sensor type.
msg_type_values           = 3 -- Set the motor speed and direction, and return the sesnors and encoders.
msg_type_e_stop           = 4 -- Float motors immidately
msg_type_timeout_settings = 5 -- Set the timeout

-- New UART address (MSG_TYPE_CHANGE_ADDR)
byte_new_address = 1

-- Sensor setup (MSG_TYPE_SENSOR_TYPE)
byte_sensor_1_type = 1
byte_sensor_2_type = 2

byte_timeout = 1

type_motor_pwm               = 0
type_motor_speed             = 1
type_motor_position          = 2

type_sensor_raw              = 0 -- - 31
type_sensor_light_off        = 0
type_sensor_light_on         = (mask_D0_M .|. mask_D0_S)
type_sensor_touch            = 32
type_sensor_ultrasonic_cont  = 33
type_sensor_ultrasonic_ss    = 34
type_sensor_rcx_light        = 35 -- tested minimally
type_sensor_color_full       = 36
type_sensor_color_red        = 37
type_sensor_color_green      = 38
type_sensor_color_blue       = 39
type_sensor_color_none       = 40
type_sensor_i2c              = 41
type_sensor_i2c_9v           = 42

bit_i2c_mid  = 0x01  -- Do one of those funny clock pulses between writing and reading. defined for each device.
bit_i2c_same = 0x02  -- The transmit data, and the number of bytes to read and write isn't going to change. defined for each device.

index_red   = 0
index_green = 1
index_blue  = 2
index_blank = 3

main :: IO()
main = print "Hello"