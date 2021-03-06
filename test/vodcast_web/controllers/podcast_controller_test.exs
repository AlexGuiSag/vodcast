defmodule VodcastWeb.PodcastControllerTest do
  use VodcastWeb.ConnCase

  alias Vodcast.Content

  @create_attrs %{feed: "some feed", name: "some name", url: "some url"}
  @update_attrs %{feed: "some updated feed", name: "some updated name", url: "some updated url"}
  @invalid_attrs %{feed: nil, name: nil, url: nil}

  def fixture(:podcast) do
    {:ok, podcast} = Content.create_podcast(@create_attrs)
    podcast
  end

  describe "index" do
    test "lists all podcasts", %{conn: conn} do
      conn = get(conn, Routes.podcast_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Podcasts"
    end
  end

  describe "new podcast" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.podcast_path(conn, :new))
      assert html_response(conn, 200) =~ "New Podcast"
    end
  end

  describe "create podcast" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.podcast_path(conn, :create), podcast: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.podcast_path(conn, :show, id)

      conn = get(conn, Routes.podcast_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Podcast"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.podcast_path(conn, :create), podcast: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Podcast"
    end
  end

  describe "edit podcast" do
    setup [:create_podcast]

    test "renders form for editing chosen podcast", %{conn: conn, podcast: podcast} do
      conn = get(conn, Routes.podcast_path(conn, :edit, podcast))
      assert html_response(conn, 200) =~ "Edit Podcast"
    end
  end

  describe "update podcast" do
    setup [:create_podcast]

    test "redirects when data is valid", %{conn: conn, podcast: podcast} do
      conn = put(conn, Routes.podcast_path(conn, :update, podcast), podcast: @update_attrs)
      assert redirected_to(conn) == Routes.podcast_path(conn, :show, podcast)

      conn = get(conn, Routes.podcast_path(conn, :show, podcast))
      assert html_response(conn, 200) =~ "some updated feed"
    end

    test "renders errors when data is invalid", %{conn: conn, podcast: podcast} do
      conn = put(conn, Routes.podcast_path(conn, :update, podcast), podcast: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Podcast"
    end
  end

  describe "delete podcast" do
    setup [:create_podcast]

    test "deletes chosen podcast", %{conn: conn, podcast: podcast} do
      conn = delete(conn, Routes.podcast_path(conn, :delete, podcast))
      assert redirected_to(conn) == Routes.podcast_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.podcast_path(conn, :show, podcast))
      end
    end
  end

  defp create_podcast(_) do
    podcast = fixture(:podcast)
    %{podcast: podcast}
  end
end
