defmodule Program do

  #Splits the assembly code list into a tuple of 2 lists
  #With instructions and data separated, null data if no label.
  def load({:prgm, code, data}) do
    {code, data}
  end

  #Gets the tuple/instruction at index pc from code
  def read_instruction(list, pc) do
    Enum.at(list, div(pc, 4))
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