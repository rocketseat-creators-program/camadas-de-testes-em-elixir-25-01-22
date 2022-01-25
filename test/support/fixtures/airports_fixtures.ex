defmodule Ectestes.AirportsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ectestes.Airports` context.
  """

  @doc """
  Generate a airport.
  """
  def airport_fixture(attrs \\ %{}) do
    {:ok, airport} =
      attrs
      |> Enum.into(%{
        city: "some city",
        code: "some code",
        country: "some country",
        lat: "some lat",
        long: "some long",
        name: "some name",
        timzone: "some timzone"
      })
      |> Ectestes.Airports.create_airport()

    airport
  end
end
