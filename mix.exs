defmodule ExWeb3.MixProject do
  use Mix.Project

  @source_url "https://github.com/animus-coop/ex_web3"
  @version "0.1.0"

  def project do
    [
      app: :ex_web3,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      deps: deps(),
      docs: docs(),
      preferred_cli_env: [
        dialyzer: :test
      ],
      dialyzer: [
        flags: [:underspecs, :unknown, :unmatched_returns],
        plt_add_apps: [:mix, :jason, :iex, :logger],
        plt_add_deps: :transitive
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      description: "Elixir library to connect and interact with Ethereum blockchain contracts.",
      maintainers: ["Julian Somoza"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/animus-coop/ex_web3"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:jason, "~> 1.4"},
      {:excoveralls, "~> 0.10", only: :test},
      {:ex_abi, "~> 0.6.0"}
    ]
  end

  defp docs do
    [
      extras: [
        "CHANGELOG.md": [title: "Changelog"],
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      formatters: ["html"]
    ]
  end
end
