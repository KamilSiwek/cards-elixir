defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "greets the world" do
    assert Cards.hello() == "hi there!"
  end

  test "Numbers" do
    assert Cards.create_deck() == ["Ace of Spades", "Ace of Clubs", "Two of Spades", "Two of Clubs"]
  end

  test "Contains" do
    assert Cards.contains?(["Ace", "Two", "Three"], "Two") == true
  end

end
