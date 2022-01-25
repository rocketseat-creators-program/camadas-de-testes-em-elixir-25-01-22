defmodule Ectestes.ServiceExternal.Client do
  @behaviour Ectestes.ServiceExternal.HttpAdpater
  def get_airports(citycode) do
    HTTPoison.get("https://#{base_url()}/v1/airports/#{citycode}", headers())
  end

  def base_url, do: "world-airports-directory.p.rapidapi.com"

  def headers do
    [
      "x-rapidapi-host": "world-airports-directory.p.rapidapi.com",
      "x-rapidapi-key": "59bb776f63msh386f88c8531d038p107d30jsnb955a8c613e6"
    ]
  end
end
