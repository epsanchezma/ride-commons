defmodule RideCommons.UUID do
  def generate_uuid do
    <<u0::48, _::4, u1::12, _::2, u2::62>> = :crypto.rand_bytes(16)
    <<u0::48, 4::4, u1::12, 2::2, u2::62>> |> uuid_to_string
  end

  defp uuid_to_string(<<u0::32, u1::16, u2::16, u3::16, u4::48>>) do
    :io_lib.format("~8.16.0b-~4.16.0b-~4.16.0b-~4.16.0b-~12.16.0b", [u0, u1, u2, u3, u4]) |> to_string
  end
end
