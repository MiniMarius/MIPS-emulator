defmodule Program do

  #Splits the assembly code list into tuples i.e one tuple for each instruction
  def assemble(prgm) do
    {:code, List.to_tuple(prgm)}
  end

  #Gets the tuple/instruction at index pc
  def read_instruction({:code, code}, pc) do
    elem(code, pc)
  end

  #creates an empty list representing memory
  def new() do
    new([])
  end

  def new(segments) do
    f = fn({start, data}, layout) ->
      last = start +  length(data) -1
      Enum.zip(start..last, data) ++ layout
    end
    layout = List.foldr(segments, [], f)
    {:mem, Map.new(layout)}
  end

  def read({:mem, mem}, i) do
    case Map.get(mem, i) do
      nil -> 0
      val -> val
    end
  end

  #writes value to memory at a specific index
  def write({:mem, mem}, i, v) do
    {:mem, Map.put(mem, i, v)}
  end
end