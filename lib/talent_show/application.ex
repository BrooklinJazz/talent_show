defmodule TalentShow.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TalentShowWeb.Telemetry,
      # Start the Ecto repository
      TalentShow.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: TalentShow.PubSub},
      # Start Finch
      {Finch, name: TalentShow.Finch},
      # Start the Endpoint (http/https)
      TalentShowWeb.Endpoint
      # Start a worker by calling: TalentShow.Worker.start_link(arg)
      # {TalentShow.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TalentShow.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TalentShowWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
