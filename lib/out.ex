defmodule Out do

  def new() do  [] end

  #add element to list
  def put(out, a) do
    out ++ [a]
  end
  def close(list) do
    IO.puts("list of integers is: [#{Enum.join(list, ", ")}]")
  end

end