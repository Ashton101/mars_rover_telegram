defmodule ElixirRoverTest do
  use ExUnit.Case
  doctest ElixirRover

  test "greets the world" do
    assert ElixirRover.hello() == :world
  end
end
