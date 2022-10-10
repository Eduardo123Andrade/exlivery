defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, return the user" do
      response =
        User.build(
          "Winterfell",
          "Eduardo",
          "lordstark@gmail.com",
          "12312312",
          26
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "When there are invalid param, return an error" do
      response = User.build("Winterfell", "Eduardo", "lordstark@gmail.com", "123123123", 15)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
