defmodule Holidays.Define do
  use GenServer

  alias Holidays.DateCalculator.DateMath

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end
  def holiday(name, %{month: month, day: day, regions: regions, observed: observed}) do
    GenServer.cast(__MODULE__, {:add_entry, :static, {name, month, day, regions, observed}})
  end
  def holiday(name, %{month: month, day: day, regions: regions}) do
    GenServer.cast(__MODULE__, {:add_entry, :static, {name, month, day, regions, nil}})
  end
  def holiday(name, %{month: month, week: week, weekday: weekday, regions: regions}) do
    GenServer.cast(__MODULE__, {:add_entry, :nth, {name, month, week, weekday, regions}})
  end
  def holiday(name, %{function: function, regions: regions}) do
    GenServer.cast(__MODULE__, {:add_entry, :fun, {name, function, regions}})
  end

  @spec on(:calendar.date, [Holidays.region]) :: list
  def on(date, regions) do
    GenServer.call(__MODULE__, {:on, date, regions})
  end

  defp on_all(%{static: statics, nth: nths, fun: funs}, date) do
    on_static(statics, date) ++
    on_nth(nths, date) ++
    on_fun(funs, date)
  end

  defp on_static(holidays, {year, month, day}) do
    holidays
    |> Enum.filter(fn
      {_, m, d, _, {:to_monday_if_sunday, _}} ->
        {year, month, day} == Holidays.DateCalculator.WeekendModifier.to_monday_if_sunday({year, m, d})
      {_, m, d, _, {:to_monday_if_weekend, _}} ->
        {year, month, day} == Holidays.DateCalculator.WeekendModifier.to_monday_if_weekend({year, m, d})
      {_, m, d, _, {:to_weekday_if_weekend, _}} ->
        {year, month, day} == Holidays.DateCalculator.WeekendModifier.to_weekday_if_weekend({year, m, d})
      {_, ^month, ^day, _, nil} -> true
      _ -> false
    end)
    |> Enum.map(fn {name, _, _, regions, _} -> %{name: name, regions: regions} end)
  end

  defp on_nth(holidays, date) do
    DateMath.get_week_and_weekday(date)
    |> Enum.flat_map(&on_nth(&1, holidays, date))
  end
  defp on_nth({week, weekday}, holidays, {_, month, _}) do
    holidays
    |> Enum.filter(&match?({_, ^month, ^week, ^weekday, _}, &1))
    |> Enum.map(fn {name, _, _, _, regions} -> %{name: name, regions: regions} end)
  end

  defp on_fun(holidays, date) do
    holidays
    |> Enum.filter(fn {_, fun, _} -> apply_fun(fun, date) == date end)
    |> Enum.map(fn {name, _, regions} -> %{name: name, regions: regions} end)
  end

  defp apply_fun({mod, fun, args, days}, date) do
    apply_fun({mod, fun, args}, date)
    |> DateMath.add_days(days)
  end
  defp apply_fun({mod, fun, [:year]}, {year, _, _}) do
    apply(mod, fun, [year])
  end

  defp region_match?(%{regions: holiday_regions}, regions_set) do
    !(MapSet.new(holiday_regions)
    |> MapSet.disjoint?(regions_set))
  end

  defp split_region(region) do
    chunks = region |> Atom.to_string() |> String.downcase() |> String.split("_")
    Enum.map(Enum.count(chunks)..1, &join_chunks(chunks, &1))
  end

  defp join_chunks(chunks, length) do
    Enum.take(chunks, length)
    |> Enum.join("_")
    |> String.to_atom()
  end

  def init([]) do
    {:ok, %{static: [], nth: [], fun: []}}
  end

  def handle_cast({:add_entry, type, definition}, state) do
    {:noreply, Map.update!(state, type, &([definition | &1]))}
  end

  def handle_call({:on, date, regions}, _valuefrom, state) do
    regions_set = regions
    |> Enum.flat_map(&split_region/1)
    |> MapSet.new()

    result = state
      |> on_all(date)
      |> Enum.filter(&region_match?(&1, regions_set))
      |> Enum.map(fn %{name: name} -> %{name: name} end)
    {:reply, result, state}
  end

end
