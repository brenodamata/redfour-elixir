defmodule Choir do
  @voices ["Bells", "Good News", "Pipe Organ", "Cellos", "Bad News"]

  def sing do
    Enum.map 1..20, fn(n) ->
      {:ok, pid} = Singer.start_link
      voice = Enum.random(@voices)
      Singer.sing_it pid, voice
    end
  end

  def groups do
    Enum.map 1..3, fn(n) ->
      voice = case n do
        1 -> "Cellos"
        2 -> "Good News"
        3 -> "Pipe Organ"
      end
      spawn Choir, :conductor, [voice]
    end
  end

  def conductor(voice) do
    Enum.map 1..5, fn(_n) ->
      {:ok, pid} = Singer.start_link
      Singer.sing_it pid, voice
    end
  end

  def staggered do
    Enum.to_list(1..20) |> staggered
  end

  def staggered([head | tail]) do
    {:ok, pid} = Singer.start_link
    Singer.sing_it pid, "Good News"
    :timer.sleep 200
    staggered tail
  end

  def staggered([]), do: IO.puts "All done."
end


defmodule Singer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def sing_it(pid, data) do
    GenServer.cast(pid, {:sing, data})
  end

  def handle_cast({:sing, voice}, _state) do
    IO.puts "Singing with #{voice}"
    System.cmd "say", ["-v", voice, "Fuck her right in the pussy."]
    {:noreply, []}
  end
end
