defmodule BanditStripeIssues.Repo do
  use Ecto.Repo,
    otp_app: :bandit_stripe_issues,
    adapter: Ecto.Adapters.Postgres
end
