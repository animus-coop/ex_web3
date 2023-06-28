# ExWeb3

[![Elixir CI](https://github.com/animus-coop/ex_web3/actions/workflows/elixir.yml/badge.svg)](https://github.com/animus-coop/ex_web3/actions/workflows/elixir.yml)
[![License](https://img.shields.io/badge/License-MIT-blue)](https://github.com/animus-coop/ex_web3/blob/master/LICENSE.md)
[![Coverage Status](https://coveralls.io/repos/github/animus-coop/ex_web3/badge.svg?branch=main)](https://coveralls.io/github/animus-coop/ex_web3?branch=main)

**This library is Work in Progress. Please don't use yet**

Elixir library to connect and interact with Ethereum blockchain contracts.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_web3` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_web3, "~> 0.1.0"}
  ]
end
```

Add configs:
```elixir
config :ex_web3,
  url: System.get_env("web3", "http://localhost:8545"),
  contract_address:
    System.get_env("CONTRACT_ADDRESS", "0x8efBF5F7EB5b114207353f4caDc1dE7D88741724"),
  contract_owner: System.get_env("CONTRACT_OWNER", "0xa1854bDAd86f65BE7B676411E166299F779617CF"),
  contract_owner_key:
    System.get_env(
      "CONTRACT_OWNER_KEY",
      "0x34ad65c123bc49bbd8c26d6fb808b6818ccab5a0e8b47c7fcbb5c035f467dbb7"
    )
```

In this case, config attempt to get values from .env first.

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/ex_web3>.

