defmodule EctestesWeb.PageController do
  use EctestesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
