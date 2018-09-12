defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      "hi there!"

      iex> Cards.create_deck()
      ["Ace of Spades", "Ace of Clubs", "Two of Spades", "Two of Clubs"]

      iex> Cards.contains?(["Ace", "Two", "Three"], "Two")
      true

  """
  def hello do
    "hi there!"
  end

  # def create_deck do
  #   values = ["Ace", "Two", "Three", "Three", "Four", "Five"]
  #   suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
  #
  #   cards = for value <- values do
  #     for suit <- suits do
  #       "#{value} of #{suit}"
  #     end
  #   end
  #
  #   List.flatten(cards)
  # end

  def create_deck do
    values = ["Ace", "Two"]
    suits = ["Spades", "Clubs"]

      for value <- values, suit <- suits do
        "#{value} of #{suit}"
      end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end
end
