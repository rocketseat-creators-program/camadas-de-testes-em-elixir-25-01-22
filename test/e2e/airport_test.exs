defmodule Ectestes.E2e.AirportsTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  describe "path harry" do
    test "get airport" do
      navigate_to("http://localhost:4000")
      Process.sleep(8000)
      code = find_element(:id, "codeAirport")
      input_into_field(code, "SBGL")
      take_screenshot("get_input_code.png")
      Hound.end_session()
    end
  end
end
