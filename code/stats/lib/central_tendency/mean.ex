defmodule Stats.CentralTendency.Mean do
  alias Stats.Errors
  alias Stats.Validators

  # ====================================================================

  @spec population_mean([number()]) :: float | {:error, String.t()}
  def population_mean([]), do: Errors.invalid_data_type()

  def population_mean(nums) when is_list(nums) do
    nums
    |> Validators.validate_num_list()
    |> calc_population_mean()
  end

  # ====================================================================

  @spec sample_mean([number()]) :: float | {:error, String.t()}
  def sample_mean(nums), do: population_mean(nums)

  # ====================================================================

  @type weight :: number()
  @type value :: number()
  @type weights_values :: {weight(), value()}
  @spec weighted_mean([weights_values()]) :: float | {:error, String.t()}
  def weighted_mean([]), do: Errors.invalid_data_type()

  def weighted_mean(nums) when is_list(nums) do
    nums
    |> Validators.validate_weighted_list()
    |> calc_weighted_mean()
  end

  # ====================================================================

  defp calc_population_mean({false, _}), do: Errors.invalid_data_type()

  defp calc_population_mean({true, nums}) do
    nums
    |> sigma()
    |> mean(Enum.count(nums))
  end

  # ====================================================================

  defp calc_weighted_mean({false, _}), do: Errors.invalid_data_type()

  defp calc_weighted_mean({true, values}) do
    values
    |> weighted_sigma()
    |> mean(weights_total(values))
  end

  # ====================================================================

  defp sigma(x, acc \\ 0)
  defp sigma([], acc), do: acc
  defp sigma([h | t], acc), do: sigma(t, acc + h)

  # ====================================================================

  defp weighted_sigma(values, acc \\ 0)
  defp weighted_sigma([], acc), do: acc
  defp weighted_sigma([{w, v} | t], acc), do: weighted_sigma(t, acc + w * v)

  # ====================================================================

  defp weights_total(values),
    do: Enum.reduce(values, 0, fn {w, _}, acc -> acc + w end)

  # ====================================================================

  defp mean(sigma, count), do: sigma / count

  # ====================================================================
end
