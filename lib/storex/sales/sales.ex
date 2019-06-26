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
    line_item = Repo.get_by(LineItem, book_id: book.id, cart_id: cart.id)

    if line_item do
      line_item
      |> LineItem.changeset(%{quantity: line_item.quantity + 1})
      |> Repo.update()
    else
      %LineItem{book_id: book.id, cart_id: cart.id}
      |> LineItem.changeset(%{quantity: 1})
      |> Repo.insert()
    end
  end
end
