defmodule Main do

  def main() do
    code =
      [{:addi, 1, 0, 1},
        {:addi, 4, 0, 20},
        {:label, :loop},
        {:out, 4},
        {:sub, 4, 4, 1},
        {:bne, 4, 0, :loop},
        {:halt}]
    data = [{:label, :arg}, {:word, 12}]
    prgm = {:prgm, code, data}
    Emulator.run(prgm)
  end
end