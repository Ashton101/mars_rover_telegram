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

def right_motor_forward():
  print("Motor R Direction forward")
  GPIO.output(DirectionOnePin, GPIO.HIGH)
  time.sleep(1.5)
  GPIO.output(DirectionOnePin, GPIO.LOW)

def right_motor_backward():
  print("Motor R Direction backward")
  GPIO.output(DirectionTwoPin, GPIO.HIGH)
  time.sleep(1.5)
  GPIO.output(DirectionTwoPin, GPIO.LOW)

def left_motor_forward():
  print("Motor L Direction forward")
  GPIO.output(DirectionThreePin, GPIO.HIGH)
  time.sleep(1.5)
  GPIO.output(DirectionThreePin, GPIO.LOW)

def left_motor_backward():
  print("Motor L Direction backward")
  GPIO.output(DirectionFourPin, GPIO.HIGH)
  time.sleep(1.5)
  GPIO.output(DirectionFourPin, GPIO.LOW)

def l():
  print("Motor R Direction forward")
  GPIO.output(DirectionOnePin, GPIO.HIGH)
  print("Motor L Direction backward")
  GPIO.output(DirectionFourPin, GPIO.HIGH)
  time.sleep(1.5)
  GPIO.output(DirectionOnePin, GPIO.LOW)
  GPIO.output(DirectionFourPin, GPIO.LOW)

def r():
  print("Motor R Direction backward")
  GPIO.output(DirectionTwoPin, GPIO.HIGH)
  print("Motor L Direction forward")
  GPIO.output(DirectionThreePin, GPIO.HIGH)
  time.sleep(1.5)
  GPIO.output(DirectionTwoPin, GPIO.LOW)
  GPIO.output(DirectionThreePin, GPIO.LOW)

def m():
  print("Motor R Direction forward")
  GPIO.output(DirectionOnePin, GPIO.HIGH)
  print("Motor L Direction forward")
  GPIO.output(DirectionThreePin, GPIO.HIGH)
  time.sleep(1.5)
  GPIO.output(DirectionOnePin, GPIO.LOW)
  GPIO.output(DirectionThreePin, GPIO.LOW)

right_motor_forward()
right_motor_backward()
left_motor_forward()
left_motor_backward()
l()
r()
m()

# This command clears the configuration from the GPIO interface
GPIO.cleanup()
