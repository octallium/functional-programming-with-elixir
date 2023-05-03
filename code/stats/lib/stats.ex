defmodule Stats do
  alias Stats.CentralTendency.{Mean, Median, Mode}
  alias Stats.Variability.{StandardDeviation, Variance}

  @spec population_mean([number]) :: number | {:error, String.t()}
  defdelegate population_mean(num_list), to: Mean

  @spec sample_mean([number]) :: number | {:error, String.t()}
  defdelegate sample_mean(num_list), to: Mean

  @spec median([number]) :: number | {:error, String.t()}
  defdelegate median(num_list), to: Median

  @spec mode([number]) :: nil | number()
  defdelegate mode(num_list), to: Mode

  @spec p_variance([number]) :: float
  defdelegate p_variance(nums), to: Variance

  @spec s_variance([number]) :: float
  defdelegate s_variance(nums), to: Variance

  @spec p_std_dev([number]) :: float
  defdelegate p_std_dev(nums), to: StandardDeviation

  @spec s_std_dev([number]) :: float
  defdelegate s_std_dev(nums), to: StandardDeviation
end
