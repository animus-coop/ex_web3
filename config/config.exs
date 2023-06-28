import Config

config :ex_web3,
  node_url: "http://localhost:8545"

import_config "#{config_env()}.exs"
