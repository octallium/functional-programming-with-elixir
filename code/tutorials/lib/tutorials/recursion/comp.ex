defmodule Tutorials.Recursion.Comp do
  alias Tutorials.Structs.SevenWonders

  def all_names() do
    for %{name: name} <- SevenWonders.all() do
      name
    end
  end
end
