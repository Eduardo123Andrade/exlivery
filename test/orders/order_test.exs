defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Order

  describe "build/2" do
    test "When all params are valid, return an order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item, description: "Sorvete raro", category: :sobremesa)
      ]

      response = Order.build(user, items)

      expected_response = {:ok, build(:order)}

      assert expected_response == response
    end

    test "When there is no items in the orders, return an error" do
      user = build(:user)

      items = []

      response = Order.build(user, items)

      expected_response = {:error, "Invalids parameters"}

      assert expected_response == response
    end
  end
end
