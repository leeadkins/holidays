defmodule Holidays.Define do

  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
      @before_compile unquote(__MODULE__)
      Module.register_attribute Holidays, :holidays, accumulate: true
      Module.register_attribute Holidays, :special_days, accumulate: true
    end
  end

  defmacro __before_compile__(_env) do
    # if env.module == Holidays do
    #   quote do
    #     def list do
    #       IO.puts "Holidays (#{inspect @holidays})"
    #     end
    #   end
    # end
  end

  defmacro holiday(name, definition) do
    quote bind_quoted: [name: name, definition: definition] do
      Module.put_attribute(Holidays, :holidays, {name, __MODULE__, definition})
    end
  end

end
