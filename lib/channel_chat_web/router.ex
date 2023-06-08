defmodule ChannelChatWeb.Router do
  use ChannelChatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ChannelChatWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :authOptional, do: plug(AuthPlugOptional)

  scope "/", ChannelChatWeb do
    pipe_through [:browser, :authOptional]

    get "/", PageController, :home
    get "/login", AuthController, :login
    get "/logout", AuthController, :logout
  end
end
