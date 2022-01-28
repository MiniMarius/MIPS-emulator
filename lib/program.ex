defmodule Program do

  def assemble(prgm) do
    {:code, List.to_tuple(prgm)}
  end

  def read_instruction({:code, code}, pc) do
    elem(code, pc)
  end


end