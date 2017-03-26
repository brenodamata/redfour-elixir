defmodule RocketryTest do
  use ExUnit.Case
  import Physics.Rocketry
  # import Planet

  test "Orbital acceleration defaults to Earth" do
    x = orbital_acceleration(100)
    assert x == 9.515619587729839
  end

  test "Orbital acceleration for earth at 100km" do
    # x = orbital_term(100)
    # assert x == 1.4
    orbitall_acc = orbital_acceleration(100)
    assert orbitall_acc == 9.515619587729839
  end

  # @tag :pending
  test "Orbital acceleration for Jupiter at 100km" do
    x = orbital_acceleration(Planet.select[:jupiter], 100)
    assert x == 24.659005330334
  end

  # @tag :pending
  test "Orbital term at 100km for Saturn at 6000km" do
    x = orbital_term(Planet.select[:saturn], 6000)
    assert x == 4.8
  end

end
