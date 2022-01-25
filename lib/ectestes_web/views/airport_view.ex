defmodule EctestesWeb.AirportView do
  use EctestesWeb, :view
  alias EctestesWeb.AirportView

  def render("index.json", %{airports: airports}) do
    %{data: render_many(airports, AirportView, "airport.json")}
  end

  def render("show.json", %{airport: airport}) do
    %{data: render_one(airport, AirportView, "airport.json")}
  end

  def render("airport.json", %{airport: airport}) do
    %{
      id: airport.id,
      name: airport.name,
      code: airport.code,
      city: airport.city,
      country: airport.country,
      lat: airport.lat,
      long: airport.long,
      timzone: airport.timzone
    }
  end
end
