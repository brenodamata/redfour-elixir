defmodule Mix.Tasks.Physics.LoadPlanets do
  use Mix.Task

  def run(_args) do
    Mix.Task.run "app.start"
    planets = [
      %{name: "Mercury", type: "rocky", mass: 3.3e23, radius: 2.439e6},
      %{name: "Venus", type: "rocky", mass: 4.86e24, radius: 6.05e6},
      %{name: "Earth", type: "rocky", mass: 5.972e24, radius: 6.37e6},
      %{name: "Mars", type: "rocky", mass: 6.41e23, radius: 3.37e6},
      %{name: "Jupiter", type: "gaseous", mass: 1.89e27, radius: 7.14e7},
      %{name: "Saturn", type: "gaseous", mass: 5.68e26, radius: 6.02e7},
      %{name: "Uranus", type: "gaseous", mass: 8.68e25, radius: 2.55e7},
      %{name: "Neptune", type: "gaseous", mass: 1.02e26, radius: 2.47e7}
    ]

    for planet <- planets, do: struct(Physics.Planet, planet) |> Physics.Repo.insert!
  end
end
