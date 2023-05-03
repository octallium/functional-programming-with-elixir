defmodule Stats.CentralTendency.Mode do
  @doc """

  `Mode` finds out the elements which are repeating most often.

  Steps:
    1. Group elements by the number of occurrences/frequencies.
    2. Find the maximum number of occurrences.
    3. Group the elements which has the max occurrences.

  Example:

      iex> values = [1, 2, 3, 4, 5, 4, 5, 2, 8, 9, 8, 6, 8, 4]
      iex> Stats.CentralTendency.Mode.mode(values)
      [4, 8]

  """
  @spec mode([number()]) :: nil | [number()]
  def mode(nums) when is_list(nums) do
    ranked_map = nums |> Enum.frequencies()

    ranked_map
    |> Map.values()
    |> Enum.max()
    |> mode_func(ranked_map)
  end

  # ====================================================================

  @spec mode_func(number(), map()) :: nil | [number()]
  defp mode_func(1, _), do: nil

  defp mode_func(max, ranked_map) do
    ranked_map
    |> Map.filter(fn {_key, value} -> value == max end)
    |> Map.keys()
  end
end
