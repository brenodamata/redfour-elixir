defmodule Physics.Planet do
  use Ecto.Schema

  schema "planets" do
    field :name, :string
    field :type, :string
    field :mass, :float
    field :radius, :float
    timestamps
  end
end
