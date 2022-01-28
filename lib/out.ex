defmodule Out do

  def new do
    []
  end

  def close(out) do
    IO.write(out)
  end
  def put(e1, e2) do
    IO.write(e1, e2)
  end
end