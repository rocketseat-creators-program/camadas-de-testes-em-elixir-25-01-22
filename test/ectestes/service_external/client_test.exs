defmodule Ectestes.ServiceExternal.ClientTest do
  use ExUnit.Case
  alias Ectestes.ServiceExternal.Client
  alias Ectestes.Expectations

  import Mox

  setup :verify_on_exit!

  describe "get_airports/1" do
    test "should return message erro when does not exists codecity" do
      Expectations.get_airports_expectation(
        "{\"results\":[],\"page\":1,\"limit\":10,\"totalPages\":0,\"totalResults\":0}"
      )

      {:ok, response} = Client.get_airports("xxp")

      assert response.body ==
               "{\"results\":[],\"page\":1,\"limit\":10,\"totalPages\":0,\"totalResults\":0}"
    end

    test "should return airport sucess" do
      Expectations.get_airports_expectation(
        "results\":[{\"isActive\":true,\"AirportName\":\"Rio Galeao Tom Jobim International Airport\",\"city\":\"Rio De Janeiro\",\"country\":\"Brazil\",\"AirportCode\":\"GIG\",\"citycode\":\"SBGL\",\"lat\":\"-22.80999947\",\"long\":\"-43.25055695\",\"timzone\":\"-3\",\"cityunicode\":\"S\",\"zone\":\"America/Sao_Paulo\",\"CountryCode\":\"BR\",\"id\":\"61e0734be2f371d6f4905ce4\"}],\"page\":1,\"limit\":10,\"totalPages\":1,\"totalResults\":1}"
      )

      {:ok, response} = Client.get_airports("SBGL")

      assert response.body ==
               "results\":[{\"isActive\":true,\"AirportName\":\"Rio Galeao Tom Jobim International Airport\",\"city\":\"Rio De Janeiro\",\"country\":\"Brazil\",\"AirportCode\":\"GIG\",\"citycode\":\"SBGL\",\"lat\":\"-22.80999947\",\"long\":\"-43.25055695\",\"timzone\":\"-3\",\"cityunicode\":\"S\",\"zone\":\"America/Sao_Paulo\",\"CountryCode\":\"BR\",\"id\":\"61e0734be2f371d6f4905ce4\"}],\"page\":1,\"limit\":10,\"totalPages\":1,\"totalResults\":1}"
    end
  end
end
