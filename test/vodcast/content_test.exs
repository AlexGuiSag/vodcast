defmodule Vodcast.ContentTest do
  use Vodcast.DataCase

  alias Vodcast.Content

  describe "podcasts" do
    alias Vodcast.Content.Podcast

    @valid_attrs %{feed: "some feed", name: "some name", url: "some url"}
    @update_attrs %{feed: "some updated feed", name: "some updated name", url: "some updated url"}
    @invalid_attrs %{feed: nil, name: nil, url: nil}

    def podcast_fixture(attrs \\ %{}) do
      {:ok, podcast} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_podcast()

      podcast
    end

    test "list_podcasts/0 returns all podcasts" do
      podcast = podcast_fixture()
      assert Content.list_podcasts() == [podcast]
    end

    test "get_podcast!/1 returns the podcast with given id" do
      podcast = podcast_fixture()
      assert Content.get_podcast!(podcast.id) == podcast
    end

    test "create_podcast/1 with valid data creates a podcast" do
      assert {:ok, %Podcast{} = podcast} = Content.create_podcast(@valid_attrs)
      assert podcast.feed == "some feed"
      assert podcast.name == "some name"
      assert podcast.url == "some url"
    end

    test "create_podcast/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_podcast(@invalid_attrs)
    end

    test "update_podcast/2 with valid data updates the podcast" do
      podcast = podcast_fixture()
      assert {:ok, %Podcast{} = podcast} = Content.update_podcast(podcast, @update_attrs)
      assert podcast.feed == "some updated feed"
      assert podcast.name == "some updated name"
      assert podcast.url == "some updated url"
    end

    test "update_podcast/2 with invalid data returns error changeset" do
      podcast = podcast_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_podcast(podcast, @invalid_attrs)
      assert podcast == Content.get_podcast!(podcast.id)
    end

    test "delete_podcast/1 deletes the podcast" do
      podcast = podcast_fixture()
      assert {:ok, %Podcast{}} = Content.delete_podcast(podcast)
      assert_raise Ecto.NoResultsError, fn -> Content.get_podcast!(podcast.id) end
    end

    test "change_podcast/1 returns a podcast changeset" do
      podcast = podcast_fixture()
      assert %Ecto.Changeset{} = Content.change_podcast(podcast)
    end
  end
end
