defmodule RideCommons.HTTP do
  use Retry

  @http_mod Application.get_env(:ride_commons, :http_module, HTTPoison)
  @retry_limit 3
  @retry_sleep 100

  def get(url, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(@http_mod.get(url, headers, options))
    end
  end

  def get!(url, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(@http_mod.get!(url, headers, options))
    end
  end

  def post(url, body, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(@http_mod.post(url, body, headers, options))
    end
  end

  def post!(url, body, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response!(@http_mod.post!(url, body, headers, options))
    end
  end

  def put(url, body, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(@http_mod.put(url, body, headers, options))
    end
  end

  def put!(url, body, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(@http_mod.put!(url, body, headers, options))
    end
  end

  def patch(url, body, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(@http_mod.patch(url, body, headers, options))
    end
  end

  def patch!(url, body, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response!(@http_mod.patch!(url, body, headers, options))
    end
  end

  def delete(url, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(@http_mod.delete(url, headers, options))
    end
  end

  def delete!(url, headers, options \\ []) do
    retry @retry_limit in @retry_sleep do
      process_response(@http_mod.delete!(url, headers, options))
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
