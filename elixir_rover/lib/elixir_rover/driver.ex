defmodule ElixirRover.Driver do
  alias ElixirALE.GPIO
  require IEx

  def turn_left do
    try do
      IO.puts("Motor R Direction forward")
      pid_r = Agent.get(:motor_pids, fn map when is_map(map) -> Map.get(map, :pid_right_forward) end)

      IO.puts("Motor L Direction backward")
      pid_l = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_left_backward) end)

      GPIO.write(pid_r, 1)
      GPIO.write(pid_l, 1)

      :timer.sleep(500)

      GPIO.write(pid_r, 0)
      GPIO.write(pid_l, 0)

      {:ok, "moved"}
    catch
      :exit, _ ->
        IO.puts "Problem with :motor_ids"
        {:ok, "moved - on local or errored"}
    end
  end

  def turn_right do
    try do
      IO.puts("Motor R Direction backward")
      pid_r = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_right_backward) end)

      IO.puts("Motor L Direction forward")
      pid_l = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_left_forward) end)

      GPIO.write(pid_r, 1)
      GPIO.write(pid_l, 1)

      :timer.sleep(500)

      GPIO.write(pid_r, 0)
      GPIO.write(pid_l, 0)

      {:ok, "moved"}
    catch
      :exit, _ ->
        IO.puts "Problem with :motor_ids"
        {:ok, "moved - on local or errored"}
    end
  end

  def move do
    try do
      IO.puts("Motor R Direction forward")
      pid_r = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_right_forward) end)

      IO.puts("Motor L Direction forward")
      pid_l = Agent.get(:motor_pids, fn map -> Map.get(map, :pid_left_forward) end)

      GPIO.write(pid_r, 1)
      GPIO.write(pid_l, 1)

      :timer.sleep(1000)

      GPIO.write(pid_r, 0)
      GPIO.write(pid_l, 0)

      {:ok, "moved"}

    catch
      :exit, _ ->
        IO.puts "Problem with :motor_ids"
        {:ok, "moved - on local or errored"}
    end
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
