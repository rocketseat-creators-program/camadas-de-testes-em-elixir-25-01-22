import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :ectestes, Ectestes.Repo,
  username: System.get_env("DB_USER"),
  password: System.get_env("DB_PASSWORD"),
  database: "ectestes_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ectestes, EctestesWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "yluojPNk7BRqjNMzDRa6Ozz33HAj8ND1AbrnGhUy8tH0r5D6scUNZIyv2yGjhDjk",
  server: false

# In test we don't send emails.
config :ectestes, Ectestes.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :ectestes, Ectestes.ServiceExternal.Client, adapter: Ectestes.ServiceExternal.HttpAdpater
