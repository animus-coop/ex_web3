defmodule ExWeb3Test do
  # This tests are not mocked, so you should configure a local truffle/ganache
  # and deploy some contract and fill below the vars.
  use ExUnit.Case
  alias WEB3.TransactionOptions

  doctest WEB3
  @contract_address "0x8efBF5F7EB5b114207353f4caDc1dE7D88741724"
  @owner_address "0x797F0Da0Ea4725ad23755Ea85D73356a2ab282Eb"
  @receiver_address "0x922119D6f8D10779c11fb29C5f5Ea0d60415ef1c"
  @private_key "0x25e7082d2962a5763029c9aceff04b4863a1bcb8e7a7d070856d282b0010c250"

  test "prepare transaction options for a siple transaction" do
    struct = %TransactionOptions{
      from: @owner_address,
      gas_price: 1_000_000_000,
      gas: 1_000_000,
      value: 1_000_000_000_000_000_000
    }

    assert %{
             from: @owner_address,
             gas_price: 1_000_000_000,
             gas: 1_000_000,
             value: 1_000_000_000_000_000_000
           } = struct
  end

  test "Get nounce" do
    {:ok, {0, "x0"}} = WEB3.Client.get_nonce(@contract_address)
  end
end
