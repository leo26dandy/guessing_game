defmodule GuessingGame do
  @moduledoc """
  This module implements a simple guessing game.
  """

  @doc """
  Start the game by greeting the player and asking for their name.
  """
  def start() do
    IO.puts("Welcome to the Guessing Number Game!")
    IO.puts("Please enter your name:")

    player_name = IO.gets("> ") |> String.trim()

    case player_name do
      "your" ->
        IO.puts("I knew it! You're a special user.")
      _ ->
        IO.puts("Hello #{player_name}, let's start the game!")
        play_game(player_name)
    end
  end

  # Guess function calculation
  def guess(num1, num2) when num1 > num2 do
    guess(num2, num1)
  end

  def guess(num1, num2) do
    answer = IO.gets("Are you thinking of number #{mid_number(num1, num2)}?\n ")

    case String.trim(answer) do
      "bigger" -> bigger_number(num1, num2)
      "smaller" -> smaller_number(num1, num2)
      "yes" -> IO.puts("I knew it!")
      _ ->
        IO.puts(~s{"Invalid input, please enter 'bigger', 'smaller' or 'yes' to continue"})
        guess(num1, num2)
    end
  end

  # Mid number calculation
  def mid_number(num1, num2) do
    div(num1 + num2, 2)
  end

  # Bigger Number Calculation
  def bigger_number(num1, num2) do
    low_new = min(num2, mid_number(num1, num2) + 1)
    guess(low_new, num2)
  end

  # Smaller Number Calculation
  def smaller_number(num1, num2) do
    high_new = max(num1, mid_number(num1, num2) - 1)
    guess(num1, high_new)
  end

  # Play the game
  defp play_game(_player_name) do
    IO.puts("Let's play the game!")

    IO.puts("Pleasee enter the lower bound of the range:")
    num1 = get_number("lower bound: ")

    IO.puts("Please enter the upper bound of the range:")
    num2 = get_number("upper bound: ")

    guess(num1, num2)
  end

  # Helper function get number input from user
  defp get_number(prompt) do
    IO.gets(prompt)
    |> String.trim
    |> String.to_integer
  end
end
