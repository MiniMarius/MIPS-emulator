defmodule Main do

  def main() do
    code =
      [{:addi, 1, 0, 10},    # $1 <- 10
        {:addi, 2, 0, 5},     # $2 <- 5
        {:add, 3, 1, 2},      # $3 <- $1 + $2
        {:addi, 5, 0, 1},     # $5 <- 1
        {:sub, 4, 4, 5},      # $4 <- $4 - $5
        {:out, 4},            # out $4
        {:halt}]
    data = [{:label, :arg}, {:word, 12}]
    prgm = {:prgm, code, data}
    Emulator.run(prgm)
  end
end