defmodule TutorialsTest do
  use ExUnit.Case
  doctest Tutorials

  test "greets the world" do
    assert Tutorials.hello() == :world
  end
end
