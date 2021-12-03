defmodule App.Challenges.Day1Test do
  use ExUnit.Case

  alias App.Challenges.Day1

  doctest App.Challenges.Day1

  test "part1" do
    assert Day1.part_1() == 1676
  end
  test "part2" do
    assert Day1.part_2() == 1706
  end
end
