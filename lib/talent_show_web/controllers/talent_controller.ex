defmodule TalentShowWeb.TalentController do
  use TalentShowWeb, :controller

  def list_talent(conn, _params) do
    render(conn, :list_talent, layout: false)
  end

  def profile(conn, _params) do
    render(conn, :profile, layout: false)
  end
end
