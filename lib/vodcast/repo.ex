defmodule Vodcast.Repo do
  use Ecto.Repo,
    otp_app: :vodcast,
    adapter: Ecto.Adapters.Postgres
end
