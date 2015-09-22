defmodule RideCommons.JSON do
  def encode_json(body, opts \\ []) do
    JSX.encode(body, opts)
  end

  def encode_json!(body, opts \\ []) do
    JSX.encode!(body, opts)
  end

  def decode_json(body, opts \\ [{:labels, :atom}]) do
    JSX.decode(body, opts)
  end

  def decode_json!(body, opts \\ [{:labels, :atom}]) do
    JSX.decode!(body, opts)
  end
end
