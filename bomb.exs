defmodule SolarFlareRecorder do
  use GenServer

  def start_link do
    Agent.start_link fn -> [] end
  end

  def record_flare(pid, flare) do
    # Cast is basically 'fire-and-forget' and will invoque the query asynchronous and move on.
    # Agent.cast pid, fn(flares) ->
    #   add_flare(flare) # add to the db
    #   List.insert_at(flares, -1, flare) # update the state
    # end

    # Synchronous
    Agent.get_and_update pid, fn(flares) ->
      add_flare(flare) # add to the db
      new_flares = List.insert_at(flares, -1, flare) # update the state
      {:ok, new_flares}
    end
  end

  defp add_flare(flare) do
    """
    insert into solar_flares(classification, scale, stations, inserted_at, updated_at)
    values($1, $2, 100, now(), now()) RETURNING *;
    """
    |> execute([flare.classification, flare.scale])
  end

  defp execute(sql, params) do
    {:ok, pid} = connect

    Postgrex.query!(pid, sql, params)
    # res = Postgrex.query!(pid, sql, params)
    # Postgrex.close(pid)
    # res
  end

  defp connect do
    Postgrex.start_link(hostname: "localhost", database: "redfour")
  end
end


Enum.map 1..5000, fn(_n) ->
  {:ok, pid} = SolarFlareRecorder.start_link
  SolarFlareRecorder.record_flare pid, %{classification: "X", scale: 33.0, stations: 10}
end

IO.inspect "DONE"
