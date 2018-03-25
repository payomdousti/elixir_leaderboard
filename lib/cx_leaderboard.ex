defmodule CxLeaderboard do
  @moduledoc """
  Here is a quick example of how you can create and manage a leaderboard.
  Negative scores are used to force descending sort.

      alias CxLeaderboard.Leaderboard

      # Create a leaderboard
      {:ok, board} = Leaderboard.create(name: :global)

      # Put data into it
      board = Leaderboard.populate!(board, [
        {-20, :id1},
        {-30, :id2}
      ])

      records =
        board
        |> Leaderboard.top()
        |> Enum.take(2)

      # Records
      # {{-30, :id2}, :id2, {0, 1, 75.0, 1, 1}},
      # {{-20, :id1}, :id1, {1, 2, 25.0, 0, 1}}

      Leaderboard.update!(board, {-10, :id2})

      records =
        board
        |> Leaderboard.top()
        |> Enum.take(2)

      # Records
      # {{-20, :id1}, :id1, {0, 1, 75.0, 1, 1}},
      # {{-10, :id2}, :id2, {1, 2, 25.0, 0, 1}}

  For detailed documentation see `CxLeaderboard.Leaderboard` module.
  """
end
