defmodule Stats.Validators do
  alias Stats.Errors

  @spec validate_num_list([number()]) :: {boolean(), [number()]} | {atom(), String.t()}
  def validate_num_list(nums) when is_list(nums) do
    {Enum.all?(nums, fn el -> is_number(el) end), nums}
  end

  def validate_num_list(_), do: Errors.invalid_data_type()
end
