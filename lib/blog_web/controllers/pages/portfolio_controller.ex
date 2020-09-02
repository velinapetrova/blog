defmodule BlogWeb.Pages.PortfolioController do
  use BlogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
