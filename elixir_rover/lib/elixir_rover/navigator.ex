defmodule ElixirRover.Navigator do
  alias ElixirRover.{ Driver }

  def move({:direction, "L"}) do
    # Agent.get(:command_queue, fn queue -> Map.get(map, :pid_left_backward) end)
    Driver.turn_left
    {:ok, "moved"}
  end

  def move({:direction, "M"}) do
    Driver.move
    {:ok, "moved"}
  end

  def move({:direction, "R"}) do
    Driver.turn_right
    {:ok, "moved"}
  end

  def move({:direction, invalid_move}) do
    {:ok, "Invalid command #{invalid_move}"}
  end

end