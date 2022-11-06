defmodule Stats.Errors do
  @spec invalid_data_type :: {:error, String.t()}
  def invalid_data_type, do: {:error, "Invalid Data Type"}
end
