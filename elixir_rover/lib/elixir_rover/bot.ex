defmodule ElixirRover.Bot do
  alias ElixirRover.{ Navigator }

  @bot_name :elixir_rover

  use Telex.Bot, name: @bot_name
  use Telex.Dsl

  def handle({:command, "start", msg}, _name, _extra) do
    ElixirRover.start
    answer("Rover has started up!")
  end

  def handle({:command, "move", msg}, _name, _extra) do
    {:ok, reply} = Navigator.move({:direction, msg.text})
    answer(reply)
  end


end
