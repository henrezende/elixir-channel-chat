defmodule ChannelChatWeb.PageHTML do
  use ChannelChatWeb, :html

  embed_templates "page_html/*"

  def person_name(person) do
    person.givenName || person.name || "guest"
  end
end
