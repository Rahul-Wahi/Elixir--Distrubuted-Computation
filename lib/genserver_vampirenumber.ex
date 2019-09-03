defmodule GenserverVampirenumber do
  @moduledoc """
  Documentation for GenserverVampirenumber.
  """

  @doc """
  Hello world.

  ## Examples

      iex> GenserverVampirenumber.hello()
      :world

  """
{:ok, pid} = Vampire.Server.start_link()

end
