defmodule VodcastWeb.Api.V1.PodcastView do
  use VodcastWeb, :view


  def render("index.json", %{podcast: podcast}) do
    %{data: render_many(podcasts, VodcastWeb.Api.V1.PodcastView, "podcast.json")}
  end

  def render("show.json", %{podcast: podcast}) do
    %{data: render_one(podcast, VodcastWeb.Api.V1.MovieView, "podcast.json")}
  end

  def render("movie.json", %{podcast: podcast}) do
    %{id: podcast.id,
      name: podcast.title,
      feed: podcast.feed,
      url: podcast.url,
     }
  end

end
