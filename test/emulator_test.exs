defmodule MipsTest do
  use ExUnit.Case
  doctest Emulator
  test "tests the emulator" do
    code = Program.assemble(demo())
    mem = Memory.new([])
    out = Out.new()
    Emulator.run(code, mem, out)
  end
  def demo do
    [{:addi, 1, 0, 10},    # $1 <- 10
      {:add, 1, 1, 5},      # $3 <- $1 + $2
      {:halt}]
  end
end