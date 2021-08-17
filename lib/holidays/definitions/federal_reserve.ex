defmodule Holidays.Definitions.FederalReserve do
  import Holidays.Define

  @moduledoc """
  Federal reserve holidays definition

  Source: http://www.federalreserve.gov/aboutthefed/k8.htm
  """
  def init() do

    holiday "New Year's Day",
      %{month: 1,
        regions: [:federal_reserve],
        day: 1,
        observed: {:to_monday_if_sunday, [:date]}}

    holiday "Birthday of Martin Luther King, Jr",
      %{month: 1,
        week: :third,
        regions: [:federal_reserve],
        weekday: :monday}

    holiday "Washington's Birthday",
      %{month: 2,
        week: :third,
        regions: [:federal_reserve],
        weekday: :monday}

    holiday "Memorial Day",
      %{month: 5,
        week: :last,
        regions: [:federal_reserve],
        weekday: :monday}

    holiday "Juneteenth National Independence Day",
      %{month: 6,
        regions: [:federal_reserve],
        day: 19,
        observed: {:to_monday_if_sunday, [:date]}}

    holiday "Independence Day",
    %{month: 7,
      regions: [:federal_reserve],
      day: 4,
      observed: {:to_monday_if_sunday, [:date]}}

    holiday "Labor Day",
      %{month: 9,
        week: :first,
        regions: [:federal_reserve],
        weekday: :monday}

    holiday "Columbus Day",
    %{month: 10,
      regions: [:federal_reserve],
      week: :second,
      weekday: :monday,
      observed: {:to_monday_if_sunday, [:date]}}

    holiday "Veterans Day",
      %{month: 11,
        regions: [:federal_reserve],
        day: 11,
        observed: {:to_monday_if_sunday, [:date]}}

    holiday "Thanksgiving",
      %{month: 11,
        week: :fourth,
        regions: [:federal_reserve],
        weekday: :thursday}

    holiday "Christmas Day",
      %{month: 12,
        regions: [:federal_reserve],
        day: 25,
        observed: {:to_monday_if_sunday, [:date]}}
  end

end
