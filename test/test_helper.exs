ExUnit.start()

defmodule Holidays.TestHelper do


  defmacro holiday_test(name, date, regions) when is_list(regions) do
    test_name = "#{name} on #{inspect date} in #{inspect regions}"
    quote do
      test unquote(test_name) do
        assert Holidays.on(unquote(date), unquote(regions)) == [%{name: unquote(name)}]
      end
    end
  end

  defmacro holiday_test(name, date, region) do
    test_name = "#{name} on #{inspect date} in #{inspect region}"
    quote do
      test unquote(test_name) do
        assert Holidays.on(unquote(date), [unquote(region)]) == [%{name: unquote(name)}]
      end
    end
  end

  defmacro no_holiday_test(date, region) do
    test_name = "No holiday on #{inspect date} in #{inspect region}"
    quote do
      test unquote(test_name) do
        assert Holidays.on(unquote(date), [unquote(region)]) == []
      end
    end
  end

  def restart_application do
    Application.stop(:holidays)
    Application.start(:holidays)
  end

end
