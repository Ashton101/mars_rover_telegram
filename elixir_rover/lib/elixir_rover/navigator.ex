defmodule ElixirRover.Navigator do
  alias ElixirRover.{Driver}

  @doc """
    moves the rover from a any string of valid commands

    ## Examples

        iex> ElixirRover.Navigator.move({:direction, "MLR"})
        {:ok, "moved - on local or errored"}

  """

  def move({:direction, "L"}) do
    Driver.turn_left()
  end

  def move({:direction, "M"}) do
    Driver.move()
  end

  def move({:direction, "R"}) do
    Driver.turn_right()
  end

  def move({:direction, some_string}) when byte_size(some_string) >= 1 do
    [head | tail]  = String.graphemes(some_string)
    move({:direction, head})
    move({:direction, tail |> Enum.join})
  end

  def move({:direction, invalid_move}) do
    {:ok, "Invalid command #{invalid_move}"}
  end
end
