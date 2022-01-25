defmodule Ectestes.Airports do
  use HTTPoison.Base

  @moduledoc """
  The Airports context.
  """

  import Ecto.Query, warn: false
  alias Ectestes.Repo

  alias Ectestes.Airports.Airport
  alias Ectestes.ServiceExternal.Client

  @expected_fields ~w(city codecity  airportName country lat long timzone)

  @doc """
  Returns the list of airports.

  ## Examples

      iex> list_airports()
      [%Airport{}, ...]

  """
  def list_airports do
    Repo.all(Airport)
  end

  @doc """
  Gets a single airport.

  Raises `Ecto.NoResultsError` if the Airport does not exist.

  ## Examples

      iex> get_airport!(123)
      %Airport{}

      iex> get_airport!(456)
      ** (Ecto.NoResultsError)

  """
  def get_airport!(id), do: Repo.get!(Airport, id)

  def get_airport_code(code) do
    from(a in Airport, where: a.code == ^code, select: a) |> Repo.one()
  end

  @doc """
  Creates a airport.

  ## Examples

      iex> create_airport(%{field: value})
      {:ok, %Airport{}}

      iex> create_airport(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_airport(code) do
    {:ok, result} = Client.get_airports(code)

    airport =
      result
      |> Map.get(:body)
      |> Jason.decode!()
      |> IO.inspect()

    attrs = %{
      "city" => airport["results"][:city],
      "code" => airport["results"][:citycode],
      "country" => airport["results"][:country],
      "lat" => airport["results"][:lat],
      "long" => airport["results"][:long],
      "name" => airport["results"][:airportName],
      "timzone" => airport["results"][:timzone]
    }

    %Airport{}
    |> Airport.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a airport.

  ## Examples

      iex> update_airport(airport, %{field: new_value})
      {:ok, %Airport{}}

      iex> update_airport(airport, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_airport(%Airport{} = airport, attrs) do
    airport
    |> Airport.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a airport.

  ## Examples

      iex> delete_airport(airport)
      {:ok, %Airport{}}

      iex> delete_airport(airport)
      {:error, %Ecto.Changeset{}}

  """
  def delete_airport(%Airport{} = airport) do
    Repo.delete(airport)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking airport changes.

  ## Examples

      iex> change_airport(airport)
      %Ecto.Changeset{data: %Airport{}}

  """
  def change_airport(%Airport{} = airport, attrs \\ %{}) do
    Airport.changeset(airport, attrs)
  end

  def find_or_create(code) do
    airport = from(a in Airport, where: a.code == ^code, select: a) |> Repo.one()

    case airport do
      nil ->
        create_airport(code)
        airport
    end
  end
end
