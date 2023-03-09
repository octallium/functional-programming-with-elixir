defmodule Tutorials.Recursion.PrintDigits do
  def upto(0), do: 0

  def upto(num) do
    IO.puts(num)
    upto(num - 1)
  end
end
