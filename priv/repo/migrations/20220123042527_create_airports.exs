defmodule Ectestes.Repo.Migrations.CreateAirports do
  use Ecto.Migration

  def change do
    create table(:airports, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :code, :string
      add :city, :string
      add :country, :string
      add :lat, :string
      add :long, :string
      add :timzone, :string

      timestamps()
    end
  end
end
