defmodule RideCommons.JSON do
  def encode(body, opts \\ []) do
    JSX.encode(body, opts)
  end

  def encode!(body, opts \\ []) do
    JSX.encode!(body, opts)
  end

  def decode(body, opts \\ [{:labels, :atom}]) do
    JSX.decode(body, opts)
  end

  def decode!(body, opts \\ [{:labels, :atom}]) do
    JSX.decode!(body, opts)
  end
end
