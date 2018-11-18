defmodule MarsRoverTelegram do
  alias ElixirALE.GPIO
  @moduledoc """
  Documentation for MarsRoverTelegram.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MarsRoverTelegram.hello
      :world

  """
  def hello do
    :world
  end

  def test do
    {:ok, pid} = GPIO.start_link(18, :output)
    IO.puts "Writing to pin 18..."
    GPIO.write(pid, 1)
    IO.puts "Done."

    :timer.sleep(1000)

    IO.puts "Writing to pin 18..."
    GPIO.write(pid, 0)
    IO.puts "Done."
  end
end
