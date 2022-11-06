defmodule Stats.Variability.StandardDeviation do
  alias Stats.Variability.Variance

  @doc """

  Steps:
    1. Take square root of Variance

  """
  @spec p_std_dev([number()]) :: float()
  def p_std_dev(nums) when is_list(nums) do
    nums
    |> Variance.p_variance()
    |> :math.sqrt()
  end

  @spec s_std_dev([number]) :: float
  def s_std_dev(nums) when is_list(nums) do
    nums
    |> Variance.s_variance()
    |> :math.sqrt()
  end
end
