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

  @months %{
    1 => "janeiro",
    2 => "fevereiro",
    3 => "março",
    4 => "abril",
    5 => "maio",
    6 => "junho",
    7 => "julho",
    8 => "agosto",
    9 => "setembro",
    10 => "outubro",
    11 => "novembro",
    12 => "dezembro"
  }

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
  defp month_acc, do: Enum.into(@freelancers, %{}, &{&1, month_list()})
  defp month_list, do: Enum.into(1..12, %{}, &{&1, 0})
  defp years_acc, do: Enum.into(@freelancers, %{}, &{&1, years_list()})
  defp years_list, do: Enum.into(2016..2020, %{}, &{&1, 0})

  defp get_hours(parsed_file) do
    %{
      all_hours: all_hours(parsed_file),
      hours_per_month: month_hours(parsed_file),
      hours_per_year: year_hours(parsed_file)
    }
  end

  defp total_hours([name, hours, _day, _month, _year], report) do
    Map.put(report, name, report[name] + hours)
  end

  defp all_hours(parsed_file) do
    Enum.reduce(parsed_file, freelancers_acc(), fn line, report_acc ->
      total_hours(line, report_acc)
    end)
  end

  defp total_month_hours([name, hours, _day, month, _year], month_acc) do
    freela = month_acc[name]

    new_hours = Map.put(freela, month, freela[month] + hours)
    Map.put(month_acc, name, new_hours)
  end

  defp month_hours(parsed_file) do
    Enum.reduce(parsed_file, month_acc(), fn line, month_acc ->
      total_month_hours(line, month_acc)
    end)
  end

  defp total_year_hours([name, hours, _day, _month, year], year_acc) do
    freela = year_acc[name]

    new_hours = Map.put(freela, year, freela[year] + hours)
    Map.put(year_acc, name, new_hours)
  end

  defp year_hours(parsed_file) do
    Enum.reduce(parsed_file, years_acc(), fn line, year_acc ->
      total_year_hours(line, year_acc)
    end)
  end
end
