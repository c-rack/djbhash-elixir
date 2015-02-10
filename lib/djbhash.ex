defmodule Djbhash do
	
  use Bitwise, only_operators: true

  def hash(data) when is_binary(data), do: _hash(:binary.bin_to_list(data), 5381)

  def hash(data), do: hash(:erlang.term_to_binary(data))

  defp _hash([], x), do: x

  defp _hash([ h | t ], x), do: _hash(t, (((x <<< 5) + x) ^^^ h) &&& 0xFFFFFFFF )
	
end
