defmodule Ectestes.AirportsTest do
  use Ectestes.DataCase

  alias Ectestes.Airports

  describe "airports" do
    alias Ectestes.Airports.Airport

    import Ectestes.AirportsFixtures

    @invalid_attrs %{
      city: nil,
      code: nil,
      country: nil,
      lat: nil,
      long: nil,
      name: nil,
      timzone: nil
    }

    test "list_airports/0 returns all airports" do
      airport = airport_fixture()
      assert Airports.list_airports() == [airport]
    end

    test "get_airport!/1 returns the airport with given id" do
      airport = airport_fixture()
      assert Airports.get_airport!(airport.id) == airport
    end

    test "create_airport/1 with valid data creates a airport" do
      valid_attrs = %{
        city: "some city",
        code: "some code",
        country: "some country",
        lat: "some lat",
        long: "some long",
        name: "some name",
        timzone: "some timzone"
      }

      assert {:ok, %Airport{} = airport} = Airports.create_airport(valid_attrs)
      assert airport.city == "some city"
      assert airport.code == "some code"
      assert airport.country == "some country"
      assert airport.lat == "some lat"
      assert airport.long == "some long"
      assert airport.name == "some name"
      assert airport.timzone == "some timzone"
    end

    test "create_airport/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Airports.create_airport(@invalid_attrs)
    end

    test "update_airport/2 with valid data updates the airport" do
      airport = airport_fixture()

      update_attrs = %{
        city: "some updated city",
        code: "some updated code",
        country: "some updated country",
        lat: "some updated lat",
        long: "some updated long",
        name: "some updated name",
        timzone: "some updated timzone"
      }

      assert {:ok, %Airport{} = airport} = Airports.update_airport(airport, update_attrs)
      assert airport.city == "some updated city"
      assert airport.code == "some updated code"
      assert airport.country == "some updated country"
      assert airport.lat == "some updated lat"
      assert airport.long == "some updated long"
      assert airport.name == "some updated name"
      assert airport.timzone == "some updated timzone"
    end

    test "update_airport/2 with invalid data returns error changeset" do
      airport = airport_fixture()
      assert {:error, %Ecto.Changeset{}} = Airports.update_airport(airport, @invalid_attrs)
      assert airport == Airports.get_airport!(airport.id)
    end

    test "delete_airport/1 deletes the airport" do
      airport = airport_fixture()
      assert {:ok, %Airport{}} = Airports.delete_airport(airport)
      assert_raise Ecto.NoResultsError, fn -> Airports.get_airport!(airport.id) end
    end

    test "change_airport/1 returns a airport changeset" do
      airport = airport_fixture()
      assert %Ecto.Changeset{} = Airports.change_airport(airport)
    end
  end
end
