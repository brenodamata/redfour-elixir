defmodule Converter do

  def to_light_seconds({:miles, miles} = _val, precision: precision) when is_integer(miles) or is_float(miles) do
    (miles * 5.36819e-6) |> round_to(precision)
  end

  def to_light_seconds({:meters, meters} = _val, precision: precision) when is_integer(meters) or is_float(meters)  do
    (meters * 3.335638620368e-9) |> round_to(precision)
  end

  def to_light_seconds({:feet, feet} = _val, precision: precision) when is_integer(feet) or is_float(feet)  do
    (feet * 1.016702651488166404e-9) |> round_to(precision)
  end

  def to_light_seconds({:inches, inches} = _val, precision: precision) when is_integer(inches) or is_float(inches)  do
    (inches * 8.472522095734715723e-11) |> round_to(precision)
  end

  def round_to(val, precision) when is_float(val) do
    Float.round(val, precision)
  end

  def round_to(val, precision) when is_integer(val), do: round_to(val/1, precision)

  def to_nearest_tenth(val) when is_integer(val) or is_float(val) do
    round_to(val, 1)
  end

  def to_km(val) when is_integer(val) or is_float(val) do
    val / 1000
  end

  def to_meters(val) when is_integer(val) or is_float(val) do
    val * 1000
  end

  def seconds_to_hours(val)  when is_integer(val) or is_float(val) do
    val / 3600 |> to_nearest_tenth
  end

end


# defmodule Converter do
#
#   def to_nearest_tenth(val) do
#     Float.ceil(val, 1)
#   end
#
#   def to_km(velocity) do
#     velocity / 1000
#   end
#
#   def to_light_seconds({:miles, miles}) do
#     (miles * 5.36819e-6) |> round_up
#   end
#
#   def to_light_seconds({:meters, meters}) do
#     (meters * 3.335638620368e-9) |> round_up
#   end
#
#   defp round_up(val) when is_float(val) do
#     Float.ceil(val, 5)
#   end
#
#   def round_down(val) when is_float(val), do: trunc(val)
# end
#
# defmodule ConverterTwo do
#   def to_light_seconds({unit, val}, precision: precision) do
#     case unit do
#       :miles -> val * 5.36819e-6
#       :meters -> val * 3.335638620368e-9
#       :feet -> val * 1.016702651488166404e-9
#       :inches -> val * 8.472522095734715723e-11
#     end |> round_to(precision)
#   end
#
#   defp round_to(val, precision), do: Float.round(val, precision)
# end
