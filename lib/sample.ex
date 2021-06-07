defmodule Sample do
  def read_csv do
    {state, deta} = File.read("CUSTOMER.csv")
    case state do
      :ok -> deta |> String.split("\r\n")
      :error -> "ファイルが取得できませんでした"
    end
  end

  def list_split(list) do
    deta =
      Enum.at(list, 0)
      |> String.split(",")

    values =
      List.delete_at(list, 0)
      |> Enum.map(&String.split(&1, ","))
    {deta, values}
  end

  def create_map(deta, values) do
    Enum.map(values, & %{Enum.at(deta, 0) => Enum.at(&1, 0), Enum.at(deta ,1) => Enum.at(&1, 1), Enum.at(deta, 2) => Enum.at(&1, 2), Enum.at(deta, 3) => Enum.at(&1, 3)})
  end

  def main do
    list = read_csv
    {deta, values} = list_split(list)
    create_map(deta, values)
  end
end
