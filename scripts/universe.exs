defmodule Universe do
  def big_bang do
    IO.puts("Big Bang 💣 ")
    Process.sleep(1000)
    expand()
  end

  def expand(state \\ 0) do
    IO.puts("Size of Universe is: #{state}")
    Process.sleep(1000)
    # Think of `state + 1` as mutation
    # and not just as addition.
    expand(state + 1)
  end
end
