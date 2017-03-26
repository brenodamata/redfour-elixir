defmodule Physics.Rocketry do

  require IEx
  import Converter
  import Calcs
  import Physics.Laws
  import Planet

  @earth Planet.select[:earth]

  # def escape_velocity(:mars), do: mars |> escape_velocity
  # def escape_velocity(:moon), do: moon |> escape_velocity
  # def escape_velocity(:earth),  do: earth |> escape_velocity
  #
  # def escape_velocity(planet) when is_map(planet) do
  #   planet
  #     |> calculate_escape
  #     |> to_km
  #     |> to_nearest_tenth
  # end

  def orbital_speed(height), do: orbital_speed(@earth, height)
  def orbital_speed(planet, height) do
    newtons_gravitational_constant * planet.mass / orbital_radius(planet, height)
    |> square_root
  end

  def orbital_acceleration(height), do: orbital_acceleration(@earth, height)
  # def orbital_acceleration(:earth, height), do: orbital_acceleration(earth, height)
  # def orbital_acceleration(:mars, height), do: orbital_acceleration(mars, height)
  # def orbital_acceleration(:moon, height), do: orbital_acceleration(moon, height)
  def orbital_acceleration(planet, height) do
    (orbital_speed(planet, height) |> squared) / orbital_radius(planet, height)
  end

  def orbital_term(height), do: orbital_term(@earth, height)
  # def orbital_term(:earth, height), do: orbital_term(earth, height)
  # def orbital_term(:mars, height), do: orbital_term(mars, height)
  # def orbital_term(:moon, height), do: orbital_term(moon, height)
  def orbital_term(planet, height) do
    four_times_pi_squared * (orbital_radius(planet, height) |> cubed) /
    (newtons_gravitational_constant * planet.mass)
      |> square_root
      |> seconds_to_hours
  end


  # t = 4 hours, what is the height?
  # r = cubed_root((g*m*t^2)/(4*pi^2))
  # def orbital_height(term) do
  #
  # end

  # defp orbital_radius(height), do: orbital_radius(earth, height)
  defp orbital_radius(planet, height) do
    planet.radius + (height |> to_meters)
  end

  # defp calculate_escape(%{mass: mass, radius: radius}) do
  #   IEx.pry
  #   2 * newtons_gravitational_constant * mass / radius
  #     |> square_root
  # end

end


# defmodule Physics.Planet do
#
#   defstruct [
#     name: "Earth",
#     radius_m: 6.371e6,
#     mass_kg: 5.97e24
#   ]
#
#   def escape_velocity(planet) do
#     g = 6.67e-11
#     gmr = 2 * g * planet.mass_kg / planet.radius_m
#     vms = :math.sqrt gmr
#     vkms = vms / 1000
#     Float.ceil vkms, 1
#   end
#
# end
#
# v = %Physics.Planet{} |> Physics.Planet.escape_velocity
#
# defmodule Physics.Rocketry do
#
#
# end
