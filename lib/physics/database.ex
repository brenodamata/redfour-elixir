use Amnesia

defdatabase Physics.Database do

  # :mnesia.create_table(:user, [
  #   {:ram_copies, [node()]},
  #   {:attributes, [:name, :email, :first, :last]}
  # ])

  deftable Planet, [
    {:id, autoincrement}, :name, :mass, :radius, :type, :ev
  ], type: :ordered_set do
    # helper methods, lookups, etc
  end

end
