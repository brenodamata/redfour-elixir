defmodule Calcs do

  def square_root(val), do: :math.sqrt(val)
  def squared(val), do: val * val
  def cubed(val), do: val * val * val
  def four_times_pi_squared, do: 4 * (:math.pi |> squared)

end

# defmodule C do
#  def count_flares(flares), do: count_flares(flares, 0)
#  def count_flares([head|tail], count), do: count_flares(tail, (count + 1))
#  def count_flares([], count), do: count
# end
