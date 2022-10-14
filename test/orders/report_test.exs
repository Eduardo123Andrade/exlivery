defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})
      filename = "report_test.csv"

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      expected_response =
        "12312312,[pizza,135.5][sobremesa,135.5]71.00\n" <>
          "12312312,[pizza,135.5][sobremesa,135.5]71.00\n"

      Report.create(filename)

      response = File.read!(filename)

      assert expected_response == response
    end
  end
end
