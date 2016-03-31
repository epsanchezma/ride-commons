defmodule RideCommons.HTTP do
  use Retry

  @retry_limit 3
  @retry_sleep 100

  def get(url, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(HTTPoison.get(url, headers, options))
    end
  end

  def get!(url, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(HTTPoison.get!(url, headers, options))
    end
  end

  def post(url, body, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(HTTPoison.post(url, body, headers, options))
    end
  end

  def post!(url, body, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response!(HTTPoison.post!(url, body, headers, options))
    end
  end

  def put(url, body, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(HTTPoison.put(url, body, headers, options))
    end
  end

  def put!(url, body, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(HTTPoison.put!(url, body, headers, options))
    end
  end

  def patch(url, body, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(HTTPoison.patch(url, body, headers, options))
    end
  end

  def patch!(url, body, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response!(HTTPoison.patch!(url, body, headers, options))
    end
  end

  def delete(url, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(HTTPoison.delete(url, headers, options))
    end
  end

  def delete!(url, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(HTTPoison.delete!(url, headers, options))
    end
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
