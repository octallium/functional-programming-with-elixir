defmodule Hello do
  @spec world() :: :ok
  def world do
    IO.puts("Hello Elixir")
  end
end

Hello.world()
