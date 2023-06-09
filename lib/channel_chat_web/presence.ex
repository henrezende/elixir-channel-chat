defmodule ChannelChatWeb.Presence do
  use Phoenix.Presence,
    otp_app: :channel_chat,
    pubsub_server: ChannelChat.PubSub
end
