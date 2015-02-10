defmodule Djbhash do
	
  use Bitwise, only_operators: true

  def djbhash(data) when is_binary(data), do: _djbhash(:binary.bin_to_list(data), 5381)

  def djbhash(data), do: djbhash(:erlang.term_to_binary(data))

  defp _djbhash([], x), do: x

  defp _djbhash([ h | t ], x), do: _djbhash(t, (((x <<< 5) + x) ^^^ h) &&& 0xFFFFFFFF )
	
end
