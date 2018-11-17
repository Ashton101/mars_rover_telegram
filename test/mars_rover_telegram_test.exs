defmodule MarsRoverTelegramTest do
  use ExUnit.Case
  doctest MarsRoverTelegram

  test "greets the world" do
    assert MarsRoverTelegram.hello() == :world
  end
end
