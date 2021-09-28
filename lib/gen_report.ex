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

  @months [
    "janeiro",
    "fevereiro",
    "março",
    "abril",
    "maio",
    "junho",
    "julho",
    "agosto",
    "setembro",
    "outubro",
    "novembro",
    "dezembro"
  ]

  @report %{
    all_hours: %{},
    hours_per_month: %{},
    hours_per_year: %{}
  }

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> get_hours()
  end

  defp freelancers_acc, do: Enum.into(@freelancers, %{}, &{&1, 0})
  defp month_acc, do: Enum.into(@months, %{}, &{&1, 0})
  # defp years_acc, do: Enum.into(2016..2020, %{}, &{&1, 0})

  defp get_hours(parsed_file) do
    %{
      all_hours: all_hours(parsed_file),
      hours_per_month: "hours_per_month",
      hours_per_year: "hours_per_year"
    }
  end

  defp total_hours([name, hours, _day, _month, _year], report) do
    Map.put(report, name, report[name] + hours)
  end

  defp all_hours(parsed_file) do
    Enum.reduce(parsed_file, freelancers_acc(), fn line, report -> total_hours(line, report) end)
  end

  defp month_hours(parsed_file) do
    Enum.reduce(parsed_file, freelancers_acc(), fn line, report -> total_hours(line, report) end)
  end
end
