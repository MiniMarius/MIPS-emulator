defmodule Register do
  #creates 32 numbers to represent registers with index from 0-31
  def new() do
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
  end

  #if 0 register return 0
  def read(  _, 0) do 0 end
  #return value of register with index i
  def read(reg, i) do elem(reg, i) end

  #if writing with one being reg zero simply writes the reg value
  def write(reg, 0, _) do reg end
  #writes value to reg with index i
  def write(reg, i, val) do put_elem(reg, i, val) end


end