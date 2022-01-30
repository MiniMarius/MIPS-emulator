defmodule Out do

  def new() do  [] end

  #
  def put(out, a) do [a|out] end

  def close(list) do IO.puts("list of integers is: [#{Enum.join(list, ", ")}]") end

end