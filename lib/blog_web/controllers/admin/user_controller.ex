defmodule BlogWeb.Admin.UserController do
  use BlogWeb, :controller

  alias Blog.Accounts

  def index(conn, _params) do
    conn
    |> put_layout("admin.html")
    |> render("index.html", users: Accounts.list())
  end
end
