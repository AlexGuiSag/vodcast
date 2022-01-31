defmodule Vodcast.Content.Podcast do
  use Ecto.Schema
  import Ecto.Changeset

  schema "podcasts" do
    field :feed, :string
    field :name, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(podcast, attrs) do
    podcast
    |> cast(attrs, [:name, :feed, :url])
    |> validate_required([:name, :feed, :url])
  end
end
