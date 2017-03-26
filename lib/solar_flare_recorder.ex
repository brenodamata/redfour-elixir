defmodule SolarFlareRecorder do
  use GenServer

  # def start_link do
  #   GenServer.start_link __MODULE__, []
  # end
  #
  # # public API
  # def record_flare(pid, {:flare, classification: c, scale: s} = flare) do
  #   GenServer.call(pid, {:record, flare})
  # end
  #
  # # the GenServer handlers for this module
  # def handle_call({:record, flare}, _sender, flares) do
  #   flares = List.insert_at flares, -1, flare
  #   {:reply, :ok, flares}
  # end

  def start_link do
    Agent.start_link fn -> [] end
  end

  def record_flare(pid, {:flare, classification: c, scale: s} = flare) do
    Agent.get_and_update pid, fn(flares) ->
      new_state = List.insert_at flares, -1, flare
      {:ok, new_state}
    end
  end

  def get_flares(pid) do
    Agent.get pid, fn(flares) ->
      flares
    end
  end
end

# task = Task.async(SolarFlareRecorder.record_flare(flare))
# result = Task.await(task)
