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
    {:ok, pid16} = GPIO.start_link(16, :output)
    IO.puts "Writing to pin one 16..."
    GPIO.write(pid16, 1)
    IO.puts "Done."

    :timer.sleep(2000)

    IO.puts "Writing to pin 16..."
    GPIO.write(pid16, 0)
    IO.puts "Done."

    {:ok, pid18} = GPIO.start_link(18, :output)
    IO.puts "Writing to pin one 18..."
    GPIO.write(pid18, 1)
    IO.puts "Done."

    :timer.sleep(2000)

    IO.puts "Writing to pin 18..."
    GPIO.write(pid18, 0)
    IO.puts "Done."

  end
end
