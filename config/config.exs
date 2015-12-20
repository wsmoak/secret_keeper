# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :secret_keeper, SecretKeeper.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "z/hWpLwXw8tUTkV+0rttwYQA5BUf9xpjhlzNxNXhjZ1tv4ehubf94zG5OI6fN2M0",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: SecretKeeper.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "SecretKeeper",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "5TDVCSTHt+X/uJNr0fV7QKJTlCVS//3Dxudqib3xrrriRF7wUgne5AyD1BT2LCKG",
  serializer: SecretKeeper.GuardianSerializer
