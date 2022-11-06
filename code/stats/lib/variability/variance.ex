defmodule Stats.Variability.Variance do
  alias Stats.CentralTendency.Mean

  @doc """

  Steps:
    1. Find mean
    2. Find Sigma = sum of (mean - num)^2
    3. Divide sigma by sum of number of elements

  """
  @spec p_variance([number()]) :: number()
  def p_variance(nums) do
    s = nums |> Mean.population_mean() |> sigma(nums)
    s / Enum.count(nums)
  end

  # ====================================================================

  @spec s_variance([number()]) :: number()
  def s_variance(nums) do
    s = nums |> Mean.sample_mean() |> sigma(nums)
    s / (Enum.count(nums) - 1)
  end

  # ====================================================================

  @spec sigma(number(), [number], number()) :: number()
  defp sigma(mean, nums, acc \\ 0)
  defp sigma(_, [], acc), do: acc

  defp sigma(mean, [h | t], acc) do
    x = :math.pow(h - mean, 2)
    sigma(mean, t, acc + x)
  end
end
