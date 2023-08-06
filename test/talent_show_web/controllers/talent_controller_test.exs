defmodule TalentShowWeb.TalentControllerTest do
  use TalentShowWeb.ConnCase, async: false
  doctest TalentShowWeb.TalentController

  import Mock

  test "GET /list_talent", %{conn: conn} do
    conn = get(conn, ~p"/list_talent")
    assert html_response(conn, 200) =~ "DockYard Academy Graduates"
  end

  test "GET /list_talent display student information", %{conn: conn} do
    with_mock File, read!: fn _ -> Jason.encode!([%{name: "John Doe"}, %{name: "Jane Doe"}]) end do
      conn = get(conn, ~p"/list_talent")
      response = html_response(conn, 200)

      assert response =~ "John Doe"
      assert response =~ "Jane Doe"
    end
  end

  test "GET /list_talent filter student information", %{conn: conn} do
    with_mock File, read!: fn _ -> Jason.encode!([%{name: "John Doe"}, %{name: "Jane Doe"}]) end do
      conn = get(conn, ~p"/list_talent?search=John")
      response = html_response(conn, 200)

      assert response =~ "John Doe"
      refute response =~ "Jane Doe"
    end
  end
end
