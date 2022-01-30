defmodule Program do

  #Splits the assembly code list into tuples i.e one tuple for each instruction
  def assemble(prgm) do
    {:code, List.to_tuple(prgm)}
  end

  #Gets the tuple/instruction at index pc
  def read_instruction({:code, code}, pc) do
    elem(code, pc)
  end
end