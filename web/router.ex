defmodule SecretKeeper.Router do
  use SecretKeeper.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  scope "/", SecretKeeper do
    pipe_through [:browser, :browser_session] # Use the default browser stack

    get "/", PageController, :index
    resources "/login", LoginController
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
   scope "/api", SecretKeeper do
     pipe_through :api
   end
end
