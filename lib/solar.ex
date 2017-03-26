defmodule Solar do

  def power(%{classification: :M, scale: s}), do: s * 10
  def power(%{classification: :X, scale: s, stations: c}) when c < 5, do: s * 1000 * 1.1
  def power(%{classification: :X, scale: s, stations: c}) when c >= 5, do: s * 1000
  def power(%{classification: :C, scale: s}), do: s
  
  def no_eva(flares), do: Enum.filter flares, &(power(&1) > 1000)

  # def power(flare) do
  #   factor = cond do
  #     flare.classification == :M -> 10
  #     flare.classification == :X -> 1000
  #     true -> 1
  #   end
  #   factor * flare.scale
  # end

  def deadliest(flares) do
    Enum.map(flares, &(power(&1)))
      |> Enum.max
  end

  def flare_list(flares) do
    # =========================================================
    # for flare <- flares, do: %{power: power(flare), is_deadly: power(flare) > 1000}
    # Filter option
    # for flare <- flares, flare.classification == :X, do: %{power: power(flare), is_deadly: power(flare) > 1000}
    # =========================================================
    for flare <- flares,
      power <- [power(flare)],
      is_deadly <- [power > 1000],
      do: %{power: power, is_deadly: is_deadly}
  end

  def flare_list_enum(flares) do
    # Enum.map( flares, fn(flare) ->
    #   [power: power(flare), is_deadly: power(flare) > 1000]
    # end) |> List.flatten
    # =========================================================
    Enum.map flares, fn(flare) ->
      p = power(flare)
      %{power: p, is_deadly: p > 1000}
    end
  end

  def total_flare_power(flares) do
    (for flare <- flares, do: power(flare)) |> Enum.sum
  end

  # Enum
  def total_flare_power_enum(list) do
    Enum.reduce list, 0, fn(flare, total) ->
      power(flare) + total
    end
  end

  # def total_flare_power(list), do: total_flare_power(list, 0)
  # def total_flare_power([], total), do: total

  # def total_flare_power([%{classification: :M, scale: s} | tail], total) do
  #   new_total = power(head) * 0.92 + total
  #   total_flare_power(tail, new_total)
  # end
  #
  # def total_flare_power([%{classification: :C, scale: s} | tail], total) do
  #   new_total = power(head) * 0.78 + total
  #   total_flare_power(tail, new_total)
  # end
  #
  # def total_flare_power([%{classification: :M, scale: s} | tail], total) do
  #   new_total = power(head) * 0.6 + total
  #   total_flare_power(tail, new_total)
  # end

end
