import RPi.GPIO as GPIO
import time

# We're using the physical board pin numbers

GPIO.setmode(GPIO.BOARD)

# define which pins we are driving the L298N with

DirectionOnePin = 16
DirectionTwoPin = 18

DirectionThreePin = 13
DirectionFourPin = 15

# Define how we are using these pins

GPIO.setup(DirectionOnePin, GPIO.OUT)
GPIO.setup(DirectionTwoPin, GPIO.OUT)
GPIO.setup(DirectionThreePin, GPIO.OUT)
GPIO.setup(DirectionFourPin, GPIO.OUT)

print("Motor A Direction forward")
GPIO.output(DirectionOnePin, GPIO.HIGH)
time.sleep(2)
GPIO.output(DirectionOnePin, GPIO.LOW)

print("Motor A Direction backward")
GPIO.output(DirectionTwoPin, GPIO.HIGH)
time.sleep(2)
GPIO.output(DirectionTwoPin, GPIO.LOW)

print("Motor B Direction forward")
GPIO.output(DirectionThreePin, GPIO.HIGH)
time.sleep(2)
GPIO.output(DirectionThreePin, GPIO.LOW)

print("Motor B Direction backward")
GPIO.output(DirectionFourPin, GPIO.HIGH)
time.sleep(2)
GPIO.output(DirectionFourPin, GPIO.LOW)


# This command clears the configuration from the GPIO interface
GPIO.cleanup()
