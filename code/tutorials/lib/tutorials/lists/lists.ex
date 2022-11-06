defmodule Tutorials.Lists do
  @doc """
  Returns the sum of numbers in a list.

  Function Summary:

  1. sum
  2. reverse
  3. map
  4. concat
  5. flat_map
  """

  # -------------------------- Sum ------------------------------

  @spec sum(list(number())) :: number()
  def sum(nums), do: sum_tail_rec(nums)

  @spec sum_head_rec(list(number())) :: number()
  def sum_head_rec([]), do: 0
  def sum_head_rec([h | t]), do: h + sum(t)

  @spec sum_tail_rec(list(number()), non_neg_integer()) :: number()
  def sum_tail_rec(nums, acc \\ 0)
  def sum_tail_rec([], acc), do: acc
  def sum_tail_rec([h | t], acc), do: sum_tail_rec(t, acc + h)

  # -------------------------- Reverse ---------------------------

  @spec reverse([any()], [any()]) :: [any()]
  def reverse(elements, acc \\ [])
  def reverse([], acc), do: acc
  def reverse([h | t], acc), do: reverse(t, [h | acc])

  # -------------------------- Map ------------------------------

  @spec map([any()], (any -> any), [any()]) :: [any()]
  def map(elements, fun, acc \\ [])
  def map([], _, acc), do: reverse(acc)
  def map([h | t], func, acc), do: map(t, func, [func.(h) | acc])

  # -------------------------- Concat ------------------------------

  @spec concat([any], [any]) :: [any]
  def concat(dst, src), do: concat_func(dst |> reverse(), src)

  @spec concat_func([any], [any]) :: [any]
  def concat_func(dst, src)
  def concat_func(dst, []), do: dst |> reverse()
  def concat_func(dst, [h | t]), do: concat_func([h | dst], t)

  # -------------------------- FlatMap ------------------------------

  def flat_map(elements, func, acc \\ [])
  def flat_map([], _, acc), do: acc
  def flat_map([h | t], func, acc), do: flat_map(t, func, concat(acc, func.(h)))
end
