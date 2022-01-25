defmodule Ectestes.ServiceExternal.HttpAdpater do
  @type response :: {:ok, String.t()} | {:error, any()}

  @callback get_airports(String.t()) :: response()

  @spec adapter :: module()
  defp adapter do
    Application.get_env(:ectestes, __MODULE__)[:http_adapter]
  end

  @spec get_airports(String.t()) :: response()
  def get_airports(citycode) do
    adapter().get_airports(citycode)
  end
end
