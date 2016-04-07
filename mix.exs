defmodule RideCommons.Mixfile do
  use Mix.Project

  def project do
    [app: :ride_commons,
     version: "0.1.0",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :exjsx, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:exjsx, "~> 3.2.0"},
      {:httpoison, "~> 0.8.2"},
      {:retry, git: "https://github.com/ride/ElixirRetry.git"},
    ]
  end
end
