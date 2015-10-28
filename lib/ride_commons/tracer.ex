defmodule RideCommons.Tracer do
  def dump_args(args) do
    args |> Enum.map(&inspect/1) |> Enum.join(", ")
  end

  def dump_defn(name, args) do
    "#{inspect(name)}(#{dump_args(args)})"
  end

  defmacro def(definition={name,_,args}, do: content) do
    quote do
      Kernel.def(unquote(definition)) do
        start_time = :os.system_time(:micro_seconds)
        IO.puts "==> call: #{RideCommons.Tracer.dump_defn(unquote(name), unquote(args))}"
        result = unquote(content)
        elapsed = :os.system_time(:micro_seconds) - start_time
        IO.puts "<== result: #{inspect(result)}, elapsed time: #{inspect(elapsed)} microseconds"
        result
      end
    end
  end
end
