defmodule Exlivery.Factory do
  use ExMachina
  alias Exlivery.Orders.Item
  # alias Exlivery.Orders.Order
  alias Exlivery.Users.User

  def user_factory do
    %User{
      address: "Winterfell",
      age: 26,
      cpf: "12312312",
      email: "lordstark@gmail.com",
      name: "Eduardo"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "Pizza de peperoni",
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end
end
