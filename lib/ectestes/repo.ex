defmodule Ectestes.Repo do
  use Ecto.Repo,
    otp_app: :ectestes,
    adapter: Ecto.Adapters.MyXQL
end
