defmodule Tutorials.Recursion.PrintDigits do
  def upto(0), do: :ok

  def upto(num) do
    IO.puts(num)
    upto(num - 1)
  end
end
