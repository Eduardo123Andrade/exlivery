defmodule Exlivery.Factory do
  use ExMachina
  alias Exlivery.Orders.{Item, Order}
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

  def order_factory do
    %Order{
      delivery_address: "Winterfell",
      items: [
        build(:item),
        %Item{
          category: :sobremesa,
          description: "Sorvete raro",
          quantity: 1,
          unity_price: Decimal.new("35.5")
        }
      ],
      total_price: Decimal.new("71.00"),
      user_cpf: "12312312"
    }
  end
end
