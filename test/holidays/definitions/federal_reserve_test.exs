defmodule Holidays.FederalReserveTest do
  use ExUnit.Case

  import Holidays.TestHelper

  setup_all do
    restart_application()
    Holidays.Definitions.FederalReserve.init()
    :ok
  end

  # 2021
  holiday_test "New Year's Day", {2021, 1, 1}, :federal_reserve
  holiday_test "Birthday of Martin Luther King, Jr", {2021,1,18}, :federal_reserve
  holiday_test "Washington's Birthday", {2021,2,15}, :federal_reserve
  holiday_test "Memorial Day", {2021,5,31}, :federal_reserve
  holiday_test "Juneteenth National Independence Day", {2021,6,19}, :federal_reserve
  holiday_test "Independence Day", {2021,7,5}, :federal_reserve
  holiday_test "Labor Day", {2021,9,6}, :federal_reserve
  holiday_test "Columbus Day", {2021,10,11}, :federal_reserve
  holiday_test "Veterans Day", {2021,11,11}, :federal_reserve
  holiday_test "Thanksgiving", {2021,11,25}, :federal_reserve
  holiday_test "Christmas Day", {2021,12,25}, :federal_reserve


  # 2022
  no_holiday_test {2022, 6, 19}, :federal_reserve
  no_holiday_test {2022, 6, 21}, :federal_reserve
  no_holiday_test {2022, 12, 24}, :federal_reserve
  no_holiday_test {2022, 12, 25}, :federal_reserve
  no_holiday_test {2022, 12, 27}, :federal_reserve
  holiday_test "New Year's Day", {2022, 1, 1}, :federal_reserve
  holiday_test "Birthday of Martin Luther King, Jr", {2022,1,17}, :federal_reserve
  holiday_test "Washington's Birthday", {2022,2,21}, :federal_reserve
  holiday_test "Memorial Day", {2022,5,30}, :federal_reserve
  holiday_test "Juneteenth National Independence Day", {2022,6,20}, :federal_reserve
  holiday_test "Independence Day", {2022,7,4}, :federal_reserve
  holiday_test "Labor Day", {2022,9,5}, :federal_reserve
  holiday_test "Columbus Day", {2022,10,10}, :federal_reserve
  holiday_test "Veterans Day", {2022,11,11}, :federal_reserve
  holiday_test "Thanksgiving", {2022,11,24}, :federal_reserve
  holiday_test "Christmas Day", {2022,12,26}, :federal_reserve


  # 2023
  no_holiday_test {2023, 1, 1}, :federal_reserve
  no_holiday_test {2023, 1, 3}, :federal_reserve
  holiday_test "New Year's Day", {2023, 1, 2}, :federal_reserve
  holiday_test "Birthday of Martin Luther King, Jr", {2023,1,16}, :federal_reserve
  holiday_test "Washington's Birthday", {2023,2,20}, :federal_reserve
  holiday_test "Memorial Day", {2023,5,29}, :federal_reserve
  holiday_test "Juneteenth National Independence Day", {2023,6,19}, :federal_reserve
  holiday_test "Independence Day", {2023,7,4}, :federal_reserve
  holiday_test "Labor Day", {2023,9,4}, :federal_reserve
  holiday_test "Columbus Day", {2023,10,9}, :federal_reserve
  holiday_test "Veterans Day", {2023,11,11}, :federal_reserve
  holiday_test "Thanksgiving", {2023,11,23}, :federal_reserve
  holiday_test "Christmas Day", {2023,12,25}, :federal_reserve


  # 2024
  holiday_test "New Year's Day", {2024, 1, 1}, :federal_reserve
  holiday_test "Birthday of Martin Luther King, Jr", {2024,1,15}, :federal_reserve
  holiday_test "Washington's Birthday", {2024,2,19}, :federal_reserve
  holiday_test "Memorial Day", {2024,5,27}, :federal_reserve
  holiday_test "Juneteenth National Independence Day", {2024,6,19}, :federal_reserve
  holiday_test "Independence Day", {2024,7,4}, :federal_reserve
  holiday_test "Labor Day", {2024,9,2}, :federal_reserve
  holiday_test "Columbus Day", {2024,10,14}, :federal_reserve
  holiday_test "Veterans Day", {2024,11,11}, :federal_reserve
  holiday_test "Thanksgiving", {2024,11,28}, :federal_reserve
  holiday_test "Christmas Day", {2024,12,25}, :federal_reserve

  # 2025
  holiday_test "New Year's Day", {2025, 1, 1}, :federal_reserve
  holiday_test "Birthday of Martin Luther King, Jr", {2025,1,20}, :federal_reserve
  holiday_test "Washington's Birthday", {2025,2,17}, :federal_reserve
  holiday_test "Memorial Day", {2025,5,26}, :federal_reserve
  holiday_test "Juneteenth National Independence Day", {2025,6,19}, :federal_reserve
  holiday_test "Independence Day", {2025,7,4}, :federal_reserve
  holiday_test "Labor Day", {2025,9,1}, :federal_reserve
  holiday_test "Columbus Day", {2025,10,13}, :federal_reserve
  holiday_test "Veterans Day", {2025,11,11}, :federal_reserve
  holiday_test "Thanksgiving", {2025,11,27}, :federal_reserve
  holiday_test "Christmas Day", {2025,12,25}, :federal_reserve

end
