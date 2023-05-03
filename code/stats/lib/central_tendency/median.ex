defmodule Stats.CentralTendency.Median do
  require Integer

  alias Stats.Errors
  alias Stats.Validators

  # ====================================================================

  # Scenario - Louis Sold The Following Candies in 9 hrs
  # 10, 40, 20, 50, 30, 90, 70, 60, 80

  # Median -> Centre Value or The Value Which Divides Measurements In Two Parts.
  # First 50% and the next 50%

  # Steps -
  # 1. Sort - [10, 20, 30, 40, 50, 60, 70, 80, 90]
  # 2. Count -
  #    2.1 - If Odd - Take the value at the middle = 50 (Median)
  #    2.2 - If Even - Take 2 value at the middle And Return Their Average = 50 (Median)
  #          E.g [10, 20, 30, 40, 50, 60, 70, 80] = (40 + 50) / 2 = 45 (Median)

  # ====================================================================

  @spec median([number()]) :: number() | {:error, String.t()}
  def median(num_list) when is_list(num_list) do
    num_list
    |> Validators.validate_num_list()
    |> calc_median()
  end

  def median(_), do: Errors.invalid_data_type()

  # ====================================================================

  defp calc_median({:error, _msg}), do: Errors.invalid_data_type()
  defp calc_median({false, _}), do: Errors.invalid_data_type()

  defp calc_median({true, num_list}) do
    count = Enum.count(num_list)

    num_list
    |> Enum.sort()
    |> get_median(Integer.is_even(count), count)
  end

  # ====================================================================

  defp get_median(num_list, false, count), do: Enum.at(num_list, div(count, 2))

  defp get_median(num_list, true, count) do
    a = Enum.at(num_list, div(count - 1, 2))
    b = Enum.at(num_list, div(count, 2))

    (a + b) / 2
  end
end
