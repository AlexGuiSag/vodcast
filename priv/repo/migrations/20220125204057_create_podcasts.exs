defmodule Vodcast.Repo.Migrations.CreatePodcasts do
  use Ecto.Migration

  def change do
    create table(:podcasts) do
      add :name, :string
      add :feed, :string
      add :url, :string

      timestamps()
    end

  end
end
