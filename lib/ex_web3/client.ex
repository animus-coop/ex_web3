defmodule WEB3.Client do
  alias Finch

  # alias WEB3.TransactionOptions
  # Cambia esto por la URL correcta de tu nodo Ganache
  @ganache_url Application.get_env(:ex_web3, :url)

  @moduledoc """
  Documentation for `ExWeb3`.
  """

  @doc """
  Get nonce

  ## Examples

      iex> WEB.Client.get_nonce("0xa1854bDAd86f65BE7B676411E166299F779617CF")
      {:ok, {0, "x0"}}

  """
  @spec get_nonce(String.t()) :: {:error, String.t()} | {:ok, {integer, binary}}
  def get_nonce(address) do
    body =
      %{
        id: 1,
        jsonrpc: "2.0",
        method: "eth_getTransactionCount",
        params: [address, "pending"]
      }
      |> Jason.encode!()

    headers = []

    with request <- Finch.build(:post, @ganache_url, headers, body),
         {:ok, %{:status => 200, :body => body}} <- Finch.request(request, WEB3.Finch),
         nonce_hex <- Jason.decode!(body)["result"],
         nonce <- Integer.parse(nonce_hex, 16) do
      {:ok, nonce}
    else
      _ -> {:error, "Error retrieving nonce."}
    end
  end
end
