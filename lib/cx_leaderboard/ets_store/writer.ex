defmodule CxLeaderboard.EtsStore.Writer do
  use GenServer
  alias CxLeaderboard.EtsStore.Ets

  def init(name) do
    Ets.init(name)
    {:ok, name}
  end

  def handle_call({:populate, data}, _from, name) do
    {:ok, {count, time}} = Ets.populate(name, data)
    # secs = time / 1000
    # IO.puts("[CxLeaderboard] #{name} indexed #{count} entries in #{secs}s")
    {:reply, {count, time}, name}
  end
end