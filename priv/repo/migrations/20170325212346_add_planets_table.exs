defmodule Physics.Repo.Migrations.AddPlanetsTable do
  use Ecto.Migration

  def change do
    create table(:planets) do
      add :name, :string
      add :type, :string
      add :mass, :float
      add :radius, :float
      timestamps
    end
  end
end
