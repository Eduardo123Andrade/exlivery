defmodule Exlivery.Factory do
  use ExMachina
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
end
