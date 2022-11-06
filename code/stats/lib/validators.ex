defmodule Stats.Validators do
  alias Stats.Errors

  # ====================================================================

  def validate_num_list(nums) when is_list(nums) do
    {Enum.all?(nums, fn el -> is_number(el) end), nums}
  end

  def validate_num_list(_), do: Errors.invalid_data_type()

  # ====================================================================

  def validate_weighted_list(nums) when is_list(nums) do
    condition = Enum.all?(nums, fn {w, v} -> is_number(w) and is_number(v) end)
    {condition, nums}
  end

  def validate_weighted_list(_), do: Errors.invalid_data_type()
end
