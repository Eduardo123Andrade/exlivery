defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  import Exlivery.Factory


  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when the user is found, returns the user" do
      cpf = "12312312312"

      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:ok,
         %User{
           address: "Winterfell",
           age: 26,
           cpf: "12312312312",
           email: "lordstark@gmail.com",
           name: "Eduardo"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      cpf = "00000000000"

      :user
      |> build()
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:error, "user not found"}

      assert response == expected_response
    end
  end
end
