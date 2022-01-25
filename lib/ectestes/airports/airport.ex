defmodule Ectestes.Airports.Airport do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "airports" do
    field :city, :string
    field :code, :string
    field :country, :string
    field :lat, :string
    field :long, :string
    field :name, :string
    field :timzone, :string

    timestamps()
  end

  @doc false
  def changeset(airport, attrs) do
    airport
    |> cast(attrs, [:name, :code, :city, :country, :lat, :long, :timzone])
    |> validate_required([:name, :code, :city, :country, :lat, :long, :timzone])
  end
end
