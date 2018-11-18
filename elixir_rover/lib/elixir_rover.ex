defmodule ElixirRover do
  # Physical pins 13,15,16,18
  # GPIO27,GPIO22,GPIO23,GPIO24
  alias ElixirALE.GPIO
  # alias Agent.{ Driver }

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

  end

  def turn_left do
    IO.puts("Motor R Direction forward")
    pid_r = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_right_forward) end)

    IO.puts("Motor L Direction backward")
    pid_l = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_left_backward) end)

    :timer.sleep(500)

    GPIO.write(pid_r, 0)
    GPIO.write(pid_l, 0)
  end

  def turn_right do
    IO.puts("Motor R Direction backward")
    pid_r = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_right_backward) end)

    IO.puts("Motor L Direction forward")
    pid_l = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_left_forward) end)

    :timer.sleep(500)

    GPIO.write(pid_r, 0)
    GPIO.write(pid_l, 0)
  end

  def move do
    IO.puts("Motor R Direction forward")
    pid_r = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_right_forward) end)

    IO.puts("Motor L Direction forward")
    pid_l = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_left_forward) end)

    :timer.sleep(1000)

    GPIO.write(pid_r, 0)
    GPIO.write(pid_l, 0)
  end

  def right_motor_forward do
    IO.puts("Motor R Direction forward")
    pid = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_right_forward) end)
    GPIO.write(pid, 1)
    :timer.sleep(1500)
    GPIO.write(pid, 0)
  end

  def right_motor_backward do
    IO.puts("Motor R Direction backward")
    pid = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_right_backward) end)
    GPIO.write(pid, 1)
    :timer.sleep(1500)
    GPIO.write(pid, 0)
  end

  def left_motor_forward do
    IO.puts("Motor L Direction forward")
    pid = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_left_forward) end)
    GPIO.write(pid, 1)
    :timer.sleep(1500)
    GPIO.write(pid, 0)
  end

  def left_motor_backward do
    IO.puts("Motor L Direction backward")
    pid = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_left_backward) end)
    GPIO.write(pid, 1)
    :timer.sleep(1500)
    GPIO.write(pid, 0)
  end

end