defmodule GenReport do
  alias GenReport.Parser

  @freelancers [
    "Daniele",
    "Mayk",
    "Giuliano",
    "Cleiton",
    "Jakeliny",
    "Joseph",
    "Diego",
    "Rafael",
    "Danilo",
    "Vinicius"
  ]

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> total_hours(line, report) end)
  end

  defp total_hours([name, hours, _day, _month, _year], report),
    do: Map.put(report, name, report[name] + hours)

  defp report_acc, do: Enum.into(@freelancers, %{}, &{&1, 0})
end
