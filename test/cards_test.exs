defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "Numbers" do
    assert Cards.create_deck() == ["Ace of Spades", "Ace of Clubs", "Two of Spades", "Two of Clubs"]
  end

  test "Contains" do
    assert Cards.contains?(["Ace", "Two", "Three"], "Two") == true
  end

  test "Deal data" do
    assert Cards.deal(["Ace of Spades", "Ace of Clubs", "Two of Spades", "Two of Clubs"], 2) == {["Ace of Spades", "Ace of Clubs"], ["Two of Spades", "Two of Clubs"]}
  end

  test "Save data to file" do
    assert Cards.save(["Ace of Spades", "Ace of Clubs", "Two of Spades", "Two of Clubs"], 'my_deck') == :ok
  end
end
