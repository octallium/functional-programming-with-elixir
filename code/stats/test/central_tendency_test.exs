defmodule CentralTendencyTest do
  use ExUnit.Case, async: true
  alias Stats.CentralTendency.{Mean, Median, Mode}

  doctest Mode
  doctest Median
  doctest Mean

  test "mode returns multiple right values" do
    mode = Mode.mode([1, 2, 3, 4, 5, 4, 5, 2, 8, 9, 8, 6, 8, 4])
    assert [4, 8] == mode
  end

  test "mode returns single right values" do
    mode = Mode.mode([1, 2, 3, 4, 5, 4, 5, 2, 8, 9, 8, 6, 8])
    assert [8] == mode
  end

  test "mode returns nil for the right values" do
    mode = Mode.mode([1, 2, 3, 4, 5, 6, 7, 8, 9])
    assert nil == mode
  end
end
