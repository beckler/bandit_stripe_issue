import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :bandit_stripe_issues, BanditStripeIssues.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "bandit_stripe_issues_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bandit_stripe_issues, BanditStripeIssuesWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "4IkQfz8tPDaqM2FBNmwhZ34baQyZI/+5Vncf/kZey3jz9EptkW+WApl79VOz66FA",
  server: false

# In test we don't send emails.
config :bandit_stripe_issues, BanditStripeIssues.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
