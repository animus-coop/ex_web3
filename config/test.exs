import Config

config :logger, level: :debug

config :ex_web3,
  url: System.get_env("ETHERIUM_URL", "http://localhost:7545"),
  contract_address:
    System.get_env("CONTRACT_ADDRESS", "0x8efBF5F7EB5b114207353f4caDc1dE7D88741724"),
  contract_owner: System.get_env("CONTRACT_OWNER", "0xa1854bDAd86f65BE7B676411E166299F779617CF"),
  contract_owner_key:
    System.get_env(
      "CONTRACT_OWNER_KEY",
      "0x34ad65c123bc49bbd8c26d6fb808b6818ccab5a0e8b47c7fcbb5c035f467dbb7"
    )
