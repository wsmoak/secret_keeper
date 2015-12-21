defmodule SecretKeeper.LoginController do
  use SecretKeeper.Web, :controller

  alias SecretKeeper.User

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, %{"login" => login_params}) do
    email = login_params["email"]
    user = Repo.one(from u in User, where: u.email == ^email)
    if Comeonin.Bcrypt.checkpw(login_params["password"], user.password_hash) do
      conn
      |> put_flash(:info, "Successful login.")
      |> render("index.html")
    else
      conn
      |> put_flash(:error, "Nope.")
      |> render("index.html")
    end
  end

end
