defmodule Emulator do
  #startup function
  def run(prgm) do
    {code, data} = Program.load(prgm)
    out = Out.new()
    reg = Register.new()
    run(0, code, data, reg, out)
  end




















  #main emulator function
  def run(pc, code, mem, reg, out) do

    next = Program.read_instruction(code, pc)

    #different cases depending on instructions given
    case next do

      {:halt} ->
        Out.close(out)

      {:out, rs} ->
        pc = pc + 4
        a = Register.read(reg, rs)
        run(pc, code, mem, reg, Out.put(out,a))

      {:add, rd, rs, rt} ->
        pc = pc + 4
        a = Register.read(reg, rs)
        b = Register.read(reg, rt)
        reg = Register.write(reg, rd, a + b)  # we're not handling overflow
        run(pc, code, mem, reg, out)

      {:sub, rd, rs, rt} ->
        pc = pc + 4
        a = Register.read(reg, rs)
        b = Register.read(reg, rt)
        reg = Register.write(reg, rd, a - b)
        run(pc, code, mem, reg, out)

      {:addi, rd, rs, imm} ->
        pc = pc + 4
        a = Register.read(reg, rs)
        reg = Register.write(reg, rd, a + imm)
        run(pc, code, mem, reg, out)

      {:beq, rs, rt, imm} ->
        pc = pc + 4
        a = Register.read(reg, rs)
        b = Register.read(reg, rt)
        pc = if a == b do  pc+(imm * 4) else pc end
        run(pc, code, mem, reg, out)

      {:bne, rs, rt, imm} ->
        pc = pc + 4
        a = Register.read(reg, rs)
        b = Register.read(reg, rt)
        pc = if a != b do  pc+(imm * 4) else pc end
        run(pc, code, mem, reg, out)

      {:lw, rd, rs, arg, imm} ->
        pc = pc + 4
        a = Register.read(reg, rs)
        addr = a + imm
        val = Program.read(mem, addr)
        reg = Register.write(reg, rd, val)
        run(pc, code, mem, reg, out)

      {:sw, rs, rt, imm} ->
        pc = pc + 4
        vs = Register.read(reg, rs)
        vt = Register.read(reg, rt)
        addr = vt + imm
        mem = Program.write(mem, addr, vs)
        run(pc, code, mem, reg, out)

        {:label, _} ->
        pc = pc + 4
        run(pc, code, mem, reg, out)
    end
  end
end