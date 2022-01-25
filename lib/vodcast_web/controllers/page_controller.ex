defmodule VodcastWeb.PageController do
  use VodcastWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
