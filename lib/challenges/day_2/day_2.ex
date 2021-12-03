defmodule App.Challenges.Day2 do
  @default_position %{horizontal: 0, depth: 0}

  @doc ~S"""

      iex> App.Challenges.Day2.part_1()
      1484118
  """
  def part_1 do
    %{horizontal: horizontal, depth: depth} = get_input() |> find_position()

    horizontal * depth
  end

  @doc ~S"""

      iex> App.Challenges.Day2.find_position(["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"])
      %{horizontal: 15, depth: 10}
  """
  def find_position(input) do
    input
    |> Enum.reduce(@default_position, &read_line/2)
  end

  @doc ~S"""
  ## Examples

      iex> App.Challenges.Day2.read_line("forward 5")
      %{horizontal: 5, depth: 0}

      iex> App.Challenges.Day2.read_line("down 5")
      %{horizontal: 0, depth: 5}

      iex> App.Challenges.Day2.read_line("up 5")
      %{horizontal: 0, depth: -5}
  """
  def read_line(_, position \\ @default_position)

  def read_line("forward " <> distance, position) do
    require IEx
    %{position | horizontal: position.horizontal + String.to_integer(distance)}
  end

  def read_line("down " <> distance, position) do
    %{position | depth: position.depth + String.to_integer(distance)}
  end

  def read_line("up " <> distance, position) do
    %{position | depth: position.depth - String.to_integer(distance)}
  end

  defp get_input do
    File.read!("./lib/challenges/day_2/input.txt")
    |> String.split("\n")
  end
end
