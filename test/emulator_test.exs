defmodule MipsTest do
  use ExUnit.Case
  doctest Emulator
  test "tests the emulator" do
    code =
      [{:addi, 1, 0, 1},
        {:addi, 4, 0, 20},
        {:label, :loop},
        {:out, 4},
        {:sub, 4, 4, 1},
        {:bne, 4, 0, :loop},
        {:halt}]
    list = Program.find_instruction(code)
    IO.write(list)
  end
end