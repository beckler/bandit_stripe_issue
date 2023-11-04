defmodule BanditStripeIssues.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BanditStripeIssuesWeb.Telemetry,
      BanditStripeIssues.Repo,
      {DNSCluster, query: Application.get_env(:bandit_stripe_issues, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BanditStripeIssues.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: BanditStripeIssues.Finch},
      # Start a worker by calling: BanditStripeIssues.Worker.start_link(arg)
      # {BanditStripeIssues.Worker, arg},
      # Start to serve requests, typically the last entry
      BanditStripeIssuesWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BanditStripeIssues.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BanditStripeIssuesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
