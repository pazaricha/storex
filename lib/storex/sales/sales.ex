defmodule Storex.Sales do
  import Ecto.Query, warn: false
  alias Storex.Repo

  alias Storex.Sales.{Cart, LineItem}

  def create_cart(attrs \\ %{}) do
    %Cart{}
    |> Cart.changeset(attrs)
    |> Repo.insert()
  end

  def get_cart!(id) do
    Repo.get!(Cart, id)
  end

  def add_book_to_cart(book, cart) do
    
  end
end
