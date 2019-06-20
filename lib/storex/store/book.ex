defmodule Storex.Store.Book do
  use Ecto.Schema
  import Ecto.Changeset
  alias Storex.Store.Book


  schema "store_books" do
    field :description, :string
    field :image_url, :string
    field :price, :decimal
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :description, :price, :image_url])
    |> validate_required([:title, :description, :price, :image_url])
    # |> validate_number(:price, greater_than_or_equal_to: 0.01, less_than_or_equal_to: 99.99) # also works!
    |> validate_max_price()
  end

  def validate_max_price(changeset) do
    current_price = get_change(changeset, :price)

    case Decimal.cmp(current_price, "99.99") do
      :gt ->
        add_error(changeset, :price, "Price is not valid")
      _ -> changeset
    end
  end
end
