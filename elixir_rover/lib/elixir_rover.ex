defmodule ElixirRover do
  # Physical pins 13,15,16,18
  # GPIO27,GPIO22,GPIO23,GPIO24
  alias ElixirALE.GPIO
  alias ElixirRover.{ Driver }

  @pin_left_motor_forward 13
  @pin_left_motor_backward 15
  @pin_right_motor_forward 16
  @pin_right_motor_backward 18

  def pin_to_gpio(pin) do
    case pin do
      13 -> 27
      15 -> 22
      16 -> 23
      18 -> 24
    end
  end

  def start do
    { :ok, pid_right_forward } = GPIO.start_link(pin_to_gpio(@pin_right_motor_forward), :output)
    { :ok, pid_right_backward } = GPIO.start_link(pin_to_gpio(@pin_right_motor_backward), :output)
    { :ok, pid_left_forward } = GPIO.start_link(pin_to_gpio(@pin_left_motor_forward), :output)
    { :ok, pid_left_backward } = GPIO.start_link(pin_to_gpio(@pin_left_motor_backward), :output)

    Agent.start_link(fn ->
      %{
        pid_right_forward: pid_right_forward,
        pid_right_backward: pid_right_backward,
        pid_left_forward: pid_left_forward,
        pid_left_backward: pid_left_backward,
      }
    end, name: :motor_pids)

    Agent.start_link(fn -> :queue.new() end, name: :driver_queue)
  end

  def command(movement) do
    case movement do
      "L" -> turn_left
      "M" -> move
      "R" -> turn_right
    end
  end

  def turn_left do
    Driver.turn_left
  end

  def turn_right do
    Driver.turn_right
  end

  def move do
    Driver.move
  end

end