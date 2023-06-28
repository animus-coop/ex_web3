defmodule WEB3.Application do
  @moduledoc """
  Configures and starts the :web3 OTP application
  """

  use Application
  import Supervisor.Spec, warn: false

  def start(_type, _args) do
    children = [
      {Finch, name: WEB3.Finch, pools: %{}}
    ]

    opts = [strategy: :one_for_one, name: WEB3.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
