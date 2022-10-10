defmodule Exlivery.Orders.Item do
  @keys [:description, :category, :unity_price, :quantity]
  @enforce_keys @keys

  @categories [:pizza, :hamburguer, :carne, :prato_feito, :japonesa, :sobremesa]

  defstruct @keys

  def build(description, category, unity_price, quantity)
      when quantity > 0 and category in @categories do
    {:ok,
     %__MODULE__{
       description: description,
       category: category,
       unity_price: unity_price,
       quantity: quantity
     }}
  end

  def build(_, _, _, _), do: {:error, "Invalid parameters"}
end
