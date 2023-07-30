defmodule TalentShowWeb.TalentControllerTest do
  use TalentShowWeb.ConnCase, async: true
  doctest TalentShowWeb.TalentController
  @test_json "./assets/js/students_test.json"

  setup do
    File.write!(@test_json, Jason.encode!([%{name: "John Doe"}, %{name: "Jane Doe"}]))

    on_exit(fn ->
      File.rm!(@test_json)
    end)
  end

  test "GET /list_talent", %{conn: conn} do
    conn = get(conn, ~p"/list_talent")
    assert html_response(conn, 200) =~ "DockYard Academy Graduates"
  end

  test "GET /list_talent display student information", %{conn: conn} do
    conn = get(conn, ~p"/list_talent")
    response = html_response(conn, 200)

    assert response =~ "John Doe"
    assert response =~ "Jane Doe"
  end
end
