defmodule Exlivery.Order.CreateOrUpdateTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent


  describe "call/1" do
    setup  do
      Exlivery.start_agents()
      user = build(:user)

      UserAgent.save(user)
      item1 = build(:item)
      item2 = build(:item, description: "sorvete", category: :sobremesa, unity_price: 10)
      items = [item1, item2]

      {:ok, user_cpf: user.cpf, items: items}
    end

    test "when all params are valid, save the order", %{user_cpf: user_cpf, items: items} do
      params = %{user_cpf: user_cpf, items: items}

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end

    test "when there is no user with given cpf, return an error", %{items: items} do
      params = %{user_cpf: "invalid cpf", items: items}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "user not found"}

      assert expected_response == response
    end

    test "when there are invalid items, return an error", %{user_cpf: user_cpf, items: items} do
      invalid_item = build(:item, quantity: 0)
      list_item = items ++ [invalid_item]
      params = %{user_cpf: user_cpf, items: list_item}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid items"}

      assert expected_response == response
    end


    test "when there are no items, return an error", %{user_cpf: user_cpf} do
      params = %{user_cpf: user_cpf, items: []}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalids parameters"}

      assert expected_response == response
    end


  end
end
