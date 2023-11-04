defmodule BanditStripeIssuesWeb.StripeHandler do
  @behaviour Stripe.WebhookHandler

  @impl true
  def handle_event(_event), do: :ok
end
