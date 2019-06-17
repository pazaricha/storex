# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :storex,
  ecto_repos: [Storex.Repo]

# Configures the endpoint
config :storex, StorexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Jp5a2HMUgcKElmcse4MwhgFOr4VmKs6lqBtw9/vNqF21AXwSAzO2+ETws9Iofatc",
  render_errors: [view: StorexWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Storex.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
