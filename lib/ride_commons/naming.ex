defmodule RideCommons.Naming do
  def dasherize(""), do: ""

  def dasherize(<<h, t :: binary>>) do
    <<to_lower_char(h)>> <> do_dasherize(t, h)
  end

  defp do_dasherize(<<h, t, rest :: binary>>, _) when h in ?A..?Z and not (t in ?A..?Z or t == ?.) do
    <<?-, to_lower_char(h), t>> <> do_dasherize(rest, t)
  end

  defp do_dasherize(<<h, t :: binary>>, prev) when h in ?A..?Z and not prev in ?A..?Z do
    <<?-, to_lower_char(h)>> <> do_dasherize(t, h)
  end

  defp do_dasherize(<<?., t :: binary>>, _) do
    <<?/>> <> dasherize(t)
  end

  defp do_dasherize(<<h, t :: binary>>, _) do
    <<to_lower_char(h)>> <> do_dasherize(t, h)
  end

  defp do_dasherize(<<>>, _) do
    <<>>
  end

  def underscore(""), do: ""

  def underscore(<<h, t :: binary>>) do
    <<to_lower_char(h)>> <> do_underscore(t, h)
  end

  defp do_underscore(<<h, t, rest :: binary>>, _) when h in ?A..?Z and not (t in ?A..?Z or t == ?.) do
    <<?_, to_lower_char(h), t>> <> do_underscore(rest, t)
  end

  defp do_underscore(<<h, t :: binary>>, prev) when h in ?A..?Z and not prev in ?A..?Z do
    <<?_, to_lower_char(h)>> <> do_underscore(t, h)
  end

  defp do_underscore(<<?., t :: binary>>, _) do
    <<?/>> <> underscore(t)
  end

  defp do_underscore(<<h, t :: binary>>, _) do
    <<to_lower_char(h)>> <> do_underscore(t, h)
  end

  defp do_underscore(<<>>, _) do
    <<>>
  end

  defp to_lower_char(char) when char in ?A..?Z, do: char + 32
  defp to_lower_char(char), do: char

  def camelize(""), do: ""

  def camelize(<<?_, t :: binary>>) do
    camelize(t)
  end

  def camelize(<<h, t :: binary>>) do
    <<to_upper_char(h)>> <> do_camelize(t)
  end

  defp do_camelize(<<?_, ?_, t :: binary>>) do
    do_camelize(<< ?_, t :: binary >>)
  end

  defp do_camelize(<<?_, h, t :: binary>>) when h in ?a..?z do
    <<to_upper_char(h)>> <> do_camelize(t)
  end

  defp do_camelize(<<?_>>) do
    <<>>
  end

  defp do_camelize(<<?/, t :: binary>>) do
    <<?.>> <> camelize(t)
  end

  defp do_camelize(<<h, t :: binary>>) do
    <<h>> <> do_camelize(t)
  end

  defp do_camelize(<<>>) do
    <<>>
  end

  defp to_upper_char(char) when char in ?a..?z, do: char - 32
  defp to_upper_char(char), do: char
end
