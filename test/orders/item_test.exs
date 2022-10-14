defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Item


  describe "build/4" do
    test "when all params are valid, return an item" do
      response = Item.build("Pizza de peperoni", :pizza, "35.5", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, returns an error" do
      response = Item.build("Pizza de peperoni", "invalid category", "35.5", 1)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there is an invalid price, returns an error" do
      response = Item.build("Pizza de peperoni", :pizza, "", 1)

      expected_response = {:error, "Invalid price"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, returns an error" do
      response = Item.build("Pizza de peperoni", :pizza, "35.5", -1)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
