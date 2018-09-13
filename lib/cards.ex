defmodule Cards do
  @moduledoc """
  Provides methods for creating and gandling a deck of cards.
  """

  @doc """
  Returns a list of strings representing a deck of playing cards.

  ## Examples

      iex> Cards.create_deck()
      ["Ace of Spades", "Ace of Clubs", "Two of Spades", "Two of Clubs"]

  """

  def create_deck do
    values = ["Ace", "Two"]
    suits = ["Spades", "Clubs"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Returns shuffled data.

  """

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Returns true if `deck` contains `card`.

  ## Examples

      iex> Cards.contains?(["Ace", "Two", "Three"], "Two")
      true

  """

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Dicides a deck into a hand the remainder of the deck.

  ## Examples

      iex> Cards.deal(["Ace of Spades", "Ace of Clubs", "Two of Spades", "Two of Clubs"], 2)
      {["Ace of Spades", "Ace of Clubs"], ["Two of Spades", "Two of Clubs"]}

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Save data to file.

  ## Examples

      iex> Cards.save(["Ace of Spades", "Ace of Clubs", "Two of Spades", "Two of Clubs"], 'my_deck')
      :ok

  """

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Returns data from file.

  ## Examples

      iex> Cards.load("my_deck")
      ["Ace of Spades",
      "Ace of Clubs",
      "Two of Spades",
      "Two of Clubs"]

  """

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end

  @doc """
  Return two arrays. First array has the indicated amount of items.

  """

  def create_hand(hand_size) do
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    # Pipe Operator:
    Cards.create_deck |> Cards.shuffle |> Cards.deal(hand_size)
  end

end
