defmodule RideCommons.HTTP do

  def get(url, headers) do
    process_response(HTTPoison.get(url, headers))
  end

  def get!(url, headers) do
    process_response(HTTPoison.get!(url, headers))
  end

  def post(url, data, headers) do
    process_response(HTTPoison.post(url, data, headers))
  end

  def post!(url, data, headers) do
    process_response!(HTTPoison.post!(url, data, headers))
  end

  def put(url, body, headers) do
    process_response(HTTPoison.put(url, body, headers))
  end

  def put!(url, body, headers) do
    process_response(HTTPoison.put!(url, body, headers))
  end

  def patch(url, body, headers) do
    process_response(HTTPoison.patch(url, body, headers))
  end

  def patch!(url, body, headers) do
    process_response!(HTTPoison.patch!(url, body, headers))
  end

  def delete(url, headers) do
    process_response(HTTPoison.delete(url, headers))
  end

  def delete!(url, headers) do
    process_response(HTTPoison.delete!(url, headers))
  end

  defp process_response(response) do
    case response do
      {:ok, resp} -> {resp.status_code, resp.headers, resp.body}
      {:error, error} -> {:error, error.reason}
    end
  end

  defp process_response!(response) do
    {response.status_code, response.headers, response.body}
  end
end