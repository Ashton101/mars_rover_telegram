defmodule ElixirRover.Bot do
  @bot_name :elixir_rover

  use Telex.Bot, name: @bot_name
  use Telex.Dsl

  def handle({:command, "start", msg}, _name, _extra) do
    answer("Hi, hier is ons nou")
  end
end
