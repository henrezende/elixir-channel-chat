defmodule ChannelChat.Repo do
  use Ecto.Repo,
    otp_app: :channel_chat,
    adapter: Ecto.Adapters.Postgres
end
