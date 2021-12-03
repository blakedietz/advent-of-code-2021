defmodule App.Challenges.Day1 do
  @doc ~S"""
  Reduces the given elevations into the total number of times the previous elevation was less than the current elevation

  ## Examples

      iex> App.Challenges.Day1.determine_number_of_increases([ 199 ])
      0

      iex> App.Challenges.Day1.determine_number_of_increases([ 199, 200 ])
      1

      iex> App.Challenges.Day1.determine_number_of_increases([ 200, 199 ])
      0

      iex> App.Challenges.Day1.determine_number_of_increases([ 199, 200, 208, 210, 200, 207, 240, 269, 260, 263 ])
      7
  """
  def determine_number_of_increases(elevations) do
    elevations
    |> Enum.reduce(%{total: 0, last: nil}, fn
      current, %{last: last} = acc when current > last ->
        %{acc | total: acc.total + 1, last: current}

      current, _ = acc ->
        %{acc | last: current}
    end)
    |> Map.get(:total)
  end

  @doc ~S"""
    Split input into a sliding window of sums. The sums are the total of the window length.

    ## Examples

      iex> App.Challenges.Day1.sliding_window([ 199, 200, 208, 210, 200, 207, 240, 269, 260, 263 ], 3)
      [607, 618, 618, 617, 647, 716, 769, 792]

      iex> App.Challenges.Day1.sliding_window([ 199, 200 ], 3)
      []

      iex> App.Challenges.Day1.sliding_window([ 199, 200, 208, 210 ], 3)
      [607, 618]
  """
  def sliding_window(elevations, window_size)
      when is_integer(window_size) and is_list(elevations) do
    Stream.chunk_every(elevations, window_size, 1, :discard)
    |> Enum.map(fn chunk -> Enum.sum(chunk) end)
    |> Enum.to_list()
  end

  @doc ~S"""
    ## Examples

    iex> App.Challenges.Day1.part_1()
    1676
  """
  def part_1 do
    get_input()
    |> determine_number_of_increases()
  end

  @doc ~S"""
  Split input into a sliding window of sums. The sums are the total of the window length.

  ## Examples

    iex> App.Challenges.Day1.part_2()
    1706
  """
  def part_2 do
    get_input()
    |> sliding_window(3)
    |> determine_number_of_increases()
  end

  defp get_input do
    File.read!("./lib/challenges/day_1/input.txt")
    |> String.split("\n")
    |> Enum.map(fn
      line -> String.to_integer(line)
    end)
  end
end
