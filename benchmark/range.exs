samples =
  Stream.iterate({:rand.uniform(1_000_000), 1}, fn
    {_, id} -> {:rand.uniform(1_000_000), id + 1}
  end)

alias ElixirLeaderboard.Leaderboard

one_mil = samples |> Enum.take(1_000_000)

ets_board =
  Leaderboard.create!(name: :benchmark, store: ElixirLeaderboard.EtsStore)
  |> Leaderboard.populate!(one_mil)

term_board =
  Leaderboard.create!(store: ElixirLeaderboard.TermStore)
  |> Leaderboard.populate!(one_mil)

Benchee.run(%{
  "ets" => fn -> Leaderboard.get(ets_board, 500_000, -10..10) end,
  "term" => fn -> Leaderboard.get(term_board, 500_000, -10..10) end
})
