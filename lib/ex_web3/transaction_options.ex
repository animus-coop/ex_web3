defmodule WEB3.TransactionOptions do
  @moduledoc "Struct to prepare the transaction options"

  @type t :: %__MODULE__{
          from: String.t(),
          gas_price: pos_integer(),
          gas: pos_integer,
          value: pos_integer()
        }

  defstruct [
    :from,
    :gas_price,
    :gas,
    :value
  ]
end
