defmodule EctestesWeb.AirportControllerTest do
  use EctestesWeb.ConnCase

  import Ectestes.AirportsFixtures

  alias Ectestes.Airports.Airport

  @create_attrs %{
    city: "some city",
    code: "some code",
    country: "some country",
    lat: "some lat",
    long: "some long",
    name: "some name",
    timzone: "some timzone"
  }
  @update_attrs %{
    city: "some updated city",
    code: "some updated code",
    country: "some updated country",
    lat: "some updated lat",
    long: "some updated long",
    name: "some updated name",
    timzone: "some updated timzone"
  }
  @invalid_attrs %{
    city: nil,
    code: nil,
    country: nil,
    lat: nil,
    long: nil,
    name: nil,
    timzone: nil
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all airports", %{conn: conn} do
      conn = get(conn, Routes.airport_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create airport" do
    test "renders airport when data is valid", %{conn: conn} do
      conn = post(conn, Routes.airport_path(conn, :create), airport: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.airport_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "city" => "some city",
               "code" => "some code",
               "country" => "some country",
               "lat" => "some lat",
               "long" => "some long",
               "name" => "some name",
               "timzone" => "some timzone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.airport_path(conn, :create), airport: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update airport" do
    setup [:create_airport]

    test "renders airport when data is valid", %{conn: conn, airport: %Airport{id: id} = airport} do
      conn = put(conn, Routes.airport_path(conn, :update, airport), airport: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.airport_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "city" => "some updated city",
               "code" => "some updated code",
               "country" => "some updated country",
               "lat" => "some updated lat",
               "long" => "some updated long",
               "name" => "some updated name",
               "timzone" => "some updated timzone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, airport: airport} do
      conn = put(conn, Routes.airport_path(conn, :update, airport), airport: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete airport" do
    setup [:create_airport]

    test "deletes chosen airport", %{conn: conn, airport: airport} do
      conn = delete(conn, Routes.airport_path(conn, :delete, airport))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.airport_path(conn, :show, airport))
      end
    end
  end

  defp create_airport(_) do
    airport = airport_fixture()
    %{airport: airport}
  end
end
