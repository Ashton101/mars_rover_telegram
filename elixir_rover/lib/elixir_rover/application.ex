defmodule ElixirRover.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  @target Mix.Project.config()[:target]
  require Logger

  use Application
  import Supervisor.Spec

  def start(_type, _args) do
    token = Telex.Config.get(:elixir_rover, :token)

    children = [supervisor(Telex, []), supervisor(ElixirRover.Bot, [:polling, token])]

    opts = [strategy: :one_for_one, name: ElixirRover.Supervisor]

    case Supervisor.start_link(children, opts) do
      {:ok, _} = ok ->
        Logger.info("Starting Elixir Rover")
        ok

      error ->
        Logger.error("Error starting Elixir Rover")
        error
    end
  end
end
