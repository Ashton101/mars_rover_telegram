defmodule ElixirRover.Bot do
  @bot_name :elixir_rover

  use Telex.Bot, name: @bot_name
  use Telex.Dsl

  def handle({:command, "start", msg}, _name, _extra) do
    answer("Hi, hier is ons nou")
  end

  def handle({:command, "move", msg}, _name, _extra) do
    case msg.text do
      "L" ->
        ElixirRover.turn_left
        answer("moved")

      "M" ->
        ElixirRover.move
        answer("moved")

      "R" ->
        ElixirRover.turn_right
        answer("moved")
      _ ->
        answer("Invalid command #{msg}")
    end

  end
end
