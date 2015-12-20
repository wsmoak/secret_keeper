defmodule SecretKeeper.PageController do
  use SecretKeeper.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
