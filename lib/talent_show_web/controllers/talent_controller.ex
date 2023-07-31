defmodule TalentShowWeb.TalentController do
  use TalentShowWeb, :controller

  @json_path "./assets/js/students.json"

  def list_talent(conn, _params) do
    students =
      File.read!(@json_path)
      |> Jason.decode!()

    render(conn, :list_talent, layout: false, students: students)
  end

  def profile(conn, _params) do
    render(conn, :profile, layout: false)
  end
end
