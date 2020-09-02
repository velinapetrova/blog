defmodule BlogWeb.UserSessionController do
  use BlogWeb, :controller

  alias Blog.Accounts
  alias BlogWeb.UserAuth

  @spec new(Plug.Conn.t(), any) :: Plug.Conn.t()
  def new(conn, _params) do
    conn
    |> put_layout("login.html")
    |> render("new.html")
  end

  def create(conn, %{"user" => user_params}) do
    %{"email" => email, "password" => password} = user_params

    if user = Accounts.get_user_by_email_and_password(email, password) do
      UserAuth.log_in_user(conn, user, user_params)
    else
      conn
      |> put_layout("login.html")
      |> put_flash(:error, "Invalid e-mail or password")
      |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UserAuth.log_out_user()
  end
end
