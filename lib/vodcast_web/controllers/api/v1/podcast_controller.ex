defmodule VodcastWeb.Api.V1.PodcastController do
  use VodcastWeb, :controller

  alias Vodcast.Content.Podcas

  def index(conn, _params) do
    podcasts = Repo.all(podcast)
    render(conn, "index.json", podcast: podcast)
  end

  def show(conn, %{"id" => id}) do
    podcast = Repo.get!(Podcast, id)
    render(conn, "show.json", podcast: podcast)
  end
end
