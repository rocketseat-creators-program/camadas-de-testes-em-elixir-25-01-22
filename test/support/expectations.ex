defmodule Ectestes.Expectations do
  @moduledoc """
  Support module that groups expectation functions
  """

  import Mox

  alias Ectestes.ServiceExternal.ClientMock

  def get_airports_expectation(message) do
    expect(ClientMock, :get_airports, fn _ ->
      {:ok,
       %{
         body: message
       }}
    end)
  end
end
