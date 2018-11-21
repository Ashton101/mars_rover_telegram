defmodule ElixirRover.Bot do
  @bot_name :elixir_rover

  use Telex.Bot, name: @bot_name
  use Telex.Dsl

  def handle({:command, "start", msg}, _name, _extra) do
    answer("Hi, hier is ons nou")
  end

  def handle({:command, "move", msg}, _name, _extra) do
    case msg do
      "L" -> ElixirRover.turn_left
      "M" -> ElixirRover.move
      "R" -> ElixirRover.turn_right
      _ -> nil
    end
    answer("moved")
  end
end
