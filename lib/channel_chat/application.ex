defmodule ChannelChat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ChannelChatWeb.Telemetry,
      # Start the Ecto repository
      ChannelChat.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ChannelChat.PubSub},
      ChannelChatWeb.Presence,
      # Start the Endpoint (http/https)
      ChannelChatWeb.Endpoint
      # Start a worker by calling: ChannelChat.Worker.start_link(arg)
      # {ChannelChat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChannelChat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ChannelChatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
